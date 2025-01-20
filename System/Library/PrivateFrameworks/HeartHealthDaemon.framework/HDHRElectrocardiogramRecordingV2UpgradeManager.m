@interface HDHRElectrocardiogramRecordingV2UpgradeManager
- (HDHRElectrocardiogramRecordingV2UpgradeManager)initWithProfile:(id)a3 v1FeatureAvailabilityManager:(id)a4 v2FeatureAvailabilityManager:(id)a5 analyticsSubmissionManager:(id)a6;
- (HDHRElectrocardiogramRecordingV2UpgradeManager)initWithProfile:(id)a3 v1FeatureAvailabilityManager:(id)a4 v2FeatureAvailabilityManager:(id)a5 analyticsSubmissionManager:(id)a6 protectedDataOperation:(id)a7;
- (id)_v1featureSettingsUponBackgroundDelivery;
- (void)_reportAnalyticsEventForCountryCode:(void *)a3 eventType:(void *)a4 errorCategory:(void *)a5 errorDetail:;
- (void)doWorkWithCompletion:(uint64_t)a1;
- (void)pairedDeviceCapabilitiesDidUpdate:(id)a3;
- (void)performWorkForOperation:(id)a3 profile:(id)a4 databaseAccessibilityAssertion:(id)a5 completion:(id)a6;
@end

@implementation HDHRElectrocardiogramRecordingV2UpgradeManager

- (HDHRElectrocardiogramRecordingV2UpgradeManager)initWithProfile:(id)a3 v1FeatureAvailabilityManager:(id)a4 v2FeatureAvailabilityManager:(id)a5 analyticsSubmissionManager:(id)a6
{
  v10 = (objc_class *)MEMORY[0x1E4F65BC0];
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v15 = [v10 alloc];
  v16 = (objc_class *)objc_opt_class();
  v17 = NSStringFromClass(v16);
  v18 = (void *)[v15 initWithProfile:v14 debugIdentifier:v17 delegate:0];

  v19 = [(HDHRElectrocardiogramRecordingV2UpgradeManager *)self initWithProfile:v14 v1FeatureAvailabilityManager:v13 v2FeatureAvailabilityManager:v12 analyticsSubmissionManager:v11 protectedDataOperation:v18];
  return v19;
}

- (HDHRElectrocardiogramRecordingV2UpgradeManager)initWithProfile:(id)a3 v1FeatureAvailabilityManager:(id)a4 v2FeatureAvailabilityManager:(id)a5 analyticsSubmissionManager:(id)a6 protectedDataOperation:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)HDHRElectrocardiogramRecordingV2UpgradeManager;
  v17 = [(HDHRElectrocardiogramRecordingV2UpgradeManager *)&v20 init];
  v18 = v17;
  if (v17)
  {
    objc_storeWeak((id *)&v17->_profile, v12);
    objc_storeStrong((id *)&v18->_protectedDataOperation, a7);
    objc_storeStrong((id *)&v18->_v1FeatureAvailabilityManager, a4);
    objc_storeStrong((id *)&v18->_v2FeatureAvailabilityManager, a5);
    objc_storeStrong((id *)&v18->_analyticsSubmissionManager, a6);
    [(HDProtectedDataOperation *)v18->_protectedDataOperation setDelegate:v18];
    [(HDProtectedDataOperation *)v18->_protectedDataOperation requestWorkWithPriority:2 error:0];
  }

  return v18;
}

