@interface HDHRElectrocardiogramRecordingFeatureAvailabilityManager
- (HDFeatureAvailabilityExtension)v1FeatureAvailabilityManager;
- (HDFeatureAvailabilityExtension)v2FeatureAvailabilityManager;
- (HDHRElectrocardiogramRecordingFeatureAvailabilityManager)initWithProfile:(id)a3 cacheDefaults:(id)a4;
- (HDHRElectrocardiogramRecordingFeatureAvailabilityManager)initWithV1FeatureAvailabilityManager:(id)a3 v2FeatureAvailabilityManager:(id)a4 cacheDefaults:(id)a5;
- (NSString)featureIdentifier;
- (id)canCompleteOnboardingForCountryCode:(id)a3 error:(id *)a4;
- (id)earliestDateLowestOnboardingVersionCompletedWithError:(id *)a3;
- (id)featureAvailabilityRequirementsWithError:(id *)a3;
- (id)featureOnboardingRecordWithError:(id *)a3;
- (id)isCurrentOnboardingVersionCompletedWithError:(id *)a3;
- (id)isFeatureCapabilitySupportedOnActivePairedDeviceWithError:(id *)a3;
- (id)onboardedCountryCodeSupportedStateWithError:(id *)a3;
- (id)onboardingEligibilityForCountryCode:(id)a3 error:(id *)a4;
- (id)pairedFeatureAttributesWithError:(id *)a3;
- (id)regionAvailabilityWithError:(id *)a3;
- (void)_observerQueue_updateCachedOnboardingVersionIfNeeded;
- (void)_registerForCacheUpdatedNotifications;
- (void)_setV1CurrentOnboardingVersionCompletedForCountryCode:(id)a3 countryCodeProvenance:(int64_t)a4 date:(id)a5 settings:(id)a6 completion:(id)a7;
- (void)dealloc;
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

@implementation HDHRElectrocardiogramRecordingFeatureAvailabilityManager

- (id)featureOnboardingRecordWithError:(id *)a3
{
  v1FeatureAvailabilityManager = self->_v1FeatureAvailabilityManager;
  id v21 = 0;
  v6 = [(HDFeatureAvailabilityExtension *)v1FeatureAvailabilityManager featureOnboardingRecordWithError:&v21];
  id v7 = v21;
  if (!v6)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_ERROR)) {
      -[HDHRElectrocardiogramRecordingFeatureAvailabilityManager featureOnboardingRecordWithError:]();
    }
  }
  v2FeatureAvailabilityManager = self->_v2FeatureAvailabilityManager;
  id v20 = 0;
  v9 = [(HDFeatureAvailabilityExtension *)v2FeatureAvailabilityManager featureOnboardingRecordWithError:&v20];
  id v10 = v20;
  if (v9)
  {
    if (v6)
    {
      uint64_t v11 = [v6 onboardingState];
      uint64_t v12 = [v9 onboardingState];
      uint64_t v13 = v12;
      if ((unint64_t)(v11 - 4) < 2)
      {
        if (v12 == 2) {
          uint64_t v16 = 2;
        }
        else {
          uint64_t v16 = v11;
        }
        if (v12 == 4) {
          uint64_t v16 = 4;
        }
        if (v12 != 5) {
          uint64_t v13 = v16;
        }
        goto LABEL_30;
      }
      if (v11 != 2)
      {
        if (v11 != 1)
        {
LABEL_30:
          if ([v9 onboardingState] == v13) {
            v18 = v9;
          }
          else {
            v18 = v6;
          }
          id v17 = v18;
          goto LABEL_34;
        }
        if ((unint64_t)(v12 - 1) < 5)
        {
          uint64_t v13 = qword_1D3B16930[v12 - 1];
          goto LABEL_30;
        }
      }
      uint64_t v13 = 2;
      goto LABEL_30;
    }
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_ERROR)) {
      -[HDHRElectrocardiogramRecordingFeatureAvailabilityManager featureOnboardingRecordWithError:]();
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

  id v17 = 0;
LABEL_34:

  return v17;
}

