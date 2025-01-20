@interface HAMenstrualAlgorithmsDeviationInput(HKMenstrualCycles)
+ (id)_dayIndexAfterLastDeviationOfType:()HKMenstrualCycles profile:calendar:;
+ (id)hdmc_deviationInputWithProfile:()HKMenstrualCycles enabledSetExplicitly:calendar:;
@end

@implementation HAMenstrualAlgorithmsDeviationInput(HKMenstrualCycles)

+ (id)hdmc_deviationInputWithProfile:()HKMenstrualCycles enabledSetExplicitly:calendar:
{
  uint64_t v83 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  id v10 = objc_alloc_init(MEMORY[0x263F42990]);
  v11 = [a1 _dayIndexAfterLastDeviationOfType:0 profile:v8 calendar:v9];
  [v10 setJulianDayMinAnalysisWindowStartProlonged:v11];

  v12 = [a1 _dayIndexAfterLastDeviationOfType:1 profile:v8 calendar:v9];
  [v10 setJulianDayMinAnalysisWindowStartSpotting:v12];

  v13 = [a1 _dayIndexAfterLastDeviationOfType:2 profile:v8 calendar:v9];
  [v10 setJulianDayMinAnalysisWindowStartIrregular:v13];

  v14 = [a1 _dayIndexAfterLastDeviationOfType:3 profile:v8 calendar:v9];
  [v10 setJulianDayMinAnalysisWindowStartInfrequent:v14];

  int v15 = HKShowSensitiveLogItems();
  v16 = (os_log_t *)MEMORY[0x263F09930];
  if (v15)
  {
    _HKInitializeLogging();
    os_log_t v17 = *v16;
    if (os_log_type_enabled(*v16, OS_LOG_TYPE_DEFAULT))
    {
      v18 = v17;
      v19 = objc_opt_class();
      id v20 = v19;
      v21 = [v10 julianDayMinAnalysisWindowStartProlonged];
      *(_DWORD *)buf = 138543618;
      v74 = v19;
      __int16 v75 = 2112;
      v76 = v21;
      _os_log_impl(&dword_225722000, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@] Minimum deviation analysis start day (prolonged): %@", buf, 0x16u);

      v16 = (os_log_t *)MEMORY[0x263F09930];
    }
    _HKInitializeLogging();
    os_log_t v22 = *v16;
    if (os_log_type_enabled(*v16, OS_LOG_TYPE_DEFAULT))
    {
      v23 = v22;
      v24 = objc_opt_class();
      id v25 = v24;
      v26 = [v10 julianDayMinAnalysisWindowStartSpotting];
      *(_DWORD *)buf = 138543618;
      v74 = v24;
      __int16 v75 = 2112;
      v76 = v26;
      _os_log_impl(&dword_225722000, v23, OS_LOG_TYPE_DEFAULT, "[%{public}@] Minimum deviation analysis start day (spotting): %@", buf, 0x16u);

      v16 = (os_log_t *)MEMORY[0x263F09930];
    }
    _HKInitializeLogging();
    os_log_t v27 = *v16;
    if (os_log_type_enabled(*v16, OS_LOG_TYPE_DEFAULT))
    {
      v28 = v27;
      v29 = objc_opt_class();
      id v30 = v29;
      v31 = [v10 julianDayMinAnalysisWindowStartIrregular];
      *(_DWORD *)buf = 138543618;
      v74 = v29;
      __int16 v75 = 2112;
      v76 = v31;
      _os_log_impl(&dword_225722000, v28, OS_LOG_TYPE_DEFAULT, "[%{public}@] Minimum deviation analysis start day (irregular): %@", buf, 0x16u);

      v16 = (os_log_t *)MEMORY[0x263F09930];
    }
    _HKInitializeLogging();
    os_log_t v32 = *v16;
    if (os_log_type_enabled(*v16, OS_LOG_TYPE_DEFAULT))
    {
      v33 = v32;
      v34 = objc_opt_class();
      id v35 = v34;
      v36 = [v10 julianDayMinAnalysisWindowStartInfrequent];
      *(_DWORD *)buf = 138543618;
      v74 = v34;
      __int16 v75 = 2112;
      v76 = v36;
      _os_log_impl(&dword_225722000, v33, OS_LOG_TYPE_DEFAULT, "[%{public}@] Minimum deviation analysis start day (infrequent): %@", buf, 0x16u);

      v16 = (os_log_t *)MEMORY[0x263F09930];
    }
  }
  v37 = [v8 onboardingCompletionManager];
  uint64_t v38 = *MEMORY[0x263F097A0];
  id v72 = 0;
  v39 = [v37 onboardingCompletionsForHighestVersionOfFeatureIdentifier:v38 error:&v72];
  id v40 = v72;

  if (!v39)
  {
    _HKInitializeLogging();
    os_log_t v41 = *v16;
    if (os_log_type_enabled(*v16, OS_LOG_TYPE_ERROR)) {
      +[HAMenstrualAlgorithmsDeviationInput(HKMenstrualCycles) hdmc_deviationInputWithProfile:enabledSetExplicitly:calendar:](v41);
    }
  }
  if ([v39 count])
  {
    v42 = objc_msgSend(v39, "hk_firstSortedObjectWithComparison:", &__block_literal_global);
    v43 = [v42 completionDate];

    v68 = v43;
    v70 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v43, "hk_dayIndexWithCalendar:", v9));
    objc_msgSend(MEMORY[0x263F43218], "hdmc_syncedMenstrualCyclesDefaultsDomainWithProfile:", v8);
    v67 = id v71 = v40;
    v44 = objc_msgSend(v67, "hdmc_unconfirmedDeviationDismissalDayIndexWithError:", &v71);
    id v45 = v71;

    if (v44 || !v45)
    {
      if (v44)
      {
        v52 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v44, "integerValue") + 10);
