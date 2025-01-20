@interface HDHRIrregularRhythmNotificationsFeatureAvailabilityManager
- (HDFeatureAvailabilityExtension)v1FeatureAvailabilityManager;
- (HDFeatureAvailabilityExtension)v2FeatureAvailabilityManager;
- (HDHRIrregularRhythmNotificationsFeatureAvailabilityManager)initWithProfile:(id)a3 v2PairedFeaturePropertiesSyncManager:(id)a4 notificationSettingDefaults:(id)a5;
- (HDHRIrregularRhythmNotificationsFeatureAvailabilityManager)initWithV1FeatureAvailabilityManager:(id)a3 v2FeatureAvailabilityManager:(id)a4;
- (HKObserverSet)observers;
- (NSString)featureIdentifier;
- (id)canCompleteOnboardingForCountryCode:(id)a3 error:(id *)a4;
- (id)earliestDateLowestOnboardingVersionCompletedWithError:(id *)a3;
- (id)featureAvailabilityRequirementsWithError:(id *)a3;
- (id)featureOnboardingRecordWithError:(id *)a3;
- (id)highestAvailableOnboardedAlgorithmVersionWithError:(id *)a3;
- (id)isCurrentOnboardingVersionCompletedWithError:(id *)a3;
- (id)isFeatureCapabilitySupportedOnActivePairedDeviceWithError:(id *)a3;
- (id)onboardedCountryCodeSupportedStateWithError:(id *)a3;
- (id)onboardingEligibilityForCountryCode:(id)a3 error:(id *)a4;
- (id)pairedFeatureAttributesWithError:(id *)a3;
- (id)regionAvailabilityWithError:(id *)a3;
- (int64_t)_featureSupportedStateForOnboardedV1CountryCodeSupportedState:(int64_t)a3 onboardedV2CountryCodeSupportedState:(int64_t)a4;
- (void)featureAvailabilityExtensionDidUpdateRegionAvailability:(id)a3;
- (void)featureAvailabilityExtensionOnboardingCompletionDataDidBecomeAvailable:(id)a3;
- (void)featureAvailabilityProvidingDidUpdateOnboardingCompletion:(id)a3;
- (void)featureAvailabilityProvidingDidUpdatePairedDeviceCapability:(id)a3;
- (void)featureAvailabilityProvidingDidUpdateSettings:(id)a3;
- (void)getFeatureOnboardingRecordWithCompletion:(id)a3;
- (void)isCurrentOnboardingVersionCompletedWithCompletion:(id)a3;
- (void)registerObserver:(id)a3 queue:(id)a4;
- (void)removeFeatureSettingValueForKey:(id)a3 completion:(id)a4;
- (void)resetOnboardingWithCompletion:(id)a3;
- (void)saveOnboardingCompletion:(id)a3 settings:(id)a4 completion:(id)a5;
- (void)setCurrentOnboardingVersionCompletedForCountryCode:(id)a3 countryCodeProvenance:(int64_t)a4 date:(id)a5 settings:(id)a6 completion:(id)a7;
- (void)setFeatureSettingData:(id)a3 forKey:(id)a4 completion:(id)a5;
- (void)setFeatureSettingNumber:(id)a3 forKey:(id)a4 completion:(id)a5;
- (void)setFeatureSettingString:(id)a3 forKey:(id)a4 completion:(id)a5;
- (void)unregisterObserver:(id)a3;
@end

@implementation HDHRIrregularRhythmNotificationsFeatureAvailabilityManager

- (id)featureAvailabilityRequirementsWithError:(id *)a3
{
  v3 = [(HDHRIrregularRhythmNotificationsFeatureAvailabilityManager *)self featureIdentifier];
  v4 = HKHRIrregularRhythmNotificationsRequirementsWithFeatureIdentifier();

  return v4;
}

- (id)featureOnboardingRecordWithError:(id *)a3
{
  v1FeatureAvailabilityManager = self->_v1FeatureAvailabilityManager;
  id v18 = 0;
  v6 = [(HDFeatureAvailabilityExtension *)v1FeatureAvailabilityManager featureOnboardingRecordWithError:&v18];
  id v7 = v18;
  if (!v6)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_ERROR)) {
      -[HDHRIrregularRhythmNotificationsFeatureAvailabilityManager featureOnboardingRecordWithError:]();
    }
  }
  v2FeatureAvailabilityManager = self->_v2FeatureAvailabilityManager;
  id v17 = 0;
  v9 = [(HDFeatureAvailabilityExtension *)v2FeatureAvailabilityManager featureOnboardingRecordWithError:&v17];
  id v10 = v17;
  if (v9)
  {
    if (v6)
    {
      int64_t v11 = -[HDHRIrregularRhythmNotificationsFeatureAvailabilityManager _featureSupportedStateForOnboardedV1CountryCodeSupportedState:onboardedV2CountryCodeSupportedState:](self, "_featureSupportedStateForOnboardedV1CountryCodeSupportedState:onboardedV2CountryCodeSupportedState:", [v6 onboardingState], objc_msgSend(v9, "onboardingState"));
      if ([v9 onboardingState] == v11) {
        v12 = v9;
      }
      else {
        v12 = v6;
      }
      id v13 = v12;
      goto LABEL_20;
    }
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_ERROR)) {
      -[HDHRIrregularRhythmNotificationsFeatureAvailabilityManager featureOnboardingRecordWithError:]();
    }
  }
  if (v7) {
    v14 = v7;
  }
  else {
    v14 = v10;
  }
  id v15 = v14;
  if (v15)
  {
    if (a3) {
      *a3 = v15;
    }
    else {
      _HKLogDroppedError();
    }
  }

  id v13 = 0;
LABEL_20:

  return v13;
}

- (id)onboardingEligibilityForCountryCode:(id)a3 error:(id *)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  v1FeatureAvailabilityManager = self->_v1FeatureAvailabilityManager;
  id v32 = 0;
  id v7 = a3;
  v8 = [(HDFeatureAvailabilityExtension *)v1FeatureAvailabilityManager onboardingEligibilityForCountryCode:v7 error:&v32];
  id v9 = v32;
  v2FeatureAvailabilityManager = self->_v2FeatureAvailabilityManager;
  id v31 = 0;
  int64_t v11 = [(HDFeatureAvailabilityExtension *)v2FeatureAvailabilityManager onboardingEligibilityForCountryCode:v7 error:&v31];

  id v12 = v31;
  id v13 = v12;
  if (v8) {
    BOOL v14 = v11 == 0;
  }
  else {
    BOOL v14 = 1;
  }
  if (!v14)
  {
    if ([v11 ineligibilityReasons])
    {
      if ([v8 ineligibilityReasons])
      {
        uint64_t v19 = [v8 ineligibilityReasons];
        uint64_t v20 = [v11 ineligibilityReasons] & v19;
        if (v20)
        {
          v21 = [v11 countryAvailabilityVersion];
          id v17 = (id)[objc_alloc(MEMORY[0x1E4F2B008]) initWithIneligibilityReasons:v20 countryAvailabilityVersion:v21];

LABEL_23:
          v24 = [(HDHRIrregularRhythmNotificationsFeatureAvailabilityManager *)self featureIdentifier];
          id v18 = [v17 eligibilityRespectingOverridesForFeatureIdentifier:v24];

          goto LABEL_24;
        }
        _HKInitializeLogging();
        v23 = (void *)*MEMORY[0x1E4F29F50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_ERROR))
        {
          v26 = v23;
          v27 = objc_opt_class();
          id v28 = v27;
          v29 = [v8 ineligibilityReasonsDescription];
          v30 = [v11 ineligibilityReasonsDescription];
          *(_DWORD *)buf = 138543874;
          v34 = v27;
          __int16 v35 = 2114;
          v36 = v29;
          __int16 v37 = 2114;
          v38 = v30;
          _os_log_error_impl(&dword_1D3AC6000, v26, OS_LOG_TYPE_ERROR, "[%{public}@] No intersection of unavailability reasons for IRN1 and IRN2: %{public}@ (v1) | %{public}@ (v2)", buf, 0x20u);
        }
      }
      id v22 = v8;
    }
    else
    {
      id v22 = v11;
    }
    id v17 = v22;
    goto LABEL_23;
  }
  if (v9) {
    id v15 = v9;
  }
  else {
    id v15 = v12;
  }
  id v16 = v15;
  id v17 = v16;
  if (v16)
  {
    if (a4)
    {
      id v17 = v16;
      id v18 = 0;
      *a4 = v17;
      goto LABEL_24;
    }
    _HKLogDroppedError();
  }
  id v18 = 0;
