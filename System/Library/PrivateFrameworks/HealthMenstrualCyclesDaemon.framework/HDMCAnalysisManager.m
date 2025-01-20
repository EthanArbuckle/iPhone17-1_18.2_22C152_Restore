@interface HDMCAnalysisManager
- (BOOL)_hasHealthAppDevicesWithHigherAlgorithmVersions;
- (BOOL)initiateCycleFactorsAutomaticUpgradeWithDatabaseAccessibilityAssertion:(id)a3 error:(id *)a4;
- (HDMCAnalysisManager)initWithProfile:(id)a3 settingsManager:(id)a4 featureAvailabilityManager:(id)a5 heartRateAvailabilityManager:(id)a6 wristTemperatureAvailabilityManager:(id)a7 deviationsAvailabilityManager:(id)a8 deviceScopedStorageManager:(id)a9 calendarCache:(id)a10;
- (HDProfile)profile;
- (HKMCAnalysis)currentAnalysis;
- (OS_dispatch_queue)queue;
- (id)_analysisWithAlgorithmsAnalysis:(id)a3 algorithmsCycles:(id)a4 recentSymptoms:(unint64_t)a5 mostRecentBasalBodyTemperature:(id)a6 lastLoggedDayIndex:(id)a7 lastMenstrualFlowDayIndex:(id)a8 numberOfDailySleepHeartRateStatisticsForPast100Days:(int64_t)a9 numberOfDailyAwakeHeartRateStatisticsForPast100Days:(int64_t)a10 featureSettings:(id)a11 useHeartRateInput:(BOOL)a12 useWristTemperatureInput:(BOOL)a13 deviationsFeatureSettings:(id)a14;
- (id)_analyzeWithForceIncludeCycles:(BOOL)a3 forceAnalyzeCompleteHistory:(BOOL)a4 error:(id *)a5;
- (id)_initWithProfile:(id)a3 settingsManager:(id)a4 featureAvailabilityManager:(id)a5 heartRateAvailabilityManager:(id)a6 wristTemperatureAvailabilityManager:(id)a7 deviationsAvailabilityManager:(id)a8 deviceScopedStorageManager:(id)a9 calendarCache:(id)a10 dayStreamProcessorProvider:(id)a11 historicalAnalyzerProvider:(id)a12;
- (id)_processorConfigurationForTodayIndex:(int64_t)a3 deviationsFeatureStatus:(id)a4 calendar:(id)a5;
- (id)_queue_analyzeNowWithForceIncludeCycles:(BOOL)a3 forceAnalyzeCompleteHistory:(BOOL)a4 error:(id *)a5;
- (id)_queue_computeAnalysisWithDatabaseAccessibilityAssertion:(id)a3 forceIncludeCycles:(BOOL)a4 forceAnalyzeCompleteHistory:(BOOL)a5 error:(id *)a6;
- (id)_takeAccessibilityAssertion;
- (id)_test_didNotUpgradeOnboardingRecord;
- (id)analyzeWithError:(id *)a3;
- (void)_calendarDayDidChange:(id)a3;
- (void)_forceDisablePredictionsFromOngoingCycleFactors:(id)a3 menstruationProjectionsEnabled:(BOOL)a4 fertileWindowProjectionsEnabled:(BOOL)a5 useHeartRateInput:(BOOL)a6 useWristTemperatureInput:(BOOL)a7;
- (void)_hasHealthAppDevicesWithHigherAlgorithmVersions;
- (void)_queue_analyzeIfNeeded;
- (void)_queue_enqueueMaintenanceOperationIfNeeded;
- (void)_queue_runMaintenanceOperation;
- (void)_startObserving;
- (void)_takeAccessibilityAssertion;
- (void)_test_setAlgorithmsAnalysis:(id)a3;
- (void)_test_setAlgorithmsCycles:(id)a3;
- (void)_test_setAnalysis:(id)a3;
- (void)_userCharacteristicsDidChange:(id)a3;
- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4;
- (void)dealloc;
- (void)featureAvailabilityProvidingDidUpdateOnboardingCompletion:(id)a3;
- (void)featureAvailabilityProvidingDidUpdateSettings:(id)a3;
- (void)featureStatusProviding:(id)a3 didUpdateFeatureStatus:(id)a4;
- (void)registerObserver:(id)a3 queue:(id)a4 userInitiated:(BOOL)a5;
- (void)samplesAdded:(id)a3 anchor:(id)a4;
- (void)samplesOfTypesWereRemoved:(id)a3 anchor:(id)a4;
- (void)setProfile:(id)a3;
- (void)setQueue:(id)a3;
- (void)set_test_didNotUpgradeOnboardingRecord:(id)a3;
- (void)settingsManagerDidUpdateAlgorithmVersionMismatchSettings:(id)a3;
- (void)settingsManagerDidUpdateAnalysisSettings:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation HDMCAnalysisManager

- (void)registerObserver:(id)a3 queue:(id)a4 userInitiated:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  [(HKObserverSet *)self->_observers registerObserver:v8 queue:v9];
  if (v5)
  {
    [(HKObserverSet *)self->_userInitiatedObservers registerObserver:v8 queue:v9];
    _HKInitializeLogging();
    v10 = (void *)*MEMORY[0x263F09930];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
    {
      v11 = v10;
      *(_DWORD *)buf = 138543618;
      id v16 = (id)objc_opt_class();
      __int16 v17 = 2114;
      id v18 = v8;
      id v12 = v16;
      _os_log_impl(&dword_225722000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Analyze if needed due to user-initiated observer add: %{public}@", buf, 0x16u);
    }
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __60__HDMCAnalysisManager_registerObserver_queue_userInitiated___block_invoke;
    block[3] = &unk_2647508B0;
    block[4] = self;
    dispatch_async(queue, block);
  }
}

- (HKMCAnalysis)currentAnalysis
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)[(HKMCAnalysis *)self->_lock_currentAnalysis copy];
  os_unfair_lock_unlock(p_lock);
  return (HKMCAnalysis *)v4;
}

void __133__HDMCAnalysisManager__queue_computeAnalysisWithDatabaseAccessibilityAssertion_forceIncludeCycles_forceAnalyzeCompleteHistory_error___block_invoke_337(void *a1, void *a2)
{
  v3 = (void *)a1[4];
  v4 = NSNumber;
  id v5 = a2;
  v6 = objc_msgSend(v4, "numberWithInteger:", objc_msgSend(v5, "dayIndex"));
  [v3 setObject:v5 forKeyedSubscript:v6];

  v7 = [v5 tenthPercentileAsleepHeartRateStatistics];

  if (v7) {
    ++*(void *)(*(void *)(a1[5] + 8) + 24);
  }
  id v8 = [v5 tenthPercentileAwakeHeartRateStatistics];

  if (v8) {
    ++*(void *)(*(void *)(a1[6] + 8) + 24);
  }
}

- (id)_processorConfigurationForTodayIndex:(int64_t)a3 deviationsFeatureStatus:(id)a4 calendar:(id)a5
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  p_profile = &self->_profile;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v11 = _UserCharacteristicOfType(WeakRetained, (void *)*MEMORY[0x263F09468]);

  id v12 = objc_loadWeakRetained((id *)&self->_profile);
  v13 = (void *)*MEMORY[0x263F0AA70];
  uint64_t v14 = _UserCharacteristicOfType(v12, (void *)*MEMORY[0x263F0AA70]);

  id v15 = objc_loadWeakRetained((id *)&self->_profile);
  uint64_t v16 = _UserCharacteristicModificationDayOfType(v15, v13, v8);

  id v17 = objc_loadWeakRetained((id *)&self->_profile);
  id v18 = (void *)*MEMORY[0x263F0AA78];
  uint64_t v19 = _UserCharacteristicOfType(v17, (void *)*MEMORY[0x263F0AA78]);

  id v20 = objc_loadWeakRetained((id *)&self->_profile);
  id v58 = v8;
  v21 = v8;
  v22 = v7;
  uint64_t v23 = _UserCharacteristicModificationDayOfType(v20, v18, v21);

  uint64_t v24 = [(HKMCSettingsManager *)self->_settingsManager cycleLengthModificationDayIndexOverriding:v16];
  uint64_t v25 = [(HKMCSettingsManager *)self->_settingsManager periodLengthModificationDayIndexOverriding:v23];
  v59 = (void *)v14;
  v57 = (void *)v19;
  v26 = objc_msgSend(MEMORY[0x263F42978], "hkmc_configurationWithBirthDateComponents:userReportedCycleLength:onDayIndex:userReportedMenstruationLength:onDayIndex:", v11, v14, v24, v19, v25);
  [v26 setTodayAsJulianDay:a3];
  if (v7)
  {
    v56 = v11;
    uint64_t v27 = *MEMORY[0x263F09600];
    v28 = [v7 objectForKeyedSubscript:*MEMORY[0x263F09600]];
    uint64_t v29 = [v28 areAllRequirementsSatisfied];

    _HKInitializeLogging();
    v30 = (void *)*MEMORY[0x263F09930];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
    {
      v31 = v30;
      v32 = objc_opt_class();
      v33 = @"NO";
      if (v29) {
        v33 = @"YES";
      }
      *(_DWORD *)buf = 138543618;
      id v62 = v32;
      __int16 v63 = 2112;
      v64 = v33;
      id v34 = v32;
      _os_log_impl(&dword_225722000, v31, OS_LOG_TYPE_DEFAULT, "[%{public}@] Deviation detection meets usage requirements: %@", buf, 0x16u);
    }
    v35 = [v22 onboardingRecord];
    v36 = [v35 featureSettings];

    deviationInputManager = self->_deviationInputManager;
    id v60 = 0;
    BOOL v38 = [(HDMCDeviationInputManager *)deviationInputManager clearStateIfNecessaryFromSettings:v36 usageRequirementsSatisfied:v29 error:&v60];
    id v39 = v60;
    v40 = v58;
    if (!v38 && (_HKInitializeLogging(), os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR)))
    {
      -[HDMCAnalysisManager _processorConfigurationForTodayIndex:deviationsFeatureStatus:calendar:]();
      if (v29) {
        goto LABEL_9;
      }
    }
    else if (v29)
    {
LABEL_9:
      uint64_t v41 = [v36 deviationDetectionEnabledSetExplicitlyForAnyType];
      v42 = (void *)MEMORY[0x263F42990];
      id v43 = objc_loadWeakRetained((id *)p_profile);
      v44 = objc_msgSend(v42, "hdmc_deviationInputWithProfile:enabledSetExplicitly:calendar:", v43, v41, v58);
      [v26 setDeviationInput:v44];

LABEL_15:
      v11 = v56;
      goto LABEL_16;
    }
    _HKInitializeLogging();
    v48 = (void *)*MEMORY[0x263F09930];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
    {
      v49 = v48;
      v50 = objc_opt_class();
      id v54 = v50;
      v51 = [v22 objectForKeyedSubscript:v27];
      v52 = [v51 unsatisfiedRequirementIdentifiers];
      *(_DWORD *)buf = 138543618;
      id v62 = v50;
      __int16 v63 = 2112;
      v64 = v52;
      _os_log_impl(&dword_225722000, v49, OS_LOG_TYPE_DEFAULT, "[%{public}@] Deviation detection unsatisfied usage requirements: %@", buf, 0x16u);
    }
    goto LABEL_15;
  }
  _HKInitializeLogging();
  v45 = (void *)*MEMORY[0x263F09930];
  v40 = v58;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
  {
    v46 = v45;
    *(_DWORD *)buf = 138543362;
    id v62 = (id)objc_opt_class();
    id v47 = v62;
    _os_log_impl(&dword_225722000, v46, OS_LOG_TYPE_DEFAULT, "[%{public}@] Deviation detection suppressed on watch", buf, 0xCu);
  }
LABEL_16:

  return v26;
}

