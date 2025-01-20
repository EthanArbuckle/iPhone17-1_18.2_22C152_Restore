@interface HKMCOnboardingManager
- (BOOL)_resetOnboardingCharacteristicsWithError:(id *)a3;
- (BOOL)_resetOnboardingKeyValueDomainWithError:(id *)a3;
- (BOOL)_setLegacyOnboardingCompletedVersion:(int64_t)a3 error:(id *)a4;
- (BOOL)isAnyOnboardingVersionCompleted;
- (HKFeatureAvailabilityStore)deviationsFeatureAvailabilityStore;
- (HKFeatureAvailabilityStore)featureAvailabilityStore;
- (HKFeatureAvailabilityStore)heartRateInputFeatureAvailabilityStore;
- (HKFeatureAvailabilityStore)wristTemperatureInputFeatureAvailabilityStore;
- (HKMCOnboardingManager)initWithHealthStore:(id)a3;
- (HKMCOnboardingManager)initWithHealthStore:(id)a3 queue:(id)a4;
- (HKQuantity)userEnteredCycleLength;
- (HKQuantity)userEnteredPeriodLength;
- (id)_featureAvailabilityStoreForFeatureWithIdentifier:(id)a3;
- (id)_onboardingRecordForFeatureWithIdentifier:(id)a3 error:(id *)a4;
- (id)onboardingRecordWithError:(id *)a3;
- (void)_saveUserEnteredCycleLength:(id)a3 userEnteredPeriodLength:(id)a4 userEnteredLastPeriodStartDay:(id)a5 addedCycleFactors:(id)a6 deletedCycleFactors:(id)a7 completion:(id)a8;
- (void)_setCurrentOnboardingVersionCompletedWithInfo:(id)a3 completion:(id)a4;
- (void)_triggerHealthKitSync;
- (void)addObserver:(id)a3 queue:(id)a4;
- (void)featureAvailabilityProvidingDidUpdateOnboardingCompletion:(id)a3;
- (void)featureAvailabilityProvidingDidUpdateSettings:(id)a3;
- (void)isAnyOnboardingVersionCompletedWithCompletion:(id)a3;
- (void)removeObserver:(id)a3;
- (void)resetOnboarding:(id)a3;
- (void)setOnboardingCompletedWithInfo:(id)a3 completion:(id)a4;
- (void)userEnteredCycleLength;
- (void)userEnteredPeriodLength;
@end

@implementation HKMCOnboardingManager

- (void)isAnyOnboardingVersionCompletedWithCompletion:(id)a3
{
  id v4 = a3;
  featureAvailabilityStore = self->_featureAvailabilityStore;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __71__HKMCOnboardingManager_isAnyOnboardingVersionCompletedWithCompletion___block_invoke;
  v7[3] = &unk_2646E9D60;
  id v8 = v4;
  id v6 = v4;
  [(HKFeatureAvailabilityStore *)featureAvailabilityStore getFeatureOnboardingRecordWithCompletion:v7];
}

- (HKMCOnboardingManager)initWithHealthStore:(id)a3 queue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v35.receiver = self;
  v35.super_class = (Class)HKMCOnboardingManager;
  v9 = [(HKMCOnboardingManager *)&v35 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_healthStore, a3);
    id v11 = objc_alloc(MEMORY[0x263F0A5A8]);
    uint64_t v12 = [v11 initWithName:@"HKMCOnboardingManagerObserver" loggingCategory:*MEMORY[0x263F09930]];
    observers = v10->_observers;
    v10->_observers = (HKObserverSet *)v12;

    v14 = [[HKMenstrualCyclesStore alloc] initWithHealthStore:v10->_healthStore];
    menstrualCyclesStore = v10->_menstrualCyclesStore;
    v10->_menstrualCyclesStore = v14;

    if (v8)
    {
      v16 = (OS_dispatch_queue *)v8;
      observerQueue = v10->_observerQueue;
      v10->_observerQueue = v16;
    }
    else
    {
      v18 = (OS_dispatch_queue *)MEMORY[0x263EF83A0];
      id v19 = MEMORY[0x263EF83A0];
      observerQueue = v10->_observerQueue;
      v10->_observerQueue = v18;
    }

    id v20 = objc_alloc(MEMORY[0x263F0A3B8]);
    uint64_t v21 = [v20 initWithFeatureIdentifier:*MEMORY[0x263F09798] healthStore:v10->_healthStore];
    featureAvailabilityStore = v10->_featureAvailabilityStore;
    v10->_featureAvailabilityStore = (HKFeatureAvailabilityStore *)v21;

    [(HKFeatureAvailabilityStore *)v10->_featureAvailabilityStore registerObserver:v10 queue:v10->_observerQueue];
    id v23 = objc_alloc(MEMORY[0x263F0A3B8]);
    uint64_t v24 = [v23 initWithFeatureIdentifier:*MEMORY[0x263F097A8] healthStore:v10->_healthStore];
    heartRateInputFeatureAvailabilityStore = v10->_heartRateInputFeatureAvailabilityStore;
    v10->_heartRateInputFeatureAvailabilityStore = (HKFeatureAvailabilityStore *)v24;

    [(HKFeatureAvailabilityStore *)v10->_heartRateInputFeatureAvailabilityStore registerObserver:v10 queue:v10->_observerQueue];
    id v26 = objc_alloc(MEMORY[0x263F0A3B8]);
    uint64_t v27 = [v26 initWithFeatureIdentifier:*MEMORY[0x263F097A0] healthStore:v10->_healthStore];
    deviationsFeatureAvailabilityStore = v10->_deviationsFeatureAvailabilityStore;
    v10->_deviationsFeatureAvailabilityStore = (HKFeatureAvailabilityStore *)v27;

    [(HKFeatureAvailabilityStore *)v10->_deviationsFeatureAvailabilityStore registerObserver:v10 queue:v10->_observerQueue];
    id v29 = objc_alloc(MEMORY[0x263F0A3B8]);
    uint64_t v30 = [v29 initWithFeatureIdentifier:*MEMORY[0x263F097B0] healthStore:v10->_healthStore];
    wristTemperatureInputFeatureAvailabilityStore = v10->_wristTemperatureInputFeatureAvailabilityStore;
    v10->_wristTemperatureInputFeatureAvailabilityStore = (HKFeatureAvailabilityStore *)v30;

    [(HKFeatureAvailabilityStore *)v10->_wristTemperatureInputFeatureAvailabilityStore registerObserver:v10 queue:v10->_observerQueue];
    uint64_t v32 = [objc_alloc(MEMORY[0x263F0A470]) initWithCategory:0 domainName:@"com.apple.private.health.menstrual-cycles" healthStore:v7];
    legacyOnboardingKeyValueDomain = v10->_legacyOnboardingKeyValueDomain;
    v10->_legacyOnboardingKeyValueDomain = (HKKeyValueDomain *)v32;
  }
  return v10;
}