LABEL_24:

  return v18;
}

- (NSString)featureIdentifier
{
  return (NSString *)(id)*MEMORY[0x1E4F29D60];
}

- (HDFeatureAvailabilityExtension)v2FeatureAvailabilityManager
{
  return self->_v2FeatureAvailabilityManager;
}

- (int64_t)_featureSupportedStateForOnboardedV1CountryCodeSupportedState:(int64_t)a3 onboardedV2CountryCodeSupportedState:(int64_t)a4
{
  switch(a3)
  {
    case 1:
      if ((unint64_t)(a4 - 1) >= 5) {
        return 5;
      }
      else {
        return a4;
      }
    case 2:
      int64_t v5 = a4 - 1;
      if ((unint64_t)(a4 - 1) >= 5) {
        goto LABEL_12;
      }
      v6 = &unk_1D3B168B8;
      goto LABEL_11;
    case 3:
      int64_t v5 = a4 - 1;
      if ((unint64_t)(a4 - 1) >= 5) {
        goto LABEL_12;
      }
      v6 = &unk_1D3B168E0;
      goto LABEL_11;
    case 4:
      int64_t v5 = a4 - 1;
      if ((unint64_t)(a4 - 1) >= 5) {
        goto LABEL_12;
      }
      v6 = &unk_1D3B16908;
LABEL_11:
      int64_t result = v6[v5];
      break;
    default:
LABEL_12:
      int64_t result = 5;
      break;
  }
  return result;
}

- (void)registerObserver:(id)a3 queue:(id)a4
{
  observers = self->_observers;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __85__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_registerObserver_queue___block_invoke;
  v5[3] = &unk_1E69B41B8;
  v5[4] = self;
  [(HKObserverSet *)observers registerObserver:a3 queue:a4 runIfFirstObserver:v5];
}

- (HDHRIrregularRhythmNotificationsFeatureAvailabilityManager)initWithProfile:(id)a3 v2PairedFeaturePropertiesSyncManager:(id)a4 notificationSettingDefaults:(id)a5
{
  v8 = (objc_class *)MEMORY[0x1E4F65B80];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [v8 alloc];
  id v13 = [v11 daemon];
  BOOL v14 = (void *)[v12 initWithDaemon:v13 remoteDisableCondition:*MEMORY[0x1E4F2A960] seedExpirationCondition:*MEMORY[0x1E4F2A970]];

  id v15 = [[HDHRIrregularRhythmNotificationsV1FeatureAvailabilityManager alloc] initWithProfile:v11 disableAndExpiryProvider:v14 notificationSettingDefaults:v9];
  id v16 = objc_msgSend(MEMORY[0x1E4F65B10], "hdhr_irregularRhythmNotificationsV2FeatureAvailabilityManagerWithProfile:disableAndExpiryProvider:pairedFeaturePropertiesSyncManager:", v11, v14, v10);

  id v17 = [(HDHRIrregularRhythmNotificationsFeatureAvailabilityManager *)self initWithV1FeatureAvailabilityManager:v15 v2FeatureAvailabilityManager:v16];
  return v17;
}

- (HDHRIrregularRhythmNotificationsFeatureAvailabilityManager)initWithV1FeatureAvailabilityManager:(id)a3 v2FeatureAvailabilityManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HDHRIrregularRhythmNotificationsFeatureAvailabilityManager;
  id v9 = [(HDHRIrregularRhythmNotificationsFeatureAvailabilityManager *)&v17 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_v1FeatureAvailabilityManager, a3);
    objc_storeStrong((id *)&v10->_v2FeatureAvailabilityManager, a4);
    id v11 = objc_alloc(MEMORY[0x1E4F2B2D0]);
    id v12 = (objc_class *)objc_opt_class();
    id v13 = NSStringFromClass(v12);
    uint64_t v14 = [v11 initWithName:v13 loggingCategory:*MEMORY[0x1E4F29F50]];
    observers = v10->_observers;
    v10->_observers = (HKObserverSet *)v14;
  }
  return v10;
}

