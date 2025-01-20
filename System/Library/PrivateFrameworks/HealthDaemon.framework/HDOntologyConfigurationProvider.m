@interface HDOntologyConfigurationProvider
- (BOOL)isCountryCodeSupported:(id)a3;
- (BOOL)isCountrySupported:(id)a3;
- (HDHealthOntologyConfiguration)unitTesting_ontologyConfigurationOverride;
- (HDOntologyConfigurationProvider)init;
- (HDProfile)profile;
- (NSSet)allSupportedCountryCodes;
- (NSSet)improveHealthRecordsGatedAnalyticsEnabledCountryCodes;
- (NSSet)optInDataCollectionEnabledCountryCodes;
- (id)ontologyConfigurationForCountryCode:(id)a3;
- (void)ontologyConfiguration;
- (void)setUnitTesting_ontologyConfigurationOverride:(id)a3;
@end

@implementation HDOntologyConfigurationProvider

- (HDOntologyConfigurationProvider)init
{
  v6.receiver = self;
  v6.super_class = (Class)HDOntologyConfigurationProvider;
  v2 = [(HDOntologyConfigurationProvider *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[HDHealthOntologyConfiguration bundledHealthOntologyConfiguration];
    ontologyConfiguration = v2->_ontologyConfiguration;
    v2->_ontologyConfiguration = (HDHealthOntologyConfiguration *)v3;
  }
  return v2;
}

- (void)ontologyConfiguration
{
  if (a1)
  {
    v2 = (void *)a1[3];
    if (!v2) {
      v2 = (void *)a1[1];
    }
    a1 = v2;
    uint64_t v1 = vars8;
  }
  return a1;
}

- (BOOL)isCountrySupported:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 countryCode];

  if (v5)
  {
    objc_super v6 = [v4 countryCode];
    BOOL v7 = [(HDOntologyConfigurationProvider *)self isCountryCodeSupported:v6];
  }
  else
  {
    _HKInitializeLogging();
    v8 = HKLogHealthOntology();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138543618;
      v11 = self;
      __int16 v12 = 2114;
      id v13 = v4;
      _os_log_error_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_ERROR, "%{public}@: passing a locale without country code (%{public}@) to isCountrySupported:, will return NO", (uint8_t *)&v10, 0x16u);
    }

    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)isCountryCodeSupported:(id)a3
{
  uint64_t v3 = [(HDOntologyConfigurationProvider *)self ontologyConfigurationForCountryCode:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (NSSet)allSupportedCountryCodes
{
  v2 = -[HDOntologyConfigurationProvider ontologyConfiguration](self);
  uint64_t v3 = [v2 allCountryConfigurations];
  BOOL v4 = objc_msgSend(v3, "hk_mapToSet:", &__block_literal_global_138);

  return (NSSet *)v4;
}

uint64_t __59__HDOntologyConfigurationProvider_allSupportedCountryCodes__block_invoke(uint64_t a1, void *a2)
{
  return [a2 countryCode];
}

- (NSSet)improveHealthRecordsGatedAnalyticsEnabledCountryCodes
{
  v2 = -[HDOntologyConfigurationProvider ontologyConfiguration](self);
  uint64_t v3 = [v2 allCountryConfigurations];
  BOOL v4 = objc_msgSend(v3, "hk_mapToSet:", &__block_literal_global_279);

  return (NSSet *)v4;
}

id __88__HDOntologyConfigurationProvider_improveHealthRecordsGatedAnalyticsEnabledCountryCodes__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 analyticsOptions])
  {
    uint64_t v3 = [v2 countryCode];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (NSSet)optInDataCollectionEnabledCountryCodes
{
  id v2 = -[HDOntologyConfigurationProvider ontologyConfiguration](self);
  uint64_t v3 = [v2 allCountryConfigurations];
  BOOL v4 = objc_msgSend(v3, "hk_mapToSet:", &__block_literal_global_281_0);

  return (NSSet *)v4;
}

id __73__HDOntologyConfigurationProvider_optInDataCollectionEnabledCountryCodes__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (([v2 analyticsOptions] & 2) != 0)
  {
    uint64_t v3 = [v2 countryCode];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (id)ontologyConfigurationForCountryCode:(id)a3
{
  id v4 = a3;
  v5 = -[HDOntologyConfigurationProvider ontologyConfiguration](self);
  objc_super v6 = [v5 configurationForCountryCode:v4];

  return v6;
}

- (HDProfile)profile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);

  return (HDProfile *)WeakRetained;
}

- (HDHealthOntologyConfiguration)unitTesting_ontologyConfigurationOverride
{
  return self->_unitTesting_ontologyConfigurationOverride;
}

- (void)setUnitTesting_ontologyConfigurationOverride:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitTesting_ontologyConfigurationOverride, 0);
  objc_destroyWeak((id *)&self->_profile);

  objc_storeStrong((id *)&self->_ontologyConfiguration, 0);
}

@end