- (id)_queue_computeAnalysisWithDatabaseAccessibilityAssertion:(id)a3 forceIncludeCycles:(BOOL)a4 forceAnalyzeCompleteHistory:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  uint64_t v372 = *MEMORY[0x263EF8340];
  id v251 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v253 = self;
  if (self->_test_analysis)
  {
    _HKInitializeLogging();
    v11 = (void *)*MEMORY[0x263F09930];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
    {
      id v12 = v11;
      v13 = objc_opt_class();
      test_analysis = self->_test_analysis;
      *(_DWORD *)buf = 138543618;
      id v356 = v13;
      __int16 v357 = 2112;
      id v358 = test_analysis;
      id v15 = v13;
      _os_log_impl(&dword_225722000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Returning test analysis: %@", buf, 0x16u);
    }
    observers = self->_observers;
    v351[0] = MEMORY[0x263EF8330];
    v351[1] = 3221225472;
    v351[2] = __133__HDMCAnalysisManager__queue_computeAnalysisWithDatabaseAccessibilityAssertion_forceIncludeCycles_forceAnalyzeCompleteHistory_error___block_invoke;
    v351[3] = &unk_264750928;
    v351[4] = self;
    [(HKObserverSet *)observers notifyObservers:v351];
    id v17 = self->_test_analysis;
    goto LABEL_226;
  }
  location = (id *)&self->_profile;
  v248 = a6;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  uint64_t v19 = [WeakRetained daemon];
  id v20 = [v19 behavior];
  int v21 = [v20 tinkerModeEnabled];

  if (!v21)
  {
    uint64_t v27 = v253;
    if ([(HKObserverSet *)v253->_userInitiatedObservers count])
    {
      int v243 = 1;
    }
    else
    {
      v28 = [MEMORY[0x263F0A980] sharedBehavior];
      int v243 = [v28 isAppleWatch] | v8;

      uint64_t v27 = v253;
    }
    v254 = [(HKCalendarCache *)v27->_calendarCache currentCalendar];
    uint64_t v29 = HKMCTodayIndex();
    id v30 = objc_loadWeakRetained(location);
    v31 = [v30 featureSettingsManager];
    uint64_t v32 = *MEMORY[0x263F09798];
    id v350 = 0;
    obuint64_t j = [v31 featureSettingsForFeatureIdentifier:v32 error:&v350];
    id v33 = v350;

    if (obj)
    {
      heartRateFeatureStatusManager = v253->_heartRateFeatureStatusManager;
      id v349 = v33;
      v245 = [(HKFeatureStatusManager *)heartRateFeatureStatusManager featureStatusWithError:&v349];
      id v35 = v349;

      if (v245)
      {
        uint64_t v36 = *MEMORY[0x263F09600];
        v37 = [(NSArray *)v245 objectForKeyedSubscript:*MEMORY[0x263F09600]];
        unsigned int v241 = [v37 areAllRequirementsSatisfied];

        _HKInitializeLogging();
        BOOL v38 = (id)*MEMORY[0x263F09930];
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          id v39 = (id)objc_opt_class();
          v40 = v39;
          uint64_t v41 = @"NO";
          if (v241) {
            uint64_t v41 = @"YES";
          }
          *(_DWORD *)buf = 138543618;
          id v356 = v39;
          __int16 v357 = 2112;
          id v358 = v41;
          _os_log_impl(&dword_225722000, v38, OS_LOG_TYPE_DEFAULT, "[%{public}@] Use heart rate input: %@", buf, 0x16u);
        }
        wristTemperatureFeatureStatusManager = v253->_wristTemperatureFeatureStatusManager;
        id v348 = v35;
        v244 = [(HKFeatureStatusManager *)wristTemperatureFeatureStatusManager featureStatusWithError:&v348];
        id v43 = v348;

        if (v244)
        {
          v44 = [(NSArray *)v244 objectForKeyedSubscript:v36];
          int v236 = [v44 areAllRequirementsSatisfied];

          _HKInitializeLogging();
          v45 = (id)*MEMORY[0x263F09930];
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
          {
            id v46 = (id)objc_opt_class();
            id v47 = v46;
            v48 = @"NO";
            if (v236) {
              v48 = @"YES";
            }
            *(_DWORD *)buf = 138543618;
            id v356 = v46;
            __int16 v357 = 2112;
            id v358 = v48;
            _os_log_impl(&dword_225722000, v45, OS_LOG_TYPE_DEFAULT, "[%{public}@] Use wrist temperature input: %@", buf, 0x16u);
          }
          deviationsFeatureStatusManager = v253->_deviationsFeatureStatusManager;
          id v347 = v43;
          v242 = [(HKFeatureStatusManager *)deviationsFeatureStatusManager featureStatusWithError:&v347];
          id v50 = v347;

          if (v253->_deviationsFeatureStatusManager && !v242)
          {
            _HKInitializeLogging();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR)) {
              -[HDMCAnalysisManager _queue_computeAnalysisWithDatabaseAccessibilityAssertion:forceIncludeCycles:forceAnalyzeCompleteHistory:error:].cold.4();
            }
            v51 = (NSArray *)v50;
            if (v51)
            {
              if (!v248)
              {
                v103 = v51;
                _HKLogDroppedError();
                id v17 = 0;
                v51 = v103;
                v55 = v103;
                goto LABEL_222;
              }
              v51 = v51;
              id v17 = 0;
              id *v248 = v51;
            }
            else
            {
              id v17 = 0;
            }
            v55 = v51;
LABEL_222:

            id v54 = v242;
            goto LABEL_223;
          }
          v237 = [(HDMCAnalysisManager *)v253 _processorConfigurationForTodayIndex:v29 deviationsFeatureStatus:v242 calendar:v254];
          v252 = (*((void (**)(void))v253->_dayStreamProcessorProvider + 2))();
          v235 = (*((void (**)(void))v253->_historicalAnalyzerProvider + 2))();
          if (!v252)
          {
            v219 = [MEMORY[0x263F08690] currentHandler];
            [v219 handleFailureInMethod:a2, v253, @"HDMCAnalysisManager.m", 497, @"Invalid parameter not satisfying: %@", @"processor" object file lineNumber description];
          }
          if (!v235)
          {
            v220 = [MEMORY[0x263F08690] currentHandler];
            [v220 handleFailureInMethod:a2, v253, @"HDMCAnalysisManager.m", 498, @"Invalid parameter not satisfying: %@", @"historicalAnalyzer" object file lineNumber description];
          }
          v234 = [[HDMCSymptomHistoryBuilder alloc] initWithCurrentDayIndex:v29];
          uint64_t v341 = 0;
          v342 = &v341;
          uint64_t v343 = 0x3032000000;
          v344 = __Block_byref_object_copy__1;
          v345 = __Block_byref_object_dispose__1;
          id v346 = 0;
          uint64_t v337 = 0;
          v338 = &v337;
          uint64_t v339 = 0x2020000000;
          uint64_t v340 = 0;
          uint64_t v333 = 0;
          v334 = &v333;
          uint64_t v335 = 0x2020000000;
          uint64_t v336 = 0;
          uint64_t v327 = 0;
          v328 = &v327;
          uint64_t v329 = 0x3032000000;
          v330 = __Block_byref_object_copy__1;
          v331 = __Block_byref_object_dispose__1;
          id v332 = 0;
          uint64_t v321 = 0;
          v322 = &v321;
          uint64_t v323 = 0x3032000000;
          v324 = __Block_byref_object_copy__1;
          v325 = __Block_byref_object_dispose__1;
          id v326 = 0;
          uint64_t v315 = 0;
          v316 = &v315;
          uint64_t v317 = 0x3032000000;
          v318 = __Block_byref_object_copy__1;
          v319 = __Block_byref_object_dispose__1;
          id v320 = 0;
          v56 = _HKLogPersistedSignposts();
          uint64_t spid = _HKLogSignpostIDGenerate();

          _HKInitializeLogging();
          v57 = _HKLogPersistedSignposts();
          BOOL v58 = os_signpost_enabled(v57);

          if (v58)
          {
            v59 = _HKLogPersistedSignposts();
            id v60 = v59;
            if ((unint64_t)(spid - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v59))
            {
              v61 = [NSNumber numberWithBool:v241];
              *(_DWORD *)buf = 138412290;
              id v356 = v61;
              _os_signpost_emit_with_name_impl(&dword_225722000, v60, OS_SIGNPOST_INTERVAL_BEGIN, spid, "menstrual-cycles-analysis", "useHeartRateInput=%@", buf, 0xCu);
            }
          }
          if ([(HKObserverSet *)v253->_userInitiatedObservers count]) {
            int v62 = 1;
          }
          else {
            int v62 = v7;
          }
          BOOL v63 = v62 == 0;
          uint64_t v231 = *MEMORY[0x263F0A050] + 1;
          if (v62) {
            uint64_t v64 = *(void *)(MEMORY[0x263F094E8] + 8);
          }
          else {
            uint64_t v64 = *MEMORY[0x263F0A050] + 1;
          }
          uint64_t v249 = v64;
          uint64_t v65 = v29 - *MEMORY[0x263F0A050] + 1;
          if (v63) {
            uint64_t v66 = v29 - *MEMORY[0x263F0A050] + 1;
          }
          else {
            uint64_t v66 = *MEMORY[0x263F094E8];
          }
          uint64_t v239 = v66;
          v67 = [MEMORY[0x263EFF910] date];
          uint64_t v68 = objc_msgSend(v67, "hk_morningIndexWithCalendar:", v254);

          v69 = (void *)MEMORY[0x263F43180];
          id v70 = objc_loadWeakRetained(location);
          calendarCache = v253->_calendarCache;
          id v314 = v50;
          v238 = objc_msgSend(v69, "hdmc_ongoingFactorsOnDayIndex:profile:calendarCache:error:", v65, v70, calendarCache, &v314);
          id v72 = v314;

          _HKInitializeLogging();
          v73 = (id)*MEMORY[0x263F09930];
          if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
          {
            id v74 = (id)objc_opt_class();
            v75 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v238, "count"));
            *(_DWORD *)buf = 138543618;
            id v356 = v74;
            __int16 v357 = 2112;
            id v358 = v75;
            _os_log_impl(&dword_225722000, v73, OS_LOG_TYPE_DEFAULT, "[%{public}@] Total ongoing cycle factors that overlap time range: %@", buf, 0x16u);
          }
          if (v238)
          {
            id v313 = v72;
            BOOL v76 = [(HDMCAnalysisManager *)v253 initiateCycleFactorsAutomaticUpgradeWithDatabaseAccessibilityAssertion:v251 error:&v313];
            id v77 = v313;

            if (v76)
            {
              long long v311 = 0u;
              long long v312 = 0u;
              long long v309 = 0u;
              long long v310 = 0u;
              id v78 = v238;
              uint64_t v79 = [v78 countByEnumeratingWithState:&v309 objects:v371 count:16];
              if (v79)
              {
                uint64_t v80 = *(void *)v310;
                do
                {
                  for (uint64_t i = 0; i != v79; ++i)
                  {
                    if (*(void *)v310 != v80) {
                      objc_enumerationMutation(v78);
                    }
                    v82 = *(void **)(*((void *)&v309 + 1) + 8 * i);
                    objc_msgSend(v82, "hkmc_cycleFactor");
                    uint64_t v83 = HAMenstrualAlgorithmsPhaseFromHKMCCycleFactor();
                    v84 = [v82 startDate];
                    objc_msgSend(v252, "beginPhase:onJulianDay:", v83, objc_msgSend(v84, "hk_dayIndexWithCalendar:", v254));
                  }
                  uint64_t v79 = [v78 countByEnumeratingWithState:&v309 objects:v371 count:16];
                }
                while (v79);
              }

              id v85 = objc_alloc_init(MEMORY[0x263EFF9A0]);
              uint64_t v305 = 0;
              v306 = &v305;
              uint64_t v307 = 0x2020000000;
              uint64_t v308 = 0;
              uint64_t v301 = 0;
              v302 = &v301;
              uint64_t v303 = 0x2020000000;
              uint64_t v304 = 0;
              if (v241)
              {
                v86 = [HDMCHeartStatisticsEnumerator alloc];
                id v87 = objc_loadWeakRetained(location);
                v88 = -[HDMCHeartStatisticsEnumerator initWithProfile:calendarCache:dayIndexRange:databaseAccessibilityAssertion:](v86, "initWithProfile:calendarCache:dayIndexRange:databaseAccessibilityAssertion:", v87, v253->_calendarCache, v68 - 100, 100, v251);

                _HKInitializeLogging();
                v89 = (id)*MEMORY[0x263F09930];
                if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
                {
                  id v90 = (id)objc_opt_class();
                  *(_DWORD *)buf = 138543362;
                  id v356 = v90;
                  _os_log_impl(&dword_225722000, v89, OS_LOG_TYPE_DEFAULT, "[%{public}@] Enumerating heart rate statistics", buf, 0xCu);
                }
                id v300 = v77;
                v296[0] = MEMORY[0x263EF8330];
                v296[1] = 3221225472;
                v296[2] = __133__HDMCAnalysisManager__queue_computeAnalysisWithDatabaseAccessibilityAssertion_forceIncludeCycles_forceAnalyzeCompleteHistory_error___block_invoke_337;
                v296[3] = &unk_264750950;
                id v297 = v85;
                v298 = &v305;
                v299 = &v301;
                BOOL v91 = [(HDMCHeartStatisticsEnumerator *)v88 enumerateWithError:&v300 handler:v296];
                id v92 = v300;

                if (!v91)
                {
                  _HKInitializeLogging();
                  v93 = (id)*MEMORY[0x263F09930];
                  if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
                  {
                    v94 = objc_opt_class();
                    -[HDMCAnalysisManager _queue_computeAnalysisWithDatabaseAccessibilityAssertion:forceIncludeCycles:forceAnalyzeCompleteHistory:error:]0(v94);
                  }
                }
              }
              else
              {
                id v92 = v77;
              }
              v104 = [HDMCDaySummaryEnumerator alloc];
              id v105 = objc_loadWeakRetained(location);
              LOBYTE(v221) = v236;
              v230 = -[HDMCDaySummaryEnumerator initWithProfile:calendarCache:dayIndexRange:ascending:includeFactors:includeWristTemperature:](v104, "initWithProfile:calendarCache:dayIndexRange:ascending:includeFactors:includeWristTemperature:", v105, v253->_calendarCache, v239, v249, 1, 1, v221);

              _HKInitializeLogging();
              v106 = (id)*MEMORY[0x263F09930];
              if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
              {
                id v107 = (id)objc_opt_class();
                *(_DWORD *)buf = 138543362;
                id v356 = v107;
                _os_log_impl(&dword_225722000, v106, OS_LOG_TYPE_DEFAULT, "[%{public}@] Enumerating day summaries", buf, 0xCu);
              }
              uint64_t v292 = 0;
              v293 = &v292;
              uint64_t v294 = 0x2020000000;
              uint64_t v295 = v68 - 101;
              id v291 = v92;
              v274[0] = MEMORY[0x263EF8330];
              v274[1] = 3221225472;
              v274[2] = __133__HDMCAnalysisManager__queue_computeAnalysisWithDatabaseAccessibilityAssertion_forceIncludeCycles_forceAnalyzeCompleteHistory_error___block_invoke_340;
              v274[3] = &unk_264750978;
              uint64_t v286 = v65;
              uint64_t v287 = v231;
              v274[4] = v253;
              v279 = &v337;
              id v108 = v252;
              char v289 = v241;
              id v275 = v108;
              v280 = &v292;
              v240 = (NSArray *)v85;
              v276 = v240;
              uint64_t v288 = v29;
              v224 = v234;
              v277 = v224;
              v281 = &v341;
              v282 = &v327;
              v283 = &v321;
              char v290 = v243;
              v284 = &v315;
              v285 = &v333;
              id v223 = v235;
              id v278 = v223;
              BOOL v109 = [(HDMCDaySummaryEnumerator *)v230 enumerateWithError:&v291 handler:v274];
              id v232 = v291;

              if (v241)
              {
                uint64_t v110 = v293[3];
                if (v110 < v68 - 1)
                {
                  uint64_t v111 = v110 + 1;
                  do
                  {
                    v112 = [NSNumber numberWithInteger:v111];
                    v113 = [(NSArray *)v240 objectForKeyedSubscript:v112];
                    BOOL v114 = v113 == 0;

                    if (!v114)
                    {
                      v115 = (void *)MEMORY[0x263F42968];
                      v116 = [NSNumber numberWithInteger:v111];
                      v117 = [(NSArray *)v240 objectForKeyedSubscript:v116];
                      v118 = objc_msgSend(v115, "hkmc_dayInputWithHeartStatistics:", v117);
                      [v108 appendDay:v118];
                    }
                    v293[3] = v111++;
                  }
                  while (v68 != v111);
                }
              }
              _HKInitializeLogging();
              v119 = (id)*MEMORY[0x263F09930];
              if (os_log_type_enabled(v119, OS_LOG_TYPE_DEFAULT))
              {
                id v120 = (id)objc_opt_class();
                v226 = [NSNumber numberWithInteger:v338[3]];
                v228 = [(NSArray *)v237 birthDateComponents];
                v227 = objc_msgSend(v228, "hk_dayIndexDateDescription");
                HKSensitiveLogItem();
                id v250 = (id)objc_claimAutoreleasedReturnValue();
                v225 = [(NSArray *)v237 userReportedCycleLength];
                v121 = [(NSArray *)v237 julianDayOfUserReportedCycleLength];
                v122 = [(NSArray *)v237 userReportedMenstruationLength];
                v123 = [(NSArray *)v237 julianDayOfUserReportedMenstruationLength];
                v124 = objc_msgSend(NSNumber, "numberWithInteger:", -[HKMCSettingsManager dayStreamProcessorAlgorithmVersion](v253->_settingsManager, "dayStreamProcessorAlgorithmVersion"));
                *(_DWORD *)buf = 138545154;
                id v356 = v120;
                __int16 v357 = 2112;
                id v358 = v226;
                __int16 v359 = 2112;
                id v360 = v250;
                __int16 v361 = 2112;
                v362 = v225;
                __int16 v363 = 2112;
                v364 = v121;
                __int16 v365 = 2112;
                v366 = v122;
                __int16 v367 = 2112;
                v368 = v123;
                __int16 v369 = 2112;
                v370 = v124;
                _os_log_impl(&dword_225722000, v119, OS_LOG_TYPE_DEFAULT, "[%{public}@] Analyzing %@ summaries with user entered birthdate: %@, cycle length: %@ (%@), period length: %@ (%@) alg version %@", buf, 0x52u);
              }
              if (v243)
              {
                _HKInitializeLogging();
                v125 = (id)*MEMORY[0x263F09930];
                if (os_log_type_enabled(v125, OS_LOG_TYPE_DEFAULT))
                {
                  id v126 = (id)objc_opt_class();
                  v127 = [NSNumber numberWithInteger:v334[3]];
                  *(_DWORD *)buf = 138543618;
                  id v356 = v126;
                  __int16 v357 = 2112;
                  id v358 = v127;
                  _os_log_impl(&dword_225722000, v125, OS_LOG_TYPE_DEFAULT, "[%{public}@] Analyzing %@ summaries for cycles", buf, 0x16u);
                }
              }
              else
              {
                _HKInitializeLogging();
                v125 = (id)*MEMORY[0x263F09930];
                if (os_log_type_enabled(v125, OS_LOG_TYPE_DEFAULT))
                {
                  id v128 = (id)objc_opt_class();
                  *(_DWORD *)buf = 138543362;
                  id v356 = v128;
                  _os_log_impl(&dword_225722000, v125, OS_LOG_TYPE_DEFAULT, "[%{public}@] Not analyzing for cycles", buf, 0xCu);
                }
              }

              if (v109)
              {
                test_algorithmsAnalysis = v253->_test_algorithmsAnalysis;
                if (test_algorithmsAnalysis)
                {
                  v130 = test_algorithmsAnalysis;
                  goto LABEL_142;
                }
                uint64_t v140 = [(id)v316[5] integerValue];
                id v273 = v232;
                v141 = [v108 analyzeWithMostRecentMenstrualFlowJulianDayUpdated:v140 error:&v273];
                id v142 = v273;

                v130 = v141;
                if (v130)
                {
                  id v232 = v142;
LABEL_142:
                  _HKInitializeLogging();
                  v229 = v130;
                  v143 = (id)*MEMORY[0x263F09930];
                  if (os_log_type_enabled(v143, OS_LOG_TYPE_DEFAULT))
                  {
                    id v144 = (id)objc_opt_class();
                    v145 = [(HAMenstrualAlgorithmsAnalysis *)v130 hkmc_description];
                    HKSensitiveLogItem();
                    id v146 = (id)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138543618;
                    id v356 = v144;
                    __int16 v357 = 2112;
                    id v358 = v146;
                    _os_log_impl(&dword_225722000, v143, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received analysis from algorithms: %@", buf, 0x16u);
                  }
                  long long v271 = 0u;
                  long long v272 = 0u;
                  long long v269 = 0u;
                  long long v270 = 0u;
                  v147 = [(HAMenstrualAlgorithmsAnalysis *)v229 menstruationPredictions];
                  uint64_t v148 = [v147 countByEnumeratingWithState:&v269 objects:v354 count:16];
                  if (v148)
                  {
                    uint64_t v149 = *(void *)v270;
                    do
                    {
                      for (uint64_t j = 0; j != v148; ++j)
                      {
                        if (*(void *)v270 != v149) {
                          objc_enumerationMutation(v147);
                        }
                        v151 = *(void **)(*((void *)&v269 + 1) + 8 * j);
                        _HKInitializeLogging();
                        v152 = (id)*MEMORY[0x263F09930];
                        if (os_log_type_enabled(v152, OS_LOG_TYPE_DEFAULT))
                        {
                          id v153 = (id)objc_opt_class();
                          v154 = objc_msgSend(v151, "hkmc_description");
                          HKSensitiveLogItem();
                          id v155 = (id)objc_claimAutoreleasedReturnValue();
                          *(_DWORD *)buf = 138543618;
                          id v356 = v153;
                          __int16 v357 = 2112;
                          id v358 = v155;
                          _os_log_impl(&dword_225722000, v152, OS_LOG_TYPE_DEFAULT, "[%{public}@] Menstruation prediction: %@", buf, 0x16u);
                        }
                      }
                      uint64_t v148 = [v147 countByEnumeratingWithState:&v269 objects:v354 count:16];
                    }
                    while (v148);
                  }

                  long long v267 = 0u;
                  long long v268 = 0u;
                  long long v265 = 0u;
                  long long v266 = 0u;
                  v156 = [(HAMenstrualAlgorithmsAnalysis *)v229 fertilityPredictions];
                  uint64_t v157 = [v156 countByEnumeratingWithState:&v265 objects:v353 count:16];
                  if (v157)
                  {
                    uint64_t v158 = *(void *)v266;
                    do
                    {
                      for (uint64_t k = 0; k != v157; ++k)
                      {
                        if (*(void *)v266 != v158) {
                          objc_enumerationMutation(v156);
                        }
                        v160 = *(void **)(*((void *)&v265 + 1) + 8 * k);
                        _HKInitializeLogging();
                        v161 = (id)*MEMORY[0x263F09930];
                        if (os_log_type_enabled(v161, OS_LOG_TYPE_DEFAULT))
                        {
                          id v162 = (id)objc_opt_class();
                          v163 = objc_msgSend(v160, "hkmc_description");
                          HKSensitiveLogItem();
                          id v164 = (id)objc_claimAutoreleasedReturnValue();
                          *(_DWORD *)buf = 138543618;
                          id v356 = v162;
                          __int16 v357 = 2112;
                          id v358 = v164;
                          _os_log_impl(&dword_225722000, v161, OS_LOG_TYPE_DEFAULT, "[%{public}@] Fertility prediction: %@", buf, 0x16u);
                        }
                      }
                      uint64_t v157 = [v156 countByEnumeratingWithState:&v265 objects:v353 count:16];
                    }
                    while (v157);
                  }

                  if (v243)
                  {
                    test_algorithmsCycles = v253->_test_algorithmsCycles;
                    if (test_algorithmsCycles)
                    {
                      v166 = test_algorithmsCycles;
                    }
                    else
                    {
                      id v264 = v232;
                      v168 = [v223 analyzeWithError:&v264];
                      id v169 = v264;

                      v166 = v168;
                      if (!v166)
                      {
                        _HKInitializeLogging();
                        v217 = (id)*MEMORY[0x263F09930];
                        if (os_log_type_enabled(v217, OS_LOG_TYPE_ERROR))
                        {
                          objc_opt_class();
                          -[HDMCAnalysisManager _queue_computeAnalysisWithDatabaseAccessibilityAssertion:forceIncludeCycles:forceAnalyzeCompleteHistory:error:].cold.7();
                        }

                        v218 = (NSArray *)v169;
                        v167 = v218;
                        if (v218)
                        {
                          if (v248)
                          {
                            v167 = v218;
                            id v17 = 0;
                            id *v248 = v167;
                            v55 = v167;
                            goto LABEL_219;
                          }
                          _HKLogDroppedError();
                        }
                        id v17 = 0;
                        v55 = v167;
                        goto LABEL_219;
                      }
                      id v232 = v169;
                    }
                    _HKInitializeLogging();
                    v170 = (id)*MEMORY[0x263F09930];
                    if (os_log_type_enabled(v170, OS_LOG_TYPE_DEFAULT))
                    {
                      id v171 = (id)objc_opt_class();
                      v172 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSArray count](v166, "count"));
                      *(_DWORD *)buf = 138543618;
                      id v356 = v171;
                      __int16 v357 = 2112;
                      id v358 = v172;
                      _os_log_impl(&dword_225722000, v170, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received %@ cycles from historical analyzer", buf, 0x16u);
                    }
                    long long v262 = 0u;
                    long long v263 = 0u;
                    long long v260 = 0u;
                    long long v261 = 0u;
                    v167 = v166;
                    uint64_t v173 = [(NSArray *)v167 countByEnumeratingWithState:&v260 objects:v352 count:16];
                    if (v173)
                    {
                      uint64_t v174 = *(void *)v261;
                      do
                      {
                        for (uint64_t m = 0; m != v173; ++m)
                        {
                          if (*(void *)v261 != v174) {
                            objc_enumerationMutation(v167);
                          }
                          v176 = *(void **)(*((void *)&v260 + 1) + 8 * m);
                          _HKInitializeLogging();
                          v177 = (void *)*MEMORY[0x263F09930];
                          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEBUG))
                          {
                            v178 = v177;
                            if (os_log_type_enabled(v178, OS_LOG_TYPE_DEBUG))
                            {
                              id v179 = (id)objc_opt_class();
                              objc_msgSend(v176, "hkmc_description");
                              id v180 = (id)objc_claimAutoreleasedReturnValue();
                              *(_DWORD *)buf = 138543618;
                              id v356 = v179;
                              __int16 v357 = 2112;
                              id v358 = v180;
                              _os_log_debug_impl(&dword_225722000, v178, OS_LOG_TYPE_DEBUG, "[%{public}@] Cycle: %@", buf, 0x16u);
                            }
                          }
                        }
                        uint64_t v173 = [(NSArray *)v167 countByEnumeratingWithState:&v260 objects:v352 count:16];
                      }
                      while (v173);
                    }
                  }
                  else
                  {
                    v167 = 0;
                  }
                  _HKInitializeLogging();
                  v181 = _HKLogPersistedSignposts();
                  BOOL v182 = os_signpost_enabled(v181);

                  if (v182)
                  {
                    v183 = _HKLogPersistedSignposts();
                    v184 = v183;
                    if ((unint64_t)(spid - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v183))
                    {
                      v185 = [NSNumber numberWithBool:v241];
                      *(_DWORD *)buf = 138412290;
                      id v356 = v185;
                      _os_signpost_emit_with_name_impl(&dword_225722000, v184, OS_SIGNPOST_INTERVAL_END, spid, "menstrual-cycles-analysis", "useHeartRateInput=%@", buf, 0xCu);
                    }
                  }
                  uint64_t v186 = [(HDMCSymptomHistoryBuilder *)v224 recentSymptoms];
                  uint64_t v187 = v342[5];
                  uint64_t v188 = v328[5];
                  uint64_t v189 = v322[5];
                  uint64_t v190 = v306[3];
                  uint64_t v191 = v302[3];
                  v192 = [(NSArray *)v242 onboardingRecord];
                  v193 = [v192 featureSettings];
                  BYTE1(v222) = v236;
                  LOBYTE(v222) = v241;
                  v194 = -[HDMCAnalysisManager _analysisWithAlgorithmsAnalysis:algorithmsCycles:recentSymptoms:mostRecentBasalBodyTemperature:lastLoggedDayIndex:lastMenstrualFlowDayIndex:numberOfDailySleepHeartRateStatisticsForPast100Days:numberOfDailyAwakeHeartRateStatisticsForPast100Days:featureSettings:useHeartRateInput:useWristTemperatureInput:deviationsFeatureSettings:](v253, "_analysisWithAlgorithmsAnalysis:algorithmsCycles:recentSymptoms:mostRecentBasalBodyTemperature:lastLoggedDayIndex:lastMenstrualFlowDayIndex:numberOfDailySleepHeartRateStatisticsForPast100Days:numberOfDailyAwakeHeartRateStatisticsForPast100Days:featureSettings:useHeartRateInput:useWristTemperatureInput:deviationsFeatureSettings:", v229, v167, v186, v187, v188, v189, v190, v191, obj, v222, v193);

                  _HKInitializeLogging();
                  v195 = (void *)*MEMORY[0x263F09930];
                  if (os_signpost_enabled((os_log_t)*MEMORY[0x263F09930]))
                  {
                    v196 = v195;
                    if (os_signpost_enabled(v196))
                    {
                      *(_WORD *)buf = 0;
                      _os_signpost_emit_with_name_impl(&dword_225722000, v196, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "hdmc_analysisSampleInfo", "", buf, 2u);
                    }
                  }
                  v197 = (void *)MEMORY[0x263F43318];
                  id v259 = 0;
                  id v198 = objc_loadWeakRetained(location);
                  id v258 = v232;
                  char v199 = objc_msgSend(v197, "hdmc_analysisSampleInfo:forProfile:error:", &v259, v198, &v258);
                  id v200 = v259;
                  v55 = (NSArray *)v258;

                  if (v199)
                  {
                    [v194 setLatestSampleInfo:v200];
                    _HKInitializeLogging();
                    v201 = (void *)*MEMORY[0x263F09930];
                    if (os_signpost_enabled((os_log_t)*MEMORY[0x263F09930]))
                    {
                      v202 = v201;
                      if (os_signpost_enabled(v202))
                      {
                        *(_WORD *)buf = 0;
                        _os_signpost_emit_with_name_impl(&dword_225722000, v202, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "hdmc_analysisSampleInfo", "", buf, 2u);
                      }
                    }
                    _HKInitializeLogging();
                    v203 = (id)*MEMORY[0x263F09930];
                    if (os_log_type_enabled(v203, OS_LOG_TYPE_DEFAULT))
                    {
                      id v204 = (id)objc_opt_class();
                      HKSensitiveLogItem();
                      id v205 = (id)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138543618;
                      id v356 = v204;
                      __int16 v357 = 2112;
                      id v358 = v205;
                      _os_log_impl(&dword_225722000, v203, OS_LOG_TYPE_DEFAULT, "[%{public}@] Did update analysis: %@", buf, 0x16u);
                    }
                    objc_storeStrong((id *)&v253->_queue_lastFeatureSettings, obj);
                    v206 = v253->_observers;
                    v255[0] = MEMORY[0x263EF8330];
                    v255[1] = 3221225472;
                    v255[2] = __133__HDMCAnalysisManager__queue_computeAnalysisWithDatabaseAccessibilityAssertion_forceIncludeCycles_forceAnalyzeCompleteHistory_error___block_invoke_344;
                    v255[3] = &unk_264750928;
                    v207 = v194;
                    v256 = v207;
                    [(HKObserverSet *)v206 notifyObservers:v255];
                    id v17 = v207;
                    v208 = v256;
                  }
                  else
                  {
                    _HKInitializeLogging();
                    v209 = (id)*MEMORY[0x263F09930];
                    if (os_log_type_enabled(v209, OS_LOG_TYPE_ERROR))
                    {
                      v210 = objc_opt_class();
                      -[HDMCAnalysisManager _queue_computeAnalysisWithDatabaseAccessibilityAssertion:forceIncludeCycles:forceAnalyzeCompleteHistory:error:].cold.8(v210);
                    }

                    v211 = v55;
                    v212 = v211;
                    if (v211)
                    {
                      if (v248) {
                        id *v248 = v211;
                      }
                      else {
                        _HKLogDroppedError();
                      }
                    }

                    _HKInitializeLogging();
                    v215 = (void *)*MEMORY[0x263F09930];
                    if (!os_signpost_enabled((os_log_t)*MEMORY[0x263F09930]))
                    {
                      id v17 = 0;
                      goto LABEL_218;
                    }
                    v208 = v215;
                    if (os_signpost_enabled(v208))
                    {
                      *(_WORD *)v257 = 0;
                      _os_signpost_emit_with_name_impl(&dword_225722000, v208, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "hdmc_analysisSampleInfo", "", v257, 2u);
                    }
                    id v17 = 0;
                  }

LABEL_218:
LABEL_219:

                  v138 = v229;
                  goto LABEL_220;
                }
                _HKInitializeLogging();
                v213 = (id)*MEMORY[0x263F09930];
                if (os_log_type_enabled(v213, OS_LOG_TYPE_ERROR))
                {
                  objc_opt_class();
                  -[HDMCAnalysisManager _queue_computeAnalysisWithDatabaseAccessibilityAssertion:forceIncludeCycles:forceAnalyzeCompleteHistory:error:].cold.6();
                }

                v214 = (HAMenstrualAlgorithmsAnalysis *)v142;
                v138 = v214;
                if (v214)
                {
                  if (v248)
                  {
                    v139 = v214;
                    goto LABEL_136;
                  }
                  _HKLogDroppedError();
                }
              }
              else
              {
                _HKInitializeLogging();
                v131 = _HKLogPersistedSignposts();
                BOOL v132 = os_signpost_enabled(v131);

                if (v132)
                {
                  v133 = _HKLogPersistedSignposts();
                  v134 = v133;
                  if ((unint64_t)(spid - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v133))
                  {
                    v135 = [NSNumber numberWithBool:v241];
                    *(_DWORD *)buf = 138412290;
                    id v356 = v135;
                    _os_signpost_emit_with_name_impl(&dword_225722000, v134, OS_SIGNPOST_INTERVAL_END, spid, "menstrual-cycles-analysis", "useHeartRateInput=%@", buf, 0xCu);
                  }
                }
                _HKInitializeLogging();
                v136 = (id)*MEMORY[0x263F09930];
                if (os_log_type_enabled(v136, OS_LOG_TYPE_ERROR))
                {
                  objc_opt_class();
                  -[HDMCAnalysisManager _queue_computeAnalysisWithDatabaseAccessibilityAssertion:forceIncludeCycles:forceAnalyzeCompleteHistory:error:].cold.9();
                }

                v137 = (HAMenstrualAlgorithmsAnalysis *)v232;
                v138 = v137;
                if (v137)
                {
                  if (v248)
                  {
                    v139 = v137;
LABEL_136:
                    id v17 = 0;
                    v138 = v139;
                    id *v248 = v139;
                    v55 = (NSArray *)v139;
LABEL_220:

                    _Block_object_dispose(&v292, 8);
                    _Block_object_dispose(&v301, 8);
                    _Block_object_dispose(&v305, 8);
                    v99 = v240;
                    goto LABEL_221;
                  }
                  _HKLogDroppedError();
                }
              }
              id v17 = 0;
              v55 = (NSArray *)v138;
              goto LABEL_220;
            }
            v101 = (NSArray *)v77;
            v99 = v101;
            if (v101)
            {
              if (v248)
              {
                v100 = v101;
                goto LABEL_104;
              }
              _HKLogDroppedError();
            }
          }
          else
          {
            _HKInitializeLogging();
            v97 = (id)*MEMORY[0x263F09930];
            if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
            {
              objc_opt_class();
              -[HDMCAnalysisManager _queue_computeAnalysisWithDatabaseAccessibilityAssertion:forceIncludeCycles:forceAnalyzeCompleteHistory:error:].cold.5();
            }

            v98 = (NSArray *)v72;
            v99 = v98;
            if (v98)
            {
              if (v248)
              {
                v100 = v98;
LABEL_104:
                id v17 = 0;
                v99 = v100;
                id *v248 = v100;
                v55 = v100;
LABEL_221:

                _Block_object_dispose(&v315, 8);
                _Block_object_dispose(&v321, 8);

                _Block_object_dispose(&v327, 8);
                _Block_object_dispose(&v333, 8);
                _Block_object_dispose(&v337, 8);
                _Block_object_dispose(&v341, 8);

                v51 = v237;
                goto LABEL_222;
              }
              _HKLogDroppedError();
            }
          }
          id v17 = 0;
          v55 = v99;
          goto LABEL_221;
        }
        _HKInitializeLogging();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR)) {
          -[HDMCAnalysisManager _queue_computeAnalysisWithDatabaseAccessibilityAssertion:forceIncludeCycles:forceAnalyzeCompleteHistory:error:]();
        }
        id v54 = (NSArray *)v43;
        if (v54)
        {
          if (!v248)
          {
            v102 = v54;
            _HKLogDroppedError();
            id v17 = 0;
            id v54 = v102;
            v55 = v102;
            goto LABEL_223;
          }
          id v54 = v54;
          id v17 = 0;
          id *v248 = v54;
        }
        else
        {
          id v17 = 0;
        }
        v55 = v54;