- (void)addObserver:(id)a3 queue:(id)a4
{
}

void __71__HKMCOnboardingManager_isAnyOnboardingVersionCompletedWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2)
  {
    objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(a2, "onboardingState") == 2);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, void))(v2 + 16))(v2, v5, 0);
  }
  else
  {
    v3 = *(void (**)(uint64_t))(v2 + 16);
    uint64_t v4 = *(void *)(a1 + 32);
    v3(v4);
  }
}

- (HKMCOnboardingManager)initWithHealthStore:(id)a3
{
  return [(HKMCOnboardingManager *)self initWithHealthStore:a3 queue:0];
}

- (id)_featureAvailabilityStoreForFeatureWithIdentifier:(id)a3
{
  v14[4] = *MEMORY[0x263EF8340];
  id v4 = a3;
  deviationsFeatureAvailabilityStore = self->_deviationsFeatureAvailabilityStore;
  heartRateInputFeatureAvailabilityStore = self->_heartRateInputFeatureAvailabilityStore;
  wristTemperatureInputFeatureAvailabilityStore = self->_wristTemperatureInputFeatureAvailabilityStore;
  v14[0] = self->_featureAvailabilityStore;
  v14[1] = heartRateInputFeatureAvailabilityStore;
  v14[2] = deviationsFeatureAvailabilityStore;
  v14[3] = wristTemperatureInputFeatureAvailabilityStore;
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:4];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __75__HKMCOnboardingManager__featureAvailabilityStoreForFeatureWithIdentifier___block_invoke;
  v12[3] = &unk_2646E9D38;
  id v13 = v4;
  id v9 = v4;
  v10 = objc_msgSend(v8, "hk_firstObjectPassingTest:", v12);

  return v10;
}

uint64_t __75__HKMCOnboardingManager__featureAvailabilityStoreForFeatureWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 featureIdentifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (void)removeObserver:(id)a3
{
}

- (BOOL)isAnyOnboardingVersionCompleted
{
  uint64_t v2 = [(HKMCOnboardingManager *)self onboardingRecordWithError:0];
  char v3 = [v2 isOnboardingPresent];

  return v3;
}

- (id)onboardingRecordWithError:(id *)a3
{
  return [(HKMCOnboardingManager *)self _onboardingRecordForFeatureWithIdentifier:*MEMORY[0x263F09798] error:a3];
}

- (id)_onboardingRecordForFeatureWithIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(HKMCOnboardingManager *)self _featureAvailabilityStoreForFeatureWithIdentifier:v6];
  id v8 = v7;
  if (v7)
  {
    id v14 = 0;
    id v9 = [v7 featureOnboardingRecordWithError:&v14];
    id v10 = v14;
    id v11 = v10;
    if (!v9)
    {
      id v12 = v10;
      if (v12)
      {
        if (a4) {
          *a4 = v12;
        }
        else {
          _HKLogDroppedError();
        }
      }

      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR)) {
        -[HKMCOnboardingManager _onboardingRecordForFeatureWithIdentifier:error:]();
      }
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:format:", a4, 110, @"%@ is not a supported feature", v6);
    id v9 = 0;
  }

  return v9;
}

- (HKQuantity)userEnteredCycleLength
{
  healthStore = self->_healthStore;
  id v8 = 0;
  char v3 = [(HKHealthStore *)healthStore _userEnteredMenstrualCycleLengthCharacteristicQuantityWithError:&v8];
  id v4 = v8;
  id v5 = v4;
  if (v3) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4 == 0;
  }
  if (!v6)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR)) {
      -[HKMCOnboardingManager userEnteredCycleLength]();
    }
  }

  return (HKQuantity *)v3;
}

- (HKQuantity)userEnteredPeriodLength
{
  healthStore = self->_healthStore;
  id v8 = 0;
  char v3 = [(HKHealthStore *)healthStore _userEnteredMenstrualPeriodLengthCharacteristicQuantityWithError:&v8];
  id v4 = v8;
  id v5 = v4;
  if (v3) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4 == 0;
  }
  if (!v6)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR)) {
      -[HKMCOnboardingManager userEnteredPeriodLength]();
    }
  }

  return (HKQuantity *)v3;
}

- (BOOL)_setLegacyOnboardingCompletedVersion:(int64_t)a3 error:(id *)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  BOOL v6 = (os_log_t *)MEMORY[0x263F09930];
  id v7 = (void *)*MEMORY[0x263F09930];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v7;
    id v9 = objc_opt_class();
    id v10 = NSNumber;
    id v11 = v9;
    id v12 = [v10 numberWithInteger:a3];
    *(_DWORD *)buf = 138543618;
    v28 = v9;
    __int16 v29 = 2114;
    uint64_t v30 = v12;
    _os_log_impl(&dword_2249E9000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Setting onboarding version %{public}@ and completion date in key value store", buf, 0x16u);
  }
  legacyOnboardingKeyValueDomain = self->_legacyOnboardingKeyValueDomain;
  id v14 = [NSNumber numberWithInteger:a3];
  id v26 = 0;
  LOBYTE(legacyOnboardingKeyValueDomain) = [(HKKeyValueDomain *)legacyOnboardingKeyValueDomain setNumber:v14 forKey:@"OnboardingCompleted" error:&v26];
  id v15 = v26;

  if (legacyOnboardingKeyValueDomain)
  {
    v16 = self->_legacyOnboardingKeyValueDomain;
    id v25 = v15;
    v17 = [(HKKeyValueDomain *)v16 dateForKey:@"OnboardingFirstCompletedDate" error:&v25];
    id v18 = v25;

    if (v17)
    {
      BOOL v19 = 1;
LABEL_13:
      id v15 = v18;
      goto LABEL_14;
    }
    if (v18)
    {
      _HKInitializeLogging();
      if (os_log_type_enabled(*v6, OS_LOG_TYPE_ERROR)) {
        -[HKMCOnboardingManager _setLegacyOnboardingCompletedVersion:error:]();
      }
      BOOL v19 = 0;
      goto LABEL_13;
    }
    uint64_t v21 = self->_legacyOnboardingKeyValueDomain;
    v22 = [MEMORY[0x263EFF910] date];
    id v24 = 0;
    char v23 = [(HKKeyValueDomain *)v21 setDate:v22 forKey:@"OnboardingFirstCompletedDate" error:&v24];
    id v15 = v24;

    if (v23)
    {
      BOOL v19 = 1;
      goto LABEL_14;
    }
    _HKInitializeLogging();
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_ERROR)) {
      -[HKMCOnboardingManager _setLegacyOnboardingCompletedVersion:error:]();
    }
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_ERROR)) {
      -[HKMCOnboardingManager _setLegacyOnboardingCompletedVersion:error:]();
    }
  }
  BOOL v19 = 0;
