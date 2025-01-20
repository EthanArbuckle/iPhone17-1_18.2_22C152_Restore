@interface HKHRAFibBurdenSevenDayAnalysisFeatureStatusInspector
- (BOOL)shouldAllowAnalysisWithFeatureStatus:(id)a3;
- (HKHRAFibBurdenSevenDayAnalysisFeatureStatusInspector)initWithOnboardingEligibilityDeterminer:(id)a3 breadcrumbManager:(id)a4;
- (id)pairedDevices;
@end

@implementation HKHRAFibBurdenSevenDayAnalysisFeatureStatusInspector

- (HKHRAFibBurdenSevenDayAnalysisFeatureStatusInspector)initWithOnboardingEligibilityDeterminer:(id)a3 breadcrumbManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HKHRAFibBurdenSevenDayAnalysisFeatureStatusInspector;
  v9 = [(HKHRAFibBurdenSevenDayAnalysisFeatureStatusInspector *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_onboardingEligibilityDeterminer, a3);
    objc_storeStrong((id *)&v10->_breadcrumbManager, a4);
  }

  return v10;
}

- (BOOL)shouldAllowAnalysisWithFeatureStatus:(id)a3
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F29C20]];
  int v6 = [v5 areAllRequirementsSatisfied];

  if (v6)
  {
    _HKInitializeLogging();
    id v7 = HKHRAFibBurdenLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v63 = self;
      _os_log_impl(&dword_1D3AC6000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Usage context supported, allowing analysis", buf, 0xCu);
    }

    BOOL v8 = 1;
  }
  else
  {
    uint64_t v9 = *MEMORY[0x1E4F67CF8];
    v10 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F67CF8]];
    char v11 = [v10 areAllRequirementsSatisfied];

    if (v11)
    {
      objc_super v12 = [(HKHRAFibBurdenSevenDayAnalysisFeatureStatusInspector *)self pairedDevices];
      if ([v12 count])
      {
        v13 = [v4 onboardingRecord];
        v14 = [v13 allOnboardingCompletionsRegardlessOfSupportedState];

        long long v57 = 0u;
        long long v58 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        id v15 = v12;
        uint64_t v16 = [v15 countByEnumeratingWithState:&v55 objects:v60 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v56;
          v46 = v12;
          v48 = v15;
          v49 = v14;
          uint64_t v44 = *(void *)v56;
          while (2)
          {
            uint64_t v19 = 0;
            uint64_t v45 = v17;
            do
            {
              if (*(void *)v56 != v18) {
                objc_enumerationMutation(v15);
              }
              uint64_t v20 = *(void *)(*((void *)&v55 + 1) + 8 * v19);
              onboardingEligibilityDeterminer = self->_onboardingEligibilityDeterminer;
              id v54 = 0;
              v22 = -[HDFeatureAvailabilityOnboardingEligibilityDeterminer onboardingEligibilitiesForDevice:onboardingCompletions:error:](onboardingEligibilityDeterminer, "onboardingEligibilitiesForDevice:onboardingCompletions:error:", v20, v14, &v54, v44);
              id v23 = v54;
              BOOL v8 = v23 == 0;
              if (v23)
              {
                id v24 = v23;
                _HKInitializeLogging();
                v43 = HKHRAFibBurdenLogForCategory();
                if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
                  [(HKHRAFibBurdenSevenDayAnalysisFeatureStatusInspector *)(uint64_t)self shouldAllowAnalysisWithFeatureStatus:v43];
                }

                [(HDHRAFibBurdenSevenDayAnalysisBreadcrumbManaging *)self->_breadcrumbManager dropAnalysisResultBreadcrumbWithContext:@"Error determining onboarding eligibility"];
                objc_super v12 = v46;
LABEL_40:

                goto LABEL_41;
              }
              long long v52 = 0u;
              long long v53 = 0u;
              long long v50 = 0u;
              long long v51 = 0u;
              v47 = v22;
              id v24 = v22;
              uint64_t v25 = [v24 countByEnumeratingWithState:&v50 objects:v59 count:16];
              if (v25)
              {
                uint64_t v26 = v25;
                uint64_t v27 = *(void *)v51;
                while (2)
                {
                  for (uint64_t i = 0; i != v26; ++i)
                  {
                    if (*(void *)v51 != v27) {
                      objc_enumerationMutation(v24);
                    }
                    v29 = [*(id *)(*((void *)&v50 + 1) + 8 * i) onboardingEligibility];
                    int v30 = [v29 isEligible];

                    if (v30)
                    {
                      _HKInitializeLogging();
                      v41 = HKHRAFibBurdenLogForCategory();
                      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 138543362;
                        v63 = self;
                        _os_log_impl(&dword_1D3AC6000, v41, OS_LOG_TYPE_DEFAULT, "[%{public}@] At least one paired device has supported onboarding completion, allowing analysis", buf, 0xCu);
                      }

                      objc_super v12 = v46;
                      v22 = v47;
                      id v15 = v48;
                      v14 = v49;
                      goto LABEL_40;
                    }
                  }
                  uint64_t v26 = [v24 countByEnumeratingWithState:&v50 objects:v59 count:16];
                  if (v26) {
                    continue;
                  }
                  break;
                }
              }

              ++v19;
              uint64_t v18 = v44;
              id v15 = v48;
              v14 = v49;
            }
            while (v19 != v45);
            uint64_t v17 = [v48 countByEnumeratingWithState:&v55 objects:v60 count:16];
            objc_super v12 = v46;
            if (v17) {
              continue;
            }
            break;
          }
        }

        _HKInitializeLogging();
        v31 = HKHRAFibBurdenLogForCategory();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v63 = self;
          _os_log_impl(&dword_1D3AC6000, v31, OS_LOG_TYPE_DEFAULT, "[%{public}@] No paired devices had supported onboarding completion, not allowing analysis", buf, 0xCu);
        }

        [(HDHRAFibBurdenSevenDayAnalysisBreadcrumbManaging *)self->_breadcrumbManager dropAnalysisResultBreadcrumbWithContext:@"No devices supported for onboarding completions"];
        BOOL v8 = 0;