- (id)onboardingEligibilityForCountryCode:(id)a3 error:(id *)a4
{
  v1FeatureAvailabilityManager = self->_v1FeatureAvailabilityManager;
  id v46 = 0;
  id v7 = a3;
  v8 = [(HDFeatureAvailabilityExtension *)v1FeatureAvailabilityManager onboardingEligibilityForCountryCode:v7 error:&v46];
  id v9 = v46;
  v2FeatureAvailabilityManager = self->_v2FeatureAvailabilityManager;
  id v45 = 0;
  uint64_t v11 = [(HDFeatureAvailabilityExtension *)v2FeatureAvailabilityManager onboardingEligibilityForCountryCode:v7 error:&v45];

  id v12 = v45;
  uint64_t v13 = v12;
  if (v8) {
    BOOL v14 = v11 == 0;
  }
  else {
    BOOL v14 = 1;
  }
  if (!v14)
  {
    v18 = self->_v1FeatureAvailabilityManager;
    id v44 = 0;
    uint64_t v19 = [(HDFeatureAvailabilityExtension *)v18 onboardedCountryCodeSupportedStateWithError:&v44];
    id v20 = v44;
    id v21 = self->_v2FeatureAvailabilityManager;
    id v43 = 0;
    uint64_t v22 = [(HDFeatureAvailabilityExtension *)v21 onboardedCountryCodeSupportedStateWithError:&v43];
    id v23 = v43;
    v24 = v23;
    if (!(v19 | v22))
    {
      if (v20) {
        v25 = v20;
      }
      else {
        v25 = v23;
      }
      id v26 = v25;
      v27 = v26;
      if (v26)
      {
        if (a4) {
          *a4 = v26;
        }
        else {
          _HKLogDroppedError();
        }
      }

      id v17 = 0;
      goto LABEL_52;
    }
    if (v19)
    {
      if (v22)
      {
        uint64_t v28 = [(id)v19 integerValue];
        uint64_t v29 = [(id)v22 integerValue];
        if ((unint64_t)(v28 - 4) < 2)
        {
          if (v29 == 5 || v29 == 4 || v29 == 2) {
LABEL_39:
          }
            uint64_t v28 = v29;
        }
        else if (v28 != 2)
        {
          if (v28 == 1)
          {
            uint64_t v28 = 2;
            switch(v29)
            {
              case 1:
              case 3:
                goto LABEL_41;
              case 4:
              case 5:
                goto LABEL_39;
              default:
                goto LABEL_45;
            }
          }
          uint64_t v28 = v29;
          if (v29 == 1)
          {
LABEL_41:
            if (objc_msgSend(v11, "isEligible", v24)) {
              v31 = v11;
            }
            else {
              v31 = v8;
            }
            id v42 = v31;
            goto LABEL_51;
          }
        }
LABEL_45:
        if (v29 == v28) {
          v32 = v11;
        }
        else {
          v32 = v8;
        }
        id v33 = v32;
        id v42 = v33;
        if ((v28 & 0xFFFFFFFFFFFFFFFELL) != 4)
        {
          v40 = v24;
LABEL_51:
          v38 = [(HDHRElectrocardiogramRecordingFeatureAvailabilityManager *)self featureIdentifier];
          id v17 = [v42 eligibilityRespectingOverridesForFeatureIdentifier:v38];

          v24 = v41;
          goto LABEL_52;
        }
        id v34 = v33;
        uint64_t v35 = [(HDHRElectrocardiogramRecordingFeatureAvailabilityManager *)self featureIdentifier];
        v36 = v34;
        v37 = (void *)v35;
        id v17 = objc_msgSend(v36, "eligibilityRespectingOverridesForFeatureIdentifier:");

LABEL_52:
        goto LABEL_53;
      }
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_ERROR)) {
        -[HDHRElectrocardiogramRecordingFeatureAvailabilityManager onboardingEligibilityForCountryCode:error:]();
      }
      id v30 = v8;
    }
    else
    {
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_ERROR)) {
        -[HDHRElectrocardiogramRecordingFeatureAvailabilityManager onboardingEligibilityForCountryCode:error:]();
      }
      id v30 = v11;
    }
    id v17 = v30;
    goto LABEL_52;
  }
  if (v9) {
    id v15 = v9;
  }
  else {
    id v15 = v12;
  }
  id v16 = v15;
  id v20 = v16;
  if (v16)
  {
    if (a4)
    {
      id v20 = v16;
      id v17 = 0;
      *a4 = v20;
      goto LABEL_53;
    }
    _HKLogDroppedError();
  }
  id v17 = 0;
LABEL_53:

  return v17;
}

- (HDFeatureAvailabilityExtension)v2FeatureAvailabilityManager
{
  return self->_v2FeatureAvailabilityManager;
}

- (HDFeatureAvailabilityExtension)v1FeatureAvailabilityManager
{
  return self->_v1FeatureAvailabilityManager;
}

- (NSString)featureIdentifier
{
  return (NSString *)(id)*MEMORY[0x1E4F29D20];
}

- (id)featureAvailabilityRequirementsWithError:(id *)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4F67E08], "requirementSet", a3);
}

- (void)registerObserver:(id)a3 queue:(id)a4
{
}

- (HDHRElectrocardiogramRecordingFeatureAvailabilityManager)initWithProfile:(id)a3 cacheDefaults:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc(MEMORY[0x1E4F65B80]);
  id v9 = [v6 daemon];
  id v10 = (void *)[v8 initWithDaemon:v9 remoteDisableCondition:*MEMORY[0x1E4F2A968] seedExpirationCondition:*MEMORY[0x1E4F2A978]];

  uint64_t v11 = [MEMORY[0x1E4F2B860] sharedBehavior];
  if ([v11 isCompanionCapable])
  {
    id v12 = HKHRElectrocardiogramRecordingV1FeatureAvailabilityProvider(v6, 0, v10, 0, v7, 0);
  }
  else
  {
    uint64_t v13 = [MEMORY[0x1E4F2B860] sharedBehavior];
    id v12 = HKHRElectrocardiogramRecordingV1FeatureAvailabilityProvider(v6, 0, v10, 0, v7, [v13 isAppleWatch] ^ 1);
  }
  BOOL v14 = [MEMORY[0x1E4F2B860] sharedBehavior];
  if ([v14 isCompanionCapable])
  {
    id v15 = HKHRElectrocardiogramRecordingV2FeatureAvailabilityProvider(v6, 0, v10, 0, v7, 0);
  }
  else
  {
    id v16 = [MEMORY[0x1E4F2B860] sharedBehavior];
    id v15 = HKHRElectrocardiogramRecordingV2FeatureAvailabilityProvider(v6, 0, v10, 0, v7, [v16 isAppleWatch] ^ 1);
  }
  id v17 = [(HDHRElectrocardiogramRecordingFeatureAvailabilityManager *)self initWithV1FeatureAvailabilityManager:v12 v2FeatureAvailabilityManager:v15 cacheDefaults:v7];

  return v17;
}

