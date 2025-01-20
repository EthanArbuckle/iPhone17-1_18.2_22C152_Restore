@interface HDFeatureAvailabilityStoreServer
+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5;
+ (Class)configurationClass;
+ (id)createTaskServerWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 error:(id *)a7;
+ (id)requiredEntitlements;
+ (id)taskIdentifier;
- (id)_clientRemoteObjectProxy;
- (id)exportedInterface;
- (id)remoteInterface;
- (uint64_t)_hasWriteEntitlementWithError:(uint64_t)result;
- (void)featureAvailabilityExtensionOnboardingCompletionDataDidBecomeAvailable:(id)a3;
- (void)featureAvailabilityProvidingDidUpdateOnboardingCompletion:(id)a3;
- (void)featureAvailabilityProvidingDidUpdatePairedDeviceCapability:(id)a3;
- (void)featureAvailabilityProvidingDidUpdateSettings:(id)a3;
- (void)remote_canCompleteOnboardingForCountryCode:(id)a3 completion:(id)a4;
- (void)remote_earliestDateLowestOnboardingVersionCompletedWithCompletion:(id)a3;
- (void)remote_getFeatureAvailabilityRequirementsWithCompletion:(id)a3;
- (void)remote_getFeatureOnboardingRecordWithCompletion:(id)a3;
- (void)remote_getIsCurrentOnboardingVersionCompletedWithCompletion:(id)a3;
- (void)remote_getIsFeatureCapabilitySupportedOnActivePairedDeviceWithCompletion:(id)a3;
- (void)remote_getPairedFeatureAttributesWithCompletion:(id)a3;
- (void)remote_getRegionAvailabilityWithCompletion:(id)a3;
- (void)remote_onboardedCountryCodeSupportedStateWithCompletion:(id)a3;
- (void)remote_onboardingEligibilityForCountryCode:(id)a3 completion:(id)a4;
- (void)remote_removeFeatureSettingValueForKey:(id)a3 completion:(id)a4;
- (void)remote_resetOnboardingWithCompletion:(id)a3;
- (void)remote_saveOnboardingCompletion:(id)a3 settings:(id)a4 completion:(id)a5;
- (void)remote_setCurrentOnboardingVersionCompletedForCountryCode:(id)a3 countryCodeProvenance:(int64_t)a4 date:(id)a5 settings:(id)a6 completion:(id)a7;
- (void)remote_setFeatureSettingData:(id)a3 forKey:(id)a4 completion:(id)a5;
- (void)remote_setFeatureSettingNumber:(id)a3 forKey:(id)a4 completion:(id)a5;
- (void)remote_setFeatureSettingString:(id)a3 forKey:(id)a4 completion:(id)a5;
- (void)remote_startObservingChangesWithCompletion:(id)a3;
- (void)remote_stopObservingChanges;
@end

@implementation HDFeatureAvailabilityStoreServer

- (void)remote_getFeatureOnboardingRecordWithCompletion:(id)a3
{
  v4 = (void (**)(id, void, id))a3;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__166;
  v14 = __Block_byref_object_dispose__166;
  id v15 = 0;
  v5 = [(HDStandardTaskServer *)self profile];
  v6 = [v5 database];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __84__HDFeatureAvailabilityStoreServer_remote_getFeatureOnboardingRecordWithCompletion___block_invoke;
  v8[3] = &unk_1E62FA2C0;
  v8[5] = &v10;
  id v9 = 0;
  v8[4] = self;
  [v6 performHighPriorityTransactionsWithError:&v9 block:v8];
  id v7 = v9;

  v4[2](v4, v11[5], v7);
  _Block_object_dispose(&v10, 8);
}

BOOL __84__HDFeatureAvailabilityStoreServer_remote_getFeatureOnboardingRecordWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 40) featureOnboardingRecordWithError:a2];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) != 0;
}