LABEL_223:

        v53 = v244;
        goto LABEL_224;
      }
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR)) {
        -[HDMCAnalysisManager _queue_computeAnalysisWithDatabaseAccessibilityAssertion:forceIncludeCycles:forceAnalyzeCompleteHistory:error:]();
      }
      v53 = (NSArray *)v35;
      if (v53)
      {
        if (!v248)
        {
          v96 = v53;
          _HKLogDroppedError();
          id v17 = 0;
          v53 = v96;
          v55 = v96;
          goto LABEL_224;
        }
        v53 = v53;
        id v17 = 0;
        id *v248 = v53;
      }
      else
      {
        id v17 = 0;
      }
      v55 = v53;
LABEL_224:

      v52 = v245;
      goto LABEL_225;
    }
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR)) {
      -[HDMCAnalysisManager _queue_computeAnalysisWithDatabaseAccessibilityAssertion:forceIncludeCycles:forceAnalyzeCompleteHistory:error:]();
    }
    v52 = (NSArray *)v33;
    if (v52)
    {
      if (!v248)
      {
        v95 = v52;
        _HKLogDroppedError();
        id v17 = 0;
        v52 = v95;
        v55 = v95;
        goto LABEL_225;
      }
      v52 = v52;
      id v17 = 0;
      id *v248 = v52;
    }
    else
    {
      id v17 = 0;
    }
    v55 = v52;