- (HDHRElectrocardiogramRecordingFeatureAvailabilityManager)initWithV1FeatureAvailabilityManager:(id)a3 v2FeatureAvailabilityManager:(id)a4 cacheDefaults:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)HDHRElectrocardiogramRecordingFeatureAvailabilityManager;
  id v12 = [(HDHRElectrocardiogramRecordingFeatureAvailabilityManager *)&v22 init];
  uint64_t v13 = v12;
  if (v12)
  {
    v12->_needsOnboardingVersionCacheUpdate = 1;
    objc_storeStrong((id *)&v12->_v1FeatureAvailabilityManager, a3);
    objc_storeStrong((id *)&v13->_v2FeatureAvailabilityManager, a4);
    objc_storeStrong((id *)&v13->_cacheDefaults, a5);
    id v14 = objc_alloc(MEMORY[0x1E4F2B2D0]);
    id v15 = (objc_class *)objc_opt_class();
    id v16 = NSStringFromClass(v15);
    uint64_t v17 = [v14 initWithName:v16 loggingCategory:*MEMORY[0x1E4F29F50]];
    observers = v13->_observers;
    v13->_observers = (HKFeatureAvailabilityProvidingObserver *)v17;

    uint64_t v19 = HKCreateSerialDispatchQueue();
    observerQueue = v13->_observerQueue;
    v13->_observerQueue = (OS_dispatch_queue *)v19;

    [(HDHRElectrocardiogramRecordingFeatureAvailabilityManager *)v13 _registerForCacheUpdatedNotifications];
    [(HDFeatureAvailabilityExtension *)v13->_v1FeatureAvailabilityManager registerObserver:v13 queue:v13->_observerQueue];
    [(HDFeatureAvailabilityExtension *)v13->_v2FeatureAvailabilityManager registerObserver:v13 queue:v13->_observerQueue];
  }

  return v13;
}

- (void)dealloc
{
  [(HDFeatureAvailabilityExtension *)self->_v1FeatureAvailabilityManager unregisterObserver:self];
  [(HDFeatureAvailabilityExtension *)self->_v2FeatureAvailabilityManager unregisterObserver:self];
  if (notify_is_valid_token(self->_didUpdateOnboardingCacheNotificationToken)) {
    notify_cancel(self->_didUpdateOnboardingCacheNotificationToken);
  }
  v3.receiver = self;
  v3.super_class = (Class)HDHRElectrocardiogramRecordingFeatureAvailabilityManager;
  [(HDHRElectrocardiogramRecordingFeatureAvailabilityManager *)&v3 dealloc];
}

- (void)_registerForCacheUpdatedNotifications
{
  objc_initWeak(&location, self);
  objc_super v3 = (const char *)*MEMORY[0x1E4F29E78];
  observerQueue = self->_observerQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __97__HDHRElectrocardiogramRecordingFeatureAvailabilityManager__registerForCacheUpdatedNotifications__block_invoke;
  v5[3] = &unk_1E69B46A8;
  objc_copyWeak(&v6, &location);
  notify_register_dispatch(v3, &self->_didUpdateOnboardingCacheNotificationToken, observerQueue, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __97__HDHRElectrocardiogramRecordingFeatureAvailabilityManager__registerForCacheUpdatedNotifications__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained featureAvailabilityProvidingDidUpdateOnboardingCompletion:WeakRetained];
}

- (void)getFeatureOnboardingRecordWithCompletion:(id)a3
{
  id v7 = 0;
  v4 = (void (**)(id, void *, id))a3;
  v5 = [(HDHRElectrocardiogramRecordingFeatureAvailabilityManager *)self featureOnboardingRecordWithError:&v7];
  id v6 = v7;
  v4[2](v4, v5, v6);
}

- (id)isCurrentOnboardingVersionCompletedWithError:(id *)a3
{
  v1FeatureAvailabilityManager = self->_v1FeatureAvailabilityManager;
  id v21 = 0;
  id v6 = [(HDFeatureAvailabilityExtension *)v1FeatureAvailabilityManager isCurrentOnboardingVersionCompletedWithError:&v21];
  id v7 = v21;
  v2FeatureAvailabilityManager = self->_v2FeatureAvailabilityManager;
  id v20 = 0;
  id v9 = [(HDFeatureAvailabilityExtension *)v2FeatureAvailabilityManager isCurrentOnboardingVersionCompletedWithError:&v20];
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
      uint64_t v13 = v7;
    }
    else {
      uint64_t v13 = v10;
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

    v18 = 0;
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
    v18 = [v15 numberWithInt:v17];
  }

  return v18;
}

- (void)isCurrentOnboardingVersionCompletedWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = dispatch_group_create();
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = __Block_byref_object_copy__7;
  v31[4] = __Block_byref_object_dispose__7;
  id v32 = 0;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = __Block_byref_object_copy__7;
  v29[4] = __Block_byref_object_dispose__7;
  id v30 = 0;
  dispatch_group_enter(v5);
  v1FeatureAvailabilityManager = self->_v1FeatureAvailabilityManager;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __110__HDHRElectrocardiogramRecordingFeatureAvailabilityManager_isCurrentOnboardingVersionCompletedWithCompletion___block_invoke;
  v25[3] = &unk_1E69B4EE8;
  v27 = v31;
  uint64_t v28 = v29;
  id v7 = v5;
  id v26 = v7;
  [(HDFeatureAvailabilityExtension *)v1FeatureAvailabilityManager isCurrentOnboardingVersionCompletedWithCompletion:v25];
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy__7;
  v23[4] = __Block_byref_object_dispose__7;
  id v24 = 0;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__7;
  v21[4] = __Block_byref_object_dispose__7;
  id v22 = 0;
  dispatch_group_enter(v7);
  v2FeatureAvailabilityManager = self->_v2FeatureAvailabilityManager;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __110__HDHRElectrocardiogramRecordingFeatureAvailabilityManager_isCurrentOnboardingVersionCompletedWithCompletion___block_invoke_2;
  v17[3] = &unk_1E69B4EE8;
  uint64_t v19 = v23;
  id v20 = v21;
  id v9 = v7;
  v18 = v9;
  [(HDFeatureAvailabilityExtension *)v2FeatureAvailabilityManager isCurrentOnboardingVersionCompletedWithCompletion:v17];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __110__HDHRElectrocardiogramRecordingFeatureAvailabilityManager_isCurrentOnboardingVersionCompletedWithCompletion___block_invoke_3;
  block[3] = &unk_1E69B4F10;
  id v12 = v4;
  uint64_t v13 = v31;
  id v14 = v23;
  id v15 = v29;
  char v16 = v21;
  id v10 = v4;
  dispatch_group_notify(v9, MEMORY[0x1E4F14428], block);

  _Block_object_dispose(v21, 8);
  _Block_object_dispose(v23, 8);

  _Block_object_dispose(v29, 8);
  _Block_object_dispose(v31, 8);
}

