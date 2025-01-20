@interface HDLocalCountrySetAvailabilityProvider
- (HDLocalCountrySetAvailabilityProvider)initWithFeatureIdentifier:(id)a3 defaultCountrySet:(id)a4 healthDaemon:(id)a5;
- (HDLocalCountrySetAvailabilityProvider)initWithFeatureIdentifier:(id)a3 defaultCountrySet:(id)a4 healthDaemon:(id)a5 overrideUserDefaults:(id)a6;
- (HDRegionAvailabilityProvidingDelegate)delegate;
- (HKCountrySet)countrySet;
- (NSString)description;
- (id)onboardingEligibilityForCountryCode:(id)a3;
- (id)onboardingEligibilityForCountryCode:(id)a3 device:(id)a4;
- (id)regionAvailability;
- (void)OTAFeatureAvailabilityManagerDidUpdateFeatureAvailabilityInfo:(id)a3;
- (void)dealloc;
- (void)downloadLatestOTAAvailabilityInfoWithCompletion:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setDelegate:(id)a3;
@end

@implementation HDLocalCountrySetAvailabilityProvider

- (HDLocalCountrySetAvailabilityProvider)initWithFeatureIdentifier:(id)a3 defaultCountrySet:(id)a4 healthDaemon:(id)a5
{
  v8 = (void *)MEMORY[0x1E4F1CB18];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = objc_msgSend(v8, "hk_localCountrySetOverrideUserDefaults");
  v13 = [(HDLocalCountrySetAvailabilityProvider *)self initWithFeatureIdentifier:v11 defaultCountrySet:v10 healthDaemon:v9 overrideUserDefaults:v12];

  return v13;
}

- (HDLocalCountrySetAvailabilityProvider)initWithFeatureIdentifier:(id)a3 defaultCountrySet:(id)a4 healthDaemon:(id)a5 overrideUserDefaults:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v23.receiver = self;
  v23.super_class = (Class)HDLocalCountrySetAvailabilityProvider;
  v14 = [(HDLocalCountrySetAvailabilityProvider *)&v23 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    featureIdentifier = v14->_featureIdentifier;
    v14->_featureIdentifier = (NSString *)v15;

    uint64_t v17 = [v11 copy];
    defaultCountrySet = v14->_defaultCountrySet;
    v14->_defaultCountrySet = (HKCountrySet *)v17;

    objc_storeWeak((id *)&v14->_healthDaemon, v12);
    objc_storeStrong((id *)&v14->_overrideUserDefaults, a6);
    id WeakRetained = objc_loadWeakRetained((id *)&v14->_healthDaemon);
    v20 = [WeakRetained OTAFeatureAvailabilityManager];
    [v20 registerObserver:v14 queue:0];

    overrideUserDefaults = v14->_overrideUserDefaults;
    if (overrideUserDefaults) {
      [(NSUserDefaults *)overrideUserDefaults addObserver:v14 forKeyPath:v10 options:0 context:0];
    }
  }

  return v14;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"%@:%@:%p", objc_opt_class(), self->_featureIdentifier, self];
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_healthDaemon);
  v4 = [WeakRetained OTAFeatureAvailabilityManager];
  [v4 unregisterObserver:self];

  [(NSUserDefaults *)self->_overrideUserDefaults removeObserver:self forKeyPath:self->_featureIdentifier];
  v5.receiver = self;
  v5.super_class = (Class)HDLocalCountrySetAvailabilityProvider;
  [(HDLocalCountrySetAvailabilityProvider *)&v5 dealloc];
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  if (obj)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained)
    {
      v6 = WeakRetained;
      id v7 = objc_loadWeakRetained((id *)&self->_delegate);

      if (v7 != obj)
      {
        v8 = [MEMORY[0x1E4F28B00] currentHandler];
        [v8 handleFailureInMethod:a2 object:self file:@"HDLocalCountrySetAvailabilityProvider.m" lineNumber:72 description:@"Delegate cannot be changed after it is set"];
      }
    }
  }
  objc_storeWeak((id *)&self->_delegate, obj);
}