- (id)highestAvailableOnboardedAlgorithmVersionWithError:(id *)a3
{
  v1FeatureAvailabilityManager = self->_v1FeatureAvailabilityManager;
  id v18 = 0;
  v6 = [(HDFeatureAvailabilityExtension *)v1FeatureAvailabilityManager onboardedCountryCodeSupportedStateWithError:&v18];
  id v7 = v18;
  v2FeatureAvailabilityManager = self->_v2FeatureAvailabilityManager;
  id v17 = 0;
  id v9 = [(HDFeatureAvailabilityExtension *)v2FeatureAvailabilityManager onboardedCountryCodeSupportedStateWithError:&v17];
  id v10 = v17;
  id v11 = v10;
  if (v6) {
    BOOL v12 = v9 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (v12)
  {
    if (v7) {
      id v13 = v7;
    }
    else {
      id v13 = v10;
    }
    id v14 = v13;
    if (v14)
    {
      if (a3) {
        *a3 = v14;
      }
      else {
        _HKLogDroppedError();
      }
    }

    goto LABEL_18;
  }
  if (-[HDHRIrregularRhythmNotificationsFeatureAvailabilityManager _featureSupportedStateForOnboardedV1CountryCodeSupportedState:onboardedV2CountryCodeSupportedState:](self, "_featureSupportedStateForOnboardedV1CountryCodeSupportedState:onboardedV2CountryCodeSupportedState:", [v6 integerValue], objc_msgSend(v9, "integerValue")) != 2)
  {
LABEL_18:
    id v15 = 0;
    goto LABEL_19;
  }
  if ([v9 integerValue] == 2) {
    id v15 = &unk_1F2B42CA0;
  }
  else {
    id v15 = &unk_1F2B42CB8;
  }
LABEL_19:

  return v15;
}

- (id)canCompleteOnboardingForCountryCode:(id)a3 error:(id *)a4
{
  v1FeatureAvailabilityManager = self->_v1FeatureAvailabilityManager;
  id v23 = 0;
  id v7 = a3;
  id v8 = [(HDFeatureAvailabilityExtension *)v1FeatureAvailabilityManager canCompleteOnboardingForCountryCode:v7 error:&v23];
  id v9 = v23;
  v2FeatureAvailabilityManager = self->_v2FeatureAvailabilityManager;
  id v22 = 0;
  id v11 = [(HDFeatureAvailabilityExtension *)v2FeatureAvailabilityManager canCompleteOnboardingForCountryCode:v7 error:&v22];

  id v12 = v22;
  id v13 = v12;
  if (v8) {
    BOOL v14 = v11 == 0;
  }
  else {
    BOOL v14 = 1;
  }
  if (v14)
  {
    if (v9) {
      id v15 = v9;
    }
    else {
      id v15 = v12;
    }
    id v16 = v15;
    if (v16)
    {
      if (a4) {
        *a4 = v16;
      }
      else {
        _HKLogDroppedError();
      }
    }

    uint64_t v20 = 0;
  }
  else
  {
    id v17 = NSNumber;
    char v18 = [v8 BOOLValue];
    if (v18) {
      uint64_t v19 = 1;
    }
    else {
      uint64_t v19 = [v11 BOOLValue];
    }
    uint64_t v20 = [v17 numberWithInt:v19];
  }

  return v20;
}

- (id)earliestDateLowestOnboardingVersionCompletedWithError:(id *)a3
{
  v1FeatureAvailabilityManager = self->_v1FeatureAvailabilityManager;
  id v18 = 0;
  uint64_t v6 = [(HDFeatureAvailabilityExtension *)v1FeatureAvailabilityManager earliestDateLowestOnboardingVersionCompletedWithError:&v18];
  id v7 = v18;
  v2FeatureAvailabilityManager = self->_v2FeatureAvailabilityManager;
  id v17 = 0;
  uint64_t v9 = [(HDFeatureAvailabilityExtension *)v2FeatureAvailabilityManager earliestDateLowestOnboardingVersionCompletedWithError:&v17];
  id v10 = v17;
  id v11 = v10;
  if (v6 | v9)
  {
    if (v6)
    {
      if (v9)
      {
        id v14 = [(id)v6 earlierDate:v9];
      }
      else
      {
        id v14 = (id)v6;
      }
    }
    else
    {
      id v14 = (id)v9;
    }
    id v15 = v14;
  }
  else
  {
    if (v7) {
      id v12 = v7;
    }
    else {
      id v12 = v10;
    }
    id v13 = v12;
    if (v13)
    {
      if (a3) {
        *a3 = v13;
      }
      else {
        _HKLogDroppedError();
      }
    }

    id v15 = 0;
  }

  return v15;
}

- (void)getFeatureOnboardingRecordWithCompletion:(id)a3
{
  id v7 = 0;
  v4 = (void (**)(id, void *, id))a3;
  int64_t v5 = [(HDHRIrregularRhythmNotificationsFeatureAvailabilityManager *)self featureOnboardingRecordWithError:&v7];
  id v6 = v7;
  v4[2](v4, v5, v6);
}

- (void)isCurrentOnboardingVersionCompletedWithCompletion:(id)a3
{
  id v4 = a3;
  int64_t v5 = dispatch_group_create();
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = __Block_byref_object_copy__6;
  v31[4] = __Block_byref_object_dispose__6;
  id v32 = 0;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = __Block_byref_object_copy__6;
  v29[4] = __Block_byref_object_dispose__6;
  id v30 = 0;
  dispatch_group_enter(v5);
  v1FeatureAvailabilityManager = self->_v1FeatureAvailabilityManager;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __112__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_isCurrentOnboardingVersionCompletedWithCompletion___block_invoke;
  v25[3] = &unk_1E69B4EE8;
  v27 = v31;
  id v28 = v29;
  id v7 = v5;
  v26 = v7;
  [(HDFeatureAvailabilityExtension *)v1FeatureAvailabilityManager isCurrentOnboardingVersionCompletedWithCompletion:v25];
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy__6;
  v23[4] = __Block_byref_object_dispose__6;
  id v24 = 0;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__6;
  v21[4] = __Block_byref_object_dispose__6;
  id v22 = 0;
  dispatch_group_enter(v7);
  v2FeatureAvailabilityManager = self->_v2FeatureAvailabilityManager;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __112__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_isCurrentOnboardingVersionCompletedWithCompletion___block_invoke_2;
  v17[3] = &unk_1E69B4EE8;
  uint64_t v19 = v23;
  uint64_t v20 = v21;
  uint64_t v9 = v7;
  id v18 = v9;
  [(HDFeatureAvailabilityExtension *)v2FeatureAvailabilityManager isCurrentOnboardingVersionCompletedWithCompletion:v17];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __112__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_isCurrentOnboardingVersionCompletedWithCompletion___block_invoke_3;
  block[3] = &unk_1E69B4F10;
  id v12 = v4;
  id v13 = v31;
  id v14 = v23;
  id v15 = v29;
  id v16 = v21;
  id v10 = v4;
  dispatch_group_notify(v9, MEMORY[0x1E4F14428], block);

  _Block_object_dispose(v21, 8);
  _Block_object_dispose(v23, 8);

  _Block_object_dispose(v29, 8);
  _Block_object_dispose(v31, 8);
}

void __112__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_isCurrentOnboardingVersionCompletedWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __112__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_isCurrentOnboardingVersionCompletedWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __112__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_isCurrentOnboardingVersionCompletedWithCompletion___block_invoke_3(void *a1)
{
  v2 = *(void **)(*(void *)(a1[5] + 8) + 40);
  if (v2 && *(void *)(*(void *)(a1[6] + 8) + 40))
  {
    if ([v2 BOOLValue]) {
      uint64_t v3 = 1;
    }
    else {
      uint64_t v3 = [*(id *)(*(void *)(a1[6] + 8) + 40) BOOLValue];
    }
    uint64_t v5 = a1[4];
    id v6 = [NSNumber numberWithBool:v3];
    (*(void (**)(uint64_t, id, void))(v5 + 16))(v5, v6, 0);
  }
  else
  {
    id v4 = *(void (**)(void))(a1[4] + 16);
    v4();
  }
}

- (id)isCurrentOnboardingVersionCompletedWithError:(id *)a3
{
  v1FeatureAvailabilityManager = self->_v1FeatureAvailabilityManager;
  id v21 = 0;
  id v6 = [(HDFeatureAvailabilityExtension *)v1FeatureAvailabilityManager isCurrentOnboardingVersionCompletedWithError:&v21];
  id v7 = v21;
  v2FeatureAvailabilityManager = self->_v2FeatureAvailabilityManager;
  id v20 = 0;
  uint64_t v9 = [(HDFeatureAvailabilityExtension *)v2FeatureAvailabilityManager isCurrentOnboardingVersionCompletedWithError:&v20];
  id v10 = v20;
  id v11 = v10;
  if (v6) {
    BOOL v12 = v9 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (v12)
  {
    if (v7) {
      id v13 = v7;
    }
    else {
      id v13 = v10;
    }
    id v14 = v13;
    if (v14)
    {
      if (a3) {
        *a3 = v14;
      }
      else {
        _HKLogDroppedError();
      }
    }

    id v18 = 0;
  }
  else
  {
    id v15 = NSNumber;
    char v16 = [v6 BOOLValue];
    if (v16) {
      uint64_t v17 = 1;
    }
    else {
      uint64_t v17 = [v9 BOOLValue];
    }
    id v18 = [v15 numberWithInt:v17];
  }

  return v18;
}

- (id)isFeatureCapabilitySupportedOnActivePairedDeviceWithError:(id *)a3
{
  v1FeatureAvailabilityManager = self->_v1FeatureAvailabilityManager;
  id v21 = 0;
  id v6 = [(HDFeatureAvailabilityExtension *)v1FeatureAvailabilityManager isFeatureCapabilitySupportedOnActivePairedDeviceWithError:&v21];
  id v7 = v21;
  v2FeatureAvailabilityManager = self->_v2FeatureAvailabilityManager;
  id v20 = 0;
  uint64_t v9 = [(HDFeatureAvailabilityExtension *)v2FeatureAvailabilityManager isFeatureCapabilitySupportedOnActivePairedDeviceWithError:&v20];
  id v10 = v20;
  id v11 = v10;
  if (v6) {
    BOOL v12 = v9 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (v12)
  {
    if (v7) {
      id v13 = v7;
    }
    else {
      id v13 = v10;
    }
    id v14 = v13;
    if (v14)
    {
      if (a3) {
        *a3 = v14;
      }
      else {
        _HKLogDroppedError();
      }
    }

    id v18 = 0;
  }
  else
  {
    id v15 = NSNumber;
    char v16 = [v6 BOOLValue];
    if (v16) {
      uint64_t v17 = 1;
    }
    else {
      uint64_t v17 = [v9 BOOLValue];
    }
    id v18 = [v15 numberWithInt:v17];
  }

  return v18;
}

- (id)onboardedCountryCodeSupportedStateWithError:(id *)a3
{
  v1FeatureAvailabilityManager = self->_v1FeatureAvailabilityManager;
  id v32 = 0;
  uint64_t v6 = [(HDFeatureAvailabilityExtension *)v1FeatureAvailabilityManager onboardedCountryCodeSupportedStateWithError:&v32];
  id v7 = v32;
  v2FeatureAvailabilityManager = self->_v2FeatureAvailabilityManager;
  id v31 = 0;
  uint64_t v9 = [(HDFeatureAvailabilityExtension *)v2FeatureAvailabilityManager onboardedCountryCodeSupportedStateWithError:&v31];
  id v10 = v31;
  id v11 = v10;
  if (v6 | v9)
  {
    if (v6)
    {
      if (v9)
      {
        objc_msgSend(NSNumber, "numberWithInteger:", -[HDHRIrregularRhythmNotificationsFeatureAvailabilityManager _featureSupportedStateForOnboardedV1CountryCodeSupportedState:onboardedV2CountryCodeSupportedState:](self, "_featureSupportedStateForOnboardedV1CountryCodeSupportedState:onboardedV2CountryCodeSupportedState:", objc_msgSend((id)v6, "integerValue"), objc_msgSend((id)v9, "integerValue")));
        id v14 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        _HKInitializeLogging();
        id v23 = *MEMORY[0x1E4F29F50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_ERROR)) {
          -[HDHRIrregularRhythmNotificationsFeatureAvailabilityManager onboardedCountryCodeSupportedStateWithError:]((uint64_t)v11, v23, v24, v25, v26, v27, v28, v29);
        }
        id v14 = (id)v6;
      }
    }
    else
    {
      _HKInitializeLogging();
      id v15 = *MEMORY[0x1E4F29F50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_ERROR)) {
        -[HDHRIrregularRhythmNotificationsFeatureAvailabilityManager onboardedCountryCodeSupportedStateWithError:]((uint64_t)v7, v15, v16, v17, v18, v19, v20, v21);
      }
      id v14 = (id)v9;
    }
    id v22 = v14;
  }
  else
  {
    if (v7) {
      BOOL v12 = v7;
    }
    else {
      BOOL v12 = v10;
    }
    id v13 = v12;
    if (v13)
    {
      if (a3) {
        *a3 = v13;
      }
      else {
        _HKLogDroppedError();
      }
    }

    id v22 = 0;
  }

  return v22;
}

- (id)pairedFeatureAttributesWithError:(id *)a3
{
  v1FeatureAvailabilityManager = self->_v1FeatureAvailabilityManager;
  id v21 = 0;
  uint64_t v6 = [(HDFeatureAvailabilityExtension *)v1FeatureAvailabilityManager onboardedCountryCodeSupportedStateWithError:&v21];
  id v7 = v21;
  v2FeatureAvailabilityManager = self->_v2FeatureAvailabilityManager;
  id v20 = 0;
  uint64_t v9 = [(HDFeatureAvailabilityExtension *)v2FeatureAvailabilityManager onboardedCountryCodeSupportedStateWithError:&v20];
  id v10 = v20;
  id v11 = v10;
  if (v6) {
    BOOL v12 = v9 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (v12)
  {
    if (v7) {
      id v13 = v7;
    }
    else {
      id v13 = v10;
    }
    id v14 = v13;
    if (v14)
    {
      if (a3) {
        *a3 = v14;
      }
      else {
        _HKLogDroppedError();
      }
    }
  }
  else
  {
    int64_t v15 = -[HDHRIrregularRhythmNotificationsFeatureAvailabilityManager _featureSupportedStateForOnboardedV1CountryCodeSupportedState:onboardedV2CountryCodeSupportedState:](self, "_featureSupportedStateForOnboardedV1CountryCodeSupportedState:onboardedV2CountryCodeSupportedState:", [v6 integerValue], objc_msgSend(v9, "integerValue"));
    if (v15 != 1)
    {
      if ([v9 integerValue] == v15) {
        uint64_t v17 = self->_v2FeatureAvailabilityManager;
      }
      else {
        uint64_t v17 = self->_v1FeatureAvailabilityManager;
      }
      uint64_t v18 = [(HDFeatureAvailabilityExtension *)v17 pairedFeatureAttributesWithError:a3];
      goto LABEL_26;
    }
    _HKInitializeLogging();
    uint64_t v16 = *MEMORY[0x1E4F29F50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_ERROR)) {
      -[HDHRIrregularRhythmNotificationsFeatureAvailabilityManager pairedFeatureAttributesWithError:](v16);
    }
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 11, @"Unable to determine paired feature attributes for IRN without onboarding completion");
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      if (a3) {
        *a3 = v14;
      }
      else {
        _HKLogDroppedError();
      }
    }
  }
  uint64_t v18 = 0;
