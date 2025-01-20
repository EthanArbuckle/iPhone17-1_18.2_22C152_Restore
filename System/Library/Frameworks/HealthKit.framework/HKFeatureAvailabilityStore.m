@interface HKFeatureAvailabilityStore
+ (id)taskIdentifier;
- (BOOL)_synchronouslyStartObservingWithError:(id *)a3;
- (HKFeatureAvailabilityStore)initWithFeatureIdentifier:(id)a3 healthStore:(id)a4;
- (NSString)description;
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
- (void)_handleAutomaticProxyReconnection;
- (void)_notifyObserversForOnboardingCompletionUpdate;
- (void)_notifyObserversForPairedDeviceCapabilityUpdate;
- (void)_notifyObserversForSettingsUpdate;
- (void)_startObservingWithActivationHandler:(id)a3;
- (void)client_featureAvailabilityExtensionDidUpdateOnboardingCompletion;
- (void)client_featureAvailabilityExtensionDidUpdatePairedDeviceCapability;
- (void)client_featureAvailabilityProvidingDidUpdateSettings;
- (void)getFeatureOnboardingRecordWithCompletion:(id)a3;
- (void)isCurrentOnboardingVersionCompletedWithCompletion:(id)a3;
- (void)registerObserver:(id)a3 queue:(id)a4;
- (void)registerObserver:(id)a3 queue:(id)a4 activationHandler:(id)a5;
- (void)removeFeatureSettingValueForKey:(id)a3 completion:(id)a4;
- (void)resetOnboardingWithCompletion:(id)a3;
- (void)saveOnboardingCompletion:(id)a3 settings:(id)a4 completion:(id)a5;
- (void)setCurrentOnboardingVersionCompletedForCountryCode:(id)a3 countryCodeProvenance:(int64_t)a4 date:(id)a5 settings:(id)a6 completion:(id)a7;
- (void)setFeatureSettingData:(id)a3 forKey:(id)a4 completion:(id)a5;
- (void)setFeatureSettingNumber:(id)a3 forKey:(id)a4 completion:(id)a5;
- (void)setFeatureSettingString:(id)a3 forKey:(id)a4 completion:(id)a5;
- (void)unregisterObserver:(id)a3;
@end

@implementation HKFeatureAvailabilityStore

- (HKFeatureAvailabilityStore)initWithFeatureIdentifier:(id)a3 healthStore:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)HKFeatureAvailabilityStore;
  v9 = [(HKFeatureAvailabilityStore *)&v23 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_featureIdentifier, a3);
    v11 = [HKObserverSet alloc];
    v12 = [NSString stringWithFormat:@"HKFeatureAvailabilityStore:%@", v7];
    v13 = HKLogInfrastructure();
    uint64_t v14 = [(HKObserverSet *)v11 initWithName:v12 loggingCategory:v13];
    observers = v10->_observers;
    v10->_observers = (HKObserverSet *)v14;

    v16 = [HKTaskServerProxyProvider alloc];
    v17 = [(id)objc_opt_class() taskIdentifier];
    v18 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v19 = [(HKTaskServerProxyProvider *)v16 initWithHealthStore:v8 taskIdentifier:v17 exportedObject:v10 taskUUID:v18];
    proxyProvider = v10->_proxyProvider;
    v10->_proxyProvider = (HKTaskServerProxyProvider *)v19;

    [(HKProxyProvider *)v10->_proxyProvider setShouldRetryOnInterruption:0];
    v21 = [[HKFeatureAvailabilityStoreServerConfiguration alloc] initWithFeatureIdentifier:v7];
    [(HKTaskServerProxyProvider *)v10->_proxyProvider setTaskConfiguration:v21];
  }
  return v10;
}

+ (id)taskIdentifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (NSString)featureIdentifier
{
  return self->_featureIdentifier;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"%@:%@", objc_opt_class(), self->_featureIdentifier];
}

- (id)featureOnboardingRecordWithError:(id *)a3
{
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__43;
  v21 = __Block_byref_object_dispose__43;
  id v22 = 0;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__43;
  v15 = __Block_byref_object_dispose__43;
  id v16 = 0;
  proxyProvider = self->_proxyProvider;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __63__HKFeatureAvailabilityStore_featureOnboardingRecordWithError___block_invoke;
  v10[3] = &unk_1E58C63F8;
  v10[4] = &v17;
  v10[5] = &v11;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __63__HKFeatureAvailabilityStore_featureOnboardingRecordWithError___block_invoke_3;
  v9[3] = &unk_1E58BDBD8;
  v9[4] = &v11;
  [(HKProxyProvider *)proxyProvider getSynchronousProxyWithHandler:v10 errorHandler:v9];
  id v5 = (id)v12[5];
  v6 = v5;
  if (v5)
  {
    if (a3) {
      *a3 = v5;
    }
    else {
      _HKLogDroppedError(v5);
    }
  }

  id v7 = (id)v18[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);

  return v7;
}

uint64_t __63__HKFeatureAvailabilityStore_featureOnboardingRecordWithError___block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __63__HKFeatureAvailabilityStore_featureOnboardingRecordWithError___block_invoke_2;
  v3[3] = &unk_1E58C63D0;
  long long v4 = *(_OWORD *)(a1 + 32);
  return objc_msgSend(a2, "remote_getFeatureOnboardingRecordWithCompletion:", v3);
}