void __110__HDHRElectrocardiogramRecordingFeatureAvailabilityManager_isCurrentOnboardingVersionCompletedWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
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

void __110__HDHRElectrocardiogramRecordingFeatureAvailabilityManager_isCurrentOnboardingVersionCompletedWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

void __110__HDHRElectrocardiogramRecordingFeatureAvailabilityManager_isCurrentOnboardingVersionCompletedWithCompletion___block_invoke_3(void *a1)
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
  uint64_t v13 = v12;
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

    id v20 = 0;
  }
  else
  {
    uint64_t v17 = NSNumber;
    char v18 = [v8 BOOLValue];
    if (v18) {
      uint64_t v19 = 1;
    }
    else {
      uint64_t v19 = [v11 BOOLValue];
    }
    id v20 = [v17 numberWithInt:v19];
  }

  return v20;
}

- (id)onboardedCountryCodeSupportedStateWithError:(id *)a3
{
  v1FeatureAvailabilityManager = self->_v1FeatureAvailabilityManager;
  id v24 = 0;
  uint64_t v6 = [(HDFeatureAvailabilityExtension *)v1FeatureAvailabilityManager onboardedCountryCodeSupportedStateWithError:&v24];
  id v7 = v24;
  v2FeatureAvailabilityManager = self->_v2FeatureAvailabilityManager;
  id v23 = 0;
  uint64_t v9 = [(HDFeatureAvailabilityExtension *)v2FeatureAvailabilityManager onboardedCountryCodeSupportedStateWithError:&v23];
  id v10 = v23;
  id v11 = v10;
  if (v6 | v9)
  {
    if (!v6)
    {
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_ERROR)) {
        -[HDHRElectrocardiogramRecordingFeatureAvailabilityManager onboardingEligibilityForCountryCode:error:]();
      }
      id v19 = (id)v9;
      goto LABEL_32;
    }
    if (!v9)
    {
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_ERROR)) {
        -[HDHRElectrocardiogramRecordingFeatureAvailabilityManager onboardingEligibilityForCountryCode:error:]();
      }
      id v19 = (id)v6;
      goto LABEL_32;
    }
    uint64_t v15 = [(id)v6 integerValue];
    uint64_t v16 = [(id)v9 integerValue];
    uint64_t v17 = v16;
    if ((unint64_t)(v15 - 4) >= 2)
    {
      if (v15 == 2)
      {
LABEL_14:
        uint64_t v18 = 2;
        goto LABEL_30;
      }
      if (v15 == 1)
      {
        uint64_t v18 = 1;
        switch(v16)
        {
          case 1:
          case 3:
            goto LABEL_30;
          case 4:
            goto LABEL_28;
          case 5:
            goto LABEL_26;
          default:
            goto LABEL_14;
        }
      }
LABEL_27:
      uint64_t v18 = v17;
      if ((v17 & 0xFFFFFFFFFFFFFFFELL) == 4) {
        goto LABEL_28;
      }
LABEL_30:
      id v21 = NSNumber;
      goto LABEL_31;
    }
    if (v16 == 2)
    {
      uint64_t v18 = 2;
      goto LABEL_30;
    }
    if (v16 != 4)
    {
      uint64_t v17 = v15;
      if (v16 != 5) {
        goto LABEL_27;
      }
LABEL_26:
      uint64_t v17 = 5;
    }
LABEL_28:
    id v21 = NSNumber;
    uint64_t v18 = v17;
LABEL_31:
    id v19 = [v21 numberWithInteger:v18];
LABEL_32:
    id v20 = v19;
    goto LABEL_33;
  }
  if (v7) {
    id v12 = v7;
  }
  else {
    id v12 = v10;
  }
  id v13 = v12;
  BOOL v14 = v13;
  if (v13)
  {
    if (a3) {
      *a3 = v13;
    }
    else {
      _HKLogDroppedError();
    }
  }

  id v20 = 0;
LABEL_33:

  return v20;
}

- (id)isFeatureCapabilitySupportedOnActivePairedDeviceWithError:(id *)a3
{
  v1FeatureAvailabilityManager = self->_v1FeatureAvailabilityManager;
  id v21 = 0;
  uint64_t v6 = [(HDFeatureAvailabilityExtension *)v1FeatureAvailabilityManager isFeatureCapabilitySupportedOnActivePairedDeviceWithError:&v21];
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

    uint64_t v18 = 0;
  }
  else
  {
    uint64_t v15 = NSNumber;
    char v16 = [v6 BOOLValue];
    if (v16) {
      uint64_t v17 = 1;
    }
    else {
      uint64_t v17 = [v9 BOOLValue];
    }
    uint64_t v18 = [v15 numberWithInt:v17];
  }

  return v18;
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
    uint64_t v15 = v14;
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

    uint64_t v15 = 0;
  }

  return v15;
}

- (id)pairedFeatureAttributesWithError:(id *)a3
{
  v1FeatureAvailabilityManager = self->_v1FeatureAvailabilityManager;
  id v25 = 0;
  uint64_t v6 = [(HDFeatureAvailabilityExtension *)v1FeatureAvailabilityManager onboardedCountryCodeSupportedStateWithError:&v25];
  id v7 = v25;
  v2FeatureAvailabilityManager = self->_v2FeatureAvailabilityManager;
  id v24 = 0;
  uint64_t v9 = [(HDFeatureAvailabilityExtension *)v2FeatureAvailabilityManager onboardedCountryCodeSupportedStateWithError:&v24];
  id v10 = v24;
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
    goto LABEL_39;
  }
  uint64_t v15 = [v6 integerValue];
  uint64_t v16 = [v9 integerValue];
  if ((unint64_t)(v15 - 4) < 2)
  {
    if (v16 == 2) {
      uint64_t v17 = 2;
    }
    else {
      uint64_t v17 = v15;
    }
    if (v16 == 5 || v16 == 4) {
      uint64_t v15 = v16;
    }
    else {
      uint64_t v15 = v17;
    }
LABEL_26:
    if ([v9 integerValue] == v15) {
      id v19 = self->_v2FeatureAvailabilityManager;
    }
    else {
      id v19 = self->_v1FeatureAvailabilityManager;
    }
    id v20 = [(HDFeatureAvailabilityExtension *)v19 pairedFeatureAttributesWithError:a3];
    goto LABEL_40;
  }
  if (v15 == 2) {
    goto LABEL_26;
  }
  if (v15 == 1)
  {
    uint64_t v15 = 2;
    switch(v16)
    {
      case 1:
      case 3:
        goto LABEL_32;
      case 4:
      case 5:
        uint64_t v15 = v16;
        goto LABEL_26;
      default:
        goto LABEL_26;
    }
  }
  uint64_t v15 = v16;
  if (v16 != 1) {
    goto LABEL_26;
  }
