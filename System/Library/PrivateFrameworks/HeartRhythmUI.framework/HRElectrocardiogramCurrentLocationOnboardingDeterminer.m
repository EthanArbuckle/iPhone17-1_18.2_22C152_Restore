@interface HRElectrocardiogramCurrentLocationOnboardingDeterminer
- (HRElectrocardiogramCurrentLocationOnboardingDeterminer)initWithHealthStore:(id)a3;
- (void)_submitOnboardingUIErrorEventWithCountryCode:(void *)a3 algorithmVersion:(void *)a4 onboardingEligibility:;
- (void)isElectrocardiogramOnboardingAvailableInCurrentLocationForActiveWatch:(id)a3;
- (void)isElectrocardiogramOnboardingAvailableInCurrentLocationForWatch:(void *)a3 completion:;
@end

@implementation HRElectrocardiogramCurrentLocationOnboardingDeterminer

- (HRElectrocardiogramCurrentLocationOnboardingDeterminer)initWithHealthStore:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HRElectrocardiogramCurrentLocationOnboardingDeterminer;
  v6 = [(HRElectrocardiogramCurrentLocationOnboardingDeterminer *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_healthStore, a3);
    uint64_t v8 = HKPreferredRegulatoryDomainProvider();
    mobileCountryCodeManager = v7->_mobileCountryCodeManager;
    v7->_mobileCountryCodeManager = (HKRegulatoryDomainProvider *)v8;

    id v10 = objc_alloc(MEMORY[0x263F0A0C0]);
    uint64_t v11 = [v10 initWithLoggingCategory:*MEMORY[0x263F09920] healthDataSource:v5];
    analyticsEventSubmissionManager = v7->_analyticsEventSubmissionManager;
    v7->_analyticsEventSubmissionManager = (HKAnalyticsEventSubmissionManager *)v11;
  }
  return v7;
}

- (void)isElectrocardiogramOnboardingAvailableInCurrentLocationForActiveWatch:(id)a3
{
  v4 = (void *)MEMORY[0x263F0A550];
  id v5 = a3;
  id v7 = [v4 activeNonFamilySetupDevice];
  -[HRElectrocardiogramCurrentLocationOnboardingDeterminer isElectrocardiogramOnboardingAvailableInCurrentLocationForWatch:completion:]((uint64_t)self, v6, v5);
}

- (void)isElectrocardiogramOnboardingAvailableInCurrentLocationForWatch:(void *)a3 completion:
{
  id v4 = a3;
  id v5 = v4;
  if (a1)
  {
    uint64_t v6 = *(void **)(a1 + 16);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __133__HRElectrocardiogramCurrentLocationOnboardingDeterminer_isElectrocardiogramOnboardingAvailableInCurrentLocationForWatch_completion___block_invoke;
    v7[3] = &unk_264581288;
    v7[4] = a1;
    v9 = sel_isElectrocardiogramOnboardingAvailableInCurrentLocationForWatch_completion_;
    id v8 = v4;
    [v6 fetchMobileCountryCodeFromCellularWithCompletion:v7];
  }
}