void __63__HKFeatureAvailabilityStore_featureOnboardingRecordWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void __63__HKFeatureAvailabilityStore_featureOnboardingRecordWithError___block_invoke_3(uint64_t a1, void *a2)
{
}

- (void)getFeatureOnboardingRecordWithCompletion:(id)a3
{
  long long v4 = [(HKProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a3];
  proxyProvider = self->_proxyProvider;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __71__HKFeatureAvailabilityStore_getFeatureOnboardingRecordWithCompletion___block_invoke;
  v9[3] = &unk_1E58C6420;
  id v10 = v4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__HKFeatureAvailabilityStore_getFeatureOnboardingRecordWithCompletion___block_invoke_2;
  v7[3] = &unk_1E58BBD88;
  id v8 = v10;
  id v6 = v10;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v9 errorHandler:v7];
}

uint64_t __71__HKFeatureAvailabilityStore_getFeatureOnboardingRecordWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_getFeatureOnboardingRecordWithCompletion:", *(void *)(a1 + 32));
}

uint64_t __71__HKFeatureAvailabilityStore_getFeatureOnboardingRecordWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)isFeatureCapabilitySupportedOnActivePairedDeviceWithError:(id *)a3
{
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__43;
  v21 = __Block_byref_object_dispose__43;
  id v22 = 0;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__43;
  v15 = __Block_byref_object_dispose__43;
  id v16 = 0;
  proxyProvider = self->_proxyProvider;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __88__HKFeatureAvailabilityStore_isFeatureCapabilitySupportedOnActivePairedDeviceWithError___block_invoke;
  v10[3] = &unk_1E58C63F8;
  v10[4] = &v17;
  v10[5] = &v11;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __88__HKFeatureAvailabilityStore_isFeatureCapabilitySupportedOnActivePairedDeviceWithError___block_invoke_3;
  v9[3] = &unk_1E58BDBD8;
  void v9[4] = &v11;
  [(HKProxyProvider *)proxyProvider getSynchronousProxyWithHandler:v10 errorHandler:v9];
  id v5 = (id)v12[5];
  id v6 = v5;
  if (v5)
  {
    if (a3) {
      *a3 = v5;
    }
    else {
      _HKLogDroppedError(v5);
    }
  }

  id v7 = (id)v18[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);

  return v7;
}

uint64_t __88__HKFeatureAvailabilityStore_isFeatureCapabilitySupportedOnActivePairedDeviceWithError___block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __88__HKFeatureAvailabilityStore_isFeatureCapabilitySupportedOnActivePairedDeviceWithError___block_invoke_2;
  v3[3] = &unk_1E58C5318;
  long long v4 = *(_OWORD *)(a1 + 32);
  return objc_msgSend(a2, "remote_getIsFeatureCapabilitySupportedOnActivePairedDeviceWithCompletion:", v3);
}

void __88__HKFeatureAvailabilityStore_isFeatureCapabilitySupportedOnActivePairedDeviceWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void __88__HKFeatureAvailabilityStore_isFeatureCapabilitySupportedOnActivePairedDeviceWithError___block_invoke_3(uint64_t a1, void *a2)
{
}

- (id)canCompleteOnboardingForCountryCode:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__43;
  v28 = __Block_byref_object_dispose__43;
  id v29 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__43;
  id v22 = __Block_byref_object_dispose__43;
  id v23 = 0;
  proxyProvider = self->_proxyProvider;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __72__HKFeatureAvailabilityStore_canCompleteOnboardingForCountryCode_error___block_invoke;
  v14[3] = &unk_1E58C6448;
  id v8 = v6;
  id v15 = v8;
  id v16 = &v24;
  uint64_t v17 = &v18;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __72__HKFeatureAvailabilityStore_canCompleteOnboardingForCountryCode_error___block_invoke_3;
  v13[3] = &unk_1E58BDBD8;
  v13[4] = &v18;
  [(HKProxyProvider *)proxyProvider getSynchronousProxyWithHandler:v14 errorHandler:v13];
  id v9 = (id)v19[5];
  id v10 = v9;
  if (v9)
  {
    if (a4) {
      *a4 = v9;
    }
    else {
      _HKLogDroppedError(v9);
    }
  }

  id v11 = (id)v25[5];
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);

  return v11;
}

uint64_t __72__HKFeatureAvailabilityStore_canCompleteOnboardingForCountryCode_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __72__HKFeatureAvailabilityStore_canCompleteOnboardingForCountryCode_error___block_invoke_2;
  v4[3] = &unk_1E58C5318;
  long long v5 = *(_OWORD *)(a1 + 40);
  return objc_msgSend(a2, "remote_canCompleteOnboardingForCountryCode:completion:", v2, v4);
}

void __72__HKFeatureAvailabilityStore_canCompleteOnboardingForCountryCode_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void __72__HKFeatureAvailabilityStore_canCompleteOnboardingForCountryCode_error___block_invoke_3(uint64_t a1, void *a2)
{
}