LABEL_32:
  _HKInitializeLogging();
  id v21 = *MEMORY[0x1E4F29F50];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_ERROR)) {
    -[HDHRElectrocardiogramRecordingFeatureAvailabilityManager pairedFeatureAttributesWithError:](v21);
  }
  objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 11, @"Unable to determine paired feature attributes for ECG without onboarding completion");
  id v22 = (id)objc_claimAutoreleasedReturnValue();
  id v14 = v22;
  if (v22)
  {
    if (a3) {
      *a3 = v22;
    }
    else {
      _HKLogDroppedError();
    }
  }

LABEL_39:
  id v20 = 0;
LABEL_40:

  return v20;
}

- (id)regionAvailabilityWithError:(id *)a3
{
  return (id)[(HDFeatureAvailabilityExtension *)self->_v2FeatureAvailabilityManager regionAvailabilityWithError:a3];
}

- (void)setCurrentOnboardingVersionCompletedForCountryCode:(id)a3 countryCodeProvenance:(int64_t)a4 date:(id)a5 settings:(id)a6 completion:(id)a7
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (![MEMORY[0x1E4F2B860] isAppleInternalInstall])
  {
    BOOL v19 = 0;
LABEL_8:
    objc_initWeak((id *)buf, self);
    v2FeatureAvailabilityManager = self->_v2FeatureAvailabilityManager;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __158__HDHRElectrocardiogramRecordingFeatureAvailabilityManager_setCurrentOnboardingVersionCompletedForCountryCode_countryCodeProvenance_date_settings_completion___block_invoke;
    v21[3] = &unk_1E69B5008;
    objc_copyWeak(v26, (id *)buf);
    id v25 = v15;
    BOOL v27 = v19;
    id v22 = v12;
    v26[1] = (id)a4;
    id v23 = v13;
    id v24 = v14;
    [(HDFeatureAvailabilityExtension *)v2FeatureAvailabilityManager setCurrentOnboardingVersionCompletedForCountryCode:v22 countryCodeProvenance:a4 date:v23 settings:v24 completion:v21];

    objc_destroyWeak(v26);
    objc_destroyWeak((id *)buf);
    goto LABEL_9;
  }
  uint64_t v16 = [(NSUserDefaults *)self->_cacheDefaults objectForKey:*MEMORY[0x1E4F29A88]];
  uint64_t v17 = [v16 unsignedIntegerValue];
  if (v17 != 3)
  {
    BOOL v19 = v17 == 4;

    goto LABEL_8;
  }
  _HKInitializeLogging();
  id v18 = *MEMORY[0x1E4F29F50];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v29 = self;
    _os_log_impl(&dword_1D3AC6000, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@] Force ECG v1 onboarding override is set, skipping attemp to onboard v2", buf, 0xCu);
  }
  [(HDHRElectrocardiogramRecordingFeatureAvailabilityManager *)self _setV1CurrentOnboardingVersionCompletedForCountryCode:v12 countryCodeProvenance:a4 date:v13 settings:v14 completion:v15];

LABEL_9:
}

void __158__HDHRElectrocardiogramRecordingFeatureAvailabilityManager_setCurrentOnboardingVersionCompletedForCountryCode_countryCodeProvenance_date_settings_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (a2)
  {
    id v7 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
  }
  else
  {
    _HKInitializeLogging();
    id v8 = (os_log_t *)MEMORY[0x1E4F29F50];
    uint64_t v9 = *MEMORY[0x1E4F29F50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_ERROR)) {
      __158__HDHRElectrocardiogramRecordingFeatureAvailabilityManager_setCurrentOnboardingVersionCompletedForCountryCode_countryCodeProvenance_date_settings_completion___block_invoke_cold_1((uint64_t)WeakRetained, (uint64_t)v5, v9);
    }
    if (!*(unsigned char *)(a1 + 80))
    {
      [WeakRetained _setV1CurrentOnboardingVersionCompletedForCountryCode:*(void *)(a1 + 32) countryCodeProvenance:*(void *)(a1 + 72) date:*(void *)(a1 + 40) settings:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
      goto LABEL_10;
    }
    _HKInitializeLogging();
    id v10 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138543362;
      id v12 = WeakRetained;
      _os_log_impl(&dword_1D3AC6000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Force ECG v2 onboarding override is set, skipping attemp to onboard v1", (uint8_t *)&v11, 0xCu);
    }
    id v7 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
  }
  v7();
LABEL_10:
}

- (void)saveOnboardingCompletion:(id)a3 settings:(id)a4 completion:(id)a5
{
  id v5 = (void (**)(id, void, void *))a5;
  _HKInitializeLogging();
  uint64_t v6 = (void *)*MEMORY[0x1E4F29F50];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_ERROR)) {
    -[HDHRElectrocardiogramRecordingFeatureAvailabilityManager saveOnboardingCompletion:settings:completion:](v6);
  }
  id v7 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 3, @"Saving HKOnboardingCompletion directly is not supported for ECG's combined feature identifier");
  v5[2](v5, 0, v7);
}