- (void)doWorkWithCompletion:(uint64_t)a1
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 32);
    id v54 = 0;
    v5 = [v4 featureOnboardingRecordWithError:&v54];
    id v6 = v54;
    v7 = v6;
    if (v5)
    {
      if ([v5 isOnboardingPresent])
      {
        _HKInitializeLogging();
        v8 = (void *)*MEMORY[0x1E4F29F50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_DEFAULT))
        {
          v9 = v8;
          v10 = objc_opt_class();
          *(_DWORD *)buf = 138543362;
          v56 = v10;
          id v11 = v10;
          _os_log_impl(&dword_1D3AC6000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Already onboarded to ECG2", buf, 0xCu);
        }
        -[HDHRElectrocardiogramRecordingV2UpgradeManager _reportAnalyticsEventForCountryCode:eventType:errorCategory:errorDetail:](a1, 0, (void *)*MEMORY[0x1E4F659A8], @"v2_eligibility", @"already_onboarded");
        v3[2](v3, 1, 0);
      }
      else
      {
        id v16 = *(void **)(a1 + 24);
        id v53 = v7;
        v17 = [v16 featureOnboardingRecordWithError:&v53];
        id v18 = v53;

        if (v17)
        {
          if ([v17 isOnboardingPresent])
          {
            v19 = [v17 onboardingCompletion];
            objc_super v20 = [v19 countryCode];

            if (v20)
            {
              v21 = *(void **)(a1 + 32);
              id v52 = v18;
              v22 = [v21 onboardingEligibilityForCountryCode:v20 error:&v52];
              id v23 = v52;

              if (v22)
              {
                char v24 = [v22 isEligible];
                _HKInitializeLogging();
                v25 = (void *)*MEMORY[0x1E4F29F50];
                BOOL v26 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_DEFAULT);
                if (v24)
                {
                  if (v26)
                  {
                    v27 = v25;
                    v28 = objc_opt_class();
                    *(_DWORD *)buf = 138543618;
                    v56 = v28;
                    __int16 v57 = 2114;
                    v58 = v20;
                    id v29 = v28;
                    _os_log_impl(&dword_1D3AC6000, v27, OS_LOG_TYPE_DEFAULT, "[%{public}@] Beginning ECG2 upgrade in country: %{public}@", buf, 0x16u);
                  }
                  v30 = *(void **)(a1 + 32);
                  v31 = -[HDHRElectrocardiogramRecordingV2UpgradeManager _v1featureSettingsUponBackgroundDelivery](a1);
                  v49[0] = MEMORY[0x1E4F143A8];
                  v49[1] = 3221225472;
                  v49[2] = __71__HDHRElectrocardiogramRecordingV2UpgradeManager_doWorkWithCompletion___block_invoke;
                  v49[3] = &unk_1E69B4358;
                  v49[4] = a1;
                  id v50 = v20;
                  v51 = v3;
                  [v30 setCurrentOnboardingVersionCompletedForCountryCode:v50 countryCodeProvenance:3 date:0 settings:v31 completion:v49];
                }
                else
                {
                  if (v26)
                  {
                    v44 = v25;
                    v45 = objc_opt_class();
                    id v48 = v45;
                    v46 = [v22 ineligibilityReasonsDescription];
                    *(_DWORD *)buf = 138543874;
                    v56 = v45;
                    __int16 v57 = 2114;
                    v58 = v20;
                    __int16 v59 = 2114;
                    v60 = v46;
                    _os_log_impl(&dword_1D3AC6000, v44, OS_LOG_TYPE_DEFAULT, "[%{public}@] Cannot upgrade to ECG2 in ECG1 country: %{public}@: %{public}@", buf, 0x20u);
                  }
                  v47 = [v22 ineligibilityReasonsDescription];
                  -[HDHRElectrocardiogramRecordingV2UpgradeManager _reportAnalyticsEventForCountryCode:eventType:errorCategory:errorDetail:](a1, v20, (void *)*MEMORY[0x1E4F659A8], @"eligibility", v47);

                  v3[2](v3, 0, 0);
                }
              }
              else
              {
                v40 = NSString;
                v41 = [v23 domain];
                v42 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v23, "code"));
                v43 = [v40 stringWithFormat:@"%@_%@", v41, v42];
                -[HDHRElectrocardiogramRecordingV2UpgradeManager _reportAnalyticsEventForCountryCode:eventType:errorCategory:errorDetail:](a1, v20, (void *)*MEMORY[0x1E4F659A8], @"eligibility", v43);

                ((void (**)(id, uint64_t, id))v3)[2](v3, 0, v23);
              }
            }
            else
            {
              -[HDHRElectrocardiogramRecordingV2UpgradeManager _reportAnalyticsEventForCountryCode:eventType:errorCategory:errorDetail:](a1, 0, (void *)*MEMORY[0x1E4F659A8], @"eligibility", @"location_unavailable");
              v22 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 109, @"Cannot upgrade V1 user to V2 as no country code exists");
              ((void (**)(id, uint64_t, void *))v3)[2](v3, 1, v22);
              id v23 = v18;
            }

            id v18 = v23;
          }
          else
          {
            _HKInitializeLogging();
            v36 = (void *)*MEMORY[0x1E4F29F50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_DEFAULT))
            {
              v37 = v36;
              v38 = objc_opt_class();
              *(_DWORD *)buf = 138543362;
              v56 = v38;
              id v39 = v38;
              _os_log_impl(&dword_1D3AC6000, v37, OS_LOG_TYPE_DEFAULT, "[%{public}@] Cannot upgrade to ECG2 as not onboarded to ECG1", buf, 0xCu);
            }
            -[HDHRElectrocardiogramRecordingV2UpgradeManager _reportAnalyticsEventForCountryCode:eventType:errorCategory:errorDetail:](a1, 0, (void *)*MEMORY[0x1E4F659A8], @"v1_eligibility", @"not_onboarded");
            v3[2](v3, 1, 0);
          }
        }
        else
        {
          v32 = NSString;
          v33 = [v18 domain];
          v34 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v18, "code"));
          v35 = [v32 stringWithFormat:@"%@_%@", v33, v34];
          -[HDHRElectrocardiogramRecordingV2UpgradeManager _reportAnalyticsEventForCountryCode:eventType:errorCategory:errorDetail:](a1, 0, (void *)*MEMORY[0x1E4F659A8], @"v1_eligibility", v35);

          ((void (**)(id, uint64_t, id))v3)[2](v3, 0, v18);
        }

        v7 = v18;
      }
    }
    else
    {
      id v12 = NSString;
      id v13 = [v6 domain];
      id v14 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "code"));
      id v15 = [v12 stringWithFormat:@"%@_%@", v13, v14];
      -[HDHRElectrocardiogramRecordingV2UpgradeManager _reportAnalyticsEventForCountryCode:eventType:errorCategory:errorDetail:](a1, 0, (void *)*MEMORY[0x1E4F659A8], @"v2_eligibility", v15);

      ((void (**)(id, uint64_t, void *))v3)[2](v3, 0, v7);
    }
  }
}