- (void)remote_getIsCurrentOnboardingVersionCompletedWithCompletion:(id)a3
{
  uint64_t v4 = (void (**)(id, void, id))a3;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__166;
  v14 = __Block_byref_object_dispose__166;
  id v15 = 0;
  v5 = [(HDStandardTaskServer *)self profile];
  v6 = [v5 database];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __96__HDFeatureAvailabilityStoreServer_remote_getIsCurrentOnboardingVersionCompletedWithCompletion___block_invoke;
  v8[3] = &unk_1E62FA2C0;
  v8[5] = &v10;
  id v9 = 0;
  v8[4] = self;
  [v6 performHighPriorityTransactionsWithError:&v9 block:v8];
  id v7 = v9;

  v4[2](v4, v11[5], v7);
  _Block_object_dispose(&v10, 8);
}

BOOL __96__HDFeatureAvailabilityStoreServer_remote_getIsCurrentOnboardingVersionCompletedWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 40) isCurrentOnboardingVersionCompletedWithError:a2];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) != 0;
}

- (void)remote_canCompleteOnboardingForCountryCode:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, id))a4;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__166;
  v20 = __Block_byref_object_dispose__166;
  id v21 = 0;
  v8 = [(HDStandardTaskServer *)self profile];
  id v9 = [v8 database];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __90__HDFeatureAvailabilityStoreServer_remote_canCompleteOnboardingForCountryCode_completion___block_invoke;
  v12[3] = &unk_1E62FA2E8;
  v14 = &v16;
  id v15 = 0;
  v12[4] = self;
  id v10 = v6;
  id v13 = v10;
  [v9 performHighPriorityTransactionsWithError:&v15 block:v12];
  id v11 = v15;

  v7[2](v7, v17[5], v11);
  _Block_object_dispose(&v16, 8);
}

BOOL __90__HDFeatureAvailabilityStoreServer_remote_canCompleteOnboardingForCountryCode_completion___block_invoke(void *a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1[4] + 40) canCompleteOnboardingForCountryCode:a1[5] error:a2];
  uint64_t v4 = *(void *)(a1[6] + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return *(void *)(*(void *)(a1[6] + 8) + 40) != 0;
}

- (void)remote_onboardingEligibilityForCountryCode:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, id))a4;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__166;
  v20 = __Block_byref_object_dispose__166;
  id v21 = 0;
  v8 = [(HDStandardTaskServer *)self profile];
  id v9 = [v8 database];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __90__HDFeatureAvailabilityStoreServer_remote_onboardingEligibilityForCountryCode_completion___block_invoke;
  v12[3] = &unk_1E62FA2E8;
  v14 = &v16;
  id v15 = 0;
  v12[4] = self;
  id v10 = v6;
  id v13 = v10;
  [v9 performHighPriorityTransactionsWithError:&v15 block:v12];
  id v11 = v15;

  v7[2](v7, v17[5], v11);
  _Block_object_dispose(&v16, 8);
}

BOOL __90__HDFeatureAvailabilityStoreServer_remote_onboardingEligibilityForCountryCode_completion___block_invoke(void *a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1[4] + 40) onboardingEligibilityForCountryCode:a1[5] error:a2];
  uint64_t v4 = *(void *)(a1[6] + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return *(void *)(*(void *)(a1[6] + 8) + 40) != 0;
}

- (void)remote_onboardedCountryCodeSupportedStateWithCompletion:(id)a3
{
  uint64_t v4 = (void (**)(id, void, id))a3;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__166;
  v14 = __Block_byref_object_dispose__166;
  id v15 = 0;
  v5 = [(HDStandardTaskServer *)self profile];
  id v6 = [v5 database];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __92__HDFeatureAvailabilityStoreServer_remote_onboardedCountryCodeSupportedStateWithCompletion___block_invoke;
  v8[3] = &unk_1E62FA2C0;
  v8[5] = &v10;
  id v9 = 0;
  v8[4] = self;
  [v6 performHighPriorityTransactionsWithError:&v9 block:v8];
  id v7 = v9;

  v4[2](v4, v11[5], v7);
  _Block_object_dispose(&v10, 8);
}

BOOL __92__HDFeatureAvailabilityStoreServer_remote_onboardedCountryCodeSupportedStateWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 40) onboardedCountryCodeSupportedStateWithError:a2];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) != 0;
}