- (void)setFeatureSettingData:(id)a3 forKey:(id)a4 completion:(id)a5
{
  id v6 = a4;
  id v7 = (void (**)(id, void, void *))a5;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_ERROR)) {
    -[HDHRElectrocardiogramRecordingFeatureAvailabilityManager setFeatureSettingData:forKey:completion:]();
  }
  id v8 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 3, @"Cannot set unknown data setting for ECG");
  v7[2](v7, 0, v8);
}

- (void)setFeatureSettingString:(id)a3 forKey:(id)a4 completion:(id)a5
{
  id v6 = a4;
  id v7 = (void (**)(id, void, void *))a5;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_ERROR)) {
    -[HDHRElectrocardiogramRecordingFeatureAvailabilityManager setFeatureSettingString:forKey:completion:]();
  }
  id v8 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 3, @"Cannot set unknown string setting for ECG");
  v7[2](v7, 0, v8);
}

- (void)setFeatureSettingNumber:(id)a3 forKey:(id)a4 completion:(id)a5
{
  id v6 = a4;
  id v7 = (void (**)(id, void, void *))a5;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_ERROR)) {
    -[HDHRElectrocardiogramRecordingFeatureAvailabilityManager setFeatureSettingNumber:forKey:completion:]();
  }
  id v8 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 3, @"Cannot set unknown number setting for ECG");
  v7[2](v7, 0, v8);
}

- (void)removeFeatureSettingValueForKey:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, void, void *))a4;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_ERROR)) {
    -[HDHRElectrocardiogramRecordingFeatureAvailabilityManager removeFeatureSettingValueForKey:completion:]();
  }
  id v7 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 3, @"Cannot remove unknown setting for ECG");
  v6[2](v6, 0, v7);
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
  v29[3] = __Block_byref_object_copy__7;
  v29[4] = __Block_byref_object_dispose__7;
  id v30 = 0;
  dispatch_group_enter(v5);
  v1FeatureAvailabilityManager = self->_v1FeatureAvailabilityManager;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __90__HDHRElectrocardiogramRecordingFeatureAvailabilityManager_resetOnboardingWithCompletion___block_invoke;
  v25[3] = &unk_1E69B4F38;
  BOOL v27 = v31;
  uint64_t v28 = v29;
  id v7 = v5;
  id v26 = v7;
  [(HDFeatureAvailabilityExtension *)v1FeatureAvailabilityManager resetOnboardingWithCompletion:v25];
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  char v24 = 0;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__7;
  void v21[4] = __Block_byref_object_dispose__7;
  id v22 = 0;
  dispatch_group_enter(v7);
  v2FeatureAvailabilityManager = self->_v2FeatureAvailabilityManager;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __90__HDHRElectrocardiogramRecordingFeatureAvailabilityManager_resetOnboardingWithCompletion___block_invoke_2;
  v17[3] = &unk_1E69B4F38;
  BOOL v19 = v23;
  id v20 = v21;
  uint64_t v9 = v7;
  id v18 = v9;
  [(HDFeatureAvailabilityExtension *)v2FeatureAvailabilityManager resetOnboardingWithCompletion:v17];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __90__HDHRElectrocardiogramRecordingFeatureAvailabilityManager_resetOnboardingWithCompletion___block_invoke_3;
  block[3] = &unk_1E69B4F10;
  id v12 = v4;
  uint64_t v13 = v31;
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

void __90__HDHRElectrocardiogramRecordingFeatureAvailabilityManager_resetOnboardingWithCompletion___block_invoke(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), obj);
  id v5 = obj;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __90__HDHRElectrocardiogramRecordingFeatureAvailabilityManager_resetOnboardingWithCompletion___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), obj);
  id v5 = obj;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __90__HDHRElectrocardiogramRecordingFeatureAvailabilityManager_resetOnboardingWithCompletion___block_invoke_3(void *a1)
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

- (void)unregisterObserver:(id)a3
{
}

- (void)featureAvailabilityProvidingDidUpdateOnboardingCompletion:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  id v4 = *MEMORY[0x1E4F29F50];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v8 = self;
    _os_log_impl(&dword_1D3AC6000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notifying observer for didUpdateOnboardingCompletion", buf, 0xCu);
  }
  [(HDHRElectrocardiogramRecordingFeatureAvailabilityManager *)self _observerQueue_updateCachedOnboardingVersionIfNeeded];
  observers = self->_observers;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __118__HDHRElectrocardiogramRecordingFeatureAvailabilityManager_featureAvailabilityProvidingDidUpdateOnboardingCompletion___block_invoke;
  v6[3] = &unk_1E69B4140;
  v6[4] = self;
  [(HKFeatureAvailabilityProvidingObserver *)observers notifyObservers:v6];
}

uint64_t __118__HDHRElectrocardiogramRecordingFeatureAvailabilityManager_featureAvailabilityProvidingDidUpdateOnboardingCompletion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 featureAvailabilityProvidingDidUpdateOnboardingCompletion:*(void *)(a1 + 32)];
}

- (void)featureAvailabilityProvidingDidUpdateSettings:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  id v4 = *MEMORY[0x1E4F29F50];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v8 = self;
    _os_log_impl(&dword_1D3AC6000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notifying observer for didUpdateSettings", buf, 0xCu);
  }
  observers = self->_observers;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __106__HDHRElectrocardiogramRecordingFeatureAvailabilityManager_featureAvailabilityProvidingDidUpdateSettings___block_invoke;
  v6[3] = &unk_1E69B4140;
  v6[4] = self;
  [(HKFeatureAvailabilityProvidingObserver *)observers notifyObservers:v6];
}

void __106__HDHRElectrocardiogramRecordingFeatureAvailabilityManager_featureAvailabilityProvidingDidUpdateSettings___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 featureAvailabilityProvidingDidUpdateSettings:*(void *)(a1 + 32)];
  }
}

