@interface HDWatchAndCompanionCountrySetIntersectionAvailabilityProvider
+ (id)lastContentVersionDuringReloadAttemptDomainForProfile:(id)a3;
- (HDRegionAvailabilityProvidingDelegate)delegate;
- (HDWatchAndCompanionCountrySetIntersectionAvailabilityProvider)initWithAllowedCountriesDataSource:(id)a3 profile:(id)a4 featureCapability:(id)a5 loggingCategory:(id)a6;
- (HDWatchAndCompanionCountrySetIntersectionAvailabilityProvider)initWithAllowedCountriesDataSource:(id)a3 profile:(id)a4 featureCapability:(id)a5 reloadsLocalCountrySetOnRemoteCountrySetUpdate:(BOOL)a6 loggingCategory:(id)a7;
- (NSString)description;
- (id)_lastContentVersionDuringReloadAttemptDomain;
- (id)onboardingEligibilityForCountryCode:(id)a3;
- (id)onboardingEligibilityForCountryCode:(id)a3 device:(id)a4;
- (id)regionAvailability;
- (id)regionAvailabilityForDevice:(id)a3;
- (void)allowedCountriesDataSourceDidUpdateActiveRemoteCountrySet:(id)a3;
- (void)allowedCountriesDataSourceDidUpdateLocalCountrySet:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation HDWatchAndCompanionCountrySetIntersectionAvailabilityProvider

- (HDWatchAndCompanionCountrySetIntersectionAvailabilityProvider)initWithAllowedCountriesDataSource:(id)a3 profile:(id)a4 featureCapability:(id)a5 loggingCategory:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = [v12 daemon];
  v15 = [v14 behavior];
  uint64_t v16 = [v15 isAppleWatch];

  v17 = [(HDWatchAndCompanionCountrySetIntersectionAvailabilityProvider *)self initWithAllowedCountriesDataSource:v13 profile:v12 featureCapability:v11 reloadsLocalCountrySetOnRemoteCountrySetUpdate:v16 loggingCategory:v10];
  return v17;
}

- (HDWatchAndCompanionCountrySetIntersectionAvailabilityProvider)initWithAllowedCountriesDataSource:(id)a3 profile:(id)a4 featureCapability:(id)a5 reloadsLocalCountrySetOnRemoteCountrySetUpdate:(BOOL)a6 loggingCategory:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  v23.receiver = self;
  v23.super_class = (Class)HDWatchAndCompanionCountrySetIntersectionAvailabilityProvider;
  v17 = [(HDWatchAndCompanionCountrySetIntersectionAvailabilityProvider *)&v23 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_allowedCountriesDataSource, a3);
    objc_storeWeak((id *)&v18->_profile, v14);
    v19 = [v14 daemon];
    uint64_t v20 = [v19 nanoRegistryDeviceCapabilityProvider];
    pairedDeviceCapabilityProvider = v18->_pairedDeviceCapabilityProvider;
    v18->_pairedDeviceCapabilityProvider = (HDPairedDeviceCapabilityProviding *)v20;

    objc_storeStrong((id *)&v18->_featureCapability, a5);
    v18->_reloadsLocalCountrySetOnRemoteCountrySetUpdate = a6;
    objc_storeStrong((id *)&v18->_loggingCategory, a7);
    [(HDAllowedCountriesDataSource *)v18->_allowedCountriesDataSource setDelegate:v18];
  }

  return v18;
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(HDAllowedCountriesDataSource *)self->_allowedCountriesDataSource featureIdentifier];
  v6 = [v3 stringWithFormat:@"%@:%@", v4, v5];

  return (NSString *)v6;
}

- (id)onboardingEligibilityForCountryCode:(id)a3
{
  id v4 = a3;
  v5 = [(HDWatchAndCompanionCountrySetIntersectionAvailabilityProvider *)self regionAvailability];
  v6 = [v5 onboardingEligibilityForCountryCode:v4];

  return v6;
}