LABEL_225:

    goto LABEL_226;
  }
  _HKInitializeLogging();
  v22 = (void *)*MEMORY[0x263F09930];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v23 = v22;
    *(_DWORD *)buf = 138543362;
    id v356 = (id)objc_opt_class();
    id v24 = v356;
    _os_log_impl(&dword_225722000, v23, OS_LOG_TYPE_DEFAULT, "[%{public}@] Skipping analysis since this is not a primary profile", buf, 0xCu);
  }
  objc_msgSend(MEMORY[0x263F087E8], "hk_featureUnavailableForProfileError");
  id v25 = (id)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (v25)
  {
    if (v248) {
      id *v248 = v25;
    }
    else {
      _HKLogDroppedError();
    }
  }

  id v17 = 0;
LABEL_226:

  return v17;
}

BOOL __97__HDMCAnalysisManager__queue_analyzeNowWithForceIncludeCycles_forceAnalyzeCompleteHistory_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "_queue_computeAnalysisWithDatabaseAccessibilityAssertion:forceIncludeCycles:forceAnalyzeCompleteHistory:error:", *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(unsigned __int8 *)(a1 + 57), a2);
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) != 0;
}

uint64_t __60__HDMCAnalysisManager_registerObserver_queue_userInitiated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_analyzeIfNeeded");
}

void __273__HDMCAnalysisManager__initWithProfile_settingsManager_featureAvailabilityManager_heartRateAvailabilityManager_wristTemperatureAvailabilityManager_deviationsAvailabilityManager_deviceScopedStorageManager_calendarCache_dayStreamProcessorProvider_historicalAnalyzerProvider___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = (id)objc_msgSend(WeakRetained, "_queue_analyzeNowWithForceIncludeCycles:forceAnalyzeCompleteHistory:error:", 0, 0, 0);
}

id __218__HDMCAnalysisManager_initWithProfile_settingsManager_featureAvailabilityManager_heartRateAvailabilityManager_wristTemperatureAvailabilityManager_deviationsAvailabilityManager_deviceScopedStorageManager_calendarCache___block_invoke_2()
{
  id v0 = objc_alloc_init(MEMORY[0x263F429A0]);
  return v0;
}

id __218__HDMCAnalysisManager_initWithProfile_settingsManager_featureAvailabilityManager_heartRateAvailabilityManager_wristTemperatureAvailabilityManager_deviationsAvailabilityManager_deviceScopedStorageManager_calendarCache___block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x263F42970];
  id v3 = a2;
  uint64_t v4 = (void *)[[v2 alloc] initWithConfig:v3];

  return v4;
}

- (BOOL)initiateCycleFactorsAutomaticUpgradeWithDatabaseAccessibilityAssertion:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL v7 = [(HDMCAnalysisManager *)self profile];
  BOOL v8 = v7;
  if (v7)
  {
    id v9 = [v7 onboardingCompletionManager];
    uint64_t v10 = *MEMORY[0x263F09798];
    id v26 = 0;
    v11 = [v9 onboardingCompletionsForHighestVersionOfFeatureIdentifier:v10 error:&v26];
    id v12 = v26;

    BOOL v13 = v11 != 0;
    if (!v11)
    {
      id v20 = v12;
      if (v20)
      {
        if (a4) {
          *a4 = v20;
        }
        else {
          _HKLogDroppedError();
        }
      }

      _HKInitializeLogging();
      int v21 = (void *)*MEMORY[0x263F09930];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR)) {
        -[HDMCAnalysisManager(CycleFactorsAutomaticUpgrade) initiateCycleFactorsAutomaticUpgradeWithDatabaseAccessibilityAssertion:error:](v21);
      }
      goto LABEL_17;
    }
    uint64_t v14 = [v11 firstObject];
    id v15 = v14;
    if (v14 && [v14 version] <= 1)
    {
      uint64_t v16 = [v6 cloneWithOwnerIdentifier:@"HDMCAnalysisManager+CycleFactorsAutomaticUpgrade"];
      id v17 = [(HDMCAnalysisManager *)self queue];
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __130__HDMCAnalysisManager_CycleFactorsAutomaticUpgrade__initiateCycleFactorsAutomaticUpgradeWithDatabaseAccessibilityAssertion_error___block_invoke;
      v23[3] = &unk_264750B00;
      v23[4] = self;
      id v24 = v16;
      id v25 = v8;
      id v18 = v16;
      dispatch_async(v17, v23);
    }
    else
    {
      uint64_t v19 = [(HDMCAnalysisManager *)self _test_didNotUpgradeOnboardingRecord];

      if (!v19)
      {
LABEL_10:

LABEL_17:
        goto LABEL_18;
      }
      id v18 = [(HDMCAnalysisManager *)self _test_didNotUpgradeOnboardingRecord];
      v18[2]();
    }

    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:description:", a4, 1, @"Profile is going away");
  BOOL v13 = 0;
LABEL_18:

  return v13;
}

- (HDProfile)profile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  return (HDProfile *)WeakRetained;
}

- (id)_test_didNotUpgradeOnboardingRecord
{
  return self->__test_didNotUpgradeOnboardingRecord;
}

- (id)_takeAccessibilityAssertion
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v3 = [WeakRetained database];
  uint64_t v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v9 = 0;
  id v6 = [v3 takeAccessibilityAssertionWithOwnerIdentifier:v5 timeout:&v9 error:300.0];
  id v7 = v9;

  if (!v6)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR)) {
      -[HDMCAnalysisManager _takeAccessibilityAssertion]();
    }
  }

  return v6;
}

- (id)_queue_analyzeNowWithForceIncludeCycles:(BOOL)a3 forceAnalyzeCompleteHistory:(BOOL)a4 error:(id *)a5
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v9 = [(HDMCAnalysisManager *)self _takeAccessibilityAssertion];
  uint64_t v10 = [MEMORY[0x263F43278] contextForAccessibilityAssertion:v9];
  [v10 setCacheScope:1];
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000;
  uint64_t v29 = __Block_byref_object_copy__1;
  id v30 = __Block_byref_object_dispose__1;
  id v31 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v12 = [WeakRetained database];
  uint64_t v17 = MEMORY[0x263EF8330];
  uint64_t v18 = 3221225472;
  uint64_t v19 = __97__HDMCAnalysisManager__queue_analyzeNowWithForceIncludeCycles_forceAnalyzeCompleteHistory_error___block_invoke;
  id v20 = &unk_264750900;
  uint64_t v23 = &v26;
  int v21 = self;
  id v13 = v9;
  id v22 = v13;
  BOOL v24 = a3;
  BOOL v25 = a4;
  LODWORD(a5) = [v12 performWithTransactionContext:v10 error:a5 block:&v17];

  if (a5 && v27[5])
  {
    os_unfair_lock_lock(&self->_lock);
    objc_storeStrong((id *)&self->_lock_currentAnalysis, (id)v27[5]);
    os_unfair_lock_unlock(&self->_lock);
    BOOL v14 = 0;
  }
  else
  {
    BOOL v14 = 1;
  }
  self->_queue_needsMaintenanceAnalysis = v14;
  objc_msgSend(v13, "invalidate", v17, v18, v19, v20, v21);
  id v15 = (id)v27[5];

  _Block_object_dispose(&v26, 8);
  return v15;
}