- (void)featureAvailabilityProvidingDidUpdatePairedDeviceCapability:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  id v4 = *MEMORY[0x1E4F29F50];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v8 = self;
    _os_log_impl(&dword_1D3AC6000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notifying observer for didUpdatePairedDeviceCapability", buf, 0xCu);
  }
  [(HDHRElectrocardiogramRecordingFeatureAvailabilityManager *)self _observerQueue_updateCachedOnboardingVersionIfNeeded];
  observers = self->_observers;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __120__HDHRElectrocardiogramRecordingFeatureAvailabilityManager_featureAvailabilityProvidingDidUpdatePairedDeviceCapability___block_invoke;
  v6[3] = &unk_1E69B4140;
  v6[4] = self;
  [(HKFeatureAvailabilityProvidingObserver *)observers notifyObservers:v6];
}

void __120__HDHRElectrocardiogramRecordingFeatureAvailabilityManager_featureAvailabilityProvidingDidUpdatePairedDeviceCapability___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 featureAvailabilityProvidingDidUpdatePairedDeviceCapability:*(void *)(a1 + 32)];
  }
}

- (void)featureAvailabilityExtensionDidUpdateRegionAvailability:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  id v4 = *MEMORY[0x1E4F29F50];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v8 = self;
    _os_log_impl(&dword_1D3AC6000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notifying observer for didUpdateRegionAvailability", buf, 0xCu);
  }
  [(HDHRElectrocardiogramRecordingFeatureAvailabilityManager *)self _observerQueue_updateCachedOnboardingVersionIfNeeded];
  observers = self->_observers;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __116__HDHRElectrocardiogramRecordingFeatureAvailabilityManager_featureAvailabilityExtensionDidUpdateRegionAvailability___block_invoke;
  v6[3] = &unk_1E69B4140;
  v6[4] = self;
  [(HKFeatureAvailabilityProvidingObserver *)observers notifyObservers:v6];
}

void __116__HDHRElectrocardiogramRecordingFeatureAvailabilityManager_featureAvailabilityExtensionDidUpdateRegionAvailability___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 conformsToProtocol:&unk_1F2B49A60]) {
    [v3 featureAvailabilityExtensionDidUpdateRegionAvailability:*(void *)(a1 + 32)];
  }
}

- (void)featureAvailabilityExtensionOnboardingCompletionDataDidBecomeAvailable:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  id v4 = *MEMORY[0x1E4F29F50];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v8 = self;
    _os_log_impl(&dword_1D3AC6000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notifying observer for onboardingCompletionDataDidBecomeAvailable", buf, 0xCu);
  }
  if (self->_needsOnboardingVersionCacheUpdate) {
    [(HDHRElectrocardiogramRecordingFeatureAvailabilityManager *)self _observerQueue_updateCachedOnboardingVersionIfNeeded];
  }
  observers = self->_observers;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __131__HDHRElectrocardiogramRecordingFeatureAvailabilityManager_featureAvailabilityExtensionOnboardingCompletionDataDidBecomeAvailable___block_invoke;
  v6[3] = &unk_1E69B4140;
  v6[4] = self;
  [(HKFeatureAvailabilityProvidingObserver *)observers notifyObservers:v6];
}

void __131__HDHRElectrocardiogramRecordingFeatureAvailabilityManager_featureAvailabilityExtensionOnboardingCompletionDataDidBecomeAvailable___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 conformsToProtocol:&unk_1F2B49A60]) {
    [v3 featureAvailabilityExtensionOnboardingCompletionDataDidBecomeAvailable:*(void *)(a1 + 32)];
  }
}

- (void)_setV1CurrentOnboardingVersionCompletedForCountryCode:(id)a3 countryCodeProvenance:(int64_t)a4 date:(id)a5 settings:(id)a6 completion:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a3;
  uint64_t v16 = [(HDHRElectrocardiogramRecordingFeatureAvailabilityManager *)self v1FeatureAvailabilityManager];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __161__HDHRElectrocardiogramRecordingFeatureAvailabilityManager__setV1CurrentOnboardingVersionCompletedForCountryCode_countryCodeProvenance_date_settings_completion___block_invoke;
  v18[3] = &unk_1E69B5030;
  id v19 = v12;
  id v17 = v12;
  [v16 setCurrentOnboardingVersionCompletedForCountryCode:v15 countryCodeProvenance:a4 date:v14 settings:v13 completion:v18];
}

uint64_t __161__HDHRElectrocardiogramRecordingFeatureAvailabilityManager__setV1CurrentOnboardingVersionCompletedForCountryCode_countryCodeProvenance_date_settings_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2) {
    a2 = 1;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v2, a2);
}