- (id)onboardingEligibilityForCountryCode:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__43;
  v28 = __Block_byref_object_dispose__43;
  id v29 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__43;
  id v22 = __Block_byref_object_dispose__43;
  id v23 = 0;
  proxyProvider = self->_proxyProvider;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __72__HKFeatureAvailabilityStore_onboardingEligibilityForCountryCode_error___block_invoke;
  v14[3] = &unk_1E58C6448;
  id v8 = v6;
  id v15 = v8;
  id v16 = &v24;
  uint64_t v17 = &v18;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __72__HKFeatureAvailabilityStore_onboardingEligibilityForCountryCode_error___block_invoke_3;
  v13[3] = &unk_1E58BDBD8;
  v13[4] = &v18;
  [(HKProxyProvider *)proxyProvider getSynchronousProxyWithHandler:v14 errorHandler:v13];
  id v9 = (id)v19[5];
  id v10 = v9;
  if (v9)
  {
    if (a4) {
      *a4 = v9;
    }
    else {
      _HKLogDroppedError(v9);
    }
  }

  id v11 = (id)v25[5];
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);

  return v11;
}

uint64_t __72__HKFeatureAvailabilityStore_onboardingEligibilityForCountryCode_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __72__HKFeatureAvailabilityStore_onboardingEligibilityForCountryCode_error___block_invoke_2;
  v4[3] = &unk_1E58C6470;
  long long v5 = *(_OWORD *)(a1 + 40);
  return objc_msgSend(a2, "remote_onboardingEligibilityForCountryCode:completion:", v2, v4);
}

void __72__HKFeatureAvailabilityStore_onboardingEligibilityForCountryCode_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void __72__HKFeatureAvailabilityStore_onboardingEligibilityForCountryCode_error___block_invoke_3(uint64_t a1, void *a2)
{
}

- (id)onboardedCountryCodeSupportedStateWithError:(id *)a3
{
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__43;
  v21 = __Block_byref_object_dispose__43;
  id v22 = 0;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__43;
  id v15 = __Block_byref_object_dispose__43;
  id v16 = 0;
  proxyProvider = self->_proxyProvider;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __74__HKFeatureAvailabilityStore_onboardedCountryCodeSupportedStateWithError___block_invoke;
  v10[3] = &unk_1E58C63F8;
  v10[4] = &v17;
  v10[5] = &v11;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __74__HKFeatureAvailabilityStore_onboardedCountryCodeSupportedStateWithError___block_invoke_3;
  v9[3] = &unk_1E58BDBD8;
  void v9[4] = &v11;
  [(HKProxyProvider *)proxyProvider getSynchronousProxyWithHandler:v10 errorHandler:v9];
  id v5 = (id)v12[5];
  id v6 = v5;
  if (v5)
  {
    if (a3) {
      *a3 = v5;
    }
    else {
      _HKLogDroppedError(v5);
    }
  }

  id v7 = (id)v18[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);

  return v7;
}

uint64_t __74__HKFeatureAvailabilityStore_onboardedCountryCodeSupportedStateWithError___block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __74__HKFeatureAvailabilityStore_onboardedCountryCodeSupportedStateWithError___block_invoke_2;
  v3[3] = &unk_1E58C5318;
  long long v4 = *(_OWORD *)(a1 + 32);
  return objc_msgSend(a2, "remote_onboardedCountryCodeSupportedStateWithCompletion:", v3);
}

void __74__HKFeatureAvailabilityStore_onboardedCountryCodeSupportedStateWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void __74__HKFeatureAvailabilityStore_onboardedCountryCodeSupportedStateWithError___block_invoke_3(uint64_t a1, void *a2)
{
}

- (id)isCurrentOnboardingVersionCompletedWithError:(id *)a3
{
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__43;
  v21 = __Block_byref_object_dispose__43;
  id v22 = 0;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__43;
  id v15 = __Block_byref_object_dispose__43;
  id v16 = 0;
  proxyProvider = self->_proxyProvider;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __75__HKFeatureAvailabilityStore_isCurrentOnboardingVersionCompletedWithError___block_invoke;
  v10[3] = &unk_1E58C63F8;
  v10[4] = &v17;
  v10[5] = &v11;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __75__HKFeatureAvailabilityStore_isCurrentOnboardingVersionCompletedWithError___block_invoke_3;
  v9[3] = &unk_1E58BDBD8;
  void v9[4] = &v11;
  [(HKProxyProvider *)proxyProvider getSynchronousProxyWithHandler:v10 errorHandler:v9];
  id v5 = (id)v12[5];
  id v6 = v5;
  if (v5)
  {
    if (a3) {
      *a3 = v5;
    }
    else {
      _HKLogDroppedError(v5);
    }
  }

  id v7 = (id)v18[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);

  return v7;
}

uint64_t __75__HKFeatureAvailabilityStore_isCurrentOnboardingVersionCompletedWithError___block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __75__HKFeatureAvailabilityStore_isCurrentOnboardingVersionCompletedWithError___block_invoke_2;
  v3[3] = &unk_1E58C5318;
  long long v4 = *(_OWORD *)(a1 + 32);
  return objc_msgSend(a2, "remote_getIsCurrentOnboardingVersionCompletedWithCompletion:", v3);
}

