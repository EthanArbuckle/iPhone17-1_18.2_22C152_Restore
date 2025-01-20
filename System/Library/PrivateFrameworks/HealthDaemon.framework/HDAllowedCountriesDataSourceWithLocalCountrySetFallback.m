@interface HDAllowedCountriesDataSourceWithLocalCountrySetFallback
- (HDAllowedCountriesDataSourceObserver)delegate;
- (HDAllowedCountriesDataSourceWithLocalCountrySetFallback)initWithDaemon:(id)a3 allowedCountriesDataSource:(id)a4 loggingCategory:(id)a5;
- (HKCountrySet)activeRemoteCountrySet;
- (HKCountrySet)localCountrySet;
- (NSString)featureIdentifier;
- (id)remoteCountrySetForDevice:(id)a3;
- (void)reloadLocalCountrySetWithCompletion:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation HDAllowedCountriesDataSourceWithLocalCountrySetFallback

- (HDAllowedCountriesDataSourceWithLocalCountrySetFallback)initWithDaemon:(id)a3 allowedCountriesDataSource:(id)a4 loggingCategory:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)HDAllowedCountriesDataSourceWithLocalCountrySetFallback;
  v11 = [(HDAllowedCountriesDataSourceWithLocalCountrySetFallback *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_allowedCountriesDataSource, a4);
    uint64_t v13 = [v8 nanoRegistryDeviceCapabilityProvider];
    pairedDeviceCapabilityProvider = v12->_pairedDeviceCapabilityProvider;
    v12->_pairedDeviceCapabilityProvider = (HDPairedDeviceCapabilityProviding *)v13;

    objc_storeStrong((id *)&v12->_loggingCategory, a5);
  }

  return v12;
}

- (HDAllowedCountriesDataSourceObserver)delegate
{
  return (HDAllowedCountriesDataSourceObserver *)[(HDAllowedCountriesDataSource *)self->_allowedCountriesDataSource delegate];
}

- (void)setDelegate:(id)a3
{
}

- (NSString)featureIdentifier
{
  return (NSString *)[(HDAllowedCountriesDataSource *)self->_allowedCountriesDataSource featureIdentifier];
}

- (HKCountrySet)localCountrySet
{
  return (HKCountrySet *)[(HDAllowedCountriesDataSource *)self->_allowedCountriesDataSource localCountrySet];
}

- (HKCountrySet)activeRemoteCountrySet
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v3 = [(HDAllowedCountriesDataSource *)self->_allowedCountriesDataSource activeRemoteCountrySet];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v6 = [(HDPairedDeviceCapabilityProviding *)self->_pairedDeviceCapabilityProvider activePairedDevice];
    _HKInitializeLogging();
    loggingCategory = self->_loggingCategory;
    BOOL v8 = os_log_type_enabled(loggingCategory, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v8)
      {
        int v10 = 138543618;
        v11 = self;
        __int16 v12 = 2114;
        uint64_t v13 = v6;
        _os_log_impl(&dword_1BCB7D000, loggingCategory, OS_LOG_TYPE_DEFAULT, "[%{public}@] Returning local device availability for paired device %{public}@", (uint8_t *)&v10, 0x16u);
      }
      id v5 = [(HDAllowedCountriesDataSourceWithLocalCountrySetFallback *)self localCountrySet];
    }
    else
    {
      if (v8)
      {
        int v10 = 138543362;
        v11 = self;
        _os_log_impl(&dword_1BCB7D000, loggingCategory, OS_LOG_TYPE_DEFAULT, "[%{public}@] No active paired device found", (uint8_t *)&v10, 0xCu);
      }
      id v5 = 0;
    }
  }

  return (HKCountrySet *)v5;
}

- (id)remoteCountrySetForDevice:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HDAllowedCountriesDataSource *)self->_allowedCountriesDataSource remoteCountrySetForDevice:v4];
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    _HKInitializeLogging();
    loggingCategory = self->_loggingCategory;
    if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138543618;
      __int16 v12 = self;
      __int16 v13 = 2114;
      id v14 = v4;
      _os_log_impl(&dword_1BCB7D000, loggingCategory, OS_LOG_TYPE_DEFAULT, "[%{public}@] Returning local device availability for paired device %{public}@", (uint8_t *)&v11, 0x16u);
    }
    id v7 = [(HDAllowedCountriesDataSourceWithLocalCountrySetFallback *)self localCountrySet];
  }
  id v9 = v7;

  return v9;
}

- (void)reloadLocalCountrySetWithCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingCategory, 0);
  objc_storeStrong((id *)&self->_pairedDeviceCapabilityProvider, 0);

  objc_storeStrong((id *)&self->_allowedCountriesDataSource, 0);
}

@end