- (void)_queue_analyzeIfNeeded
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([(HKObserverSet *)self->_userInitiatedObservers count])
  {
    analyzeOperation = self->_analyzeOperation;
    [(_HKDelayedOperation *)analyzeOperation execute];
  }
  else if ([(HKObserverSet *)self->_observers count])
  {
    [(HDMCAnalysisManager *)self _queue_enqueueMaintenanceOperationIfNeeded];
  }
}

- (HDMCAnalysisManager)initWithProfile:(id)a3 settingsManager:(id)a4 featureAvailabilityManager:(id)a5 heartRateAvailabilityManager:(id)a6 wristTemperatureAvailabilityManager:(id)a7 deviationsAvailabilityManager:(id)a8 deviceScopedStorageManager:(id)a9 calendarCache:(id)a10
{
  return (HDMCAnalysisManager *)[(HDMCAnalysisManager *)self _initWithProfile:a3 settingsManager:a4 featureAvailabilityManager:a5 heartRateAvailabilityManager:a6 wristTemperatureAvailabilityManager:a7 deviationsAvailabilityManager:a8 deviceScopedStorageManager:a9 calendarCache:a10 dayStreamProcessorProvider:&__block_literal_global_0 historicalAnalyzerProvider:&__block_literal_global_283];
}

- (id)_initWithProfile:(id)a3 settingsManager:(id)a4 featureAvailabilityManager:(id)a5 heartRateAvailabilityManager:(id)a6 wristTemperatureAvailabilityManager:(id)a7 deviationsAvailabilityManager:(id)a8 deviceScopedStorageManager:(id)a9 calendarCache:(id)a10 dayStreamProcessorProvider:(id)a11 historicalAnalyzerProvider:(id)a12
{
  id v17 = a3;
  id v58 = a4;
  id v57 = a5;
  id v60 = a6;
  id v18 = a7;
  id v19 = a8;
  id v56 = a9;
  id v20 = v17;
  id v55 = a10;
  id v21 = a11;
  id v22 = a12;
  v64.receiver = self;
  v64.super_class = (Class)HDMCAnalysisManager;
  uint64_t v23 = [(HDMCAnalysisManager *)&v64 init];
  BOOL v24 = v23;
  if (v23)
  {
    objc_storeWeak((id *)&v23->_profile, v17);
    v24->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v24->_settingsManager, a4);
    objc_storeStrong((id *)&v24->_featureAvailabilityManager, a5);
    uint64_t v25 = [objc_alloc(MEMORY[0x263F0A3D0]) initWithFeatureAvailabilityProviding:v60 healthDataSource:v17];
    heartRateFeatureStatusManager = v24->_heartRateFeatureStatusManager;
    v24->_heartRateFeatureStatusManager = (HKFeatureStatusManager *)v25;

    uint64_t v27 = [objc_alloc(MEMORY[0x263F0A3D0]) initWithFeatureAvailabilityProviding:v18 healthDataSource:v17];
    wristTemperatureFeatureStatusManager = v24->_wristTemperatureFeatureStatusManager;
    v24->_wristTemperatureFeatureStatusManager = (HKFeatureStatusManager *)v27;

    if (v19)
    {
      uint64_t v29 = [objc_alloc(MEMORY[0x263F0A3D0]) initWithFeatureAvailabilityProviding:v19 healthDataSource:v17];
      deviationsFeatureStatusManager = v24->_deviationsFeatureStatusManager;
      v24->_deviationsFeatureStatusManager = (HKFeatureStatusManager *)v29;
    }
    else
    {
      deviationsFeatureStatusManager = v24->_deviationsFeatureStatusManager;
      v24->_deviationsFeatureStatusManager = 0;
    }

    objc_storeStrong((id *)&v24->_deviceScopedStorageManager, a9);
    id v31 = [HDMCDeviationInputManager alloc];
    id WeakRetained = objc_loadWeakRetained((id *)&v24->_profile);
    uint64_t v33 = [(HDMCDeviationInputManager *)v31 initWithProfile:WeakRetained];
    deviationInputManager = v24->_deviationInputManager;
    v24->_deviationInputManager = (HDMCDeviationInputManager *)v33;

    id v35 = objc_alloc(MEMORY[0x263F0A5A8]);
    uint64_t v36 = (void *)MEMORY[0x263F09930];
    uint64_t v37 = [v35 initWithName:@"HKMCAnalysisManagerObservers" loggingCategory:*MEMORY[0x263F09930]];
    observers = v24->_observers;
    v24->_observers = (HKObserverSet *)v37;

    uint64_t v39 = [objc_alloc(MEMORY[0x263F0A5A8]) initWithName:@"HKMCAnalysisManagerUserInitiatedObservers" loggingCategory:*v36];
    userInitiatedObservers = v24->_userInitiatedObservers;
    v24->_userInitiatedObservers = (HKObserverSet *)v39;

    uint64_t v41 = HKCreateSerialDispatchQueue();
    queue = v24->_queue;
    v24->_queue = (OS_dispatch_queue *)v41;

    objc_storeStrong((id *)&v24->_calendarCache, a10);
    id v43 = v21;
    v44 = _Block_copy(v21);
    id dayStreamProcessorProvider = v24->_dayStreamProcessorProvider;
    v24->_id dayStreamProcessorProvider = v44;

    id v46 = _Block_copy(v22);
    id historicalAnalyzerProvider = v24->_historicalAnalyzerProvider;
    v24->_id historicalAnalyzerProvider = v46;

    objc_initWeak(&location, v24);
    id v48 = objc_alloc(MEMORY[0x263F0A9B0]);
    v49 = v24->_queue;
    v61[0] = MEMORY[0x263EF8330];
    v61[1] = 3221225472;
    v61[2] = __273__HDMCAnalysisManager__initWithProfile_settingsManager_featureAvailabilityManager_heartRateAvailabilityManager_wristTemperatureAvailabilityManager_deviationsAvailabilityManager_deviceScopedStorageManager_calendarCache_dayStreamProcessorProvider_historicalAnalyzerProvider___block_invoke;
    v61[3] = &unk_2647507D0;
    objc_copyWeak(&v62, &location);
    uint64_t v50 = [v48 initWithMode:0 clock:1 queue:v49 delay:v61 block:0.25];
    analyzeOperation = v24->_analyzeOperation;
    v24->_analyzeOperation = (_HKDelayedOperation *)v50;

    id v52 = objc_loadWeakRetained((id *)&v24->_profile);
    v53 = [v52 database];
    [v53 addProtectedDataObserver:v24 queue:v24->_queue];

    [(HDMCAnalysisManager *)v24 _startObserving];
    objc_destroyWeak(&v62);
    objc_destroyWeak(&location);
    id v21 = v43;
  }

  return v24;
}

- (void)dealloc
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  [(HKMCSettingsManager *)self->_settingsManager removeObserver:self];
  [(HDFeatureAvailabilityManager *)self->_featureAvailabilityManager unregisterObserver:self];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v3 = HKMCDaySummarySampleTypes();
  uint64_t v4 = [v3 countByEnumeratingWithState:&v37 objects:v43 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v38;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v38 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v37 + 1) + 8 * v7);
        id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
        uint64_t v10 = [WeakRetained dataManager];
        [v10 removeObserver:self forDataType:v8];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v37 objects:v43 count:16];
    }
    while (v5);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v11 = HKMCCycleFactorsTypes();
  uint64_t v12 = [v11 countByEnumeratingWithState:&v33 objects:v42 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v34;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v34 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v33 + 1) + 8 * v15);
        id v17 = objc_loadWeakRetained((id *)&self->_profile);
        id v18 = [v17 dataManager];
        [v18 removeObserver:self forDataType:v16];

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v33 objects:v42 count:16];
    }
    while (v13);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v19 = HKMCDeviationSampleTypes();
  uint64_t v20 = [v19 countByEnumeratingWithState:&v29 objects:v41 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v30;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v30 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = *(void *)(*((void *)&v29 + 1) + 8 * v23);
        id v25 = objc_loadWeakRetained((id *)&self->_profile);
        uint64_t v26 = [v25 dataManager];
        [v26 removeObserver:self forDataType:v24];

        ++v23;
      }
      while (v21 != v23);
      uint64_t v21 = [v19 countByEnumeratingWithState:&v29 objects:v41 count:16];
    }
    while (v21);
  }

  uint64_t v27 = [MEMORY[0x263F08A00] defaultCenter];
  [v27 removeObserver:self];

  v28.receiver = self;
  v28.super_class = (Class)HDMCAnalysisManager;
  [(HDMCAnalysisManager *)&v28 dealloc];
}

- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_queue_needsMaintenanceAnalysis)
  {
    [(HDMCAnalysisManager *)self _queue_enqueueMaintenanceOperationIfNeeded];
  }
}

- (void)_startObserving
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  [(HKMCSettingsManager *)self->_settingsManager addObserver:self queue:self->_queue];
  [(HDFeatureAvailabilityManager *)self->_featureAvailabilityManager registerObserver:self queue:self->_queue];
  [(HKFeatureStatusManager *)self->_heartRateFeatureStatusManager registerObserver:self queue:self->_queue];
  [(HKFeatureStatusManager *)self->_wristTemperatureFeatureStatusManager registerObserver:self queue:self->_queue];
  [(HKFeatureStatusManager *)self->_deviationsFeatureStatusManager registerObserver:self queue:self->_queue];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v3 = HKMCDaySummarySampleTypes();
  uint64_t v4 = [v3 countByEnumeratingWithState:&v37 objects:v43 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v38;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v38 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v37 + 1) + 8 * v7);
        id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
        uint64_t v10 = [WeakRetained dataManager];
        [v10 addObserver:self forDataType:v8];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v37 objects:v43 count:16];
    }
    while (v5);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v11 = HKMCCycleFactorsTypes();
  uint64_t v12 = [v11 countByEnumeratingWithState:&v33 objects:v42 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v34;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v34 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v33 + 1) + 8 * v15);
        id v17 = objc_loadWeakRetained((id *)&self->_profile);
        id v18 = [v17 dataManager];
        [v18 addObserver:self forDataType:v16];

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v33 objects:v42 count:16];
    }
    while (v13);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v19 = HKMCDeviationSampleTypes();
  uint64_t v20 = [v19 countByEnumeratingWithState:&v29 objects:v41 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v30;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v30 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = *(void *)(*((void *)&v29 + 1) + 8 * v23);
        id v25 = objc_loadWeakRetained((id *)&self->_profile);
        uint64_t v26 = objc_msgSend(v25, "dataManager", (void)v29);
        [v26 addObserver:self forDataType:v24];

        ++v23;
      }
      while (v21 != v23);
      uint64_t v21 = [v19 countByEnumeratingWithState:&v29 objects:v41 count:16];
    }
    while (v21);
  }

  uint64_t v27 = [MEMORY[0x263F08A00] defaultCenter];
  [v27 addObserver:self selector:sel__userCharacteristicsDidChange_ name:*MEMORY[0x263F430C0] object:0];

  objc_super v28 = [MEMORY[0x263F08A00] defaultCenter];
  [v28 addObserver:self selector:sel__calendarDayDidChange_ name:*MEMORY[0x263EFF3C8] object:0];
}

- (void)samplesAdded:(id)a3 anchor:(id)a4
{
  id v5 = a3;
  queue = self->_queue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __43__HDMCAnalysisManager_samplesAdded_anchor___block_invoke;
  v8[3] = &unk_2647507F8;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

uint64_t __43__HDMCAnalysisManager_samplesAdded_anchor___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  v2 = (void *)*MEMORY[0x263F09930];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
  {
    id v3 = v2;
    uint64_t v4 = objc_opt_class();
    id v5 = v4;
    uint64_t v6 = HKSensitiveLogItem();
    int v8 = 138543618;
    id v9 = v4;
    __int16 v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_225722000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Analyze if needed due to samples added: %@", (uint8_t *)&v8, 0x16u);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_queue_analyzeIfNeeded");
}

- (void)samplesOfTypesWereRemoved:(id)a3 anchor:(id)a4
{
  id v5 = a3;
  queue = self->_queue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __56__HDMCAnalysisManager_samplesOfTypesWereRemoved_anchor___block_invoke;
  v8[3] = &unk_2647507F8;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

uint64_t __56__HDMCAnalysisManager_samplesOfTypesWereRemoved_anchor___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  v2 = (void *)*MEMORY[0x263F09930];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
  {
    id v3 = v2;
    uint64_t v4 = objc_opt_class();
    id v5 = v4;
    uint64_t v6 = HKSensitiveLogItem();
    int v8 = 138543618;
    id v9 = v4;
    __int16 v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_225722000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Analyze if needed due to samples removed of types: %@", (uint8_t *)&v8, 0x16u);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_queue_analyzeIfNeeded");
}

- (void)settingsManagerDidUpdateAnalysisSettings:(id)a3
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__HDMCAnalysisManager_settingsManagerDidUpdateAnalysisSettings___block_invoke;
  block[3] = &unk_2647508B0;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __64__HDMCAnalysisManager_settingsManagerDidUpdateAnalysisSettings___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  v2 = (void *)*MEMORY[0x263F09930];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
  {
    id v3 = v2;
    *(_DWORD *)uint64_t v6 = 138543362;
    *(void *)&v6[4] = objc_opt_class();
    id v4 = *(id *)&v6[4];
    _os_log_impl(&dword_225722000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Analyze if needed due to settings update", v6, 0xCu);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_queue_analyzeIfNeeded", *(_OWORD *)v6);
}

- (void)settingsManagerDidUpdateAlgorithmVersionMismatchSettings:(id)a3
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __80__HDMCAnalysisManager_settingsManagerDidUpdateAlgorithmVersionMismatchSettings___block_invoke;
  block[3] = &unk_2647508B0;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __80__HDMCAnalysisManager_settingsManagerDidUpdateAlgorithmVersionMismatchSettings___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  v2 = (void *)*MEMORY[0x263F09930];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
  {
    id v3 = v2;
    *(_DWORD *)uint64_t v6 = 138543362;
    *(void *)&v6[4] = objc_opt_class();
    id v4 = *(id *)&v6[4];
    _os_log_impl(&dword_225722000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Analyze if needed due to algorithm version mismatch settings update", v6, 0xCu);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_queue_analyzeIfNeeded", *(_OWORD *)v6);
}