- (void)remote_getIsFeatureCapabilitySupportedOnActivePairedDeviceWithCompletion:(id)a3
{
  uint64_t v4 = (void (**)(id, void, id))a3;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__166;
  v14 = __Block_byref_object_dispose__166;
  id v15 = 0;
  v5 = [(HDStandardTaskServer *)self profile];
  id v6 = [v5 database];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __109__HDFeatureAvailabilityStoreServer_remote_getIsFeatureCapabilitySupportedOnActivePairedDeviceWithCompletion___block_invoke;
  v8[3] = &unk_1E62FA2C0;
  v8[5] = &v10;
  id v9 = 0;
  v8[4] = self;
  [v6 performHighPriorityTransactionsWithError:&v9 block:v8];
  id v7 = v9;

  v4[2](v4, v11[5], v7);
  _Block_object_dispose(&v10, 8);
}

BOOL __109__HDFeatureAvailabilityStoreServer_remote_getIsFeatureCapabilitySupportedOnActivePairedDeviceWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 40) isFeatureCapabilitySupportedOnActivePairedDeviceWithError:a2];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) != 0;
}

- (void)remote_earliestDateLowestOnboardingVersionCompletedWithCompletion:(id)a3
{
  uint64_t v4 = (void (**)(id, void, id))a3;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__166;
  v14 = __Block_byref_object_dispose__166;
  id v15 = 0;
  v5 = [(HDStandardTaskServer *)self profile];
  id v6 = [v5 database];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __102__HDFeatureAvailabilityStoreServer_remote_earliestDateLowestOnboardingVersionCompletedWithCompletion___block_invoke;
  v8[3] = &unk_1E62FA2C0;
  v8[5] = &v10;
  id v9 = 0;
  v8[4] = self;
  [v6 performHighPriorityTransactionsWithError:&v9 block:v8];
  id v7 = v9;

  v4[2](v4, v11[5], v7);
  _Block_object_dispose(&v10, 8);
}

BOOL __102__HDFeatureAvailabilityStoreServer_remote_earliestDateLowestOnboardingVersionCompletedWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 40) earliestDateLowestOnboardingVersionCompletedWithError:a2];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) != 0;
}

- (void)remote_getPairedFeatureAttributesWithCompletion:(id)a3
{
  extension = self->_extension;
  id v7 = 0;
  uint64_t v4 = (void (**)(id, void *, id))a3;
  v5 = [(HDFeatureAvailabilityExtension *)extension pairedFeatureAttributesWithError:&v7];
  id v6 = v7;
  v4[2](v4, v5, v6);
}

- (void)remote_getFeatureAvailabilityRequirementsWithCompletion:(id)a3
{
  extension = self->_extension;
  id v7 = 0;
  uint64_t v4 = (void (**)(id, void *, id))a3;
  v5 = [(HDFeatureAvailabilityExtension *)extension featureAvailabilityRequirementsWithError:&v7];
  id v6 = v7;
  v4[2](v4, v5, v6);
}

- (void)remote_getRegionAvailabilityWithCompletion:(id)a3
{
  extension = self->_extension;
  id v7 = 0;
  uint64_t v4 = (void (**)(id, void *, id))a3;
  v5 = [(HDFeatureAvailabilityExtension *)extension regionAvailabilityWithError:&v7];
  id v6 = v7;
  v4[2](v4, v5, v6);
}

- (uint64_t)_hasWriteEntitlementWithError:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = (id *)result;
    uint64_t v4 = [(id)result client];
    v5 = [v4 entitlements];
    char v6 = [v5 hasEntitlement:*MEMORY[0x1E4F29C40]];

    if (v6) {
      return 1;
    }
    id v7 = [v3 client];
    v8 = [v7 entitlements];
    uint64_t v9 = *MEMORY[0x1E4F29C48];
    uint64_t v10 = [v3[5] featureIdentifier];
    LOBYTE(v9) = [v8 arrayEntitlement:v9 containsString:v10];

    if (v9)
    {
      return 1;
    }
    else
    {
      id v11 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v12 = [v3[5] featureIdentifier];
      objc_msgSend(v11, "hk_error:format:", 4, @"Unauthorized access to modify availability of feature %@", v12);
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        if (a2) {
          *a2 = v13;
        }
        else {
          _HKLogDroppedError();
        }
      }

      return 0;
    }
  }
  return result;
}