- (id)onboardingEligibilityForCountryCode:(id)a3 device:(id)a4
{
  id v6 = a3;
  v7 = [(HDWatchAndCompanionCountrySetIntersectionAvailabilityProvider *)self regionAvailabilityForDevice:a4];
  v8 = [v7 onboardingEligibilityForCountryCode:v6];

  return v8;
}

- (id)regionAvailability
{
  v3 = [(HDPairedDeviceCapabilityProviding *)self->_pairedDeviceCapabilityProvider activePairedDevice];
  id v4 = [(HDWatchAndCompanionCountrySetIntersectionAvailabilityProvider *)self regionAvailabilityForDevice:v3];

  return v4;
}

- (id)regionAvailabilityForDevice:(id)a3
{
  id v4 = a3;
  v5 = [(HDAllowedCountriesDataSource *)self->_allowedCountriesDataSource localCountrySet];
  if (v4)
  {
    id v6 = [(HDAllowedCountriesDataSource *)self->_allowedCountriesDataSource remoteCountrySetForDevice:v4];
    if (v6)
    {
      uint64_t v7 = [MEMORY[0x1E4F2ABD8] allowedCountriesInIntersectionOfLocalSet:v5 remoteSet:v6];
    }
    else
    {
      featureCapability = self->_featureCapability;
      if (featureCapability
        && ([(HDPairedDeviceCapabilityProviding *)self->_pairedDeviceCapabilityProvider isCapabilitySupported:featureCapability onDevice:v4] & 1) == 0)
      {
        uint64_t v7 = [MEMORY[0x1E4F2ABD8] capabilityNotSupportedOnRemoteDevice:v5];
      }
      else
      {
        uint64_t v7 = [MEMORY[0x1E4F2ABD8] allowedCountriesInIntersectionOfLocalAndRemoteSetPendingSync:v5];
      }
    }
    v8 = (void *)v7;
  }
  else
  {
    v8 = [MEMORY[0x1E4F2ABD8] noRemoteDevice:v5];
  }
  id v10 = [MEMORY[0x1E4F2B410] allowedInSomeCountries:v8];

  return v10;
}

- (void)allowedCountriesDataSourceDidUpdateLocalCountrySet:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained regionAvailabilityProvidingDidUpdate:self];
}

- (void)allowedCountriesDataSourceDidUpdateActiveRemoteCountrySet:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (self->_reloadsLocalCountrySetOnRemoteCountrySetUpdate)
  {
    id v4 = [(HDAllowedCountriesDataSource *)self->_allowedCountriesDataSource activeRemoteCountrySet];
    v5 = v4;
    if (v4)
    {
      uint64_t v6 = [v4 contentVersion];
      id v21 = 0;
      uint64_t v7 = -[HDWatchAndCompanionCountrySetIntersectionAvailabilityProvider _lastContentVersionDuringReloadAttemptDomain]((uint64_t)self);
      v8 = [(HDAllowedCountriesDataSource *)self->_allowedCountriesDataSource featureIdentifier];
      v9 = [v7 numberForKey:v8 error:&v21];

      id v10 = v21;
      id v11 = v10;
      if (v9 || !v10)
      {
        BOOL v13 = [v9 integerValue] < v6;
      }
      else
      {
        _HKInitializeLogging();
        loggingCategory = self->_loggingCategory;
        if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          *(void *)&buf[4] = self;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v11;
          _os_log_error_impl(&dword_1BCB7D000, loggingCategory, OS_LOG_TYPE_ERROR, "[%{public}@] Could not read last content version to determine reload attempt eligibility: %{public}@", buf, 0x16u);
        }
        BOOL v13 = 0;
      }

      _HKInitializeLogging();
      v17 = self->_loggingCategory;
      BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
      if (v13)
      {
        if (v18)
        {
          *(_DWORD *)buf = 138543362;
          *(void *)&buf[4] = self;
          _os_log_impl(&dword_1BCB7D000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@] Attempting reload of local country set", buf, 0xCu);
        }
        allowedCountriesDataSource = self->_allowedCountriesDataSource;
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __87__HDWatchAndCompanionCountrySetIntersectionAvailabilityProvider__reloadLocalCountrySet__block_invoke;
        objc_super v23 = &unk_1E62FDAC0;
        v24 = self;
        uint64_t v25 = v6;
        [(HDAllowedCountriesDataSource *)allowedCountriesDataSource reloadLocalCountrySetWithCompletion:buf];
        goto LABEL_18;
      }
      if (v18)
      {
        *(_DWORD *)buf = 138543362;
        *(void *)&buf[4] = self;
        id v15 = "[%{public}@] Skipping reload of local country set: already attempted for current remote country set version";
        id v16 = v17;
        goto LABEL_17;
      }
    }
    else
    {
      _HKInitializeLogging();
      id v14 = self->_loggingCategory;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)&buf[4] = self;
        id v15 = "[%{public}@] Skipping reload of local country set due to missing remote country set";
        id v16 = v14;