LABEL_24:
        id v69 = v9;
        int v53 = a4;
        if (a4)
        {
          id v54 = v52;
        }
        else
        {
          v55 = v70;
          if (v52 && v70)
          {
            v66 = NSNumber;
            uint64_t v56 = [v52 integerValue];
            uint64_t v57 = [v70 integerValue];
            if (v56 <= v57) {
              uint64_t v58 = v57;
            }
            else {
              uint64_t v58 = v56;
            }
            id v54 = [v66 numberWithInteger:v58];
          }
          else
          {
            if (v52) {
              v55 = v52;
            }
            id v54 = v55;
          }
        }
        v59 = v54;
        _HKInitializeLogging();
        v60 = (void *)*MEMORY[0x263F09930];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
        {
          v61 = v60;
          v62 = objc_opt_class();
          *(_DWORD *)buf = 138544386;
          v63 = @"NO";
          v74 = v62;
          __int16 v75 = 2112;
          if (v53) {
            v63 = @"YES";
          }
          v76 = v59;
          __int16 v77 = 2112;
          v78 = v70;
          __int16 v79 = 2112;
          v80 = v44;
          __int16 v81 = 2112;
          v82 = v63;
          id v64 = v62;
          _os_log_impl(&dword_225722000, v61, OS_LOG_TYPE_DEFAULT, "[%{public}@] Minimum deviation analysis end day: %@ (first onboarded: %@, last dismissed: %@, enabled set explicitly: %@)", buf, 0x34u);
        }
        [v10 setJulianDayMinAnalysisWindowEndProlonged:v59];
        [v10 setJulianDayMinAnalysisWindowEndSpotting:v59];
        [v10 setJulianDayMinAnalysisWindowEndIrregular:v59];
        [v10 setJulianDayMinAnalysisWindowEndInfrequent:v59];
        id v51 = v10;

        id v9 = v69;
        goto LABEL_40;
      }
    }
    else
    {
      _HKInitializeLogging();
      v46 = (void *)*MEMORY[0x263F09930];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR)) {
        +[HAMenstrualAlgorithmsDeviationInput(HKMenstrualCycles) hdmc_deviationInputWithProfile:enabledSetExplicitly:calendar:](v46);
      }
    }
    v52 = 0;
    goto LABEL_24;
  }
  _HKInitializeLogging();
  os_log_t v47 = *v16;
  if (os_log_type_enabled(*v16, OS_LOG_TYPE_DEFAULT))
  {
    v48 = v47;
    v49 = objc_opt_class();
    *(_DWORD *)buf = 138543362;
    v74 = v49;
    id v50 = v49;
    _os_log_impl(&dword_225722000, v48, OS_LOG_TYPE_DEFAULT, "[%{public}@] Skipping deviation input configuration due to no onboarding completion", buf, 0xCu);
  }
  id v51 = 0;
  id v45 = v40;