- (void)remote_setCurrentOnboardingVersionCompletedForCountryCode:(id)a3 countryCodeProvenance:(int64_t)a4 date:(id)a5 settings:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v18 = 0;
  id v15 = (void (**)(id, void, id))a7;
  char v16 = -[HDFeatureAvailabilityStoreServer _hasWriteEntitlementWithError:]((uint64_t)self, &v18);
  id v17 = v18;
  if (v16) {
    [(HDFeatureAvailabilityExtension *)self->_extension setCurrentOnboardingVersionCompletedForCountryCode:v12 countryCodeProvenance:a4 date:v13 settings:v14 completion:v15];
  }
  else {
    v15[2](v15, 0, v17);
  }
}

- (void)remote_saveOnboardingCompletion:(id)a3 settings:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = (void (**)(id, void, void *))a5;
  id v21 = 0;
  char v12 = -[HDFeatureAvailabilityStoreServer _hasWriteEntitlementWithError:]((uint64_t)self, &v21);
  id v13 = v21;
  if (v12)
  {
    id v14 = [v9 featureIdentifier];
    id v15 = [(HDFeatureAvailabilityExtension *)self->_extension featureIdentifier];
    char v16 = [v14 isEqualToString:v15];

    if (v16)
    {
      [(HDFeatureAvailabilityExtension *)self->_extension saveOnboardingCompletion:v9 settings:v10 completion:v11];
    }
    else
    {
      id v17 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v18 = objc_opt_class();
      v19 = [v9 featureIdentifier];
      v20 = objc_msgSend(v17, "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", v18, a2, @"Cannot save onboarding for feature %@"", v19);
      v11[2](v11, 0, v20);
    }
  }
  else
  {
    v11[2](v11, 0, v13);
  }
}

- (void)remote_setFeatureSettingData:(id)a3 forKey:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v13 = 0;
  id v10 = (void (**)(id, void, id))a5;
  char v11 = -[HDFeatureAvailabilityStoreServer _hasWriteEntitlementWithError:]((uint64_t)self, &v13);
  id v12 = v13;
  if (v11) {
    [(HDFeatureAvailabilityExtension *)self->_extension setFeatureSettingData:v8 forKey:v9 completion:v10];
  }
  else {
    v10[2](v10, 0, v12);
  }
}

- (void)remote_setFeatureSettingString:(id)a3 forKey:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v13 = 0;
  id v10 = (void (**)(id, void, id))a5;
  char v11 = -[HDFeatureAvailabilityStoreServer _hasWriteEntitlementWithError:]((uint64_t)self, &v13);
  id v12 = v13;
  if (v11) {
    [(HDFeatureAvailabilityExtension *)self->_extension setFeatureSettingString:v8 forKey:v9 completion:v10];
  }
  else {
    v10[2](v10, 0, v12);
  }
}

- (void)remote_setFeatureSettingNumber:(id)a3 forKey:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v13 = 0;
  id v10 = (void (**)(id, void, id))a5;
  char v11 = -[HDFeatureAvailabilityStoreServer _hasWriteEntitlementWithError:]((uint64_t)self, &v13);
  id v12 = v13;
  if (v11) {
    [(HDFeatureAvailabilityExtension *)self->_extension setFeatureSettingNumber:v8 forKey:v9 completion:v10];
  }
  else {
    v10[2](v10, 0, v12);
  }
}

- (void)remote_removeFeatureSettingValueForKey:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v10 = 0;
  id v7 = (void (**)(id, void, id))a4;
  char v8 = -[HDFeatureAvailabilityStoreServer _hasWriteEntitlementWithError:]((uint64_t)self, &v10);
  id v9 = v10;
  if (v8) {
    [(HDFeatureAvailabilityExtension *)self->_extension removeFeatureSettingValueForKey:v6 completion:v7];
  }
  else {
    v7[2](v7, 0, v9);
  }
}