LABEL_14:

  return v19;
}

- (void)_saveUserEnteredCycleLength:(id)a3 userEnteredPeriodLength:(id)a4 userEnteredLastPeriodStartDay:(id)a5 addedCycleFactors:(id)a6 deletedCycleFactors:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  v36[2] = __156__HKMCOnboardingManager__saveUserEnteredCycleLength_userEnteredPeriodLength_userEnteredLastPeriodStartDay_addedCycleFactors_deletedCycleFactors_completion___block_invoke;
  v36[3] = &unk_2646E9D88;
  id v20 = v19;
  id v37 = v20;
  uint64_t v21 = (void (**)(void, void, void))MEMORY[0x22A61C290](v36);
  if (v14)
  {
    healthStore = self->_healthStore;
    id v35 = 0;
    char v23 = [(HKHealthStore *)healthStore _setUserEnteredMenstrualCycleLengthCharacteristicQuantity:v14 error:&v35];
    id v24 = v35;
    id v25 = v24;
    if ((v23 & 1) == 0)
    {
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR)) {
        -[HKMCOnboardingManager _saveUserEnteredCycleLength:userEnteredPeriodLength:userEnteredLastPeriodStartDay:addedCycleFactors:deletedCycleFactors:completion:]();
      }
      goto LABEL_12;
    }
  }
  if (v15)
  {
    id v26 = self->_healthStore;
    id v34 = 0;
    char v27 = [(HKHealthStore *)v26 _setUserEnteredMenstrualPeriodLengthCharacteristicQuantity:v15 error:&v34];
    id v28 = v34;
    id v25 = v28;
    if (v27)
    {

      goto LABEL_7;
    }
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR)) {
      -[HKMCOnboardingManager _saveUserEnteredCycleLength:userEnteredPeriodLength:userEnteredLastPeriodStartDay:addedCycleFactors:deletedCycleFactors:completion:]();
    }
LABEL_12:
    ((void (**)(void, void, void *))v21)[2](v21, 0, v25);

    goto LABEL_13;
  }
LABEL_7:
  __int16 v29 = self->_healthStore;
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __156__HKMCOnboardingManager__saveUserEnteredCycleLength_userEnteredPeriodLength_userEnteredLastPeriodStartDay_addedCycleFactors_deletedCycleFactors_completion___block_invoke_371;
  v30[3] = &unk_2646E9DB0;
  v30[4] = self;
  v33 = v21;
  id v31 = v16;
  id v32 = v15;
  [(HKHealthStore *)v29 saveObjects:v17 deleteObjects:v18 associations:0 completion:v30];

LABEL_13:
}

uint64_t __156__HKMCOnboardingManager__saveUserEnteredCycleLength_userEnteredPeriodLength_userEnteredLastPeriodStartDay_addedCycleFactors_deletedCycleFactors_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __156__HKMCOnboardingManager__saveUserEnteredCycleLength_userEnteredPeriodLength_userEnteredLastPeriodStartDay_addedCycleFactors_deletedCycleFactors_completion___block_invoke_371(void *a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    id v11 = (void *)*MEMORY[0x263F09930];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR)) {
      __156__HKMCOnboardingManager__saveUserEnteredCycleLength_userEnteredPeriodLength_userEnteredLastPeriodStartDay_addedCycleFactors_deletedCycleFactors_completion___block_invoke_371_cold_1((uint64_t)a1, v11);
    }
    id v12 = *(void (**)(void))(a1[7] + 16);
    goto LABEL_9;
  }
  BOOL v6 = (void *)a1[5];
  if (!v6)
  {
    id v12 = *(void (**)(void))(a1[7] + 16);
LABEL_9:
    v12();
    goto LABEL_12;
  }
  id v7 = (void *)a1[6];
  if (v7)
  {
    id v8 = [MEMORY[0x263F0A830] dayUnit];
    [v7 doubleValueForUnit:v8];
    uint64_t v10 = (uint64_t)v9;

    BOOL v6 = (void *)a1[5];
  }
  else
  {
    uint64_t v10 = 1;
  }
  uint64_t v13 = [v6 integerValue];
  uint64_t v14 = a1[4];
  id v15 = *(void **)(v14 + 24);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __156__HKMCOnboardingManager__saveUserEnteredCycleLength_userEnteredPeriodLength_userEnteredLastPeriodStartDay_addedCycleFactors_deletedCycleFactors_completion___block_invoke_373;
  v17[3] = &unk_2646E92C8;
  uint64_t v16 = a1[7];
  v17[4] = v14;
  v17[5] = v16;
  objc_msgSend(v15, "saveLastMenstrualPeriodWithDayIndexRange:completion:", v13, v10, v17);
LABEL_12:
}