LABEL_26:

  return v18;
}

- (id)regionAvailabilityWithError:(id *)a3
{
  return (id)[(HDFeatureAvailabilityExtension *)self->_v2FeatureAvailabilityManager regionAvailabilityWithError:a3];
}

- (void)setCurrentOnboardingVersionCompletedForCountryCode:(id)a3 countryCodeProvenance:(int64_t)a4 date:(id)a5 settings:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  uint64_t v16 = dispatch_group_create();
  v61[0] = 0;
  v61[1] = v61;
  v61[2] = 0x2020000000;
  char v62 = 0;
  v59[0] = 0;
  v59[1] = v59;
  v59[2] = 0x3032000000;
  v59[3] = __Block_byref_object_copy__6;
  v59[4] = __Block_byref_object_dispose__6;
  id v60 = 0;
  dispatch_group_enter(v16);
  v1FeatureAvailabilityManager = self->_v1FeatureAvailabilityManager;
  v55[0] = MEMORY[0x1E4F143A8];
  v55[1] = 3221225472;
  v55[2] = __160__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_setCurrentOnboardingVersionCompletedForCountryCode_countryCodeProvenance_date_settings_completion___block_invoke;
  v55[3] = &unk_1E69B4F38;
  v57 = v61;
  v58 = v59;
  uint64_t v18 = v16;
  v56 = v18;
  [(HDFeatureAvailabilityExtension *)v1FeatureAvailabilityManager setCurrentOnboardingVersionCompletedForCountryCode:v12 countryCodeProvenance:a4 date:v13 settings:v14 completion:v55];
  v53[0] = 0;
  v53[1] = v53;
  v53[2] = 0x2020000000;
  char v54 = 0;
  uint64_t v47 = 0;
  v48 = &v47;
  uint64_t v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__6;
  v51 = __Block_byref_object_dispose__6;
  id v52 = 0;
  v2FeatureAvailabilityManager = self->_v2FeatureAvailabilityManager;
  id v46 = 0;
  id v20 = [(HDFeatureAvailabilityExtension *)v2FeatureAvailabilityManager onboardingEligibilityForCountryCode:v12 error:&v46];
  id v21 = v46;
  if (v20)
  {
    if (![v20 isEligible])
    {
      char v33 = 0;
      goto LABEL_9;
    }
    dispatch_group_enter(v18);
    id v22 = self->_v2FeatureAvailabilityManager;
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __160__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_setCurrentOnboardingVersionCompletedForCountryCode_countryCodeProvenance_date_settings_completion___block_invoke_295;
    v42[3] = &unk_1E69B4F38;
    v44 = v53;
    v45 = &v47;
    v43 = v18;
    [(HDFeatureAvailabilityExtension *)v22 setCurrentOnboardingVersionCompletedForCountryCode:v12 countryCodeProvenance:a4 date:v13 settings:v14 completion:v42];
    id v23 = v43;
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v24 = *MEMORY[0x1E4F29F50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_ERROR)) {
      -[HDHRIrregularRhythmNotificationsFeatureAvailabilityManager setCurrentOnboardingVersionCompletedForCountryCode:countryCodeProvenance:date:settings:completion:]((uint64_t)v21, v24, v25, v26, v27, v28, v29, v30);
    }
    id v31 = v48;
    id v32 = v21;
    id v23 = v31[5];
    void v31[5] = (uint64_t)v32;
  }

  char v33 = 1;