- (void)_userCharacteristicsDidChange:(id)a3
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__HDMCAnalysisManager__userCharacteristicsDidChange___block_invoke;
  block[3] = &unk_2647508B0;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __53__HDMCAnalysisManager__userCharacteristicsDidChange___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  v2 = (void *)*MEMORY[0x263F09930];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
  {
    id v3 = v2;
    *(_DWORD *)uint64_t v6 = 138543362;
    *(void *)&v6[4] = objc_opt_class();
    id v4 = *(id *)&v6[4];
    _os_log_impl(&dword_225722000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Analyze if needed due to user characteristics change", v6, 0xCu);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_queue_analyzeIfNeeded", *(_OWORD *)v6);
}

- (void)_calendarDayDidChange:(id)a3
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__HDMCAnalysisManager__calendarDayDidChange___block_invoke;
  block[3] = &unk_2647508B0;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __45__HDMCAnalysisManager__calendarDayDidChange___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  v2 = (void *)*MEMORY[0x263F09930];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
  {
    id v3 = v2;
    *(_DWORD *)uint64_t v6 = 138543362;
    *(void *)&v6[4] = objc_opt_class();
    id v4 = *(id *)&v6[4];
    _os_log_impl(&dword_225722000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Analyze if needed due to calendar day change", v6, 0xCu);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_queue_analyzeIfNeeded", *(_OWORD *)v6);
}

- (void)featureStatusProviding:(id)a3 didUpdateFeatureStatus:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  _HKInitializeLogging();
  uint64_t v6 = (void *)*MEMORY[0x263F09930];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = v6;
    int v8 = objc_opt_class();
    id v9 = v8;
    __int16 v10 = [v5 featureIdentifier];
    int v11 = 138543618;
    uint64_t v12 = v8;
    __int16 v13 = 2114;
    uint64_t v14 = v10;
    _os_log_impl(&dword_225722000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received feature status update for %{public}@", (uint8_t *)&v11, 0x16u);
  }
  [(HDMCAnalysisManager *)self _queue_analyzeIfNeeded];
}

- (void)featureAvailabilityProvidingDidUpdateOnboardingCompletion:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  _HKInitializeLogging();
  id v4 = (void *)*MEMORY[0x263F09930];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
  {
    id v5 = v4;
    *(_DWORD *)uint64_t v7 = 138543362;
    *(void *)&v7[4] = objc_opt_class();
    id v6 = *(id *)&v7[4];
    _os_log_impl(&dword_225722000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Analyze if needed due to onboarding state changing", v7, 0xCu);
  }
  [(HDMCAnalysisManager *)self _queue_analyzeIfNeeded];
}

- (void)featureAvailabilityProvidingDidUpdateSettings:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  p_queue_lastFeatureSettings = &self->_queue_lastFeatureSettings;
  if (self->_queue_lastFeatureSettings)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    uint64_t v7 = [WeakRetained featureSettingsManager];
    uint64_t v8 = [v4 featureIdentifier];
    id v23 = 0;
    id v9 = [v7 featureSettingsForFeatureIdentifier:v8 error:&v23];
    id v10 = v23;

    if (v9)
    {
      int v11 = [v9 projectionsEnabledSettingsHaveChangedFromFeatureSettings:*p_queue_lastFeatureSettings];
      _HKInitializeLogging();
      uint64_t v12 = (void *)*MEMORY[0x263F09930];
      BOOL v13 = os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT);
      if (v11)
      {
        if (v13)
        {
          uint64_t v14 = v12;
          uint64_t v15 = objc_opt_class();
          *(_DWORD *)buf = 138543362;
          id v25 = v15;
          id v16 = v15;
          _os_log_impl(&dword_225722000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] Settings changed: projections enabled changed, analyzing", buf, 0xCu);
        }
        [(HDMCAnalysisManager *)self _queue_analyzeIfNeeded];
      }
      else if (v13)
      {
        uint64_t v20 = v12;
        uint64_t v21 = objc_opt_class();
        *(_DWORD *)buf = 138543362;
        id v25 = v21;
        id v22 = v21;
        _os_log_impl(&dword_225722000, v20, OS_LOG_TYPE_DEFAULT, "[%{public}@] Settings changed, not affecting projections enabled", buf, 0xCu);
      }
      objc_storeStrong((id *)p_queue_lastFeatureSettings, v9);
    }
    else
    {
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR)) {
        -[HDMCAnalysisManager featureAvailabilityProvidingDidUpdateSettings:]();
      }
    }
  }
  else
  {
    _HKInitializeLogging();
    id v17 = (void *)*MEMORY[0x263F09930];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
    {
      id v18 = v17;
      *(_DWORD *)buf = 138543362;
      id v25 = (id)objc_opt_class();
      id v19 = v25;
      _os_log_impl(&dword_225722000, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@] Settings changed: no cached settings, analyzing", buf, 0xCu);
    }
    [(HDMCAnalysisManager *)self _queue_analyzeIfNeeded];
  }
}

- (id)_analyzeWithForceIncludeCycles:(BOOL)a3 forceAnalyzeCompleteHistory:(BOOL)a4 error:(id *)a5
{
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = __Block_byref_object_copy__1;
  uint64_t v24 = __Block_byref_object_dispose__1;
  id v25 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__1;
  id v18 = __Block_byref_object_dispose__1;
  id v19 = 0;
  queue = self->_queue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __88__HDMCAnalysisManager__analyzeWithForceIncludeCycles_forceAnalyzeCompleteHistory_error___block_invoke;
  v11[3] = &unk_2647508D8;
  v11[4] = self;
  v11[5] = &v20;
  BOOL v12 = a3;
  BOOL v13 = a4;
  v11[6] = &v14;
  dispatch_sync(queue, v11);
  id v7 = (id)v15[5];
  uint64_t v8 = v7;
  if (v7)
  {
    if (a5) {
      *a5 = v7;
    }
    else {
      _HKLogDroppedError();
    }
  }

  id v9 = (id)v21[5];
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  return v9;
}

void __88__HDMCAnalysisManager__analyzeWithForceIncludeCycles_forceAnalyzeCompleteHistory_error___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(unsigned __int8 *)(a1 + 56);
  uint64_t v4 = *(unsigned __int8 *)(a1 + 57);
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  obuint64_t j = *(id *)(v5 + 40);
  uint64_t v6 = objc_msgSend(v2, "_queue_analyzeNowWithForceIncludeCycles:forceAnalyzeCompleteHistory:error:", v3, v4, &obj);
  objc_storeStrong((id *)(v5 + 40), obj);
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

- (id)analyzeWithError:(id *)a3
{
  return [(HDMCAnalysisManager *)self _analyzeWithForceIncludeCycles:0 forceAnalyzeCompleteHistory:0 error:a3];
}

- (void)_queue_enqueueMaintenanceOperationIfNeeded
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_queue_maintenanceOperationQueued)
  {
    *(_WORD *)&self->_queue_needsMaintenanceAnalysis = 257;
    uint64_t v3 = (void *)MEMORY[0x263F43248];
    uint64_t v4 = (objc_class *)objc_opt_class();
    uint64_t v5 = NSStringFromClass(v4);
    queue = self->_queue;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __65__HDMCAnalysisManager__queue_enqueueMaintenanceOperationIfNeeded__block_invoke;
    v15[3] = &unk_2647508B0;
    v15[4] = self;
    uint64_t v7 = [v3 maintenanceOperationWithName:v5 queue:queue synchronousBlock:v15];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    id v9 = [WeakRetained daemon];
    id v10 = [v9 maintenanceWorkCoordinator];
    [v10 enqueueMaintenanceOperation:v7];

    _HKInitializeLogging();
    int v11 = (void *)*MEMORY[0x263F09930];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
    {
      BOOL v12 = v11;
      BOOL v13 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      id v17 = v13;
      id v14 = v13;
      _os_log_impl(&dword_225722000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Enqueued maintenance operation for analysis", buf, 0xCu);
    }
  }
}

uint64_t __65__HDMCAnalysisManager__queue_enqueueMaintenanceOperationIfNeeded__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_runMaintenanceOperation");
}

- (void)_queue_runMaintenanceOperation
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_queue_needsMaintenanceAnalysis)
  {
    [(_HKDelayedOperation *)self->_analyzeOperation execute];
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v3 = (void *)*MEMORY[0x263F09930];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = v3;
      int v6 = 138543362;
      id v7 = (id)objc_opt_class();
      id v5 = v7;
      _os_log_impl(&dword_225722000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Skipping maintenance operation for analysis since no longer needed", (uint8_t *)&v6, 0xCu);
    }
  }
  self->_queue_maintenanceOperationQueued = 0;
}

uint64_t __133__HDMCAnalysisManager__queue_computeAnalysisWithDatabaseAccessibilityAssertion_forceIncludeCycles_forceAnalyzeCompleteHistory_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 didUpdateAnalysis:*(void *)(*(void *)(a1 + 32) + 160)];
}

void __133__HDMCAnalysisManager__queue_computeAnalysisWithDatabaseAccessibilityAssertion_forceIncludeCycles_forceAnalyzeCompleteHistory_error___block_invoke_340(uint64_t a1, void *a2)
{
  id v45 = a2;
  if ([MEMORY[0x263F0A980] isAppleInternalInstall])
  {
    uint64_t v3 = objc_msgSend(v45, "_daySummaryWithOverrideSourceIDBySourceID:ignoreCycleFactors:ignoreOvulationTestResults:", 0, objc_msgSend(*(id *)(*(void *)(a1 + 32) + 48), "internalCycleFactorsOverrideEnabled"), objc_msgSend(*(id *)(*(void *)(a1 + 32) + 48), "internalIgnoreOvulationTestResultsEnabled"));

    uint64_t v4 = (void *)v3;
  }
  else
  {
    uint64_t v4 = v45;
  }
  id v46 = v4;
  uint64_t v5 = [v4 dayIndex];
  int v6 = objc_msgSend(MEMORY[0x263F42968], "hkmc_dayInputWithDaySummary:", v46);
  uint64_t v7 = *(void *)(a1 + 128);
  if (v5 >= v7 && v5 - v7 < *(void *)(a1 + 136))
  {
    if (!*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
    {
      id v9 = *(void **)(a1 + 40);
      id v10 = objc_msgSend(MEMORY[0x263F42968], "hkmc_emptyDayInputWithDayIndex:", v7 - 10);
      [v9 appendDay:v10];
    }
    if (*(unsigned char *)(a1 + 152))
    {
      uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) + 1;
      if (v11 < v5)
      {
        do
        {
          BOOL v12 = *(void **)(a1 + 48);
          BOOL v13 = [NSNumber numberWithInteger:v11];
          id v14 = [v12 objectForKeyedSubscript:v13];

          if (v14)
          {
            uint64_t v15 = (void *)MEMORY[0x263F42968];
            uint64_t v16 = *(void **)(a1 + 40);
            id v17 = *(void **)(a1 + 48);
            uint64_t v18 = [NSNumber numberWithInteger:v11];
            id v19 = [v17 objectForKeyedSubscript:v18];
            uint64_t v20 = objc_msgSend(v15, "hkmc_dayInputWithHeartStatistics:", v19);
            [v16 appendDay:v20];
          }
          ++v11;
        }
        while (v5 != v11);
      }
      uint64_t v21 = *(void **)(a1 + 48);
      uint64_t v22 = [NSNumber numberWithInteger:v5];
      id v23 = [v21 objectForKeyedSubscript:v22];

      if (v23)
      {
        uint64_t v24 = *(void **)(a1 + 48);
        id v25 = [NSNumber numberWithInteger:v5];
        uint64_t v26 = [v24 objectForKeyedSubscript:v25];
        objc_msgSend(v6, "hkmc_updateWithHeartStatistics:", v26);
      }
      *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = v5;
    }
    [*(id *)(a1 + 40) appendDay:v6];
    objc_msgSend(*(id *)(a1 + 56), "addSymptoms:forDayIndex:", objc_msgSend(v46, "symptoms"), v5);
    uint64_t v27 = [v46 basalBodyTemperature];
    if (v27)
    {
      uint64_t v28 = *(void *)(a1 + 144) - 14;

      if (v5 > v28)
      {
        uint64_t v29 = [v46 basalBodyTemperature];
        uint64_t v30 = *(void *)(*(void *)(a1 + 88) + 8);
        long long v31 = *(void **)(v30 + 40);
        *(void *)(v30 + 40) = v29;
      }
    }
    if ([v46 isDataLogged])
    {
      uint64_t v32 = [NSNumber numberWithInteger:v5];
      uint64_t v33 = *(void *)(*(void *)(a1 + 96) + 8);
      long long v34 = *(void **)(v33 + 40);
      *(void *)(v33 + 40) = v32;
    }
    else
    {
      uint64_t v35 = *(void *)(*(void *)(a1 + 96) + 8);
      id v36 = *(id *)(v35 + 40);
      long long v34 = *(void **)(v35 + 40);
      *(void *)(v35 + 40) = v36;
    }

    if ([v46 menstrualFlow])
    {
      uint64_t v37 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v46, "dayIndex"));
      uint64_t v38 = *(void *)(*(void *)(a1 + 104) + 8);
      long long v39 = *(void **)(v38 + 40);
      *(void *)(v38 + 40) = v37;

      uint64_t v40 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v46, "menstrualFlowModificationDayIndex"));
      uint64_t v41 = *(void *)(*(void *)(a1 + 112) + 8);
      v42 = *(void **)(v41 + 40);
      *(void *)(v41 + 40) = v40;
    }
    HKMCAppendCycleFactorsPhaseFromDaySummary();
    ++*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
  }
  if (*(unsigned char *)(a1 + 153))
  {
    if (!*(void *)(*(void *)(*(void *)(a1 + 120) + 8) + 24))
    {
      id v43 = *(void **)(a1 + 64);
      uint64_t v44 = objc_msgSend(MEMORY[0x263F42968], "hkmc_emptyDayInputWithDayIndex:", v5 - 10);
      [v43 appendDay:v44];
    }
    HKMCAppendCycleFactorsPhaseFromDaySummary();
    [*(id *)(a1 + 64) appendDay:v6];
    ++*(void *)(*(void *)(*(void *)(a1 + 120) + 8) + 24);
  }
}

uint64_t __133__HDMCAnalysisManager__queue_computeAnalysisWithDatabaseAccessibilityAssertion_forceIncludeCycles_forceAnalyzeCompleteHistory_error___block_invoke_344(uint64_t a1, void *a2)
{
  return [a2 didUpdateAnalysis:*(void *)(a1 + 32)];
}