void __156__HKMCOnboardingManager__saveUserEnteredCycleLength_userEnteredPeriodLength_userEnteredLastPeriodStartDay_addedCycleFactors_deletedCycleFactors_completion___block_invoke_373(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    BOOL v6 = (void *)*MEMORY[0x263F09930];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR)) {
      __156__HKMCOnboardingManager__saveUserEnteredCycleLength_userEnteredPeriodLength_userEnteredLastPeriodStartDay_addedCycleFactors_deletedCycleFactors_completion___block_invoke_373_cold_1(a1, v6);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_setCurrentOnboardingVersionCompletedWithInfo:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v18 = 0;
  BOOL v8 = [(HKMCOnboardingManager *)self _setLegacyOnboardingCompletedVersion:2 error:&v18];
  id v9 = v18;
  if (v8)
  {
    id v10 = objc_alloc(MEMORY[0x263F0A5B0]);
    uint64_t v11 = *MEMORY[0x263F09798];
    id v12 = [MEMORY[0x263EFF910] date];
    uint64_t v13 = (void *)[v10 initWithFeatureIdentifier:v11 version:2 completionDate:v12 countryCode:0 countryCodeProvenance:0];

    uint64_t v14 = objc_msgSend(objc_alloc(MEMORY[0x263F0A3C0]), "initWithMenstruationProjectionsEnabled:fertileWindowProjectionsEnabled:areFertilityTrackingDisplayTypesVisible:isSexualActivityDisplayTypeVisible:", objc_msgSend(v6, "menstruationProjectionsEnabled"), objc_msgSend(v6, "fertileWindowProjectionsEnabled"), objc_msgSend(v6, "fertilityTrackingDisplayTypesVisible"), objc_msgSend(v6, "sexualActivityDisplayTypeVisible"));
    featureAvailabilityStore = self->_featureAvailabilityStore;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __82__HKMCOnboardingManager__setCurrentOnboardingVersionCompletedWithInfo_completion___block_invoke;
    v16[3] = &unk_2646E92C8;
    v16[4] = self;
    id v17 = v7;
    [(HKFeatureAvailabilityStore *)featureAvailabilityStore saveOnboardingCompletion:v13 settings:v14 completion:v16];
  }
  else
  {
    (*((void (**)(id, void, id))v7 + 2))(v7, 0, v9);
  }
}

void __82__HKMCOnboardingManager__setCurrentOnboardingVersionCompletedWithInfo_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a3;
  _HKInitializeLogging();
  id v6 = (void *)*MEMORY[0x263F09930];
  id v7 = *MEMORY[0x263F09930];
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v8 = v6;
      int v10 = 138543362;
      id v11 = (id)objc_opt_class();
      id v9 = v11;
      _os_log_impl(&dword_2249E9000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set current onboarding version completed in the feature availability store", (uint8_t *)&v10, 0xCu);
    }
    (*(void (**)(void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 1);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __82__HKMCOnboardingManager__setCurrentOnboardingVersionCompletedWithInfo_completion___block_invoke_cold_1(a1, v6);
    }
    (*(void (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0);
  }
}

- (void)setOnboardingCompletedWithInfo:(id)a3 completion:(id)a4
{
  uint64_t v81 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  _HKInitializeLogging();
  BOOL v8 = (void *)*MEMORY[0x263F09930];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
  {
    log = v8;
    id v58 = v7;
    id v9 = self;
    int v10 = objc_opt_class();
    id v11 = NSNumber;
    id v57 = v10;
    uint64_t v12 = [v11 numberWithInteger:2];
    uint64_t v13 = [v6 userEnteredCycleLength];
    v55 = HKSensitiveLogItem();
    uint64_t v14 = [v6 userEnteredPeriodLength];
    id v15 = HKSensitiveLogItem();
    uint64_t v16 = [v6 userEnteredLastPeriodStartDay];
    id v17 = HKSensitiveLogItem();
    *(_DWORD *)buf = 138544386;
    v72 = v10;
    self = v9;
    id v7 = v58;
    __int16 v73 = 2114;
    v74 = v12;
    __int16 v75 = 2112;
    v76 = v55;
    __int16 v77 = 2112;
    v78 = v15;
    __int16 v79 = 2112;
    v80 = v17;
    _os_log_impl(&dword_2249E9000, log, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set onboarding completed (version: %{public}@), cycle length: %@, period length: %@, last period start: %@", buf, 0x34u);
  }
  v67[0] = MEMORY[0x263EF8330];
  v67[1] = 3221225472;
  v67[2] = __67__HKMCOnboardingManager_setOnboardingCompletedWithInfo_completion___block_invoke;
  v67[3] = &unk_2646E9DD8;
  v67[4] = self;
  id v18 = v7;
  id v69 = v18;
  id v19 = v6;
  id v68 = v19;
  [(HKMCOnboardingManager *)self _setCurrentOnboardingVersionCompletedWithInfo:v19 completion:v67];
  id v20 = [v19 heartRateInputSupportedCountryCode];

  uint64_t v21 = (void *)MEMORY[0x263F09820];
  if (v20)
  {
    id v22 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    char v23 = [v19 heartRateInputEnabled];
    [v22 setObject:v23 forKeyedSubscript:*v21];

    id v24 = (void *)[objc_alloc(MEMORY[0x263F0A3C0]) initWithDictionary:v22];
    heartRateInputFeatureAvailabilityStore = self->_heartRateInputFeatureAvailabilityStore;
    id v26 = [v19 heartRateInputSupportedCountryCode];
    char v27 = [v26 ISOCode];
    id v28 = [v19 heartRateInputSupportedCountryCode];
    uint64_t v29 = [v28 provenance];
    v66[0] = MEMORY[0x263EF8330];
    v66[1] = 3221225472;
    v66[2] = __67__HKMCOnboardingManager_setOnboardingCompletedWithInfo_completion___block_invoke_3;
    v66[3] = &unk_2646E9E00;
    v66[4] = self;
    [(HKFeatureAvailabilityStore *)heartRateInputFeatureAvailabilityStore setCurrentOnboardingVersionCompletedForCountryCode:v27 countryCodeProvenance:v29 date:0 settings:v24 completion:v66];

    uint64_t v21 = (void *)MEMORY[0x263F09820];
  }
  uint64_t v30 = [v19 deviationDetectionSupportedCountryCode];

  if (v30)
  {
    id v59 = v18;
    id v31 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    id v32 = HKMCAllDeviationTypes();
    uint64_t v33 = [v32 countByEnumeratingWithState:&v62 objects:v70 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v63;
      do
      {
        for (uint64_t i = 0; i != v34; ++i)
        {
          if (*(void *)v63 != v35) {
            objc_enumerationMutation(v32);
          }
          id v37 = *(void **)(*((void *)&v62 + 1) + 8 * i);
          v38 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v19, "deviationDetectionEnabled"));
          v39 = HKFeatureSettingsKeyForDeviationDetectionTypeEnabled([v37 integerValue]);
          [v31 setObject:v38 forKeyedSubscript:v39];
        }
        uint64_t v34 = [v32 countByEnumeratingWithState:&v62 objects:v70 count:16];
      }
      while (v34);
    }

    v40 = (void *)[objc_alloc(MEMORY[0x263F0A3C0]) initWithDictionary:v31];
    deviationsFeatureAvailabilityStore = self->_deviationsFeatureAvailabilityStore;
    v42 = [v19 deviationDetectionSupportedCountryCode];
    v43 = [v42 ISOCode];
    v44 = [v19 deviationDetectionSupportedCountryCode];
    uint64_t v45 = [v44 provenance];
    v61[0] = MEMORY[0x263EF8330];
    v61[1] = 3221225472;
    v61[2] = __67__HKMCOnboardingManager_setOnboardingCompletedWithInfo_completion___block_invoke_379;
    v61[3] = &unk_2646E9E00;
    v61[4] = self;
    [(HKFeatureAvailabilityStore *)deviationsFeatureAvailabilityStore setCurrentOnboardingVersionCompletedForCountryCode:v43 countryCodeProvenance:v45 date:0 settings:v40 completion:v61];

    id v18 = v59;
    uint64_t v21 = (void *)MEMORY[0x263F09820];
  }
  v46 = [v19 wristTemperatureInputSupportedCountryCode];

  if (v46)
  {
    id v47 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v48 = [v19 wristTemperatureInputEnabled];
    [v47 setObject:v48 forKeyedSubscript:*v21];

    v49 = (void *)[objc_alloc(MEMORY[0x263F0A3C0]) initWithDictionary:v47];
    wristTemperatureInputFeatureAvailabilityStore = self->_wristTemperatureInputFeatureAvailabilityStore;
    v51 = [v19 wristTemperatureInputSupportedCountryCode];
    v52 = [v51 ISOCode];
    v53 = [v19 wristTemperatureInputSupportedCountryCode];
    uint64_t v54 = [v53 provenance];
    v60[0] = MEMORY[0x263EF8330];
    v60[1] = 3221225472;
    v60[2] = __67__HKMCOnboardingManager_setOnboardingCompletedWithInfo_completion___block_invoke_380;
    v60[3] = &unk_2646E9E00;
    v60[4] = self;
    [(HKFeatureAvailabilityStore *)wristTemperatureInputFeatureAvailabilityStore setCurrentOnboardingVersionCompletedForCountryCode:v52 countryCodeProvenance:v54 date:0 settings:v49 completion:v60];
  }
}

