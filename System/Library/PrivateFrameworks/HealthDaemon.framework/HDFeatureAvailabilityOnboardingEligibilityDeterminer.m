@interface HDFeatureAvailabilityOnboardingEligibilityDeterminer
- (BOOL)_isActiveRemoteDevicePresent;
- (HDFeatureAvailabilityOnboardingEligibilityDeterminer)initWithFeatureIdentifier:(id)a3 currentOnboardingVersion:(int64_t)a4 pairedDeviceCapability:(id)a5 pairedDeviceCapabilityProvider:(id)a6 regionAvailabilityProvider:(id)a7 disableAndExpiryProvider:(id)a8 loggingCategory:(id)a9;
- (id)_onboardingEligibilitiesForOnboardingCompletions:(id)a3 onboardingEligibilityRetrievalBlock:(id)a4 error:(id *)a5;
- (id)_onboardingEligibilityForRegionEligibility:(id)a3 rescindedStatus:(id)a4 isCapabilitySupported:(id)a5 isActiveRemoteDevicePresent:(id)a6;
- (id)description;
- (id)onboardingEligibilitiesForDevice:(id)a3 onboardingCompletions:(id)a4 error:(id *)a5;
- (id)onboardingEligibilitiesForOnboardingCompletions:(id)a3 error:(id *)a4;
- (id)onboardingEligibilityForCountryCode:(id)a3 error:(id *)a4;
- (id)onboardingEligibilityForDevice:(id)a3 countryCode:(id)a4 error:(id *)a5;
- (int64_t)currentOnboardingVersion;
- (void)setCurrentOnboardingVersion:(int64_t)a3;
@end

@implementation HDFeatureAvailabilityOnboardingEligibilityDeterminer

- (HDFeatureAvailabilityOnboardingEligibilityDeterminer)initWithFeatureIdentifier:(id)a3 currentOnboardingVersion:(int64_t)a4 pairedDeviceCapability:(id)a5 pairedDeviceCapabilityProvider:(id)a6 regionAvailabilityProvider:(id)a7 disableAndExpiryProvider:(id)a8 loggingCategory:(id)a9
{
  id v24 = a3;
  id v23 = a5;
  id v22 = a6;
  id v15 = a7;
  id v16 = a8;
  id v17 = a9;
  v25.receiver = self;
  v25.super_class = (Class)HDFeatureAvailabilityOnboardingEligibilityDeterminer;
  v18 = [(HDFeatureAvailabilityOnboardingEligibilityDeterminer *)&v25 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_featureIdentifier, a3);
    v19->_currentOnboardingVersion = a4;
    objc_storeStrong((id *)&v19->_pairedDeviceCapability, a5);
    objc_storeStrong((id *)&v19->_pairedDeviceCapabilityProvider, a6);
    objc_storeStrong((id *)&v19->_regionAvailabilityProvider, a7);
    objc_storeStrong((id *)&v19->_disableAndExpiryProvider, a8);
    objc_storeStrong((id *)&v19->_loggingCategory, a9);
  }

  return v19;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"%@:%@", objc_opt_class(), self->_featureIdentifier];
}

- (id)onboardingEligibilityForCountryCode:(id)a3 error:(id *)a4
{
  regionAvailabilityProvider = self->_regionAvailabilityProvider;
  id v7 = a3;
  v8 = [(HDRegionAvailabilityProviding *)regionAvailabilityProvider onboardingEligibilityForCountryCode:v7];
  disableAndExpiryProvider = self->_disableAndExpiryProvider;
  id v22 = 0;
  v10 = [(HDFeatureDisableAndExpiryProviding *)disableAndExpiryProvider rescindedStatusOnActivePairedDeviceForCountryCode:v7 error:&v22];

  id v11 = v22;
  v12 = v11;
  if (!v10)
  {
    if (v11)
    {
      id v17 = v11;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 100, @"Failure when determining rescinded status, no error given");
      id v17 = (id)objc_claimAutoreleasedReturnValue();
      if (!v17) {
        goto LABEL_28;
      }
    }
    if (a4) {
      *a4 = v17;
    }
    else {
      _HKLogDroppedError();
    }

    v18 = 0;
    v19 = 0;
    if (v12) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  pairedDeviceCapabilityProvider = self->_pairedDeviceCapabilityProvider;
  if (pairedDeviceCapabilityProvider)
  {
    pairedDeviceCapability = self->_pairedDeviceCapability;
    if (pairedDeviceCapability)
    {
      id v21 = v12;
      id v15 = [(HDPairedDeviceCapabilityProviding *)pairedDeviceCapabilityProvider isCapabilitySupportedOnActivePairedDevice:pairedDeviceCapability error:&v21];
      id v16 = v21;

      if (v15)
      {
        if ([v15 BOOLValue])
        {
          id v17 = (id)MEMORY[0x1E4F1CC38];
        }
        else
        {
          objc_msgSend(NSNumber, "numberWithBool:", -[HDFeatureAvailabilityOnboardingEligibilityDeterminer _isActiveRemoteDevicePresent](self, "_isActiveRemoteDevicePresent"));
          id v17 = (id)objc_claimAutoreleasedReturnValue();
        }
        v12 = v16;
        goto LABEL_20;
      }
      if (v16)
      {
        id v17 = v16;
        goto LABEL_26;
      }
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 100, @"Failure when determining device capability support, no error given");
      id v17 = (id)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
LABEL_26:
        if (a4) {
          *a4 = v17;
        }
        else {
          _HKLogDroppedError();
        }

        v18 = 0;
        v19 = 0;
        v12 = v16;
        if (v16) {
          goto LABEL_22;
        }
        goto LABEL_21;
      }
LABEL_28:
      v18 = 0;
      v19 = 0;
      goto LABEL_21;
    }
  }
  id v17 = 0;
  id v15 = 0;