- (id)_v1featureSettingsUponBackgroundDelivery
{
  v7[2] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v1 = objc_alloc(MEMORY[0x1E4F2B058]);
    uint64_t v2 = *MEMORY[0x1E4F29AD0];
    v6[0] = *MEMORY[0x1E4F29AD8];
    v6[1] = v2;
    v7[0] = MEMORY[0x1E4F1CC38];
    v7[1] = MEMORY[0x1E4F1CC28];
    v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];
    v4 = (void *)[v1 initWithDictionary:v3];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

void __71__HDHRElectrocardiogramRecordingV2UpgradeManager_doWorkWithCompletion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    if (v6) {
      -[HDHRElectrocardiogramRecordingV2UpgradeManager _reportAnalyticsEventForCountryCode:eventType:errorCategory:errorDetail:](v6, *(void **)(a1 + 40), (void *)*MEMORY[0x1E4F659A0], 0, 0);
    }
  }
  else
  {
    _HKInitializeLogging();
    v7 = (void *)*MEMORY[0x1E4F29F50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_ERROR)) {
      __71__HDHRElectrocardiogramRecordingV2UpgradeManager_doWorkWithCompletion___block_invoke_cold_1(a1, v7);
    }
    uint64_t v8 = *(void *)(a1 + 32);
    v9 = *(void **)(a1 + 40);
    v10 = NSString;
    id v11 = [v5 domain];
    id v12 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "code"));
    id v13 = [v10 stringWithFormat:@"%@_%@", v11, v12];
    if (v8) {
      -[HDHRElectrocardiogramRecordingV2UpgradeManager _reportAnalyticsEventForCountryCode:eventType:errorCategory:errorDetail:](v8, v9, (void *)*MEMORY[0x1E4F659A8], @"save", v13);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)performWorkForOperation:(id)a3 profile:(id)a4 databaseAccessibilityAssertion:(id)a5 completion:(id)a6
{
  id v7 = a6;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __124__HDHRElectrocardiogramRecordingV2UpgradeManager_performWorkForOperation_profile_databaseAccessibilityAssertion_completion___block_invoke;
  v9[3] = &unk_1E69B4190;
  v9[4] = self;
  id v10 = v7;
  id v8 = v7;
  -[HDHRElectrocardiogramRecordingV2UpgradeManager doWorkWithCompletion:]((uint64_t)self, v9);
}