void __67__HKMCOnboardingManager_setOnboardingCompletedWithInfo_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    id v6 = HKCreateSerialDispatchQueue();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __67__HKMCOnboardingManager_setOnboardingCompletedWithInfo_completion___block_invoke_376;
    block[3] = &unk_2646E9770;
    id v7 = *(void **)(a1 + 40);
    block[4] = *(void *)(a1 + 32);
    id v11 = v7;
    id v12 = *(id *)(a1 + 48);
    dispatch_async(v6, block);
  }
  else
  {
    _HKInitializeLogging();
    BOOL v8 = (void *)*MEMORY[0x263F09930];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR)) {
      __67__HKMCOnboardingManager_setOnboardingCompletedWithInfo_completion___block_invoke_cold_1(a1, v8);
    }
    uint64_t v9 = *(void *)(a1 + 48);
    if (v9) {
      (*(void (**)(uint64_t, void, id))(v9 + 16))(v9, 0, v5);
    }
  }
}

void __67__HKMCOnboardingManager_setOnboardingCompletedWithInfo_completion___block_invoke_376(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  char v3 = [*(id *)(a1 + 40) userEnteredCycleLength];
  id v4 = [*(id *)(a1 + 40) userEnteredPeriodLength];
  id v5 = [*(id *)(a1 + 40) userEnteredLastPeriodStartDay];
  id v6 = [*(id *)(a1 + 40) addedCycleFactors];
  id v7 = [*(id *)(a1 + 40) deletedCycleFactors];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __67__HKMCOnboardingManager_setOnboardingCompletedWithInfo_completion___block_invoke_2;
  v8[3] = &unk_2646E9D88;
  id v9 = *(id *)(a1 + 48);
  [v2 _saveUserEnteredCycleLength:v3 userEnteredPeriodLength:v4 userEnteredLastPeriodStartDay:v5 addedCycleFactors:v6 deletedCycleFactors:v7 completion:v8];
}

uint64_t __67__HKMCOnboardingManager_setOnboardingCompletedWithInfo_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __67__HKMCOnboardingManager_setOnboardingCompletedWithInfo_completion___block_invoke_3(uint64_t a1, int a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a3;
  _HKInitializeLogging();
  id v6 = (void *)*MEMORY[0x263F09930];
  id v7 = *MEMORY[0x263F09930];
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v8 = v6;
      int v10 = 138543362;
      id v11 = (id)objc_opt_class();
      id v9 = v11;
      _os_log_impl(&dword_2249E9000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set current heart rate input onboarding version completed", (uint8_t *)&v10, 0xCu);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __67__HKMCOnboardingManager_setOnboardingCompletedWithInfo_completion___block_invoke_3_cold_1(a1, v6);
  }
}

void __67__HKMCOnboardingManager_setOnboardingCompletedWithInfo_completion___block_invoke_379(uint64_t a1, int a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a3;
  _HKInitializeLogging();
  id v6 = (void *)*MEMORY[0x263F09930];
  id v7 = *MEMORY[0x263F09930];
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v8 = v6;
      int v10 = 138543362;
      id v11 = (id)objc_opt_class();
      id v9 = v11;
      _os_log_impl(&dword_2249E9000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set current deviation detection onboarding version completed", (uint8_t *)&v10, 0xCu);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __67__HKMCOnboardingManager_setOnboardingCompletedWithInfo_completion___block_invoke_379_cold_1(a1, v6);
  }
}