LABEL_20:
  v19 = [(HDFeatureAvailabilityOnboardingEligibilityDeterminer *)self _onboardingEligibilityForRegionEligibility:v8 rescindedStatus:v10 isCapabilitySupported:v15 isActiveRemoteDevicePresent:v17];

  v18 = v12;
LABEL_21:

  v12 = v18;
LABEL_22:

  return v19;
}

- (id)onboardingEligibilityForDevice:(id)a3 countryCode:(id)a4 error:(id *)a5
{
  id v8 = a3;
  regionAvailabilityProvider = self->_regionAvailabilityProvider;
  id v10 = a4;
  id v11 = [(HDRegionAvailabilityProviding *)regionAvailabilityProvider onboardingEligibilityForCountryCode:v10 device:v8];
  disableAndExpiryProvider = self->_disableAndExpiryProvider;
  id v22 = 0;
  v13 = [(HDFeatureDisableAndExpiryProviding *)disableAndExpiryProvider rescindedStatusForCountryCode:v10 device:v8 error:&v22];

  id v14 = v22;
  id v15 = v14;
  if (v13)
  {
    pairedDeviceCapabilityProvider = self->_pairedDeviceCapabilityProvider;
    if (pairedDeviceCapabilityProvider && self->_pairedDeviceCapability)
    {
      if (v8)
      {
        objc_msgSend(NSNumber, "numberWithBool:", -[HDPairedDeviceCapabilityProviding isCapabilitySupported:onDevice:](pairedDeviceCapabilityProvider, "isCapabilitySupported:onDevice:"));
        id v17 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v18 = MEMORY[0x1E4F1CC38];
      }
      else
      {
        uint64_t v18 = MEMORY[0x1E4F1CC28];
        id v17 = (id)MEMORY[0x1E4F1CC28];
      }
    }
    else
    {
      uint64_t v18 = 0;
      id v17 = 0;
    }
    uint64_t v19 = [(HDFeatureAvailabilityOnboardingEligibilityDeterminer *)self _onboardingEligibilityForRegionEligibility:v11 rescindedStatus:v13 isCapabilitySupported:v17 isActiveRemoteDevicePresent:v18];
    goto LABEL_8;
  }
  if (v14)
  {
    id v17 = v14;
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 100, @"Failure when determining rescinded status, no error given");
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
LABEL_15:
    if (a5) {
      *a5 = v17;
    }
    else {
      _HKLogDroppedError();
    }

    uint64_t v19 = 0;
    v20 = 0;
    if (v15) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  uint64_t v19 = 0;
LABEL_8:

  v20 = (void *)v19;
LABEL_9:

  return v20;
}

- (id)_onboardingEligibilityForRegionEligibility:(id)a3 rescindedStatus:(id)a4 isCapabilitySupported:(id)a5 isActiveRemoteDevicePresent:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  id v12 = a4;
  id v13 = a3;
  uint64_t v14 = [v13 ineligibilityReasons];
  uint64_t v15 = [v12 integerValue];

  uint64_t v16 = v14 | 0x80;
  if (v15 != 2) {
    uint64_t v16 = v14;
  }
  if (v15 == 1) {
    uint64_t v17 = v14 | 0x40;
  }
  else {
    uint64_t v17 = v16;
  }
  if (v11 && ![v11 BOOLValue]) {
    v17 |= 2uLL;
  }
  if (v10 && ![v10 BOOLValue]) {
    v17 |= 4uLL;
  }
  id v18 = objc_alloc(MEMORY[0x1E4F2B008]);
  uint64_t v19 = [v13 countryAvailabilityVersion];

  v20 = (void *)[v18 initWithIneligibilityReasons:v17 countryAvailabilityVersion:v19];
  id v21 = [v20 eligibilityRespectingOverridesForFeatureIdentifier:self->_featureIdentifier];

  return v21;
}

- (id)onboardingEligibilitiesForOnboardingCompletions:(id)a3 error:(id *)a4
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __110__HDFeatureAvailabilityOnboardingEligibilityDeterminer_onboardingEligibilitiesForOnboardingCompletions_error___block_invoke;
  v6[3] = &unk_1E63082A0;
  v6[4] = self;
  v4 = [(HDFeatureAvailabilityOnboardingEligibilityDeterminer *)self _onboardingEligibilitiesForOnboardingCompletions:a3 onboardingEligibilityRetrievalBlock:v6 error:a4];

  return v4;
}