LABEL_9:
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __160__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_setCurrentOnboardingVersionCompletedForCountryCode_countryCodeProvenance_date_settings_completion___block_invoke_2;
  v35[3] = &unk_1E69B4F60;
  id v36 = v15;
  __int16 v37 = v61;
  v38 = v53;
  uint64_t v39 = v59;
  v40 = &v47;
  char v41 = v33;
  id v34 = v15;
  dispatch_group_notify(v18, MEMORY[0x1E4F14428], v35);

  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(v53, 8);

  _Block_object_dispose(v59, 8);
  _Block_object_dispose(v61, 8);
}

void __160__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_setCurrentOnboardingVersionCompletedForCountryCode_countryCodeProvenance_date_settings_completion___block_invoke(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), obj);
  id v5 = obj;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __160__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_setCurrentOnboardingVersionCompletedForCountryCode_countryCodeProvenance_date_settings_completion___block_invoke_295(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), obj);
  id v5 = obj;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __160__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_setCurrentOnboardingVersionCompletedForCountryCode_countryCodeProvenance_date_settings_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
LABEL_5:
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
    {
      _HKInitializeLogging();
      uint64_t v9 = (os_log_t *)MEMORY[0x1E4F29F50];
      id v10 = *MEMORY[0x1E4F29F50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_INFO))
      {
        int v11 = *(unsigned __int8 *)(a1 + 72);
        v21[0] = 67240192;
        v21[1] = v11;
        _os_log_impl(&dword_1D3AC6000, v10, OS_LOG_TYPE_INFO, "Completed onboarding for IRN 1.0, but did not complete onboarding for 2.0 with expectation: %{public}d", (uint8_t *)v21, 8u);
      }
      if (*(unsigned char *)(a1 + 72))
      {
        _HKInitializeLogging();
        id v12 = *v9;
        if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR)) {
          __160__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_setCurrentOnboardingVersionCompletedForCountryCode_countryCodeProvenance_date_settings_completion___block_invoke_2_cold_1(a1, v12, v13, v14, v15, v16, v17, v18);
        }
      }
    }
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    _HKInitializeLogging();
    v2 = *MEMORY[0x1E4F29F50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_ERROR)) {
      __160__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_setCurrentOnboardingVersionCompletedForCountryCode_countryCodeProvenance_date_settings_completion___block_invoke_2_cold_2(a1, v2, v3, v4, v5, v6, v7, v8);
    }
    goto LABEL_5;
  }
  id v20 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v20();
}

- (void)saveOnboardingCompletion:(id)a3 settings:(id)a4 completion:(id)a5
{
  uint64_t v5 = (void (**)(id, void, void *))a5;
  _HKInitializeLogging();
  uint64_t v6 = (void *)*MEMORY[0x1E4F29F50];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_ERROR)) {
    -[HDHRIrregularRhythmNotificationsFeatureAvailabilityManager saveOnboardingCompletion:settings:completion:](v6);
  }
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 3, @"Saving HKOnboardingCompletion directly is not supported for IRN's combined feature identifier");
  v5[2](v5, 0, v7);
}

- (void)setFeatureSettingData:(id)a3 forKey:(id)a4 completion:(id)a5
{
  id v6 = a4;
  uint64_t v7 = (void (**)(id, void, void *))a5;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_ERROR)) {
    -[HDHRIrregularRhythmNotificationsFeatureAvailabilityManager setFeatureSettingData:forKey:completion:]();
  }
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 3, @"Cannot set unknown data setting for IRN");
  v7[2](v7, 0, v8);
}

- (void)setFeatureSettingString:(id)a3 forKey:(id)a4 completion:(id)a5
{
  id v6 = a4;
  uint64_t v7 = (void (**)(id, void, void *))a5;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_ERROR)) {
    -[HDHRIrregularRhythmNotificationsFeatureAvailabilityManager setFeatureSettingString:forKey:completion:]();
  }
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 3, @"Cannot set unknown string setting for IRN");
  v7[2](v7, 0, v8);
}