void __133__HRElectrocardiogramCurrentLocationOnboardingDeterminer_isElectrocardiogramOnboardingAvailableInCurrentLocationForWatch_completion___block_invoke(uint64_t *a1, void *a2, void *a3)
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = [v5 ISOCode];
    if (!v7)
    {
      _HKInitializeLogging();
      v20 = (void *)*MEMORY[0x263F09920];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09920], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v21 = a1[4];
        v22 = (const char *)a1[6];
        v23 = v20;
        v24 = NSStringFromSelector(v22);
        *(_DWORD *)buf = 138543618;
        uint64_t v44 = v21;
        __int16 v45 = 2114;
        v46 = v24;
        _os_log_impl(&dword_220CA3000, v23, OS_LOG_TYPE_DEFAULT, "[%{public}@] %{public}@] -> Country code is nil. Set error.", buf, 0x16u);
      }
      uint64_t v25 = objc_msgSend(MEMORY[0x263F087E8], "hk_error:description:", 122, @"Location is invalid or unavailable");

      -[HRElectrocardiogramCurrentLocationOnboardingDeterminer _submitOnboardingUIErrorEventWithCountryCode:algorithmVersion:onboardingEligibility:](a1[4], v5, (void *)*MEMORY[0x263F091B0], 0);
      (*(void (**)(void))(a1[5] + 16))();
      id v6 = (id)v25;
      goto LABEL_36;
    }
    if ([MEMORY[0x263F0A980] isAppleInternalInstall])
    {
      id v8 = objc_msgSend(MEMORY[0x263EFFA40], "hk_heartRhythmDefaults");
      v9 = [v8 objectForKey:*MEMORY[0x263F09528]];

      uint64_t v10 = [v9 unsignedIntegerValue];
      if (v10)
      {
        uint64_t v11 = [MEMORY[0x263F0A348] algorithmVersionForOnboardingVersion:v10];
        _HKInitializeLogging();
        v12 = (void *)*MEMORY[0x263F09920];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09920], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v13 = a1[4];
          objc_super v14 = (const char *)a1[6];
          v15 = v12;
          v16 = NSStringFromSelector(v14);
          *(_DWORD *)buf = 138544130;
          uint64_t v44 = v13;
          __int16 v45 = 2114;
          v46 = v16;
          __int16 v47 = 2114;
          v48 = v9;
          __int16 v49 = 2114;
          id v50 = v5;
          _os_log_impl(&dword_220CA3000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}@] -> Algorithm Version was overridden via HKECGOnboardingVersionOverrideKey -> %{public}@, Country Code: %{public}@", buf, 0x2Au);
        }
        uint64_t v17 = a1[5];
        v18 = [NSNumber numberWithInteger:v11];
        (*(void (**)(uint64_t, void *, void *, id))(v17 + 16))(v17, v7, v18, v6);

        goto LABEL_35;
      }
    }
    id v26 = objc_alloc(MEMORY[0x263F0A3B8]);
    uint64_t v27 = a1[4];
    if (v27) {
      uint64_t v28 = *(void *)(v27 + 8);
    }
    else {
      uint64_t v28 = 0;
    }
    v9 = (void *)[v26 initWithFeatureIdentifier:*MEMORY[0x263F09748] healthStore:v28];
    id v42 = 0;
    v29 = [v9 onboardingEligibilityForCountryCode:v7 error:&v42];
    id v30 = v42;
    if (!v29)
    {
      _HKInitializeLogging();
      v32 = (void *)*MEMORY[0x263F09920];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09920], OS_LOG_TYPE_ERROR))
      {
        uint64_t v38 = a1[4];
        v39 = (const char *)a1[6];
        v40 = v32;
        v41 = NSStringFromSelector(v39);
        *(_DWORD *)buf = 138544130;
        uint64_t v44 = v38;
        __int16 v45 = 2114;
        v46 = v41;
        __int16 v47 = 2114;
        v48 = v7;
        __int16 v49 = 2114;
        id v50 = v30;
        _os_log_error_impl(&dword_220CA3000, v40, OS_LOG_TYPE_ERROR, "[%{public}@ %{public}@] -> Could not establish eligibility for ECG2 countryCode: %{public}@, Error: %{public}@", buf, 0x2Au);
      }
      -[HRElectrocardiogramCurrentLocationOnboardingDeterminer _submitOnboardingUIErrorEventWithCountryCode:algorithmVersion:onboardingEligibility:](a1[4], v5, &unk_26D2BF300, 0);
      v31 = *(void (**)(void))(a1[5] + 16);
      goto LABEL_23;
    }
    if ([v29 isEligible])
    {
      -[HRElectrocardiogramCurrentLocationOnboardingDeterminer _submitOnboardingUIErrorEventWithCountryCode:algorithmVersion:onboardingEligibility:](a1[4], v5, &unk_26D2BF300, v29);
      v31 = *(void (**)(void))(a1[5] + 16);
LABEL_23:
      v31();
LABEL_34:

LABEL_35:
LABEL_36:

      goto LABEL_37;
    }

    id v33 = v29;
    char v34 = [v33 ineligibilityReasons];
    if ((v34 & 2) == 0 && (v34 & 4) == 0)
    {
      if ((v34 & 8) != 0) {
        goto LABEL_38;
      }
      if ((v34 & 0x10) == 0)
      {
        if ((v34 & 0x20) == 0)
        {
          if ((v34 & 0x40) != 0)
          {
            v36 = (void *)MEMORY[0x263F087E8];
            v35 = @"Feature disabled";
            uint64_t v37 = 111;
            goto LABEL_33;
          }
          if (v34 < 0)
          {
            v35 = @"Feature seed expired";
            v36 = (void *)MEMORY[0x263F087E8];
            uint64_t v37 = 113;
            goto LABEL_33;
          }
          v35 = @"Feature unavailable";
          v36 = (void *)MEMORY[0x263F087E8];
          goto LABEL_39;
        }
LABEL_38:
        v36 = (void *)MEMORY[0x263F087E8];
        v35 = @"Feature unavailable";
LABEL_39:
        uint64_t v37 = 110;
        goto LABEL_33;
      }
    }
    v36 = (void *)MEMORY[0x263F087E8];
    v35 = @"Device not supported";
    uint64_t v37 = 112;