- (HKCountrySet)countrySet
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (!self)
  {
LABEL_10:
    v8 = 0;
    goto LABEL_11;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_healthDaemon);
  v4 = [WeakRetained OTAFeatureAvailabilityManager];
  featureIdentifier = self->_featureIdentifier;
  id v19 = 0;
  v6 = [v4 featureAvailabilityInfoForFeature:featureIdentifier error:&v19];
  id v7 = v19;
  v8 = [v6 allowedCountrySet];

  if (!v8)
  {
    if ((objc_msgSend(v7, "hk_isHealthKitErrorWithCode:", 11) & 1) == 0)
    {
      _HKInitializeLogging();
      id v11 = HKLogInfrastructure();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v21 = self;
        __int16 v22 = 2114;
        id v23 = v7;
        _os_log_error_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_ERROR, "[%{public}@] Unexpected error attempting to read OTA info: %{public}@", buf, 0x16u);
      }
    }
    goto LABEL_10;
  }

  uint64_t v9 = [v8 contentVersion];
  if (v9 >= [(HKCountrySet *)self->_defaultCountrySet contentVersion])
  {
    id v10 = v8;
    v8 = v10;
    goto LABEL_12;
  }
LABEL_11:
  id v10 = self->_defaultCountrySet;
LABEL_12:
  id v12 = v10;
  id v13 = [(NSUserDefaults *)self->_overrideUserDefaults hk_countrySetForKey:self->_featureIdentifier];
  v14 = v12;
  if (v13)
  {
    _HKInitializeLogging();
    uint64_t v15 = HKLogInfrastructure();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v18 = [v13 dictionaryRepresentation];
      *(_DWORD *)buf = 138543618;
      v21 = self;
      __int16 v22 = 2114;
      id v23 = v18;
      _os_log_error_impl(&dword_1BCB7D000, v15, OS_LOG_TYPE_ERROR, "[%{public}@] Internal country set override present: %{public}@", buf, 0x16u);
    }
    v14 = (HKCountrySet *)v13;
  }
  v16 = v14;

  return v16;
}

- (void)OTAFeatureAvailabilityManagerDidUpdateFeatureAvailabilityInfo:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained regionAvailabilityProvidingDidUpdate:self];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = (NSUserDefaults *)a4;
  id v12 = a5;
  if ([v10 isEqualToString:self->_featureIdentifier]
    && self->_overrideUserDefaults == v11)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

    if (WeakRetained)
    {
      v14 = objc_loadWeakRetained((id *)&self->_delegate);
      [v14 regionAvailabilityProvidingDidUpdate:self];
    }
    else
    {
      _HKInitializeLogging();
      uint64_t v15 = HKLogInfrastructure();
      BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);

      if (!v16) {
        goto LABEL_4;
      }
      v14 = HKLogInfrastructure();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        id v19 = self;
        _os_log_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_INFO, "[%{public}@] No delegate to receive observation message", buf, 0xCu);
      }
    }
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)HDLocalCountrySetAvailabilityProvider;
    [(HDLocalCountrySetAvailabilityProvider *)&v17 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
LABEL_4:
}

- (id)onboardingEligibilityForCountryCode:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(HDLocalCountrySetAvailabilityProvider *)self regionAvailability];
  v6 = [v5 onboardingEligibilityForCountryCode:v4];

  return v6;
}

- (id)onboardingEligibilityForCountryCode:(id)a3 device:(id)a4
{
  id v5 = a3;
  v6 = [(HDLocalCountrySetAvailabilityProvider *)self regionAvailability];
  id v7 = [v6 onboardingEligibilityForCountryCode:v5];

  return v7;
}

- (id)regionAvailability
{
  v2 = (void *)MEMORY[0x1E4F2B410];
  v3 = (void *)MEMORY[0x1E4F2ABD8];
  id v4 = [(HDLocalCountrySetAvailabilityProvider *)self countrySet];
  id v5 = [v3 allowedCountriesInLocalSet:v4];
  v6 = [v2 allowedInSomeCountries:v5];

  return v6;
}

- (void)downloadLatestOTAAvailabilityInfoWithCompletion:(id)a3
{
  p_healthDaemon = &self->_healthDaemon;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_healthDaemon);
  id v5 = [WeakRetained OTAFeatureAvailabilityManager];
  [v5 downloadWithCompletion:v4];
}

- (HDRegionAvailabilityProvidingDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HDRegionAvailabilityProvidingDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_overrideUserDefaults, 0);
  objc_destroyWeak((id *)&self->_healthDaemon);
  objc_storeStrong((id *)&self->_defaultCountrySet, 0);

  objc_storeStrong((id *)&self->_featureIdentifier, 0);
}

@end