void __75__HKFeatureAvailabilityStore_isCurrentOnboardingVersionCompletedWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void __75__HKFeatureAvailabilityStore_isCurrentOnboardingVersionCompletedWithError___block_invoke_3(uint64_t a1, void *a2)
{
}

- (void)isCurrentOnboardingVersionCompletedWithCompletion:(id)a3
{
  long long v4 = [(HKProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a3];
  proxyProvider = self->_proxyProvider;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __80__HKFeatureAvailabilityStore_isCurrentOnboardingVersionCompletedWithCompletion___block_invoke;
  v9[3] = &unk_1E58C6420;
  id v10 = v4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __80__HKFeatureAvailabilityStore_isCurrentOnboardingVersionCompletedWithCompletion___block_invoke_2;
  v7[3] = &unk_1E58BBD88;
  id v8 = v10;
  id v6 = v10;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v9 errorHandler:v7];
}

uint64_t __80__HKFeatureAvailabilityStore_isCurrentOnboardingVersionCompletedWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_getIsCurrentOnboardingVersionCompletedWithCompletion:", *(void *)(a1 + 32));
}

uint64_t __80__HKFeatureAvailabilityStore_isCurrentOnboardingVersionCompletedWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)earliestDateLowestOnboardingVersionCompletedWithError:(id *)a3
{
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__43;
  v21 = __Block_byref_object_dispose__43;
  id v22 = 0;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__43;
  id v15 = __Block_byref_object_dispose__43;
  id v16 = 0;
  proxyProvider = self->_proxyProvider;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __84__HKFeatureAvailabilityStore_earliestDateLowestOnboardingVersionCompletedWithError___block_invoke;
  v10[3] = &unk_1E58C63F8;
  v10[4] = &v17;
  v10[5] = &v11;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __84__HKFeatureAvailabilityStore_earliestDateLowestOnboardingVersionCompletedWithError___block_invoke_3;
  v9[3] = &unk_1E58BDBD8;
  void v9[4] = &v11;
  [(HKProxyProvider *)proxyProvider getSynchronousProxyWithHandler:v10 errorHandler:v9];
  id v5 = (id)v12[5];
  id v6 = v5;
  if (v5)
  {
    if (a3) {
      *a3 = v5;
    }
    else {
      _HKLogDroppedError(v5);
    }
  }

  id v7 = (id)v18[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);

  return v7;
}

uint64_t __84__HKFeatureAvailabilityStore_earliestDateLowestOnboardingVersionCompletedWithError___block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __84__HKFeatureAvailabilityStore_earliestDateLowestOnboardingVersionCompletedWithError___block_invoke_2;
  v3[3] = &unk_1E58BE078;
  long long v4 = *(_OWORD *)(a1 + 32);
  return objc_msgSend(a2, "remote_earliestDateLowestOnboardingVersionCompletedWithCompletion:", v3);
}

void __84__HKFeatureAvailabilityStore_earliestDateLowestOnboardingVersionCompletedWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void __84__HKFeatureAvailabilityStore_earliestDateLowestOnboardingVersionCompletedWithError___block_invoke_3(uint64_t a1, void *a2)
{
}

- (id)pairedFeatureAttributesWithError:(id *)a3
{
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__43;
  v21 = __Block_byref_object_dispose__43;
  id v22 = 0;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__43;
  id v15 = __Block_byref_object_dispose__43;
  id v16 = 0;
  proxyProvider = self->_proxyProvider;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __63__HKFeatureAvailabilityStore_pairedFeatureAttributesWithError___block_invoke;
  v10[3] = &unk_1E58C63F8;
  v10[4] = &v17;
  v10[5] = &v11;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __63__HKFeatureAvailabilityStore_pairedFeatureAttributesWithError___block_invoke_3;
  v9[3] = &unk_1E58BDBD8;
  void v9[4] = &v11;
  [(HKProxyProvider *)proxyProvider getSynchronousProxyWithHandler:v10 errorHandler:v9];
  id v5 = (id)v12[5];
  id v6 = v5;
  if (v5)
  {
    if (a3) {
      *a3 = v5;
    }
    else {
      _HKLogDroppedError(v5);
    }
  }

  id v7 = (id)v18[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);

  return v7;
}

uint64_t __63__HKFeatureAvailabilityStore_pairedFeatureAttributesWithError___block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __63__HKFeatureAvailabilityStore_pairedFeatureAttributesWithError___block_invoke_2;
  v3[3] = &unk_1E58C6498;
  long long v4 = *(_OWORD *)(a1 + 32);
  return objc_msgSend(a2, "remote_getPairedFeatureAttributesWithCompletion:", v3);
}

void __63__HKFeatureAvailabilityStore_pairedFeatureAttributesWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void __63__HKFeatureAvailabilityStore_pairedFeatureAttributesWithError___block_invoke_3(uint64_t a1, void *a2)
{
}