void __67__HKMCOnboardingManager_setOnboardingCompletedWithInfo_completion___block_invoke_380(uint64_t a1, int a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a3;
  _HKInitializeLogging();
  id v6 = (void *)*MEMORY[0x263F09930];
  id v7 = *MEMORY[0x263F09930];
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v8 = v6;
      int v10 = 138543362;
      id v11 = (id)objc_opt_class();
      id v9 = v11;
      _os_log_impl(&dword_2249E9000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set current wrist temperature input onboarding version completed", (uint8_t *)&v10, 0xCu);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __67__HKMCOnboardingManager_setOnboardingCompletedWithInfo_completion___block_invoke_380_cold_1(a1, v6);
  }
}

- (BOOL)_resetOnboardingKeyValueDomainWithError:(id *)a3
{
  legacyOnboardingKeyValueDomain = self->_legacyOnboardingKeyValueDomain;
  id v15 = 0;
  char v6 = [(HKKeyValueDomain *)legacyOnboardingKeyValueDomain setNumber:&unk_26D7D01C0 forKey:@"OnboardingCompleted" error:&v15];
  id v7 = v15;
  BOOL v8 = (os_log_t *)MEMORY[0x263F09930];
  if ((v6 & 1) == 0)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR)) {
      -[HKMCOnboardingManager _resetOnboardingKeyValueDomainWithError:]();
    }
  }
  id v9 = self->_legacyOnboardingKeyValueDomain;
  id v14 = v7;
  char v10 = [(HKKeyValueDomain *)v9 setDate:0 forKey:@"OnboardingFirstCompletedDate" error:&v14];
  id v11 = v14;

  if ((v10 & 1) == 0)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR)) {
      -[HKMCOnboardingManager _resetOnboardingKeyValueDomainWithError:]();
    }
  }
  id v12 = v11;
  if (v12)
  {
    if (a3) {
      *a3 = v12;
    }
    else {
      _HKLogDroppedError();
    }
  }

  return v6;
}

- (BOOL)_resetOnboardingCharacteristicsWithError:(id *)a3
{
  healthStore = self->_healthStore;
  id v15 = 0;
  char v6 = [(HKHealthStore *)healthStore _setUserEnteredMenstrualCycleLengthCharacteristicQuantity:0 error:&v15];
  id v7 = v15;
  BOOL v8 = (os_log_t *)MEMORY[0x263F09930];
  if ((v6 & 1) == 0)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR)) {
      -[HKMCOnboardingManager _resetOnboardingCharacteristicsWithError:]();
    }
  }
  id v9 = self->_healthStore;
  id v14 = v7;
  char v10 = [(HKHealthStore *)v9 _setUserEnteredMenstrualPeriodLengthCharacteristicQuantity:0 error:&v14];
  id v11 = v14;

  if ((v10 & 1) == 0)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR)) {
      -[HKMCOnboardingManager _resetOnboardingCharacteristicsWithError:]();
    }
  }
  id v12 = v11;
  if (v12)
  {
    if (a3) {
      *a3 = v12;
    }
    else {
      _HKLogDroppedError();
    }
  }

  return v10;
}

- (void)_triggerHealthKitSync
{
  char v3 = (void *)[objc_alloc(MEMORY[0x263F0A558]) initWithHealthStore:self->_healthStore];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __46__HKMCOnboardingManager__triggerHealthKitSync__block_invoke;
  v4[3] = &unk_2646E9E00;
  v4[4] = self;
  [v3 forceNanoSyncWithOptions:0 completion:v4];
}

void __46__HKMCOnboardingManager__triggerHealthKitSync__block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a3;
  _HKInitializeLogging();
  char v6 = (void *)*MEMORY[0x263F09930];
  id v7 = *MEMORY[0x263F09930];
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v8 = v6;
      int v10 = 138543362;
      id v11 = (id)objc_opt_class();
      id v9 = v11;
      _os_log_impl(&dword_2249E9000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Forced HealthKit sync", (uint8_t *)&v10, 0xCu);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __46__HKMCOnboardingManager__triggerHealthKitSync__block_invoke_cold_1(a1, v6);
  }
}

- (void)resetOnboarding:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  _HKInitializeLogging();
  id v5 = (void *)*MEMORY[0x263F09930];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
  {
    char v6 = v5;
    *(_DWORD *)buf = 138543362;
    id v17 = (id)objc_opt_class();
    id v7 = v17;
    _os_log_impl(&dword_2249E9000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Resetting onboarding", buf, 0xCu);
  }
  featureAvailabilityStore = self->_featureAvailabilityStore;
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  uint64_t v12 = __41__HKMCOnboardingManager_resetOnboarding___block_invoke;
  uint64_t v13 = &unk_2646E92C8;
  id v14 = self;
  id v15 = v4;
  id v9 = v4;
  [(HKFeatureAvailabilityStore *)featureAvailabilityStore resetOnboardingWithCompletion:&v10];
  -[HKFeatureAvailabilityStore resetOnboardingWithCompletion:](self->_heartRateInputFeatureAvailabilityStore, "resetOnboardingWithCompletion:", &__block_literal_global_4, v10, v11, v12, v13, v14);
  [(HKFeatureAvailabilityStore *)self->_deviationsFeatureAvailabilityStore resetOnboardingWithCompletion:&__block_literal_global_385];
  [(HKFeatureAvailabilityStore *)self->_wristTemperatureInputFeatureAvailabilityStore resetOnboardingWithCompletion:&__block_literal_global_387];
}

void __41__HKMCOnboardingManager_resetOnboarding___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    char v6 = HKCreateSerialDispatchQueue();
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __41__HKMCOnboardingManager_resetOnboarding___block_invoke_383;
    v10[3] = &unk_2646E94C0;
    id v7 = *(void **)(a1 + 40);
    v10[4] = *(void *)(a1 + 32);
    id v11 = v7;
    dispatch_async(v6, v10);
  }
  else
  {
    _HKInitializeLogging();
    BOOL v8 = (void *)*MEMORY[0x263F09930];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR)) {
      __41__HKMCOnboardingManager_resetOnboarding___block_invoke_cold_1(a1, v8);
    }
    uint64_t v9 = *(void *)(a1 + 40);
    if (v9) {
      (*(void (**)(uint64_t, void, id))(v9 + 16))(v9, 0, v5);
    }
  }
}