- (void)setFeatureSettingNumber:(id)a3 forKey:(id)a4 completion:(id)a5
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = dispatch_group_create();
  v1FeatureAvailabilityManager = self->_v1FeatureAvailabilityManager;
  id v57 = 0;
  uint64_t v13 = [(HDFeatureAvailabilityExtension *)v1FeatureAvailabilityManager onboardedCountryCodeSupportedStateWithError:&v57];
  id v14 = v57;
  v55[0] = 0;
  v55[1] = v55;
  v55[2] = 0x2020000000;
  char v56 = 1;
  v53[0] = 0;
  v53[1] = v53;
  v53[2] = 0x3032000000;
  void v53[3] = __Block_byref_object_copy__6;
  v53[4] = __Block_byref_object_dispose__6;
  id v54 = 0;
  if (v13)
  {
    if ([v13 integerValue] != 1)
    {
      dispatch_group_enter(v11);
      uint64_t v15 = self->_v1FeatureAvailabilityManager;
      v49[0] = MEMORY[0x1E4F143A8];
      v49[1] = 3221225472;
      v49[2] = __104__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_setFeatureSettingNumber_forKey_completion___block_invoke;
      v49[3] = &unk_1E69B4F88;
      v49[4] = self;
      v51 = v55;
      id v52 = v53;
      v50 = v11;
      [(HDFeatureAvailabilityExtension *)v15 setFeatureSettingNumber:v8 forKey:v9 completion:v49];
    }
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v16 = (id)*MEMORY[0x1E4F29F50];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = objc_opt_class();
      -[HDHRIrregularRhythmNotificationsFeatureAvailabilityManager setFeatureSettingNumber:forKey:completion:](v17, (uint64_t)v14, (uint64_t)v59);
    }
  }
  v2FeatureAvailabilityManager = self->_v2FeatureAvailabilityManager;
  id v48 = 0;
  uint64_t v19 = [(HDFeatureAvailabilityExtension *)v2FeatureAvailabilityManager onboardedCountryCodeSupportedStateWithError:&v48];
  id v20 = v48;
  v46[0] = 0;
  v46[1] = v46;
  v46[2] = 0x2020000000;
  char v47 = 1;
  v44[0] = 0;
  v44[1] = v44;
  v44[2] = 0x3032000000;
  v44[3] = __Block_byref_object_copy__6;
  v44[4] = __Block_byref_object_dispose__6;
  id v45 = 0;
  if (v19)
  {
    if ([v19 integerValue] != 1)
    {
      dispatch_group_enter(v11);
      id v21 = self->_v2FeatureAvailabilityManager;
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __104__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_setFeatureSettingNumber_forKey_completion___block_invoke_305;
      v40[3] = &unk_1E69B4F88;
      v40[4] = self;
      v42 = v46;
      v43 = v44;
      char v41 = v11;
      [(HDFeatureAvailabilityExtension *)v21 setFeatureSettingNumber:v8 forKey:v9 completion:v40];
    }
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v22 = (id)*MEMORY[0x1E4F29F50];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      id v23 = objc_opt_class();
      -[HDHRIrregularRhythmNotificationsFeatureAvailabilityManager setFeatureSettingNumber:forKey:completion:](v23, (uint64_t)v20, (uint64_t)v58);
    }
  }
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __104__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_setFeatureSettingNumber_forKey_completion___block_invoke_306;
  v29[3] = &unk_1E69B4FB0;
  id v30 = v13;
  id v31 = v19;
  id v32 = v14;
  id v33 = v20;
  id v36 = v55;
  __int16 v37 = v46;
  v38 = v53;
  uint64_t v39 = v44;
  id v34 = self;
  id v35 = v10;
  id v24 = v20;
  id v25 = v14;
  id v26 = v10;
  id v27 = v19;
  id v28 = v13;
  dispatch_group_notify(v11, MEMORY[0x1E4F14428], v29);

  _Block_object_dispose(v44, 8);
  _Block_object_dispose(v46, 8);

  _Block_object_dispose(v53, 8);
  _Block_object_dispose(v55, 8);
}

void __104__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_setFeatureSettingNumber_forKey_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    id v6 = (void *)*MEMORY[0x1E4F29F50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_ERROR)) {
      __104__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_setFeatureSettingNumber_forKey_completion___block_invoke_cold_1(a1, v6);
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2;
  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v9 = v5;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __104__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_setFeatureSettingNumber_forKey_completion___block_invoke_305(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    id v6 = (void *)*MEMORY[0x1E4F29F50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_ERROR)) {
      __104__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_setFeatureSettingNumber_forKey_completion___block_invoke_305_cold_1(a1, v6);
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2;
  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v9 = v5;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __104__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_setFeatureSettingNumber_forKey_completion___block_invoke_306(uint64_t a1)
{
  if (!*(void *)(a1 + 32) || (v2 = *(void **)(a1 + 40)) == 0)
  {
    uint64_t v6 = *(void *)(a1 + 72);
LABEL_12:
    uint64_t v7 = *(void (**)(void))(v6 + 16);
    goto LABEL_13;
  }
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24)
    || !*(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24))
  {
    uint64_t v6 = *(void *)(a1 + 72);
    goto LABEL_12;
  }
  if ([v2 integerValue] == 1 && objc_msgSend(*(id *)(a1 + 32), "integerValue") == 1)
  {
    _HKInitializeLogging();
    uint64_t v3 = (void *)*MEMORY[0x1E4F29F50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_FAULT)) {
      __104__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_setFeatureSettingNumber_forKey_completion___block_invoke_306_cold_1(a1, v3);
    }
    uint64_t v4 = *(void *)(a1 + 72);
    id v5 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 110, @"Unable to update setting for IRN with neither version onboarded");
    (*(void (**)(uint64_t, void, void *))(v4 + 16))(v4, 0, v5);

    return;
  }
  uint64_t v7 = *(void (**)(void))(*(void *)(a1 + 72) + 16);
LABEL_13:

  v7();
}

- (void)removeFeatureSettingValueForKey:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = dispatch_group_create();
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x2020000000;
  char v35 = 1;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = __Block_byref_object_copy__6;
  v32[4] = __Block_byref_object_dispose__6;
  id v33 = 0;
  dispatch_group_enter(v8);
  v1FeatureAvailabilityManager = self->_v1FeatureAvailabilityManager;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __105__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_removeFeatureSettingValueForKey_completion___block_invoke;
  v28[3] = &unk_1E69B4F88;
  v28[4] = self;
  id v30 = v34;
  id v31 = v32;
  id v10 = v8;
  uint64_t v29 = v10;
  [(HDFeatureAvailabilityExtension *)v1FeatureAvailabilityManager removeFeatureSettingValueForKey:v6 completion:v28];
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  char v27 = 1;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy__6;
  v24[4] = __Block_byref_object_dispose__6;
  id v25 = 0;
  dispatch_group_enter(v10);
  v2FeatureAvailabilityManager = self->_v2FeatureAvailabilityManager;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __105__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_removeFeatureSettingValueForKey_completion___block_invoke_310;
  v20[3] = &unk_1E69B4F88;
  v20[4] = self;
  uint64_t v22 = v26;
  id v23 = v24;
  id v12 = v10;
  id v21 = v12;
  [(HDFeatureAvailabilityExtension *)v2FeatureAvailabilityManager removeFeatureSettingValueForKey:v6 completion:v20];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __105__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_removeFeatureSettingValueForKey_completion___block_invoke_311;
  block[3] = &unk_1E69B4F10;
  id v15 = v7;
  uint64_t v16 = v34;
  uint64_t v17 = v26;
  uint64_t v18 = v32;
  uint64_t v19 = v24;
  id v13 = v7;
  dispatch_group_notify(v12, MEMORY[0x1E4F14428], block);

  _Block_object_dispose(v24, 8);
  _Block_object_dispose(v26, 8);

  _Block_object_dispose(v32, 8);
  _Block_object_dispose(v34, 8);
}