- (void)_observerQueue_updateCachedOnboardingVersionIfNeeded
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_observerQueue);
  id v3 = [MEMORY[0x1E4F2B860] sharedBehavior];
  char v4 = [v3 isAppleWatch];

  if ((v4 & 1) == 0)
  {
    id v18 = 0;
    id v5 = [(HDHRElectrocardiogramRecordingFeatureAvailabilityManager *)self featureOnboardingRecordWithError:&v18];
    id v6 = v18;
    if (v5
      && ([v5 onboardingCompletion],
          id v7 = objc_claimAutoreleasedReturnValue(),
          v7,
          v7))
    {
      if ([v5 onboardingState] != 1)
      {
        uint64_t v8 = *MEMORY[0x1E4F29AB0];
        NSInteger v9 = [(NSUserDefaults *)self->_cacheDefaults integerForKey:*MEMORY[0x1E4F29AB0]];
        id v10 = [v5 onboardingCompletion];
        uint64_t v11 = [v10 version];

        if (v9 == v11)
        {
          _HKInitializeLogging();
          id v12 = *MEMORY[0x1E4F29F50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            id v20 = self;
            __int16 v21 = 2048;
            NSInteger v22 = v9;
            _os_log_impl(&dword_1D3AC6000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Current onboarding version matched cached version (%ld)", buf, 0x16u);
          }
          goto LABEL_18;
        }
        [(NSUserDefaults *)self->_cacheDefaults setInteger:v11 forKey:v8];
        _HKInitializeLogging();
        id v14 = *MEMORY[0x1E4F29F50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          id v20 = self;
          __int16 v21 = 2048;
          NSInteger v22 = v11;
          _os_log_impl(&dword_1D3AC6000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] Updated cached onboarding version to %ld", buf, 0x16u);
        }
        id v15 = [MEMORY[0x1E4F2B860] sharedBehavior];
        int v16 = [v15 isCompanionCapable];

        if (v16)
        {
          id v17 = [MEMORY[0x1E4F1CAD0] setWithObject:v8];
          HKSynchronizeNanoPreferencesUserDefaults();
        }
      }
    }
    else
    {
      _HKInitializeLogging();
      id v13 = *MEMORY[0x1E4F29F50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v20 = self;
        _os_log_impl(&dword_1D3AC6000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] No onboarding completions found when trying to update cached onboarding version", buf, 0xCu);
      }
      if (v6)
      {
        if ([v6 code] == 6) {
          self->_needsOnboardingVersionCacheUpdate = 1;
        }
        goto LABEL_18;
      }
    }
    self->_needsOnboardingVersionCacheUpdate = 0;
LABEL_18:
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_v2FeatureAvailabilityManager, 0);
  objc_storeStrong((id *)&self->_v1FeatureAvailabilityManager, 0);
  objc_storeStrong((id *)&self->_observerQueue, 0);
  objc_storeStrong((id *)&self->_cacheDefaults, 0);

  objc_storeStrong((id *)&self->_observers, 0);
}

- (void)featureOnboardingRecordWithError:.cold.1()
{
  OUTLINED_FUNCTION_4();
  id v2 = v1;
  id v3 = (void *)OUTLINED_FUNCTION_2();
  id v4 = OUTLINED_FUNCTION_0_0(v3);
  OUTLINED_FUNCTION_1_0(&dword_1D3AC6000, v5, v6, "[%{public}@] Failed to retrieve onboarding record for ECG2: %{public}@", v7, v8, v9, v10, v11);
}

- (void)featureOnboardingRecordWithError:.cold.2()
{
  OUTLINED_FUNCTION_4();
  id v2 = v1;
  id v3 = (void *)OUTLINED_FUNCTION_2();
  id v4 = OUTLINED_FUNCTION_0_0(v3);
  OUTLINED_FUNCTION_1_0(&dword_1D3AC6000, v5, v6, "[%{public}@] Failed to retrieve onboarding record for ECG1: %{public}@", v7, v8, v9, v10, v11);
}

- (void)onboardingEligibilityForCountryCode:error:.cold.1()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_2_3(&dword_1D3AC6000, v0, v1, "Error checking onboarded country code supported state for ECG 1.0, returning supported state for 2.0: %{public}@", v2, v3, v4, v5, v6);
}

- (void)onboardingEligibilityForCountryCode:error:.cold.2()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_2_3(&dword_1D3AC6000, v0, v1, "Error checking onboarded country code supported state for ECG 2.0, returning supported state for 1.0: %{public}@", v2, v3, v4, v5, v6);
}

- (void)pairedFeatureAttributesWithError:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1D3AC6000, log, OS_LOG_TYPE_ERROR, "Unable to determine paired feature attributes for ECG without onboarding completion", v1, 2u);
}

void __158__HDHRElectrocardiogramRecordingFeatureAvailabilityManager_setCurrentOnboardingVersionCompletedForCountryCode_countryCodeProvenance_date_settings_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1D3AC6000, log, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to complete ECG 2.0 onboarding with error: %{public}@", (uint8_t *)&v3, 0x16u);
}

- (void)saveOnboardingCompletion:(void *)a1 settings:completion:.cold.1(void *a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = a1;
  objc_opt_class();
  OUTLINED_FUNCTION_5_0();
  id v3 = v2;
  _os_log_error_impl(&dword_1D3AC6000, v1, OS_LOG_TYPE_ERROR, "[%{public}@] Saving HKOnboardingCompletion directly is not supported for ECG's combined feature identifier", v4, 0xCu);
}

- (void)setFeatureSettingData:forKey:completion:.cold.1()
{
  OUTLINED_FUNCTION_4();
  id v2 = v1;
  id v3 = (void *)OUTLINED_FUNCTION_2();
  id v4 = OUTLINED_FUNCTION_0_0(v3);
  OUTLINED_FUNCTION_1_0(&dword_1D3AC6000, v5, v6, "[%{public}@] Unknown data setting for ECG: %{public}@", v7, v8, v9, v10, v11);
}

- (void)setFeatureSettingString:forKey:completion:.cold.1()
{
  OUTLINED_FUNCTION_4();
  id v2 = v1;
  id v3 = (void *)OUTLINED_FUNCTION_2();
  id v4 = OUTLINED_FUNCTION_0_0(v3);
  OUTLINED_FUNCTION_1_0(&dword_1D3AC6000, v5, v6, "[%{public}@] Unknown string setting for ECG: %{public}@", v7, v8, v9, v10, v11);
}

- (void)setFeatureSettingNumber:forKey:completion:.cold.1()
{
  OUTLINED_FUNCTION_4();
  id v2 = v1;
  id v3 = (void *)OUTLINED_FUNCTION_2();
  id v4 = OUTLINED_FUNCTION_0_0(v3);
  OUTLINED_FUNCTION_1_0(&dword_1D3AC6000, v5, v6, "[%{public}@] Unknown number setting for ECG: %{public}@", v7, v8, v9, v10, v11);
}

- (void)removeFeatureSettingValueForKey:completion:.cold.1()
{
  OUTLINED_FUNCTION_4();
  id v2 = v1;
  id v3 = (void *)OUTLINED_FUNCTION_2();
  id v4 = OUTLINED_FUNCTION_0_0(v3);
  OUTLINED_FUNCTION_1_0(&dword_1D3AC6000, v5, v6, "[%{public}@] Unknown setting for ECG: %{public}@", v7, v8, v9, v10, v11);
}

@end