- (id)featureAvailabilityRequirementsWithError:(id *)a3
{
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__43;
  v21 = __Block_byref_object_dispose__43;
  id v22 = 0;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__43;
  id v15 = __Block_byref_object_dispose__43;
  id v16 = 0;
  proxyProvider = self->_proxyProvider;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __71__HKFeatureAvailabilityStore_featureAvailabilityRequirementsWithError___block_invoke;
  v10[3] = &unk_1E58C63F8;
  v10[4] = &v17;
  v10[5] = &v11;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __71__HKFeatureAvailabilityStore_featureAvailabilityRequirementsWithError___block_invoke_3;
  v9[3] = &unk_1E58BDBD8;
  void v9[4] = &v11;
  [(HKProxyProvider *)proxyProvider getSynchronousProxyWithHandler:v10 errorHandler:v9];
  id v5 = (id)v12[5];
  id v6 = v5;
  if (v5)
  {
    if (a3) {
      *a3 = v5;
    }
    else {
      _HKLogDroppedError(v5);
    }
  }

  id v7 = (id)v18[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);

  return v7;
}

uint64_t __71__HKFeatureAvailabilityStore_featureAvailabilityRequirementsWithError___block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __71__HKFeatureAvailabilityStore_featureAvailabilityRequirementsWithError___block_invoke_2;
  v3[3] = &unk_1E58C64C0;
  long long v4 = *(_OWORD *)(a1 + 32);
  return objc_msgSend(a2, "remote_getFeatureAvailabilityRequirementsWithCompletion:", v3);
}

void __71__HKFeatureAvailabilityStore_featureAvailabilityRequirementsWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void __71__HKFeatureAvailabilityStore_featureAvailabilityRequirementsWithError___block_invoke_3(uint64_t a1, void *a2)
{
}

- (id)regionAvailabilityWithError:(id *)a3
{
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__43;
  v21 = __Block_byref_object_dispose__43;
  id v22 = 0;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__43;
  id v15 = __Block_byref_object_dispose__43;
  id v16 = 0;
  proxyProvider = self->_proxyProvider;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __58__HKFeatureAvailabilityStore_regionAvailabilityWithError___block_invoke;
  v10[3] = &unk_1E58C63F8;
  v10[4] = &v17;
  v10[5] = &v11;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__HKFeatureAvailabilityStore_regionAvailabilityWithError___block_invoke_3;
  v9[3] = &unk_1E58BDBD8;
  void v9[4] = &v11;
  [(HKProxyProvider *)proxyProvider getSynchronousProxyWithHandler:v10 errorHandler:v9];
  id v5 = (id)v12[5];
  id v6 = v5;
  if (v5)
  {
    if (a3) {
      *a3 = v5;
    }
    else {
      _HKLogDroppedError(v5);
    }
  }

  id v7 = (id)v18[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);

  return v7;
}

uint64_t __58__HKFeatureAvailabilityStore_regionAvailabilityWithError___block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __58__HKFeatureAvailabilityStore_regionAvailabilityWithError___block_invoke_2;
  v3[3] = &unk_1E58C64E8;
  long long v4 = *(_OWORD *)(a1 + 32);
  return objc_msgSend(a2, "remote_getRegionAvailabilityWithCompletion:", v3);
}

void __58__HKFeatureAvailabilityStore_regionAvailabilityWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void __58__HKFeatureAvailabilityStore_regionAvailabilityWithError___block_invoke_3(uint64_t a1, void *a2)
{
}

- (void)registerObserver:(id)a3 queue:(id)a4
{
}

- (void)registerObserver:(id)a3 queue:(id)a4 activationHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a5];
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  observers = self->_observers;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __71__HKFeatureAvailabilityStore_registerObserver_queue_activationHandler___block_invoke;
  v13[3] = &unk_1E58C5688;
  id v15 = &v16;
  v13[4] = self;
  id v12 = v10;
  id v14 = v12;
  [(HKObserverSet *)observers registerObserver:v8 queue:v9 runIfFirstObserver:v13];
  if (!*((unsigned char *)v17 + 24)) {
    (*((void (**)(id, uint64_t, void))v12 + 2))(v12, 1, 0);
  }

  _Block_object_dispose(&v16, 8);
}

void __71__HKFeatureAvailabilityStore_registerObserver_queue_activationHandler___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  objc_initWeak(&location, *(id *)(a1 + 32));
  uint64_t v2 = MEMORY[0x1E4F143A8];
  uint64_t v3 = 3221225472;
  long long v4 = __71__HKFeatureAvailabilityStore_registerObserver_queue_activationHandler___block_invoke_2;
  id v5 = &unk_1E58BE428;
  objc_copyWeak(&v6, &location);
  [*(id *)(*(void *)(a1 + 32) + 24) setAutomaticProxyReconnectionHandler:&v2];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "setShouldRetryOnInterruption:", 1, v2, v3, v4, v5);
  [*(id *)(a1 + 32) _startObservingWithActivationHandler:*(void *)(a1 + 40)];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __71__HKFeatureAvailabilityStore_registerObserver_queue_activationHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleAutomaticProxyReconnection];
}

- (void)unregisterObserver:(id)a3
{
  observers = self->_observers;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __49__HKFeatureAvailabilityStore_unregisterObserver___block_invoke;
  v4[3] = &unk_1E58BBA00;
  void v4[4] = self;
  [(HKObserverSet *)observers unregisterObserver:a3 runIfLastObserver:v4];
}