- (void)_forceDisablePredictionsFromOngoingCycleFactors:(id)a3 menstruationProjectionsEnabled:(BOOL)a4 fertileWindowProjectionsEnabled:(BOOL)a5 useHeartRateInput:(BOOL)a6 useWristTemperatureInput:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  BOOL v9 = a5;
  BOOL v10 = a4;
  id v20 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  BOOL v13 = [WeakRetained daemon];
  id v14 = [v13 behavior];
  int v15 = [v14 isCompanionCapable];

  if (v15)
  {
    [(HKMCSettingsManager *)self->_settingsManager forceDisableProjectionsFromOngoingCycleFactors:v20 menstruationProjectionsEnabled:v10 fertileWindowProjectionsEnabled:v9 useHeartRateInput:v8 useWristTemperatureInput:v7];
  }
  else
  {
    id v16 = objc_loadWeakRetained((id *)&self->_profile);
    id v17 = [v16 daemon];
    uint64_t v18 = [v17 behavior];
    int v19 = [v18 isAppleWatch];

    if (v19) {
      [(HKMCSettingsManager *)self->_settingsManager setProjectionAttributesOnWatchFromUseHeartRateInput:v8 useWristTemperatureInput:v7];
    }
  }
}

- (id)_analysisWithAlgorithmsAnalysis:(id)a3 algorithmsCycles:(id)a4 recentSymptoms:(unint64_t)a5 mostRecentBasalBodyTemperature:(id)a6 lastLoggedDayIndex:(id)a7 lastMenstrualFlowDayIndex:(id)a8 numberOfDailySleepHeartRateStatisticsForPast100Days:(int64_t)a9 numberOfDailyAwakeHeartRateStatisticsForPast100Days:(int64_t)a10 featureSettings:(id)a11 useHeartRateInput:(BOOL)a12 useWristTemperatureInput:(BOOL)a13 deviationsFeatureSettings:(id)a14
{
  uint64_t v134 = *MEMORY[0x263EF8340];
  id v108 = a3;
  id v107 = a4;
  id v106 = a6;
  id v105 = a7;
  id v101 = a8;
  id v104 = a11;
  id v97 = a14;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v114 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v123 = 0u;
  long long v124 = 0u;
  long long v125 = 0u;
  long long v126 = 0u;
  HKMCCycleFactorsTypes();
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v19 = [obj countByEnumeratingWithState:&v123 objects:v133 count:16];
  v99 = self;
  if (v19)
  {
    uint64_t v20 = v19;
    id v111 = *(id *)v124;
    p_profile = &self->_profile;
    id v22 = 0;
    uint64_t v23 = *MEMORY[0x263F434E8];
    do
    {
      uint64_t v24 = 0;
      id v25 = v22;
      do
      {
        if (*(id *)v124 != v111) {
          objc_enumerationMutation(obj);
        }
        uint64_t v26 = *(void *)(*((void *)&v123 + 1) + 8 * v24);
        uint64_t v27 = (void *)MEMORY[0x263F43318];
        id WeakRetained = objc_loadWeakRetained((id *)p_profile);
        uint64_t v29 = [MEMORY[0x263EFF910] distantFuture];
        uint64_t v30 = HDSampleEntityPredicateForEndDate();
        id v122 = v25;
        long long v31 = [v27 samplesWithType:v26 profile:WeakRetained encodingOptions:0 predicate:v30 limit:v23 anchor:0 error:&v122];
        id v22 = v122;

        [v114 addObjectsFromArray:v31];
        ++v24;
        id v25 = v22;
      }
      while (v20 != v24);
      uint64_t v20 = [obj countByEnumeratingWithState:&v123 objects:v133 count:16];
    }
    while (v20);
  }
  else
  {
    id v22 = 0;
  }

  uint64_t v32 = [v104 menstruationProjectionsEnabled];
  uint64_t v33 = [v104 fertileWindowProjectionsEnabled];
  long long v34 = (void *)[v114 copy];
  unsigned int obja = v32;
  unsigned int v112 = v33;
  [(HDMCAnalysisManager *)v99 _forceDisablePredictionsFromOngoingCycleFactors:v34 menstruationProjectionsEnabled:v32 fertileWindowProjectionsEnabled:v33 useHeartRateInput:a12 useWristTemperatureInput:a13];

  uint64_t v35 = v108;
  id v36 = objc_msgSend(v108, "hkmc_statistics");
  uint64_t v37 = [v36 cycleLengthMedian];

  uint64_t v38 = (os_log_t *)MEMORY[0x263F09930];
  v102 = v36;
  if (!v37)
  {
    id v39 = objc_loadWeakRetained((id *)&v99->_profile);
    uint64_t v40 = _UserCharacteristicOfType(v39, (void *)*MEMORY[0x263F0AA70]);

    _HKInitializeLogging();
    os_log_t v41 = *v38;
    if (os_log_type_enabled(*v38, OS_LOG_TYPE_DEFAULT))
    {
      v42 = v41;
      id v43 = objc_opt_class();
      id v44 = v43;
      HKSensitiveLogItem();
      id v45 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      id v128 = v43;
      __int16 v129 = 2112;
      v130 = v45;
      _os_log_impl(&dword_225722000, v42, OS_LOG_TYPE_DEFAULT, "[%{public}@] Replacing statistics cycle length with user entered cycle length: %@", buf, 0x16u);

      uint64_t v35 = v108;
    }
    if (v40)
    {
      id v46 = NSNumber;
      id v47 = [MEMORY[0x263F0A830] dayUnit];
      [v40 doubleValueForUnit:v47];
      id v48 = objc_msgSend(v46, "numberWithDouble:");

      [v36 setCycleLengthMedian:v48];
    }
  }
  v49 = [v36 menstruationLengthMedian];

  if (!v49)
  {
    id v50 = objc_loadWeakRetained((id *)&v99->_profile);
    v51 = _UserCharacteristicOfType(v50, (void *)*MEMORY[0x263F0AA78]);

    _HKInitializeLogging();
    os_log_t v52 = *v38;
    if (os_log_type_enabled(*v38, OS_LOG_TYPE_DEFAULT))
    {
      v53 = v52;
      id v54 = objc_opt_class();
      id v55 = v54;
      HKSensitiveLogItem();
      id v56 = v35;
      id v57 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      id v128 = v54;
      __int16 v129 = 2112;
      v130 = v57;
      _os_log_impl(&dword_225722000, v53, OS_LOG_TYPE_DEFAULT, "[%{public}@] Replacing statistics period length with user entered period length: %@", buf, 0x16u);

      uint64_t v35 = v56;
      id v36 = v102;
    }
    if (v51)
    {
      id v58 = NSNumber;
      v59 = [MEMORY[0x263F0A830] dayUnit];
      [v51 doubleValueForUnit:v59];
      id v60 = objc_msgSend(v58, "numberWithDouble:");

      [v36 setMenstruationLengthMedian:v60];
    }
  }
  if (a13)
  {
    v103 = [(HKMCSettingsManager *)v99->_settingsManager dayStreamProcessorPredictionPrimarySourceOverride];
  }
  else
  {
    v103 = 0;
  }
  if (obja) {
    int v61 = [(HKMCSettingsManager *)v99->_settingsManager areAllMenstruationPredictionAlgorithmAttributesSupported];
  }
  else {
    int v61 = 0;
  }
  if (v112) {
    int v62 = [(HKMCSettingsManager *)v99->_settingsManager areAllFertileWindowPredictionAlgorithmAttributesSupported];
  }
  else {
    int v62 = 0;
  }
  _HKInitializeLogging();
  os_log_t v63 = *v38;
  if (os_log_type_enabled(*v38, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v64 = v63;
    uint64_t v65 = objc_opt_class();
    uint64_t v66 = @"OFF";
    if (v61) {
      v67 = @"ON";
    }
    else {
      v67 = @"OFF";
    }
    *(_DWORD *)buf = 138543874;
    id v128 = v65;
    v130 = v67;
    __int16 v129 = 2112;
    if (v62) {
      uint64_t v66 = @"ON";
    }
    __int16 v131 = 2112;
    BOOL v132 = v66;
    id v68 = v65;
    _os_log_impl(&dword_225722000, v64, OS_LOG_TYPE_DEFAULT, "[%{public}@] Surfacing analysis with period predictions: %@, fertility predictions: %@", buf, 0x20u);
  }
  if (v61)
  {
    v96 = objc_msgSend(v35, "hkmc_menstruationProjections");
    if (!v62)
    {
LABEL_40:
      v69 = (void *)MEMORY[0x263EFFA68];
      goto LABEL_43;
    }
  }
  else
  {
    v96 = (void *)MEMORY[0x263EFFA68];
    if (!v62) {
      goto LABEL_40;
    }
  }
  id v70 = [MEMORY[0x263EFF910] date];
  v71 = [(HKCalendarCache *)v99->_calendarCache currentCalendar];
  v69 = objc_msgSend(v35, "hkmc_fertileWindowProjectionsWithOverridePredictionPrimarySource:currentDayIndex:", v103, objc_msgSend(v70, "hk_dayIndexWithCalendar:", v71));

LABEL_43:
  v95 = objc_msgSend(v69, "subarrayWithRange:", 0, objc_msgSend(v69, "count") != 0);

  if (v107)
  {
    uint64_t v72 = [v107 count];
    v73 = [MEMORY[0x263EFF980] arrayWithCapacity:v72];
    v117[0] = MEMORY[0x263EF8330];
    v117[1] = 3221225472;
    v117[2] = __352__HDMCAnalysisManager__analysisWithAlgorithmsAnalysis_algorithmsCycles_recentSymptoms_mostRecentBasalBodyTemperature_lastLoggedDayIndex_lastMenstrualFlowDayIndex_numberOfDailySleepHeartRateStatisticsForPast100Days_numberOfDailyAwakeHeartRateStatisticsForPast100Days_featureSettings_useHeartRateInput_useWristTemperatureInput_deviationsFeatureSettings___block_invoke;
    v117[3] = &unk_2647509A0;
    id v118 = v73;
    uint64_t v119 = v72;
    BOOL v120 = a13;
    v117[4] = v99;
    char v121 = v112;
    id v74 = v73;
    [v107 enumerateObjectsWithOptions:2 usingBlock:v117];
    v94 = (void *)[v74 copy];
  }
  else
  {
    v94 = 0;
  }
  objc_msgSend(v35, "hkmc_deviations");
  v75 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v115[0] = MEMORY[0x263EF8330];
  v115[1] = 3221225472;
  v115[2] = __352__HDMCAnalysisManager__analysisWithAlgorithmsAnalysis_algorithmsCycles_recentSymptoms_mostRecentBasalBodyTemperature_lastLoggedDayIndex_lastMenstrualFlowDayIndex_numberOfDailySleepHeartRateStatisticsForPast100Days_numberOfDailyAwakeHeartRateStatisticsForPast100Days_featureSettings_useHeartRateInput_useWristTemperatureInput_deviationsFeatureSettings___block_invoke_2;
  v115[3] = &unk_2647509C8;
  id v98 = v97;
  id v116 = v98;
  BOOL v76 = [(__CFString *)v75 hk_filter:v115];
  if (HKShowSensitiveLogItems())
  {
    _HKInitializeLogging();
    os_log_t v77 = *v38;
    if (os_log_type_enabled(*v38, OS_LOG_TYPE_DEFAULT))
    {
      id v78 = v77;
      uint64_t v79 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      id v128 = v79;
      __int16 v129 = 2112;
      v130 = v75;
      id v80 = v79;
      _os_log_impl(&dword_225722000, v78, OS_LOG_TYPE_DEFAULT, "[%{public}@] Deviations detected (all): %@", buf, 0x16u);
    }
    _HKInitializeLogging();
    os_log_t v81 = *v38;
    if (os_log_type_enabled(*v38, OS_LOG_TYPE_DEFAULT))
    {
      v82 = v81;
      uint64_t v83 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      id v128 = v83;
      __int16 v129 = 2112;
      v130 = v76;
      id v84 = v83;
      _os_log_impl(&dword_225722000, v82, OS_LOG_TYPE_DEFAULT, "[%{public}@] Deviations detected (enabled): %@", buf, 0x16u);
    }
  }
  id v85 = objc_alloc(MEMORY[0x263F45110]);
  id v86 = objc_loadWeakRetained((id *)&v99->_profile);
  id v87 = +[HDMCRecentBasalBodyTemperatureRangeQuery recentRangeForAnalysisWithProfile:v86];
  v88 = [v87 recentBasalBodyTemperatureWithMostRecentQuantity:v106];
  char v89 = [v35 isUserInactive];
  id v90 = (void *)[v114 copy];
  LOBYTE(v93) = [(HDMCAnalysisManager *)v99 _hasHealthAppDevicesWithHigherAlgorithmVersions];
  LOBYTE(v92) = v89;
  id v113 = (id)objc_msgSend(v85, "initWithStatistics:menstruationProjections:fertileWindowProjections:menstruationProjectionsEnabled:fertileWindowProjectionsEnabled:cycles:deviations:recentSymptoms:recentBasalBodyTemperature:lastLoggedDayIndex:lastMenstrualFlowDayIndex:isPeriodLogLate:ongoingCycleFactors:numberOfDailySleepHeartRateStatisticsForPast100Days:numberOfDailyAwakeHeartRateStatisticsForPast100Days:hasHealthAppDevicesWithHigherAlgorithmVersions:", v102, v96, v95, obja, v112, v94, v76, a5, v88, v105, v101, v92, v90, a9,
               a10,
               v93);

  return v113;
}

void __352__HDMCAnalysisManager__analysisWithAlgorithmsAnalysis_algorithmsCycles_recentSymptoms_mostRecentBasalBodyTemperature_lastLoggedDayIndex_lastMenstrualFlowDayIndex_numberOfDailySleepHeartRateStatisticsForPast100Days_numberOfDailyAwakeHeartRateStatisticsForPast100Days_featureSettings_useHeartRateInput_useWristTemperatureInput_deviationsFeatureSettings___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v15 = a2;
  uint64_t v5 = (void *)MEMORY[0x22A634E00]();
  uint64_t v6 = *(void *)(a1 + 48) + ~a3;
  if (*(unsigned char *)(a1 + 56))
  {
    BOOL v7 = [*(id *)(*(void *)(a1 + 32) + 48) historicalAnalyzerPredictionPrimarySourceOverrideForCycleAtReverseChronologicalIndex:*(void *)(a1 + 48) + ~a3];
    BOOL v8 = [*(id *)(*(void *)(a1 + 32) + 48) historicalAnalyzerOvulationConfirmationFailureOverrideForCycleAtReverseChronologicalIndex:v6];
    BOOL v9 = [*(id *)(*(void *)(a1 + 32) + 48) historicalAnalyzerDailyEligibleWristTemperatureCountOverrideForCycleAtReverseChronologicalIndex:v6];
    if (v6)
    {
LABEL_3:
      BOOL v10 = [*(id *)(a1 + 40) lastObject];
      uint64_t v11 = [v10 menstruationSegment];
      uint64_t v12 = [v11 days];

      BOOL v13 = [NSNumber numberWithInteger:v12 - 1];
      id v14 = objc_msgSend(v15, "hkmc_cycleWithLastDayIndex:includeFertileWindow:overridePredictionPrimarySource:overrideOvulationConfirmationFailure:overrideDailyEligibleWristTemperatureCount:useWristTemperatureInput:", v13, *(unsigned __int8 *)(a1 + 57), v7, v8, v9, *(unsigned __int8 *)(a1 + 56));

      goto LABEL_6;
    }
  }
  else
  {
    BOOL v8 = 0;
    BOOL v9 = 0;
    BOOL v7 = 0;
    if (v6) {
      goto LABEL_3;
    }
  }
  id v14 = objc_msgSend(v15, "hkmc_cycleWithLastDayIndex:includeFertileWindow:overridePredictionPrimarySource:overrideOvulationConfirmationFailure:overrideDailyEligibleWristTemperatureCount:useWristTemperatureInput:", 0, *(unsigned __int8 *)(a1 + 57), v7, v8, v9, *(unsigned __int8 *)(a1 + 56));
LABEL_6:
  [*(id *)(a1 + 40) addObject:v14];
}