- (void)remote_resetOnboardingWithCompletion:(id)a3
{
  id v7 = 0;
  uint64_t v4 = (void (**)(id, void, id))a3;
  char v5 = -[HDFeatureAvailabilityStoreServer _hasWriteEntitlementWithError:]((uint64_t)self, &v7);
  id v6 = v7;
  if (v5) {
    [(HDFeatureAvailabilityExtension *)self->_extension resetOnboardingWithCompletion:v4];
  }
  else {
    v4[2](v4, 0, v6);
  }
}

- (void)remote_startObservingChangesWithCompletion:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void (**)(id, uint64_t, void))a3;
  _HKInitializeLogging();
  char v5 = HKLogInfrastructure();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = self;
    _os_log_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Registering for extension changes", (uint8_t *)&v6, 0xCu);
  }

  [(HDFeatureAvailabilityExtension *)self->_extension registerObserver:self queue:self->_queue];
  v4[2](v4, 1, 0);
}

- (void)remote_stopObservingChanges
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  uint64_t v3 = HKLogInfrastructure();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543362;
    char v5 = self;
    _os_log_impl(&dword_1BCB7D000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Unregistering for extension changes", (uint8_t *)&v4, 0xCu);
  }

  [(HDFeatureAvailabilityExtension *)self->_extension unregisterObserver:self];
}

- (void)featureAvailabilityProvidingDidUpdateOnboardingCompletion:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  int v4 = HKLogInfrastructure();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = self;
    _os_log_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notifying client of onboarding completion update", (uint8_t *)&v6, 0xCu);
  }

  char v5 = -[HDFeatureAvailabilityStoreServer _clientRemoteObjectProxy](self);
  objc_msgSend(v5, "client_featureAvailabilityExtensionDidUpdateOnboardingCompletion");
}

- (id)_clientRemoteObjectProxy
{
  if (a1)
  {
    v1 = [a1 client];
    v2 = [v1 connection];
    uint64_t v3 = [v2 remoteObjectProxy];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (void)featureAvailabilityProvidingDidUpdatePairedDeviceCapability:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  int v4 = HKLogInfrastructure();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = self;
    _os_log_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notifying client of paired device capability update", (uint8_t *)&v6, 0xCu);
  }

  char v5 = -[HDFeatureAvailabilityStoreServer _clientRemoteObjectProxy](self);
  objc_msgSend(v5, "client_featureAvailabilityExtensionDidUpdatePairedDeviceCapability");
}

- (void)featureAvailabilityProvidingDidUpdateSettings:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  int v4 = HKLogInfrastructure();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = self;
    _os_log_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notifying client of settings update", (uint8_t *)&v6, 0xCu);
  }

  char v5 = -[HDFeatureAvailabilityStoreServer _clientRemoteObjectProxy](self);
  objc_msgSend(v5, "client_featureAvailabilityProvidingDidUpdateSettings");
}

- (void)featureAvailabilityExtensionOnboardingCompletionDataDidBecomeAvailable:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  int v4 = HKLogInfrastructure();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = self;
    _os_log_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notifying client of onboarding completion data becoming available", (uint8_t *)&v6, 0xCu);
  }

  char v5 = -[HDFeatureAvailabilityStoreServer _clientRemoteObjectProxy](self);
  objc_msgSend(v5, "client_featureAvailabilityExtensionDidUpdateOnboardingCompletion");
}