uint64_t __49__HKFeatureAvailabilityStore_unregisterObserver___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 24) setAutomaticProxyReconnectionHandler:0];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 24);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__HKFeatureAvailabilityStore_unregisterObserver___block_invoke_3;
  v5[3] = &unk_1E58BBCC0;
  v5[4] = v2;
  return [v3 fetchProxyWithHandler:&__block_literal_global_99 errorHandler:v5];
}

uint64_t __49__HKFeatureAvailabilityStore_unregisterObserver___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_stopObservingChanges");
}

void __49__HKFeatureAvailabilityStore_unregisterObserver___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  long long v4 = HKLogInfrastructure();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __70__HKFeatureAvailabilityHealthDataRequirementStore_unregisterObserver___block_invoke_2_cold_1(a1);
  }
}

- (void)_startObservingWithActivationHandler:(id)a3
{
  id v4 = a3;
  proxyProvider = self->_proxyProvider;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __67__HKFeatureAvailabilityStore__startObservingWithActivationHandler___block_invoke;
  v9[3] = &unk_1E58C6420;
  id v10 = v4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__HKFeatureAvailabilityStore__startObservingWithActivationHandler___block_invoke_2;
  v7[3] = &unk_1E58BBC48;
  void v7[4] = self;
  id v8 = v10;
  id v6 = v10;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v9 errorHandler:v7];
}

uint64_t __67__HKFeatureAvailabilityStore__startObservingWithActivationHandler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_startObservingChangesWithCompletion:", *(void *)(a1 + 32));
}

void __67__HKFeatureAvailabilityStore__startObservingWithActivationHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  id v4 = HKLogInfrastructure();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __97__HKFeatureAvailabilityHealthDataRequirementStore__startObservingRequirements_activationHandler___block_invoke_2_cold_1(a1);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (BOOL)_synchronouslyStartObservingWithError:(id *)a3
{
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__43;
  id v15 = __Block_byref_object_dispose__43;
  id v16 = 0;
  proxyProvider = self->_proxyProvider;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __68__HKFeatureAvailabilityStore__synchronouslyStartObservingWithError___block_invoke;
  v10[3] = &unk_1E58C63F8;
  v10[4] = &v17;
  v10[5] = &v11;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __68__HKFeatureAvailabilityStore__synchronouslyStartObservingWithError___block_invoke_3;
  v9[3] = &unk_1E58BDB60;
  void v9[4] = self;
  void v9[5] = &v11;
  [(HKProxyProvider *)proxyProvider getSynchronousProxyWithHandler:v10 errorHandler:v9];
  id v5 = (id)v12[5];
  id v6 = v5;
  if (v5)
  {
    if (a3) {
      *a3 = v5;
    }
    else {
      _HKLogDroppedError(v5);
    }
  }

  char v7 = *((unsigned char *)v18 + 24);
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v7;
}

uint64_t __68__HKFeatureAvailabilityStore__synchronouslyStartObservingWithError___block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __68__HKFeatureAvailabilityStore__synchronouslyStartObservingWithError___block_invoke_2;
  v3[3] = &unk_1E58BE050;
  long long v4 = *(_OWORD *)(a1 + 32);
  return objc_msgSend(a2, "remote_startObservingChangesWithCompletion:", v3);
}

void __68__HKFeatureAvailabilityStore__synchronouslyStartObservingWithError___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

void __68__HKFeatureAvailabilityStore__synchronouslyStartObservingWithError___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  long long v4 = HKLogInfrastructure();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __89__HKFeatureAvailabilityHealthDataRequirementStore__synchronouslyStartObservingWithError___block_invoke_3_cold_1(a1, v4);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

- (void)_handleAutomaticProxyReconnection
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v7 = 0;
  BOOL v3 = [(HKFeatureAvailabilityStore *)self _synchronouslyStartObservingWithError:&v7];
  id v4 = v7;
  _HKInitializeLogging();
  uint64_t v5 = HKLogInfrastructure();
  id v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v9 = self;
      _os_log_impl(&dword_19C023000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received notification of successful server reconnection", buf, 0xCu);
    }

    [(HKFeatureAvailabilityStore *)self _notifyObserversForOnboardingCompletionUpdate];
    [(HKFeatureAvailabilityStore *)self _notifyObserversForPairedDeviceCapabilityUpdate];
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[HKFeatureAvailabilityHealthDataRequirementStore _handleAutomaticProxyReconnection]((uint64_t)self);
    }
  }
}

- (void)client_featureAvailabilityExtensionDidUpdateOnboardingCompletion
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  BOOL v3 = HKLogInfrastructure();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543362;
    uint64_t v5 = self;
    _os_log_impl(&dword_19C023000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received server notification of onboarding completion update", (uint8_t *)&v4, 0xCu);
  }

  [(HKFeatureAvailabilityStore *)self _notifyObserversForOnboardingCompletionUpdate];
}

- (void)client_featureAvailabilityExtensionDidUpdatePairedDeviceCapability
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  BOOL v3 = HKLogInfrastructure();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543362;
    uint64_t v5 = self;
    _os_log_impl(&dword_19C023000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received server notification of paired device capability update", (uint8_t *)&v4, 0xCu);
  }

  [(HKFeatureAvailabilityStore *)self _notifyObserversForPairedDeviceCapabilityUpdate];
}

