@interface HDAllowedCountriesDataSourceWithNanoRegistryFallback
- (HDAllowedCountriesDataSourceObserver)delegate;
- (HDAllowedCountriesDataSourceWithNanoRegistryFallback)initWithDaemon:(id)a3 allowedCountriesDataSource:(id)a4 availableRegionsDevicePropertyName:(id)a5 loggingCategory:(id)a6 shouldReturnLocalAvailabilityForNilDeviceRegions:(BOOL)a7;
- (HKCountrySet)activeRemoteCountrySet;
- (HKCountrySet)localCountrySet;
- (NSString)featureIdentifier;
- (id)_nanoRegistryCountryListForDevice:(uint64_t)a1;
- (id)remoteCountrySetForDevice:(id)a3;
- (void)reloadLocalCountrySetWithCompletion:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation HDAllowedCountriesDataSourceWithNanoRegistryFallback

- (HDAllowedCountriesDataSourceWithNanoRegistryFallback)initWithDaemon:(id)a3 allowedCountriesDataSource:(id)a4 availableRegionsDevicePropertyName:(id)a5 loggingCategory:(id)a6 shouldReturnLocalAvailabilityForNilDeviceRegions:(BOOL)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v21.receiver = self;
  v21.super_class = (Class)HDAllowedCountriesDataSourceWithNanoRegistryFallback;
  v16 = [(HDAllowedCountriesDataSourceWithNanoRegistryFallback *)&v21 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_allowedCountriesDataSource, a4);
    uint64_t v18 = [v12 nanoRegistryDeviceCapabilityProvider];
    pairedDeviceCapabilityProvider = v17->_pairedDeviceCapabilityProvider;
    v17->_pairedDeviceCapabilityProvider = (HDPairedDeviceCapabilityProviding *)v18;

    objc_storeStrong((id *)&v17->_devicePropertyName, a5);
    objc_storeStrong((id *)&v17->_loggingCategory, a6);
    v17->_shouldReturnLocalAvailabilityForNilDeviceRegions = a7;
  }

  return v17;
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
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v3 = [(HDAllowedCountriesDataSource *)self->_allowedCountriesDataSource activeRemoteCountrySet];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v6 = [(HDPairedDeviceCapabilityProviding *)self->_pairedDeviceCapabilityProvider activePairedDevice];
    if (v6)
    {
      -[HDAllowedCountriesDataSourceWithNanoRegistryFallback _nanoRegistryCountryListForDevice:]((uint64_t)self, v6);
      id v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      _HKInitializeLogging();
      loggingCategory = self->_loggingCategory;
      if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 138543362;
        v10 = self;
        _os_log_impl(&dword_1BCB7D000, loggingCategory, OS_LOG_TYPE_DEFAULT, "[%{public}@] No active paired device found", (uint8_t *)&v9, 0xCu);
      }
      id v5 = 0;
    }
  }

  return (HKCountrySet *)v5;
}

- (id)_nanoRegistryCountryListForDevice:(uint64_t)a1
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = v3;
  if (a1)
  {
    id v5 = [v3 valueForProperty:*(void *)(a1 + 24)];
    if (v5)
    {
      uint64_t v6 = [objc_alloc(MEMORY[0x1E4F2AE70]) initWithDictionaryRepresentation:v5 provenance:2];
    }
    else
    {
      _HKInitializeLogging();
      v7 = *(NSObject **)(a1 + 32);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 138543618;
        uint64_t v11 = a1;
        __int16 v12 = 2114;
        id v13 = v4;
        _os_log_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Nil available regions found for paired device %{public}@", (uint8_t *)&v10, 0x16u);
      }
      if (!*(unsigned char *)(a1 + 40))
      {
        a1 = 0;
        goto LABEL_11;
      }
      _HKInitializeLogging();
      v8 = *(NSObject **)(a1 + 32);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 138543618;
        uint64_t v11 = a1;
        __int16 v12 = 2114;
        id v13 = v4;
        _os_log_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Returning local device availability for paired device %{public}@", (uint8_t *)&v10, 0x16u);
      }
      uint64_t v6 = [(id)a1 localCountrySet];
    }
    a1 = v6;
LABEL_11:
  }

  return (id)a1;
}

- (id)remoteCountrySetForDevice:(id)a3
{
  id v4 = a3;
  id v5 = [(HDAllowedCountriesDataSource *)self->_allowedCountriesDataSource remoteCountrySetForDevice:v4];
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    -[HDAllowedCountriesDataSourceWithNanoRegistryFallback _nanoRegistryCountryListForDevice:]((uint64_t)self, v4);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

- (void)reloadLocalCountrySetWithCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingCategory, 0);
  objc_storeStrong((id *)&self->_devicePropertyName, 0);
  objc_storeStrong((id *)&self->_pairedDeviceCapabilityProvider, 0);

  objc_storeStrong((id *)&self->_allowedCountriesDataSource, 0);
}

@end