uint64_t __110__HDFeatureAvailabilityOnboardingEligibilityDeterminer_onboardingEligibilitiesForOnboardingCompletions_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) onboardingEligibilityForCountryCode:a2 error:a3];
}

- (id)onboardingEligibilitiesForDevice:(id)a3 onboardingCompletions:(id)a4 error:(id *)a5
{
  id v8 = a3;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __117__HDFeatureAvailabilityOnboardingEligibilityDeterminer_onboardingEligibilitiesForDevice_onboardingCompletions_error___block_invoke;
  v12[3] = &unk_1E63082C8;
  v12[4] = self;
  id v13 = v8;
  id v9 = v8;
  id v10 = [(HDFeatureAvailabilityOnboardingEligibilityDeterminer *)self _onboardingEligibilitiesForOnboardingCompletions:a4 onboardingEligibilityRetrievalBlock:v12 error:a5];

  return v10;
}

uint64_t __117__HDFeatureAvailabilityOnboardingEligibilityDeterminer_onboardingEligibilitiesForDevice_onboardingCompletions_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) onboardingEligibilityForDevice:*(void *)(a1 + 40) countryCode:a2 error:a3];
}

- (id)_onboardingEligibilitiesForOnboardingCompletions:(id)a3 onboardingEligibilityRetrievalBlock:(id)a4 error:(id *)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v29 = (void (**)(id, void *, id *))a4;
  if ([v8 count])
  {
    v27 = a5;
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id obj = v8;
    uint64_t v10 = [obj countByEnumeratingWithState:&v31 objects:v39 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v32;
LABEL_4:
      uint64_t v13 = 0;
      while (1)
      {
        if (*(void *)v32 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void **)(*((void *)&v31 + 1) + 8 * v13);
        if ([v14 version] >= self->_currentOnboardingVersion)
        {
          uint64_t v16 = v9;
          uint64_t v17 = [v14 countryCode];
          id v30 = 0;
          id v18 = v29[2](v29, v17, &v30);
          id v19 = v30;

          if (!v18)
          {
            _HKInitializeLogging();
            loggingCategory = self->_loggingCategory;
            id v9 = v16;
            if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              v36 = self;
              __int16 v37 = 2114;
              id v38 = v19;
              _os_log_error_impl(&dword_1BCB7D000, loggingCategory, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to determine onboarding eligibility: %{public}@", buf, 0x16u);
            }
            if (v19)
            {
              id v24 = v19;
              goto LABEL_23;
            }
            objc_super v25 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v14 = [v14 countryCode];
            objc_msgSend(v25, "hk_error:format:", 100, @"Unexpected failure when evaluating eligibility for %@", v14);
            id v24 = (id)objc_claimAutoreleasedReturnValue();
            if (v24)
            {
LABEL_23:
              if (v27) {
                id *v27 = v24;
              }
              else {
                _HKLogDroppedError();
              }

              if (!v19) {
                goto LABEL_27;
              }
            }
            else
            {
LABEL_27:
            }
            id v21 = 0;
            goto LABEL_29;
          }
          v20 = (void *)[objc_alloc(MEMORY[0x1E4F2B000]) initWithOnboardingCompletion:v14 onboardingEligibility:v18];
          id v9 = v16;
          [v16 addObject:v20];
        }
        else
        {
          _HKInitializeLogging();
          uint64_t v15 = self->_loggingCategory;
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v36 = self;
            _os_log_impl(&dword_1BCB7D000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] Onboarding completion found with older version than current", buf, 0xCu);
          }
        }
        if (v11 == ++v13)
        {
          uint64_t v11 = [obj countByEnumeratingWithState:&v31 objects:v39 count:16];
          if (v11) {
            goto LABEL_4;
          }
          break;
        }
      }
    }

    id v21 = v9;
LABEL_29:
  }
  else
  {
    _HKInitializeLogging();
    id v22 = self->_loggingCategory;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v36 = self;
      _os_log_impl(&dword_1BCB7D000, v22, OS_LOG_TYPE_DEFAULT, "[%{public}@] No onboarding completion found", buf, 0xCu);
    }
    id v21 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v21;
}

- (BOOL)_isActiveRemoteDevicePresent
{
  v2 = [(HDPairedDeviceCapabilityProviding *)self->_pairedDeviceCapabilityProvider activePairedDevice];
  BOOL v3 = v2 != 0;

  return v3;
}

- (int64_t)currentOnboardingVersion
{
  return self->_currentOnboardingVersion;
}

- (void)setCurrentOnboardingVersion:(int64_t)a3
{
  self->_currentOnboardingVersion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingCategory, 0);
  objc_storeStrong((id *)&self->_disableAndExpiryProvider, 0);
  objc_storeStrong((id *)&self->_regionAvailabilityProvider, 0);
  objc_storeStrong((id *)&self->_pairedFeatureAttributesProvider, 0);
  objc_storeStrong((id *)&self->_pairedDeviceCapabilityProvider, 0);
  objc_storeStrong((id *)&self->_pairedDeviceCapability, 0);

  objc_storeStrong((id *)&self->_featureIdentifier, 0);
}

@end