- (void)client_featureAvailabilityProvidingDidUpdateSettings
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  BOOL v3 = HKLogInfrastructure();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543362;
    uint64_t v5 = self;
    _os_log_impl(&dword_19C023000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received server notification of settings update", (uint8_t *)&v4, 0xCu);
  }

  [(HKFeatureAvailabilityStore *)self _notifyObserversForSettingsUpdate];
}

- (void)_notifyObserversForOnboardingCompletionUpdate
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  BOOL v3 = HKLogInfrastructure();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HKObserverSet count](self->_observers, "count"));
    *(_DWORD *)buf = 138543618;
    id v8 = self;
    __int16 v9 = 2112;
    uint64_t v10 = v4;
    _os_log_impl(&dword_19C023000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notifying %@ observers of onboarding completion update", buf, 0x16u);
  }
  observers = self->_observers;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __75__HKFeatureAvailabilityStore__notifyObserversForOnboardingCompletionUpdate__block_invoke;
  v6[3] = &unk_1E58C6530;
  v6[4] = self;
  [(HKObserverSet *)observers notifyObservers:v6];
}

uint64_t __75__HKFeatureAvailabilityStore__notifyObserversForOnboardingCompletionUpdate__block_invoke(uint64_t a1, void *a2)
{
  return [a2 featureAvailabilityProvidingDidUpdateOnboardingCompletion:*(void *)(a1 + 32)];
}

- (void)_notifyObserversForPairedDeviceCapabilityUpdate
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  BOOL v3 = HKLogInfrastructure();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HKObserverSet count](self->_observers, "count"));
    *(_DWORD *)buf = 138543618;
    id v8 = self;
    __int16 v9 = 2112;
    uint64_t v10 = v4;
    _os_log_impl(&dword_19C023000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notifying %@ observers of paired device capability update", buf, 0x16u);
  }
  observers = self->_observers;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __77__HKFeatureAvailabilityStore__notifyObserversForPairedDeviceCapabilityUpdate__block_invoke;
  v6[3] = &unk_1E58C6530;
  v6[4] = self;
  [(HKObserverSet *)observers notifyObservers:v6];
}

void __77__HKFeatureAvailabilityStore__notifyObserversForPairedDeviceCapabilityUpdate__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 featureAvailabilityProvidingDidUpdatePairedDeviceCapability:*(void *)(a1 + 32)];
  }
}

- (void)_notifyObserversForSettingsUpdate
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  id v3 = HKLogInfrastructure();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HKObserverSet count](self->_observers, "count"));
    *(_DWORD *)buf = 138543618;
    id v8 = self;
    __int16 v9 = 2112;
    uint64_t v10 = v4;
    _os_log_impl(&dword_19C023000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notifying %@ observers of settings update", buf, 0x16u);
  }
  observers = self->_observers;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __63__HKFeatureAvailabilityStore__notifyObserversForSettingsUpdate__block_invoke;
  v6[3] = &unk_1E58C6530;
  v6[4] = self;
  [(HKObserverSet *)observers notifyObservers:v6];
}

void __63__HKFeatureAvailabilityStore__notifyObserversForSettingsUpdate__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 featureAvailabilityProvidingDidUpdateSettings:*(void *)(a1 + 32)];
  }
}

- (void)setCurrentOnboardingVersionCompletedForCountryCode:(id)a3 countryCodeProvenance:(int64_t)a4 date:(id)a5 settings:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a7];
  proxyProvider = self->_proxyProvider;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __128__HKFeatureAvailabilityStore_setCurrentOnboardingVersionCompletedForCountryCode_countryCodeProvenance_date_settings_completion___block_invoke;
  v23[3] = &unk_1E58C6558;
  id v24 = v12;
  id v25 = v13;
  int64_t v28 = a4;
  id v26 = v14;
  id v27 = v15;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __128__HKFeatureAvailabilityStore_setCurrentOnboardingVersionCompletedForCountryCode_countryCodeProvenance_date_settings_completion___block_invoke_2;
  v21[3] = &unk_1E58BBD88;
  id v22 = v27;
  id v17 = v27;
  id v18 = v14;
  id v19 = v13;
  id v20 = v12;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v23 errorHandler:v21];
}

uint64_t __128__HKFeatureAvailabilityStore_setCurrentOnboardingVersionCompletedForCountryCode_countryCodeProvenance_date_settings_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_setCurrentOnboardingVersionCompletedForCountryCode:countryCodeProvenance:date:settings:completion:", a1[4], a1[8], a1[5], a1[6], a1[7]);
}

uint64_t __128__HKFeatureAvailabilityStore_setCurrentOnboardingVersionCompletedForCountryCode_countryCodeProvenance_date_settings_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)saveOnboardingCompletion:(id)a3 settings:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a5];
  proxyProvider = self->_proxyProvider;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __75__HKFeatureAvailabilityStore_saveOnboardingCompletion_settings_completion___block_invoke;
  v17[3] = &unk_1E58C6580;
  id v18 = v8;
  id v19 = v9;
  id v20 = v10;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __75__HKFeatureAvailabilityStore_saveOnboardingCompletion_settings_completion___block_invoke_2;
  v15[3] = &unk_1E58BBD88;
  id v16 = v20;
  id v12 = v20;
  id v13 = v9;
  id v14 = v8;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v17 errorHandler:v15];
}