void __41__HKMCOnboardingManager_resetOnboarding___block_invoke_383(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v9 = 0;
  uint64_t v3 = [v2 _resetOnboardingKeyValueDomainWithError:&v9];
  id v4 = v9;
  if (v3)
  {
    id v5 = *(void **)(a1 + 32);
    id v8 = v4;
    uint64_t v3 = [v5 _resetOnboardingCharacteristicsWithError:&v8];
    id v6 = v8;

    id v4 = v6;
  }
  [*(id *)(a1 + 32) _triggerHealthKitSync];
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, v3, v4);
  }
}

- (void)featureAvailabilityProvidingDidUpdateOnboardingCompletion:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  _HKInitializeLogging();
  id v5 = (void *)*MEMORY[0x263F09930];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    uint64_t v7 = objc_opt_class();
    id v8 = v7;
    id v9 = [v4 featureIdentifier];
    *(_DWORD *)buf = 138543618;
    uint64_t v13 = v7;
    __int16 v14 = 2114;
    id v15 = v9;
    _os_log_impl(&dword_2249E9000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notify observers that onboarding state did change for %{public}@", buf, 0x16u);
  }
  observers = self->_observers;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __83__HKMCOnboardingManager_featureAvailabilityProvidingDidUpdateOnboardingCompletion___block_invoke;
  v11[3] = &unk_2646E9E28;
  v11[4] = self;
  [(HKObserverSet *)observers notifyObservers:v11];
}

uint64_t __83__HKMCOnboardingManager_featureAvailabilityProvidingDidUpdateOnboardingCompletion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 onboardingManagerDidUpdateOnboardingCompletion:*(void *)(a1 + 32)];
}

- (void)featureAvailabilityProvidingDidUpdateSettings:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  _HKInitializeLogging();
  id v5 = (void *)*MEMORY[0x263F09930];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    uint64_t v7 = objc_opt_class();
    id v8 = v7;
    id v9 = [v4 featureIdentifier];
    *(_DWORD *)buf = 138543618;
    id v15 = v7;
    __int16 v16 = 2114;
    id v17 = v9;
    _os_log_impl(&dword_2249E9000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notify observers of feature settings change for %{public}@", buf, 0x16u);
  }
  observers = self->_observers;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __71__HKMCOnboardingManager_featureAvailabilityProvidingDidUpdateSettings___block_invoke;
  v12[3] = &unk_2646E9E50;
  void v12[4] = self;
  id v13 = v4;
  id v11 = v4;
  [(HKObserverSet *)observers notifyObservers:v12];
}

void __71__HKMCOnboardingManager_featureAvailabilityProvidingDidUpdateSettings___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(a1 + 40);
  id v4 = a2;
  id v5 = [v3 featureIdentifier];
  [v4 onboardingManager:v2 didUpdateFeatureSettingsForFeatureIdentifier:v5];
}

- (HKFeatureAvailabilityStore)featureAvailabilityStore
{
  return self->_featureAvailabilityStore;
}

- (HKFeatureAvailabilityStore)deviationsFeatureAvailabilityStore
{
  return self->_deviationsFeatureAvailabilityStore;
}

- (HKFeatureAvailabilityStore)heartRateInputFeatureAvailabilityStore
{
  return self->_heartRateInputFeatureAvailabilityStore;
}

- (HKFeatureAvailabilityStore)wristTemperatureInputFeatureAvailabilityStore
{
  return self->_wristTemperatureInputFeatureAvailabilityStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wristTemperatureInputFeatureAvailabilityStore, 0);
  objc_storeStrong((id *)&self->_heartRateInputFeatureAvailabilityStore, 0);
  objc_storeStrong((id *)&self->_deviationsFeatureAvailabilityStore, 0);
  objc_storeStrong((id *)&self->_featureAvailabilityStore, 0);
  objc_storeStrong((id *)&self->_observerQueue, 0);
  objc_storeStrong((id *)&self->_legacyOnboardingKeyValueDomain, 0);
  objc_storeStrong((id *)&self->_menstrualCyclesStore, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
}

- (void)_onboardingRecordForFeatureWithIdentifier:error:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  id v2 = v1;
  uint64_t v3 = (void *)OUTLINED_FUNCTION_2_1();
  id v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_2249E9000, v5, v6, "[%{public}@] Error retrieving onboarding record: %{public}@", v7, v8, v9, v10, v11);
}

- (void)userEnteredCycleLength
{
  OUTLINED_FUNCTION_3_0();
  id v2 = v1;
  uint64_t v3 = (void *)OUTLINED_FUNCTION_2_1();
  id v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_2249E9000, v5, v6, "[%{public}@] Error retrieving user entered cycle length: %{public}@", v7, v8, v9, v10, v11);
}

- (void)userEnteredPeriodLength
{
  OUTLINED_FUNCTION_3_0();
  id v2 = v1;
  uint64_t v3 = (void *)OUTLINED_FUNCTION_2_1();
  id v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_2249E9000, v5, v6, "[%{public}@] Error retrieving user entered period length: %{public}@", v7, v8, v9, v10, v11);
}

- (void)_setLegacyOnboardingCompletedVersion:error:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  id v2 = v1;
  uint64_t v3 = (void *)OUTLINED_FUNCTION_2_1();
  id v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_2249E9000, v5, v6, "[%{public}@] Error setting onboarding completed date: %{public}@", v7, v8, v9, v10, v11);
}

- (void)_setLegacyOnboardingCompletedVersion:error:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  id v2 = v1;
  uint64_t v3 = (void *)OUTLINED_FUNCTION_2_1();
  id v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_2249E9000, v5, v6, "[%{public}@] Error retrieving first onboarding completed date: %{public}@", v7, v8, v9, v10, v11);
}