LABEL_40:

  return v51;
}

+ (id)_dayIndexAfterLastDeviationOfType:()HKMenstrualCycles profile:calendar:
{
  v38[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a5;
  uint64_t v26 = 0;
  os_log_t v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__0;
  id v30 = __Block_byref_object_dispose__0;
  id v31 = 0;
  id v8 = (void *)MEMORY[0x263F43318];
  id v9 = HKCategoryTypeFromDeviationType();
  id v10 = [v8 entityEnumeratorWithType:v9 profile:v6];

  v11 = [MEMORY[0x263F08B30] sortDescriptorWithKey:*MEMORY[0x263F09F80] ascending:0];
  v38[0] = v11;
  v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v38 count:1];
  [v10 setSortDescriptors:v12];

  v13 = HDSampleEntityOrderingTermsForRecentness();
  [v10 setOrderingTerms:v13];

  [v10 setLimitCount:1];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __109__HAMenstrualAlgorithmsDeviationInput_HKMenstrualCycles___dayIndexAfterLastDeviationOfType_profile_calendar___block_invoke;
  v24[3] = &unk_264750778;
  v24[4] = &v26;
  id v25 = 0;
  [v10 enumerateWithError:&v25 handler:v24];
  id v14 = v25;
  int v15 = (void *)v27[5];
  if (v15)
  {
    uint64_t v16 = objc_msgSend(v15, "hk_dayIndexRangeWithCalendar:", v7);
    if (v17 <= 0) {
      unint64_t v18 = 0x8000000000000000;
    }
    else {
      unint64_t v18 = v16 + v17;
    }
    v19 = [NSNumber numberWithInteger:v18];
  }
  else
  {
    if (v14)
    {
      _HKInitializeLogging();
      id v20 = (id)*MEMORY[0x263F09930];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        id v22 = (id)objc_opt_class();
        v23 = NSStringFromDeviationType();
        *(_DWORD *)buf = 138543874;
        id v33 = v22;
        __int16 v34 = 2114;
        id v35 = v23;
        __int16 v36 = 2114;
        id v37 = v14;
        _os_log_error_impl(&dword_225722000, v20, OS_LOG_TYPE_ERROR, "[%{public}@] Error retrieving last %{public}@ deviation sample: %{public}@", buf, 0x20u);
      }
    }
    v19 = 0;
  }

  _Block_object_dispose(&v26, 8);
  return v19;
}

+ (void)hdmc_deviationInputWithProfile:()HKMenstrualCycles enabledSetExplicitly:calendar:.cold.1(void *a1)
{
  id v1 = a1;
  v2 = objc_opt_class();
  id v3 = OUTLINED_FUNCTION_0(v2);
  OUTLINED_FUNCTION_1(&dword_225722000, v4, v5, "[%{public}@] Error retrieving unconfirmed deviation dismiss day: %{public}@", v6, v7, v8, v9, v10);
}

+ (void)hdmc_deviationInputWithProfile:()HKMenstrualCycles enabledSetExplicitly:calendar:.cold.2(void *a1)
{
  id v1 = a1;
  v2 = objc_opt_class();
  id v3 = OUTLINED_FUNCTION_0(v2);
  OUTLINED_FUNCTION_1(&dword_225722000, v4, v5, "[%{public}@] Error retrieving deviation detection onboarding completions: %{public}@", v6, v7, v8, v9, v10);
}

@end