void __105__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_removeFeatureSettingValueForKey_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    id v6 = (void *)*MEMORY[0x1E4F29F50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_ERROR)) {
      __105__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_removeFeatureSettingValueForKey_completion___block_invoke_cold_1(a1, v6);
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2;
  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v9 = v5;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __105__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_removeFeatureSettingValueForKey_completion___block_invoke_310(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    id v6 = (void *)*MEMORY[0x1E4F29F50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_ERROR)) {
      __105__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_removeFeatureSettingValueForKey_completion___block_invoke_310_cold_1(a1, v6);
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2;
  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v9 = v5;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __105__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_removeFeatureSettingValueForKey_completion___block_invoke_311(void *a1)
{
  if (*(unsigned char *)(*(void *)(a1[5] + 8) + 24) && *(unsigned char *)(*(void *)(a1[6] + 8) + 24)) {
    return (*(uint64_t (**)(void))(a1[4] + 16))();
  }
  uint64_t v2 = *(void *)(*(void *)(a1[7] + 8) + 40);
  if (!v2) {
    uint64_t v2 = *(void *)(*(void *)(a1[8] + 8) + 40);
  }
  return (*(uint64_t (**)(void, void, uint64_t))(a1[4] + 16))(a1[4], 0, v2);
}

- (void)resetOnboardingWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = dispatch_group_create();
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x2020000000;
  char v32 = 0;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = __Block_byref_object_copy__6;
  void v29[4] = __Block_byref_object_dispose__6;
  id v30 = 0;
  dispatch_group_enter(v5);
  v1FeatureAvailabilityManager = self->_v1FeatureAvailabilityManager;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __92__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_resetOnboardingWithCompletion___block_invoke;
  v25[3] = &unk_1E69B4F38;
  char v27 = v31;
  id v28 = v29;
  uint64_t v7 = v5;
  id v26 = v7;
  [(HDFeatureAvailabilityExtension *)v1FeatureAvailabilityManager resetOnboardingWithCompletion:v25];
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  char v24 = 0;
  v21[0] = 0;
  v21[1] = v21;
  _DWORD v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__6;
  v21[4] = __Block_byref_object_dispose__6;
  id v22 = 0;
  dispatch_group_enter(v7);
  v2FeatureAvailabilityManager = self->_v2FeatureAvailabilityManager;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __92__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_resetOnboardingWithCompletion___block_invoke_2;
  v17[3] = &unk_1E69B4F38;
  uint64_t v19 = v23;
  id v20 = v21;
  id v9 = v7;
  uint64_t v18 = v9;
  [(HDFeatureAvailabilityExtension *)v2FeatureAvailabilityManager resetOnboardingWithCompletion:v17];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __92__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_resetOnboardingWithCompletion___block_invoke_3;
  block[3] = &unk_1E69B4F10;
  id v12 = v4;
  id v13 = v31;
  id v14 = v23;
  id v15 = v29;
  uint64_t v16 = v21;
  id v10 = v4;
  dispatch_group_notify(v9, MEMORY[0x1E4F14428], block);

  _Block_object_dispose(v21, 8);
  _Block_object_dispose(v23, 8);

  _Block_object_dispose(v29, 8);
  _Block_object_dispose(v31, 8);
}

void __92__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_resetOnboardingWithCompletion___block_invoke(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), obj);
  id v5 = obj;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __92__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_resetOnboardingWithCompletion___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), obj);
  id v5 = obj;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __92__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_resetOnboardingWithCompletion___block_invoke_3(void *a1)
{
  if (*(unsigned char *)(*(void *)(a1[5] + 8) + 24) && *(unsigned char *)(*(void *)(a1[6] + 8) + 24)) {
    return (*(uint64_t (**)(void))(a1[4] + 16))();
  }
  uint64_t v2 = *(void *)(*(void *)(a1[7] + 8) + 40);
  if (!v2) {
    uint64_t v2 = *(void *)(*(void *)(a1[8] + 8) + 40);
  }
  return (*(uint64_t (**)(void, void, uint64_t))(a1[4] + 16))(a1[4], 0, v2);
}

void __85__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_registerObserver_queue___block_invoke(uint64_t a1)
{
  HKCreateSerialDispatchQueue();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(*(void *)(a1 + 32) + 8) registerObserver:*(void *)(a1 + 32) queue:v2];
  [*(id *)(*(void *)(a1 + 32) + 16) registerObserver:*(void *)(a1 + 32) queue:v2];
}

- (void)unregisterObserver:(id)a3
{
  observers = self->_observers;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __81__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_unregisterObserver___block_invoke;
  v4[3] = &unk_1E69B41B8;
  v4[4] = self;
  [(HKObserverSet *)observers unregisterObserver:a3 runIfLastObserver:v4];
}

uint64_t __81__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_unregisterObserver___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "unregisterObserver:");
  id v2 = *(void **)(*(void *)(a1 + 32) + 16);

  return objc_msgSend(v2, "unregisterObserver:");
}

- (void)featureAvailabilityProvidingDidUpdateOnboardingCompletion:(id)a3
{
  observers = self->_observers;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __120__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_featureAvailabilityProvidingDidUpdateOnboardingCompletion___block_invoke;
  v4[3] = &unk_1E69B4140;
  v4[4] = self;
  [(HKObserverSet *)observers notifyObservers:v4];
}

uint64_t __120__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_featureAvailabilityProvidingDidUpdateOnboardingCompletion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 featureAvailabilityProvidingDidUpdateOnboardingCompletion:*(void *)(a1 + 32)];
}

- (void)featureAvailabilityProvidingDidUpdateSettings:(id)a3
{
  observers = self->_observers;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __108__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_featureAvailabilityProvidingDidUpdateSettings___block_invoke;
  v4[3] = &unk_1E69B4140;
  v4[4] = self;
  [(HKObserverSet *)observers notifyObservers:v4];
}

void __108__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_featureAvailabilityProvidingDidUpdateSettings___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 featureAvailabilityProvidingDidUpdateSettings:*(void *)(a1 + 32)];
  }
}

- (void)featureAvailabilityProvidingDidUpdatePairedDeviceCapability:(id)a3
{
  observers = self->_observers;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __122__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_featureAvailabilityProvidingDidUpdatePairedDeviceCapability___block_invoke;
  v4[3] = &unk_1E69B4140;
  v4[4] = self;
  [(HKObserverSet *)observers notifyObservers:v4];
}

void __122__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_featureAvailabilityProvidingDidUpdatePairedDeviceCapability___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 featureAvailabilityProvidingDidUpdatePairedDeviceCapability:*(void *)(a1 + 32)];
  }
}

- (void)featureAvailabilityExtensionDidUpdateRegionAvailability:(id)a3
{
  observers = self->_observers;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __118__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_featureAvailabilityExtensionDidUpdateRegionAvailability___block_invoke;
  v4[3] = &unk_1E69B4140;
  v4[4] = self;
  [(HKObserverSet *)observers notifyObservers:v4];
}

void __118__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_featureAvailabilityExtensionDidUpdateRegionAvailability___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 conformsToProtocol:&unk_1F2B49A60]) {
    [v3 featureAvailabilityExtensionDidUpdateRegionAvailability:*(void *)(a1 + 32)];
  }
}

- (void)featureAvailabilityExtensionOnboardingCompletionDataDidBecomeAvailable:(id)a3
{
  observers = self->_observers;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __133__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_featureAvailabilityExtensionOnboardingCompletionDataDidBecomeAvailable___block_invoke;
  v4[3] = &unk_1E69B4140;
  v4[4] = self;
  [(HKObserverSet *)observers notifyObservers:v4];
}

void __133__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_featureAvailabilityExtensionOnboardingCompletionDataDidBecomeAvailable___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 conformsToProtocol:&unk_1F2B49A60]) {
    [v3 featureAvailabilityExtensionOnboardingCompletionDataDidBecomeAvailable:*(void *)(a1 + 32)];
  }
}