LABEL_41:
      }
      else
      {
        _HKInitializeLogging();
        v40 = HKHRAFibBurdenLogForCategory();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v63 = self;
          _os_log_impl(&dword_1D3AC6000, v40, OS_LOG_TYPE_DEFAULT, "[%{public}@] No devices present, not allowing analysis", buf, 0xCu);
        }

        [(HDHRAFibBurdenSevenDayAnalysisBreadcrumbManaging *)self->_breadcrumbManager dropAnalysisResultBreadcrumbWithContext:@"Analysis feature context allowed but no paired devices"];
        BOOL v8 = 0;
      }
    }
    else
    {
      v32 = [v4 objectForKeyedSubscript:v9];
      v33 = [v32 unsatisfiedRequirementIdentifiers];
      uint64_t v61 = *MEMORY[0x1E4F29C90];
      v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v61 count:1];
      int v35 = [v33 isEqualToArray:v34];

      _HKInitializeLogging();
      v36 = HKHRAFibBurdenLogForCategory();
      BOOL v37 = os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT);
      if (v35)
      {
        if (v37)
        {
          *(_DWORD *)buf = 138543362;
          v63 = self;
          _os_log_impl(&dword_1D3AC6000, v36, OS_LOG_TYPE_DEFAULT, "[%{public}@] Analysis context not supported exclusively due to setting being toggled off, not allowing analysis", buf, 0xCu);
        }

        breadcrumbManager = self->_breadcrumbManager;
        v39 = @"Feature turned off";
      }
      else
      {
        if (v37)
        {
          *(_DWORD *)buf = 138543362;
          v63 = self;
          _os_log_impl(&dword_1D3AC6000, v36, OS_LOG_TYPE_DEFAULT, "[%{public}@] Analysis context not supported, not allowing analysis", buf, 0xCu);
        }

        breadcrumbManager = self->_breadcrumbManager;
        v39 = @"Usage feature status not allowed";
      }
      [(HDHRAFibBurdenSevenDayAnalysisBreadcrumbManaging *)breadcrumbManager dropAnalysisResultBreadcrumbWithContext:v39];
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (id)pairedDevices
{
  v2 = [MEMORY[0x1E4F79EF0] sharedInstance];
  v3 = [MEMORY[0x1E4F79EF0] pairedDevicesSelectorBlock];
  id v4 = [v2 getDevicesMatching:v3];

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_breadcrumbManager, 0);

  objc_storeStrong((id *)&self->_onboardingEligibilityDeterminer, 0);
}

- (void)shouldAllowAnalysisWithFeatureStatus:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1D3AC6000, log, OS_LOG_TYPE_ERROR, "[%{public}@] Error when retrieving onboarding eligibility: %{public}@", (uint8_t *)&v3, 0x16u);
}

@end