LABEL_17:
        _os_log_impl(&dword_1BCB7D000, v16, OS_LOG_TYPE_DEFAULT, v15, buf, 0xCu);
      }
    }
LABEL_18:
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained regionAvailabilityProvidingDidUpdate:self];
}

void __87__HDWatchAndCompanionCountrySetIntersectionAvailabilityProvider__reloadLocalCountrySet__block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    if (v6)
    {
      uint64_t v7 = *(void *)(a1 + 40);
      id v16 = 0;
      v8 = -[HDWatchAndCompanionCountrySetIntersectionAvailabilityProvider _lastContentVersionDuringReloadAttemptDomain](v6);
      v9 = [NSNumber numberWithInteger:v7];
      id v10 = [*(id *)(v6 + 8) featureIdentifier];
      char v11 = [v8 setNumber:v9 forKey:v10 error:&v16];

      id v12 = v16;
      if ((v11 & 1) == 0)
      {
        _HKInitializeLogging();
        BOOL v13 = *(NSObject **)(v6 + 48);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          uint64_t v18 = v6;
          __int16 v19 = 2114;
          id v20 = v12;
          _os_log_error_impl(&dword_1BCB7D000, v13, OS_LOG_TYPE_ERROR, "[%{public}@] Error setting last content version: %{public}@", buf, 0x16u);
        }
      }
    }
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v14 = *(void *)(a1 + 32);
    id v15 = *(NSObject **)(v14 + 48);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v18 = v14;
      __int16 v19 = 2114;
      id v20 = v5;
      _os_log_error_impl(&dword_1BCB7D000, v15, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to initiate local country set reload: %{public}@", buf, 0x16u);
    }
  }
}

+ (id)lastContentVersionDuringReloadAttemptDomainForProfile:(id)a3
{
  id v3 = a3;
  id v4 = [[HDKeyValueDomain alloc] initWithCategory:0 domainName:@"HDWatchAndCompanionCountrySetIntersectionAvailabilityProvider_LastContentVersionDuringReloadAttempt" profile:v3];

  return v4;
}

- (id)_lastContentVersionDuringReloadAttemptDomain
{
  v2 = objc_opt_class();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
  id v4 = [v2 lastContentVersionDuringReloadAttemptDomainForProfile:WeakRetained];

  return v4;
}

- (HDRegionAvailabilityProvidingDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HDRegionAvailabilityProvidingDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_loggingCategory, 0);
  objc_storeStrong((id *)&self->_featureCapability, 0);
  objc_storeStrong((id *)&self->_pairedDeviceCapabilityProvider, 0);
  objc_destroyWeak((id *)&self->_profile);

  objc_storeStrong((id *)&self->_allowedCountriesDataSource, 0);
}

@end