- (HDFeatureAvailabilityExtension)v1FeatureAvailabilityManager
{
  return self->_v1FeatureAvailabilityManager;
}

- (HKObserverSet)observers
{
  return self->_observers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_v2FeatureAvailabilityManager, 0);

  objc_storeStrong((id *)&self->_v1FeatureAvailabilityManager, 0);
}

- (void)featureOnboardingRecordWithError:.cold.1()
{
  OUTLINED_FUNCTION_4();
  id v2 = v1;
  id v3 = (void *)OUTLINED_FUNCTION_2();
  id v4 = OUTLINED_FUNCTION_0_0(v3);
  OUTLINED_FUNCTION_1_0(&dword_1D3AC6000, v5, v6, "[%{public}@] Failed to retrieve onboarding record for IRN2: %{public}@", v7, v8, v9, v10, v11);
}

- (void)featureOnboardingRecordWithError:.cold.2()
{
  OUTLINED_FUNCTION_4();
  id v2 = v1;
  id v3 = (void *)OUTLINED_FUNCTION_2();
  id v4 = OUTLINED_FUNCTION_0_0(v3);
  OUTLINED_FUNCTION_1_0(&dword_1D3AC6000, v5, v6, "[%{public}@] Failed to retrieve onboarding record for IRN1: %{public}@", v7, v8, v9, v10, v11);
}

- (void)onboardedCountryCodeSupportedStateWithError:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_3(&dword_1D3AC6000, a2, a3, "Error checking onboarded country code supported state for IRN 1.0, returning supported state for 2.0: %{public}@", a5, a6, a7, a8, 2u);
}

- (void)onboardedCountryCodeSupportedStateWithError:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_3(&dword_1D3AC6000, a2, a3, "Error checking onboarded country code supported state for IRN 2.0, returning supported state for 1.0: %{public}@", a5, a6, a7, a8, 2u);
}

- (void)pairedFeatureAttributesWithError:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_1D3AC6000, log, OS_LOG_TYPE_ERROR, "Unable to determine paired feature attributes for IRN without onboarding completion", v1, 2u);
}

- (void)setCurrentOnboardingVersionCompletedForCountryCode:(uint64_t)a3 countryCodeProvenance:(uint64_t)a4 date:(uint64_t)a5 settings:(uint64_t)a6 completion:(uint64_t)a7 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __160__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_setCurrentOnboardingVersionCompletedForCountryCode_countryCodeProvenance_date_settings_completion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __160__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_setCurrentOnboardingVersionCompletedForCountryCode_countryCodeProvenance_date_settings_completion___block_invoke_2_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)saveOnboardingCompletion:(void *)a1 settings:completion:.cold.1(void *a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  int v3 = 138543362;
  id v4 = (id)objc_opt_class();
  id v2 = v4;
  _os_log_error_impl(&dword_1D3AC6000, v1, OS_LOG_TYPE_ERROR, "[%{public}@] Saving HKOnboardingCompletion directly is not supported for IRN's combined feature identifier", (uint8_t *)&v3, 0xCu);
}

- (void)setFeatureSettingData:forKey:completion:.cold.1()
{
  OUTLINED_FUNCTION_4();
  id v2 = v1;
  int v3 = (void *)OUTLINED_FUNCTION_2();
  id v4 = OUTLINED_FUNCTION_0_0(v3);
  OUTLINED_FUNCTION_1_0(&dword_1D3AC6000, v5, v6, "[%{public}@] Unknown data setting for IRN: %{public}@", v7, v8, v9, v10, v11);
}

- (void)setFeatureSettingString:forKey:completion:.cold.1()
{
  OUTLINED_FUNCTION_4();
  id v2 = v1;
  int v3 = (void *)OUTLINED_FUNCTION_2();
  id v4 = OUTLINED_FUNCTION_0_0(v3);
  OUTLINED_FUNCTION_1_0(&dword_1D3AC6000, v5, v6, "[%{public}@] Unknown string setting for IRN: %{public}@", v7, v8, v9, v10, v11);
}

- (void)setFeatureSettingNumber:(void *)a1 forKey:(uint64_t)a2 completion:(uint64_t)a3 .cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  id v3 = OUTLINED_FUNCTION_4_4(a1, a2, a3, 5.8382e-34);
  OUTLINED_FUNCTION_7_0(&dword_1D3AC6000, v4, v5, "[%{public}@] Unable to determine whether IRN2 is onboarded: %{public}@");
}

- (void)setFeatureSettingNumber:(void *)a1 forKey:(uint64_t)a2 completion:(uint64_t)a3 .cold.2(void *a1, uint64_t a2, uint64_t a3)
{
  id v3 = OUTLINED_FUNCTION_4_4(a1, a2, a3, 5.8382e-34);
  OUTLINED_FUNCTION_7_0(&dword_1D3AC6000, v4, v5, "[%{public}@] Unable to determine whether IRN1 is onboarded: %{public}@");
}

void __104__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_setFeatureSettingNumber_forKey_completion___block_invoke_cold_1(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_5_3(a1, a2);
  id v3 = (void *)OUTLINED_FUNCTION_2();
  id v4 = OUTLINED_FUNCTION_0_0(v3);
  OUTLINED_FUNCTION_1_0(&dword_1D3AC6000, v5, v6, "[%{public}@] Failed to update feature setting for IRN1: %{public}@", v7, v8, v9, v10, v11);
}

void __104__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_setFeatureSettingNumber_forKey_completion___block_invoke_305_cold_1(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_5_3(a1, a2);
  id v3 = (void *)OUTLINED_FUNCTION_2();
  id v4 = OUTLINED_FUNCTION_0_0(v3);
  OUTLINED_FUNCTION_1_0(&dword_1D3AC6000, v5, v6, "[%{public}@] Failed to update feature setting for IRN2: %{public}@", v7, v8, v9, v10, v11);
}

void __104__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_setFeatureSettingNumber_forKey_completion___block_invoke_306_cold_1(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  int v4 = 138543362;
  id v5 = (id)objc_opt_class();
  id v3 = v5;
  _os_log_fault_impl(&dword_1D3AC6000, v2, OS_LOG_TYPE_FAULT, "[%{public}@] Attempt to update setting failed; neither version of IRN is onboarded",
    (uint8_t *)&v4,
    0xCu);
}

void __105__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_removeFeatureSettingValueForKey_completion___block_invoke_cold_1(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_5_3(a1, a2);
  id v3 = (void *)OUTLINED_FUNCTION_2();
  id v4 = OUTLINED_FUNCTION_0_0(v3);
  OUTLINED_FUNCTION_1_0(&dword_1D3AC6000, v5, v6, "[%{public}@] Failed to remove feature setting for IRN1: %{public}@", v7, v8, v9, v10, v11);
}

void __105__HDHRIrregularRhythmNotificationsFeatureAvailabilityManager_removeFeatureSettingValueForKey_completion___block_invoke_310_cold_1(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_5_3(a1, a2);
  id v3 = (void *)OUTLINED_FUNCTION_2();
  id v4 = OUTLINED_FUNCTION_0_0(v3);
  OUTLINED_FUNCTION_1_0(&dword_1D3AC6000, v5, v6, "[%{public}@] Failed to remove feature setting for IRN2: %{public}@", v7, v8, v9, v10, v11);
}

@end