+ (id)createTaskServerWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 error:(id *)a7
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v40 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v39 = v12;
  id v14 = [v12 profile];
  id v15 = [v14 profileExtensionsConformingToProtocol:&unk_1F180B2D8];

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v16 = v15;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v41 objects:v51 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v42;
LABEL_3:
    uint64_t v20 = 0;
    while (1)
    {
      if (*(void *)v42 != v19) {
        objc_enumerationMutation(v16);
      }
      id v21 = *(void **)(*((void *)&v41 + 1) + 8 * v20);
      v22 = [v11 featureIdentifier];
      v23 = [v21 featureAvailabilityExtensionForFeatureIdentifier:v22];

      if (v23) {
        break;
      }
      if (v18 == ++v20)
      {
        uint64_t v18 = [v16 countByEnumeratingWithState:&v41 objects:v51 count:16];
        if (v18) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }

    v30 = v39;
    v29 = v40;
    v31 = [(HDStandardTaskServer *)[HDFeatureAvailabilityStoreServer alloc] initWithUUID:v40 configuration:v11 client:v39 delegate:v13];
    _HKInitializeLogging();
    v32 = HKLogInfrastructure();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      v33 = [v11 featureIdentifier];
      *(_DWORD *)buf = 138543874;
      v46 = v31;
      __int16 v47 = 2114;
      v48 = v23;
      __int16 v49 = 2114;
      v50 = v33;
      _os_log_impl(&dword_1BCB7D000, v32, OS_LOG_TYPE_DEFAULT, "[%{public}@] Using profile extension %{public}@ for feature %{public}@", buf, 0x20u);
    }
    v34 = v23;
    v35 = v34;
    if (v31)
    {
      objc_storeStrong((id *)&v31->_extension, v23);
      uint64_t v36 = HKCreateSerialDispatchQueue();
      queue = v31->_queue;
      v31->_queue = (OS_dispatch_queue *)v36;
      v26 = v35;
      goto LABEL_19;
    }
    v26 = v34;
  }
  else
  {
LABEL_9:

    v24 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v25 = objc_opt_class();
    v26 = [v11 featureIdentifier];
    objc_msgSend(v24, "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", v25, a2, @"No profile extension providing feature availability for %@"", v26);
    v27 = (OS_dispatch_queue *)(id)objc_claimAutoreleasedReturnValue();
    queue = v27;
    if (v27)
    {
      v30 = v39;
      v29 = v40;
      if (a7)
      {
        v31 = 0;
        *a7 = v27;
      }
      else
      {
        _HKLogDroppedError();
        v31 = 0;
      }
      v35 = queue;
    }
    else
    {
      v31 = 0;
      v35 = 0;
      v30 = v39;
      v29 = v40;
    }
LABEL_19:
  }

  return v31;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (id)requiredEntitlements
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [v8 entitlements];
  char v10 = [v9 hasEntitlement:*MEMORY[0x1E4F29C40]];

  if (v10) {
    goto LABEL_5;
  }
  id v11 = [v8 entitlements];
  uint64_t v12 = *MEMORY[0x1E4F29C48];
  id v13 = [v7 featureIdentifier];
  LOBYTE(v12) = [v11 arrayEntitlement:v12 containsString:v13];

  if (v12) {
    goto LABEL_5;
  }
  id v14 = [v8 entitlements];
  char v15 = [v14 hasEntitlement:*MEMORY[0x1E4F29C30]];

  if (v15) {
    goto LABEL_5;
  }
  id v16 = [v8 entitlements];
  uint64_t v17 = *MEMORY[0x1E4F29C38];
  uint64_t v18 = [v7 featureIdentifier];
  LOBYTE(v17) = [v16 arrayEntitlement:v17 containsString:v18];

  if (v17)
  {
LABEL_5:
    BOOL v19 = 1;
  }
  else
  {
    id v21 = (void *)MEMORY[0x1E4F28C58];
    v22 = [v7 featureIdentifier];
    objc_msgSend(v21, "hk_error:format:", 4, @"Unauthorized access to availability of feature %@", v22);
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      if (a5) {
        *a5 = v23;
      }
      else {
        _HKLogDroppedError();
      }
    }

    BOOL v19 = 0;
  }

  return v19;
}

- (id)exportedInterface
{
  return (id)MEMORY[0x1F40E7CD8](self, a2);
}

- (id)remoteInterface
{
  return (id)MEMORY[0x1F40E7CD0](self, a2);
}

+ (id)taskIdentifier
{
  return (id)[MEMORY[0x1E4F2B040] taskIdentifier];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_extension, 0);
}

@end