uint64_t __75__HKFeatureAvailabilityStore_saveOnboardingCompletion_settings_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_saveOnboardingCompletion:settings:completion:", a1[4], a1[5], a1[6]);
}

uint64_t __75__HKFeatureAvailabilityStore_saveOnboardingCompletion_settings_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setFeatureSettingData:(id)a3 forKey:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a5];
  proxyProvider = self->_proxyProvider;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __70__HKFeatureAvailabilityStore_setFeatureSettingData_forKey_completion___block_invoke;
  v17[3] = &unk_1E58C6580;
  id v18 = v8;
  id v19 = v9;
  id v20 = v10;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __70__HKFeatureAvailabilityStore_setFeatureSettingData_forKey_completion___block_invoke_2;
  v15[3] = &unk_1E58BBD88;
  id v16 = v20;
  id v12 = v20;
  id v13 = v9;
  id v14 = v8;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v17 errorHandler:v15];
}

uint64_t __70__HKFeatureAvailabilityStore_setFeatureSettingData_forKey_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_setFeatureSettingData:forKey:completion:", a1[4], a1[5], a1[6]);
}

uint64_t __70__HKFeatureAvailabilityStore_setFeatureSettingData_forKey_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setFeatureSettingString:(id)a3 forKey:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a5];
  proxyProvider = self->_proxyProvider;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __72__HKFeatureAvailabilityStore_setFeatureSettingString_forKey_completion___block_invoke;
  v17[3] = &unk_1E58C6580;
  id v18 = v8;
  id v19 = v9;
  id v20 = v10;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __72__HKFeatureAvailabilityStore_setFeatureSettingString_forKey_completion___block_invoke_2;
  v15[3] = &unk_1E58BBD88;
  id v16 = v20;
  id v12 = v20;
  id v13 = v9;
  id v14 = v8;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v17 errorHandler:v15];
}

uint64_t __72__HKFeatureAvailabilityStore_setFeatureSettingString_forKey_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_setFeatureSettingString:forKey:completion:", a1[4], a1[5], a1[6]);
}

uint64_t __72__HKFeatureAvailabilityStore_setFeatureSettingString_forKey_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setFeatureSettingNumber:(id)a3 forKey:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a5];
  proxyProvider = self->_proxyProvider;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __72__HKFeatureAvailabilityStore_setFeatureSettingNumber_forKey_completion___block_invoke;
  v17[3] = &unk_1E58C6580;
  id v18 = v8;
  id v19 = v9;
  id v20 = v10;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __72__HKFeatureAvailabilityStore_setFeatureSettingNumber_forKey_completion___block_invoke_2;
  v15[3] = &unk_1E58BBD88;
  id v16 = v20;
  id v12 = v20;
  id v13 = v9;
  id v14 = v8;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v17 errorHandler:v15];
}

uint64_t __72__HKFeatureAvailabilityStore_setFeatureSettingNumber_forKey_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_setFeatureSettingNumber:forKey:completion:", a1[4], a1[5], a1[6]);
}

uint64_t __72__HKFeatureAvailabilityStore_setFeatureSettingNumber_forKey_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)removeFeatureSettingValueForKey:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a4];
  proxyProvider = self->_proxyProvider;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __73__HKFeatureAvailabilityStore_removeFeatureSettingValueForKey_completion___block_invoke;
  v13[3] = &unk_1E58C65A8;
  id v14 = v6;
  id v15 = v7;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __73__HKFeatureAvailabilityStore_removeFeatureSettingValueForKey_completion___block_invoke_2;
  v11[3] = &unk_1E58BBD88;
  id v12 = v15;
  id v9 = v15;
  id v10 = v6;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v13 errorHandler:v11];
}

uint64_t __73__HKFeatureAvailabilityStore_removeFeatureSettingValueForKey_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_removeFeatureSettingValueForKey:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __73__HKFeatureAvailabilityStore_removeFeatureSettingValueForKey_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)resetOnboardingWithCompletion:(id)a3
{
  int v4 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a3];
  proxyProvider = self->_proxyProvider;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __60__HKFeatureAvailabilityStore_resetOnboardingWithCompletion___block_invoke;
  v9[3] = &unk_1E58C6420;
  id v10 = v4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__HKFeatureAvailabilityStore_resetOnboardingWithCompletion___block_invoke_2;
  v7[3] = &unk_1E58BBD88;
  id v8 = v10;
  id v6 = v10;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v9 errorHandler:v7];
}

uint64_t __60__HKFeatureAvailabilityStore_resetOnboardingWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_resetOnboardingWithCompletion:", *(void *)(a1 + 32));
}

uint64_t __60__HKFeatureAvailabilityStore_resetOnboardingWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxyProvider, 0);
  objc_storeStrong((id *)&self->_observers, 0);

  objc_storeStrong((id *)&self->_featureIdentifier, 0);
}

@end