uint64_t __124__HDHRElectrocardiogramRecordingV2UpgradeManager_performWorkForOperation_profile_databaseAccessibilityAssertion_completion___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  id v5 = [WeakRetained daemon];
  uint64_t v6 = [v5 nanoRegistryDeviceCapabilityProvider];
  id v7 = v6;
  uint64_t v8 = *(void *)(a1 + 32);
  if (a2) {
    [v6 unregisterObserver:v8];
  }
  else {
    [v6 registerObserver:v8 queue:0];
  }

  v9 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v9();
}

- (void)pairedDeviceCapabilitiesDidUpdate:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  protectedDataOperation = self->_protectedDataOperation;
  id v10 = 0;
  int v4 = [(HDProtectedDataOperation *)protectedDataOperation requestWorkWithPriority:2 error:&v10];
  id v5 = v10;
  _HKInitializeLogging();
  uint64_t v6 = HKLogInfrastructure();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = objc_opt_class();
    if (v4) {
      id v8 = 0;
    }
    else {
      id v8 = v5;
    }
    *(_DWORD *)buf = 138543618;
    id v12 = v7;
    __int16 v13 = 2114;
    id v14 = v8;
    id v9 = v7;
    _os_log_impl(&dword_1D3AC6000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Requested a chance to upgrade due to nano pairing changes (error: %{public}@)", buf, 0x16u);
  }
}

- (void)_reportAnalyticsEventForCountryCode:(void *)a3 eventType:(void *)a4 errorCategory:(void *)a5 errorDetail:
{
  if (a1)
  {
    id v9 = (objc_class *)MEMORY[0x1E4F65A88];
    id v10 = a5;
    id v11 = a4;
    id v12 = a3;
    id v13 = a2;
    id v14 = [v9 alloc];
    if (v13) {
      uint64_t v15 = 3;
    }
    else {
      uint64_t v15 = 0;
    }
    id v16 = (void *)[v14 initWithFeatureIdentifier:*MEMORY[0x1E4F29D30] eventType:v12 countryCode:v13 countryCodeProvenance:v15 errorCategory:v11 errorDetail:v10];

    v17 = *(void **)(a1 + 40);
    id v21 = 0;
    char v18 = [v17 submitEvent:v16 error:&v21];
    id v19 = v21;
    if ((v18 & 1) == 0)
    {
      _HKInitializeLogging();
      objc_super v20 = (void *)*MEMORY[0x1E4F29F50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_ERROR)) {
        -[HDHRElectrocardiogramRecordingV2UpgradeManager _reportAnalyticsEventForCountryCode:eventType:errorCategory:errorDetail:](v20);
      }
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsSubmissionManager, 0);
  objc_storeStrong((id *)&self->_v2FeatureAvailabilityManager, 0);
  objc_storeStrong((id *)&self->_v1FeatureAvailabilityManager, 0);
  objc_storeStrong((id *)&self->_protectedDataOperation, 0);

  objc_destroyWeak((id *)&self->_profile);
}

void __71__HDHRElectrocardiogramRecordingV2UpgradeManager_doWorkWithCompletion___block_invoke_cold_1(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = objc_opt_class();
  id v4 = OUTLINED_FUNCTION_0_0(v3);
  OUTLINED_FUNCTION_1_0(&dword_1D3AC6000, v5, v6, "[%{public}@] Error saving ECGV2 Upgrade: %{public}@", v7, v8, v9, v10, v11);
}

- (void)_reportAnalyticsEventForCountryCode:(void *)a1 eventType:errorCategory:errorDetail:.cold.1(void *a1)
{
  id v1 = a1;
  id v2 = objc_opt_class();
  id v3 = OUTLINED_FUNCTION_0_0(v2);
  OUTLINED_FUNCTION_1_0(&dword_1D3AC6000, v4, v5, "[%{public}@] Failed to submit analytics event: %{public}@", v6, v7, v8, v9, v10);
}

@end