LABEL_33:
    objc_msgSend(v36, "hk_error:description:", v37, v35);
    id v30 = (id)objc_claimAutoreleasedReturnValue();
    -[HRElectrocardiogramCurrentLocationOnboardingDeterminer _submitOnboardingUIErrorEventWithCountryCode:algorithmVersion:onboardingEligibility:](a1[4], v5, &unk_26D2BF300, v33);
    (*(void (**)(void))(a1[5] + 16))();

    goto LABEL_34;
  }
  _HKInitializeLogging();
  v19 = (void *)*MEMORY[0x263F09920];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09920], OS_LOG_TYPE_ERROR)) {
    __133__HRElectrocardiogramCurrentLocationOnboardingDeterminer_isElectrocardiogramOnboardingAvailableInCurrentLocationForWatch_completion___block_invoke_cold_1((uint64_t)a1, v19, (uint64_t)v6);
  }
  -[HRElectrocardiogramCurrentLocationOnboardingDeterminer _submitOnboardingUIErrorEventWithCountryCode:algorithmVersion:onboardingEligibility:](a1[4], 0, (void *)*MEMORY[0x263F091B0], 0);
  (*(void (**)(void))(a1[5] + 16))();
LABEL_37:
}

- (void)_submitOnboardingUIErrorEventWithCountryCode:(void *)a3 algorithmVersion:(void *)a4 onboardingEligibility:
{
  if (a1)
  {
    id v7 = (objc_class *)MEMORY[0x263F468A0];
    id v8 = a4;
    id v9 = a3;
    id v10 = a2;
    id v11 = [v7 alloc];
    uint64_t v12 = *MEMORY[0x263F09740];
    uint64_t v13 = [v9 stringValue];

    objc_super v14 = [v10 ISOCode];

    v15 = (void *)[v11 initWithFeatureIdentifier:v12 featureVersion:v13 countryCode:v14 step:@"Intro" onboardingEligibility:v8];
    v16 = *(void **)(a1 + 24);
    id v20 = 0;
    id v17 = v16;
    LOBYTE(v8) = [v17 submitEvent:v15 error:&v20];
    id v18 = v20;

    if ((v8 & 1) == 0)
    {
      _HKInitializeLogging();
      v19 = (void *)*MEMORY[0x263F09920];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09920], OS_LOG_TYPE_ERROR)) {
        -[HRElectrocardiogramCurrentLocationOnboardingDeterminer _submitOnboardingUIErrorEventWithCountryCode:algorithmVersion:onboardingEligibility:](v19, a1, (uint64_t)v18);
      }
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsEventSubmissionManager, 0);
  objc_storeStrong((id *)&self->_mobileCountryCodeManager, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
}

void __133__HRElectrocardiogramCurrentLocationOnboardingDeterminer_isElectrocardiogramOnboardingAvailableInCurrentLocationForWatch_completion___block_invoke_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(const char **)(a1 + 48);
  id v6 = a2;
  id v7 = NSStringFromSelector(v5);
  int v8 = 138544130;
  uint64_t v9 = v4;
  __int16 v10 = 2114;
  id v11 = v7;
  __int16 v12 = 2114;
  uint64_t v13 = 0;
  __int16 v14 = 2114;
  uint64_t v15 = a3;
  _os_log_error_impl(&dword_220CA3000, v6, OS_LOG_TYPE_ERROR, "[%{public}@ %{public}@] -> Location not found, Country Code: %{public}@, Error: %{public}@", (uint8_t *)&v8, 0x2Au);
}

- (void)_submitOnboardingUIErrorEventWithCountryCode:(void *)a1 algorithmVersion:(uint64_t)a2 onboardingEligibility:(uint64_t)a3 .cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v4 = a1;
  int v6 = 138543618;
  id v7 = (id)objc_opt_class();
  __int16 v8 = 2114;
  uint64_t v9 = a3;
  id v5 = v7;
  _os_log_error_impl(&dword_220CA3000, v4, OS_LOG_TYPE_ERROR, "[%{public}@] Error submitting onboarding errors analytics event: %{public}@", (uint8_t *)&v6, 0x16u);
}

@end