- (void)_setLegacyOnboardingCompletedVersion:error:.cold.3()
{
  OUTLINED_FUNCTION_3_0();
  id v2 = v1;
  uint64_t v3 = (void *)OUTLINED_FUNCTION_2_1();
  id v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_2249E9000, v5, v6, "[%{public}@] Error setting onboarding completed: %{public}@", v7, v8, v9, v10, v11);
}

- (void)_saveUserEnteredCycleLength:userEnteredPeriodLength:userEnteredLastPeriodStartDay:addedCycleFactors:deletedCycleFactors:completion:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  id v2 = v1;
  uint64_t v3 = (void *)OUTLINED_FUNCTION_2_1();
  id v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_2249E9000, v5, v6, "[%{public}@] Error setting user entered period length: %{public}@", v7, v8, v9, v10, v11);
}

- (void)_saveUserEnteredCycleLength:userEnteredPeriodLength:userEnteredLastPeriodStartDay:addedCycleFactors:deletedCycleFactors:completion:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  id v2 = v1;
  uint64_t v3 = (void *)OUTLINED_FUNCTION_2_1();
  id v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_2249E9000, v5, v6, "[%{public}@] Error setting user entered cycle length: %{public}@", v7, v8, v9, v10, v11);
}

void __156__HKMCOnboardingManager__saveUserEnteredCycleLength_userEnteredPeriodLength_userEnteredLastPeriodStartDay_addedCycleFactors_deletedCycleFactors_completion___block_invoke_371_cold_1(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_4_1(a1, a2);
  uint64_t v3 = (void *)OUTLINED_FUNCTION_2_1();
  id v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_2249E9000, v5, v6, "[%{public}@] Error saving added and removed cycle factors: %{public}@", v7, v8, v9, v10, v11);
}

void __156__HKMCOnboardingManager__saveUserEnteredCycleLength_userEnteredPeriodLength_userEnteredLastPeriodStartDay_addedCycleFactors_deletedCycleFactors_completion___block_invoke_373_cold_1(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_4_1(a1, a2);
  uint64_t v3 = (void *)OUTLINED_FUNCTION_2_1();
  id v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_2249E9000, v5, v6, "[%{public}@] Error saving user entered last period: %{public}@", v7, v8, v9, v10, v11);
}

void __82__HKMCOnboardingManager__setCurrentOnboardingVersionCompletedWithInfo_completion___block_invoke_cold_1(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_4_1(a1, a2);
  uint64_t v3 = (void *)OUTLINED_FUNCTION_2_1();
  id v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_2249E9000, v5, v6, "[%{public}@] Error setting saving current onboarding version completed to feature availability store: %{public}@", v7, v8, v9, v10, v11);
}

void __67__HKMCOnboardingManager_setOnboardingCompletedWithInfo_completion___block_invoke_cold_1(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_4_1(a1, a2);
  uint64_t v3 = (void *)OUTLINED_FUNCTION_2_1();
  id v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_2249E9000, v5, v6, "[%{public}@] Error saving current onboarding version completed: %{public}@", v7, v8, v9, v10, v11);
}

void __67__HKMCOnboardingManager_setOnboardingCompletedWithInfo_completion___block_invoke_3_cold_1(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_4_1(a1, a2);
  uint64_t v3 = (void *)OUTLINED_FUNCTION_2_1();
  id v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_2249E9000, v5, v6, "[%{public}@] Error setting current heart rate input onboarding version completed: %{public}@", v7, v8, v9, v10, v11);
}

void __67__HKMCOnboardingManager_setOnboardingCompletedWithInfo_completion___block_invoke_379_cold_1(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_4_1(a1, a2);
  uint64_t v3 = (void *)OUTLINED_FUNCTION_2_1();
  id v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_2249E9000, v5, v6, "[%{public}@] Error setting current deviation detection onboarding version completed: %{public}@", v7, v8, v9, v10, v11);
}

void __67__HKMCOnboardingManager_setOnboardingCompletedWithInfo_completion___block_invoke_380_cold_1(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_4_1(a1, a2);
  uint64_t v3 = (void *)OUTLINED_FUNCTION_2_1();
  id v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_2249E9000, v5, v6, "[%{public}@] Error setting current wrist temperature input onboarding version completed: %{public}@", v7, v8, v9, v10, v11);
}

- (void)_resetOnboardingKeyValueDomainWithError:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  id v2 = v1;
  uint64_t v3 = (void *)OUTLINED_FUNCTION_2_1();
  id v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_2249E9000, v5, v6, "[%{public}@] Error resetting onboarding completed date: %{public}@", v7, v8, v9, v10, v11);
}

- (void)_resetOnboardingKeyValueDomainWithError:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  id v2 = v1;
  uint64_t v3 = (void *)OUTLINED_FUNCTION_2_1();
  id v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_2249E9000, v5, v6, "[%{public}@] Error resetting onboarding completed: %{public}@", v7, v8, v9, v10, v11);
}

- (void)_resetOnboardingCharacteristicsWithError:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  id v2 = v1;
  uint64_t v3 = (void *)OUTLINED_FUNCTION_2_1();
  id v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_2249E9000, v5, v6, "[%{public}@] Error clearing user entered period length: %{public}@", v7, v8, v9, v10, v11);
}

- (void)_resetOnboardingCharacteristicsWithError:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  id v2 = v1;
  uint64_t v3 = (void *)OUTLINED_FUNCTION_2_1();
  id v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_2249E9000, v5, v6, "[%{public}@] Error clearing user entered cycle length: %{public}@", v7, v8, v9, v10, v11);
}

void __46__HKMCOnboardingManager__triggerHealthKitSync__block_invoke_cold_1(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_4_1(a1, a2);
  uint64_t v3 = (void *)OUTLINED_FUNCTION_2_1();
  id v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_2249E9000, v5, v6, "[%{public}@] Error forcing HealthKit sync: %{public}@", v7, v8, v9, v10, v11);
}

void __41__HKMCOnboardingManager_resetOnboarding___block_invoke_cold_1(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_4_1(a1, a2);
  uint64_t v3 = (void *)OUTLINED_FUNCTION_2_1();
  id v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_2249E9000, v5, v6, "[%{public}@] Error resetting onboarding in feature availability store: %{public}@", v7, v8, v9, v10, v11);
}

@end