uint64_t __352__HDMCAnalysisManager__analysisWithAlgorithmsAnalysis_algorithmsCycles_recentSymptoms_mostRecentBasalBodyTemperature_lastLoggedDayIndex_lastMenstrualFlowDayIndex_numberOfDailySleepHeartRateStatisticsForPast100Days_numberOfDailyAwakeHeartRateStatisticsForPast100Days_featureSettings_useHeartRateInput_useWristTemperatureInput_deviationsFeatureSettings___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 type];
  return [v2 deviationDetectionEnabledForType:v3];
}

- (BOOL)_hasHealthAppDevicesWithHigherAlgorithmVersions
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  _HKInitializeLogging();
  uint64_t v3 = (os_log_t *)MEMORY[0x263F09930];
  uint64_t v4 = *MEMORY[0x263F09930];
  if (os_signpost_enabled((os_log_t)*MEMORY[0x263F09930]))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_225722000, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "hasHealthAppDevicesWithHigherAlgorithmVersions", "", buf, 2u);
  }
  deviceScopedStorageManager = self->_deviceScopedStorageManager;
  id v12 = 0;
  uint64_t v6 = [(HDMCDeviceScopedStorageManager *)deviceScopedStorageManager accountDevicesInfoWithError:&v12];
  id v7 = v12;
  if (v6)
  {
    char v8 = [v6 hasHealthAppDevicesWithHigherAlgorithmVersions];
    _HKInitializeLogging();
    BOOL v9 = *v3;
    if (os_signpost_enabled(v9))
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_signpost_emit_with_name_impl(&dword_225722000, v9, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "hasHealthAppDevicesWithHigherAlgorithmVersions", "", v11, 2u);
    }
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR)) {
      -[HDMCAnalysisManager _hasHealthAppDevicesWithHigherAlgorithmVersions]();
    }
    char v8 = 0;
  }

  return v8;
}

- (void)unregisterObserver:(id)a3
{
  observers = self->_observers;
  id v5 = a3;
  [(HKObserverSet *)observers unregisterObserver:v5];
  [(HKObserverSet *)self->_userInitiatedObservers unregisterObserver:v5];
}

- (void)_test_setAnalysis:(id)a3
{
}

- (void)_test_setAlgorithmsAnalysis:(id)a3
{
}

- (void)_test_setAlgorithmsCycles:(id)a3
{
}

- (void)setProfile:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void)set_test_didNotUpgradeOnboardingRecord:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->__test_didNotUpgradeOnboardingRecord, 0);
  objc_storeStrong((id *)&self->_test_algorithmsCycles, 0);
  objc_storeStrong((id *)&self->_test_algorithmsAnalysis, 0);
  objc_storeStrong((id *)&self->_test_analysis, 0);
  objc_storeStrong(&self->_historicalAnalyzerProvider, 0);
  objc_storeStrong(&self->_dayStreamProcessorProvider, 0);
  objc_storeStrong((id *)&self->_queue_lastFeatureSettings, 0);
  objc_storeStrong((id *)&self->_lock_currentAnalysis, 0);
  objc_storeStrong((id *)&self->_calendarCache, 0);
  objc_storeStrong((id *)&self->_deviceScopedStorageManager, 0);
  objc_storeStrong((id *)&self->_deviationInputManager, 0);
  objc_storeStrong((id *)&self->_deviationsFeatureStatusManager, 0);
  objc_storeStrong((id *)&self->_wristTemperatureFeatureStatusManager, 0);
  objc_storeStrong((id *)&self->_heartRateFeatureStatusManager, 0);
  objc_storeStrong((id *)&self->_featureAvailabilityManager, 0);
  objc_storeStrong((id *)&self->_settingsManager, 0);
  objc_storeStrong((id *)&self->_analyzeOperation, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_userInitiatedObservers, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_destroyWeak((id *)&self->_profile);
}

void __130__HDMCAnalysisManager_CycleFactorsAutomaticUpgrade__initiateCycleFactorsAutomaticUpgradeWithDatabaseAccessibilityAssertion_error___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  v2 = (os_log_t *)MEMORY[0x263F09930];
  uint64_t v3 = (void *)*MEMORY[0x263F09930];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = v3;
    *(_DWORD *)buf = 138543362;
    id v15 = (id)objc_opt_class();
    id v5 = v15;
    _os_log_impl(&dword_225722000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Writing a Cycle Factors onboarding record for backwards compatibility", buf, 0xCu);
  }
  uint64_t v6 = [MEMORY[0x263F43278] contextForAccessibilityAssertion:*(void *)(a1 + 40)];
  [v6 setCacheScope:1];
  id v7 = [*(id *)(a1 + 48) database];
  id v13 = 0;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __130__HDMCAnalysisManager_CycleFactorsAutomaticUpgrade__initiateCycleFactorsAutomaticUpgradeWithDatabaseAccessibilityAssertion_error___block_invoke_287;
  v11[3] = &unk_264751528;
  id v12 = *(id *)(a1 + 48);
  char v8 = [v7 performWithTransactionContext:v6 error:&v13 block:v11];
  id v9 = v13;

  if ((v8 & 1) == 0)
  {
    _HKInitializeLogging();
    os_log_t v10 = *v2;
    if (os_log_type_enabled(*v2, OS_LOG_TYPE_ERROR)) {
      __130__HDMCAnalysisManager_CycleFactorsAutomaticUpgrade__initiateCycleFactorsAutomaticUpgradeWithDatabaseAccessibilityAssertion_error___block_invoke_cold_1(a1, v10);
    }
  }
}

uint64_t __130__HDMCAnalysisManager_CycleFactorsAutomaticUpgrade__initiateCycleFactorsAutomaticUpgradeWithDatabaseAccessibilityAssertion_error___block_invoke_287(uint64_t a1, uint64_t a2)
{
  id v4 = objc_alloc(MEMORY[0x263F0A5B0]);
  uint64_t v5 = *MEMORY[0x263F09798];
  uint64_t v6 = [MEMORY[0x263EFF910] date];
  id v7 = (void *)[v4 initWithFeatureIdentifier:v5 version:3 completionDate:v6 countryCode:0 countryCodeProvenance:0];

  char v8 = [*(id *)(a1 + 32) onboardingCompletionManager];
  uint64_t v9 = [v8 insertOnboardingCompletion:v7 error:a2];

  return v9;
}

- (void)_takeAccessibilityAssertion
{
  OUTLINED_FUNCTION_2();
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v2 = v1;
  uint64_t v3 = (void *)OUTLINED_FUNCTION_3();
  id v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_4(&dword_225722000, v0, v5, "[%{public}@] Unable to take an accessibility assertion: %{public}@", v6);
}

- (void)featureAvailabilityProvidingDidUpdateSettings:.cold.1()
{
  OUTLINED_FUNCTION_2();
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v2 = v1;
  uint64_t v3 = (void *)OUTLINED_FUNCTION_3();
  id v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_4(&dword_225722000, v0, v5, "[%{public}@] Settings change: unable to read new settings: %{public}@", v6);
}

- (void)_queue_computeAnalysisWithDatabaseAccessibilityAssertion:forceIncludeCycles:forceAnalyzeCompleteHistory:error:.cold.1()
{
  OUTLINED_FUNCTION_8();
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v1 = v0;
  id v2 = objc_opt_class();
  id v3 = OUTLINED_FUNCTION_3_0(v2);
  OUTLINED_FUNCTION_4(&dword_225722000, v1, v4, "[%{public}@] Error retrieving feature settings: %{public}@", v5);
}

- (void)_queue_computeAnalysisWithDatabaseAccessibilityAssertion:forceIncludeCycles:forceAnalyzeCompleteHistory:error:.cold.2()
{
  OUTLINED_FUNCTION_8();
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v1 = v0;
  id v2 = objc_opt_class();
  id v3 = OUTLINED_FUNCTION_3_0(v2);
  OUTLINED_FUNCTION_4(&dword_225722000, v1, v4, "[%{public}@] Error retrieving feature status for heart rate input: %{public}@", v5);
}

- (void)_queue_computeAnalysisWithDatabaseAccessibilityAssertion:forceIncludeCycles:forceAnalyzeCompleteHistory:error:.cold.3()
{
  OUTLINED_FUNCTION_8();
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v1 = v0;
  id v2 = objc_opt_class();
  id v3 = OUTLINED_FUNCTION_3_0(v2);
  OUTLINED_FUNCTION_4(&dword_225722000, v1, v4, "[%{public}@] Error retrieving feature status for wrist temperature input: %{public}@", v5);
}

- (void)_queue_computeAnalysisWithDatabaseAccessibilityAssertion:forceIncludeCycles:forceAnalyzeCompleteHistory:error:.cold.4()
{
  OUTLINED_FUNCTION_8();
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v1 = v0;
  id v2 = objc_opt_class();
  id v3 = OUTLINED_FUNCTION_3_0(v2);
  OUTLINED_FUNCTION_4(&dword_225722000, v1, v4, "[%{public}@] Error retrieving feature status for deviations: %{public}@", v5);
}

- (void)_queue_computeAnalysisWithDatabaseAccessibilityAssertion:forceIncludeCycles:forceAnalyzeCompleteHistory:error:.cold.5()
{
  OUTLINED_FUNCTION_9();
  id v3 = OUTLINED_FUNCTION_1_1(v0, v1, v2, 5.8382e-34);
  OUTLINED_FUNCTION_0_1(&dword_225722000, v4, v5, "[%{public}@] Error retrieving initial factors: %{public}@");
}

- (void)_queue_computeAnalysisWithDatabaseAccessibilityAssertion:forceIncludeCycles:forceAnalyzeCompleteHistory:error:.cold.6()
{
  OUTLINED_FUNCTION_9();
  id v3 = OUTLINED_FUNCTION_1_1(v0, v1, v2, 5.8382e-34);
  OUTLINED_FUNCTION_0_1(&dword_225722000, v4, v5, "[%{public}@] Error analyzing predictions with most recent menstrual flow julian day updated: %{public}@");
}

- (void)_queue_computeAnalysisWithDatabaseAccessibilityAssertion:forceIncludeCycles:forceAnalyzeCompleteHistory:error:.cold.7()
{
  OUTLINED_FUNCTION_9();
  id v3 = OUTLINED_FUNCTION_1_1(v0, v1, v2, 5.8382e-34);
  OUTLINED_FUNCTION_0_1(&dword_225722000, v4, v5, "[%{public}@] Error analyzing historical cycles: %{public}@");
}

- (void)_queue_computeAnalysisWithDatabaseAccessibilityAssertion:(void *)a1 forceIncludeCycles:forceAnalyzeCompleteHistory:error:.cold.8(void *a1)
{
  id v1 = a1;
  OUTLINED_FUNCTION_6((uint64_t)v1, 5.8382e-34);
  OUTLINED_FUNCTION_0_1(&dword_225722000, v2, v3, "[%{public}@] Error retrieving analysis sample info: %{public}@");
}

- (void)_queue_computeAnalysisWithDatabaseAccessibilityAssertion:forceIncludeCycles:forceAnalyzeCompleteHistory:error:.cold.9()
{
  OUTLINED_FUNCTION_9();
  id v3 = OUTLINED_FUNCTION_1_1(v0, v1, v2, 5.8382e-34);
  OUTLINED_FUNCTION_0_1(&dword_225722000, v4, v5, "[%{public}@] Error enumerating day summaries: %{public}@");
}

- (void)_queue_computeAnalysisWithDatabaseAccessibilityAssertion:(void *)a1 forceIncludeCycles:forceAnalyzeCompleteHistory:error:.cold.10(void *a1)
{
  id v1 = a1;
  OUTLINED_FUNCTION_6((uint64_t)v1, 5.8382e-34);
  OUTLINED_FUNCTION_0_1(&dword_225722000, v2, v3, "[%{public}@] Error retrieving heart statistics: %{public}@");
}

- (void)_processorConfigurationForTodayIndex:deviationsFeatureStatus:calendar:.cold.1()
{
  OUTLINED_FUNCTION_2();
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v2 = v1;
  uint64_t v3 = (void *)OUTLINED_FUNCTION_3();
  id v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_4(&dword_225722000, v0, v5, "[%{public}@] Unable to clear state for deviation input: %{public}@", v6);
}

- (void)_hasHealthAppDevicesWithHigherAlgorithmVersions
{
  OUTLINED_FUNCTION_2();
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v2 = v1;
  uint64_t v3 = (void *)OUTLINED_FUNCTION_3();
  id v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_4(&dword_225722000, v0, v5, "[%{public}@] Failed to retrieve account device info: %{public}@", v6);
}

void __130__HDMCAnalysisManager_CycleFactorsAutomaticUpgrade__initiateCycleFactorsAutomaticUpgradeWithDatabaseAccessibilityAssertion_error___block_invoke_cold_1(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = objc_opt_class();
  id v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_225722000, v5, v6, "[%{public}@] Error writing a Cycle Factors onboarding record for backwards compatibility: %{public}@", v7, v8, v9, v10, v11);
}

@end