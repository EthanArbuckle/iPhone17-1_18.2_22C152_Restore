@interface HDPairedFeaturePropertiesSyncManager
- (HDAllowedCountriesDataSourceObserver)delegate;
- (HDPairedFeaturePropertiesSyncManager)initWithFeatureIdentifier:(id)a3 localFeatureAttributes:(id)a4 localCountrySetAvailabilityProvider:(id)a5;
- (HDPairedFeaturePropertiesSyncManager)initWithFeatureIdentifier:(id)a3 localFeatureAttributes:(id)a4 localCountrySetAvailabilityProvider:(id)a5 activeRemoteReadSourceProvider:(id)a6 remoteReadSourceForDeviceProvider:(id)a7 localWriteSource:(id)a8;
- (HKCountrySet)activeRemoteCountrySet;
- (HKCountrySet)localCountrySet;
- (HKPairedFeatureAttributes)currentPairedFeatureAttributes;
- (NSString)featureIdentifier;
- (id)pairedFeatureAttributesForPairedDevice:(id)a3;
- (id)remoteCountrySetForDevice:(id)a3;
- (void)dealloc;
- (void)regionAvailabilityProvidingDidUpdate:(id)a3;
- (void)reloadLocalCountrySetWithCompletion:(id)a3;
- (void)setDelegate:(id)a3;
- (void)synchronizeLocalProperties;
@end

@implementation HDPairedFeaturePropertiesSyncManager

- (HDPairedFeaturePropertiesSyncManager)initWithFeatureIdentifier:(id)a3 localFeatureAttributes:(id)a4 localCountrySetAvailabilityProvider:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = HKLocalFeaturePropertiesDefaultsDomainForFeatureIdentifier(v10);
  v12 = (void *)MEMORY[0x1E4F2B860];
  id v13 = v11;
  v14 = [v12 sharedBehavior];
  int v15 = [v14 isAppleWatch];

  if (v15)
  {
    v16 = [_HDDeferredFeaturePropertiesWriting alloc];
    v17 = [MEMORY[0x1E4F79EF0] sharedInstance];
    v18 = [(_HDDeferredFeaturePropertiesWriting *)v16 initWithLocalDomain:v13 pairedDeviceRegistry:v17];
  }
  else
  {
    v18 = [[_HDFeaturePropertiesWriting alloc] initWithLocalDomain:v13];
    v17 = v13;
  }

  v19 = [(HDPairedFeaturePropertiesSyncManager *)self initWithFeatureIdentifier:v10 localFeatureAttributes:v9 localCountrySetAvailabilityProvider:v8 activeRemoteReadSourceProvider:&__block_literal_global_156 remoteReadSourceForDeviceProvider:&__block_literal_global_378 localWriteSource:v18];
  return v19;
}

id __125__HDPairedFeaturePropertiesSyncManager_initWithFeatureIdentifier_localFeatureAttributes_localCountrySetAvailabilityProvider___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [MEMORY[0x1E4F2B860] sharedBehavior];
  int v4 = [v3 isCompanionCapable];

  if (v4)
  {
    v5 = (void *)[objc_alloc(MEMORY[0x1E4F79CD8]) initWithDomain:v2];
    id v6 = (id)[v5 synchronize];
  }
  else
  {
    v7 = [MEMORY[0x1E4F2B860] sharedBehavior];
    int v8 = [v7 isAppleWatch];

    if (v8) {
      v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:v2];
    }
    else {
      v5 = 0;
    }
  }

  return v5;
}

id __125__HDPairedFeaturePropertiesSyncManager_initWithFeatureIdentifier_localFeatureAttributes_localCountrySetAvailabilityProvider___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = v4;
  v7 = [MEMORY[0x1E4F2B860] sharedBehavior];
  int v8 = [v7 isCompanionCapable];

  if (v8)
  {
    id v9 = (void *)[objc_alloc(MEMORY[0x1E4F79CD8]) initWithDomain:v6 pairedDevice:v5];
    id v10 = (id)[v9 synchronize];
  }
  else
  {
    v11 = [MEMORY[0x1E4F2B860] sharedBehavior];
    int v12 = [v11 isAppleWatch];

    if (v12) {
      id v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:v6];
    }
    else {
      id v9 = 0;
    }
  }

  return v9;
}

- (HDPairedFeaturePropertiesSyncManager)initWithFeatureIdentifier:(id)a3 localFeatureAttributes:(id)a4 localCountrySetAvailabilityProvider:(id)a5 activeRemoteReadSourceProvider:(id)a6 remoteReadSourceForDeviceProvider:(id)a7 localWriteSource:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v35.receiver = self;
  v35.super_class = (Class)HDPairedFeaturePropertiesSyncManager;
  v20 = [(HDPairedFeaturePropertiesSyncManager *)&v35 init];
  if (v20)
  {
    id v34 = v16;
    uint64_t v21 = [v14 copy];
    featureIdentifier = v20->_featureIdentifier;
    v20->_featureIdentifier = (NSString *)v21;

    uint64_t v23 = [v15 copy];
    localFeatureAttributes = v20->_localFeatureAttributes;
    v20->_localFeatureAttributes = (HKFeatureAttributes *)v23;

    objc_storeStrong((id *)&v20->_localCountrySetAvailabilityProvider, a5);
    v25 = _Block_copy(v17);
    id activeRemoteReadSourceProvider = v20->_activeRemoteReadSourceProvider;
    v20->_id activeRemoteReadSourceProvider = v25;

    v27 = _Block_copy(v18);
    id remoteReadSourceForDeviceProvider = v20->_remoteReadSourceForDeviceProvider;
    v20->_id remoteReadSourceForDeviceProvider = v27;

    objc_storeStrong((id *)&v20->_localWriteSource, a8);
    v20->_nanoPreferencesSyncChangeNotificationToken = -1;
    objc_initWeak(&location, v20);
    HKFeaturePropertiesChangeNotificationForFeatureIdentifier();
    id v29 = objc_claimAutoreleasedReturnValue();
    v30 = (const char *)[v29 UTF8String];
    v31 = MEMORY[0x1E4F14428];
    id v32 = MEMORY[0x1E4F14428];
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __89__HDPairedFeaturePropertiesSyncManager__registerForNanoPreferencesSyncChangeNotification__block_invoke;
    handler[3] = &unk_1E62F3490;
    objc_copyWeak(&v37, &location);
    notify_register_dispatch(v30, &v20->_nanoPreferencesSyncChangeNotificationToken, v31, handler);

    objc_destroyWeak(&v37);
    objc_destroyWeak(&location);
    [(HDLocalCountrySetAvailabilityProvider *)v20->_localCountrySetAvailabilityProvider setDelegate:v20];
    id v16 = v34;
  }

  return v20;
}

- (void)dealloc
{
  if (self)
  {
    int nanoPreferencesSyncChangeNotificationToken = self->_nanoPreferencesSyncChangeNotificationToken;
    if (nanoPreferencesSyncChangeNotificationToken != -1) {
      notify_cancel(nanoPreferencesSyncChangeNotificationToken);
    }
  }
  v4.receiver = self;
  v4.super_class = (Class)HDPairedFeaturePropertiesSyncManager;
  [(HDPairedFeaturePropertiesSyncManager *)&v4 dealloc];
}

- (void)synchronizeLocalProperties
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = NSDictionaryPreferencesSyncRepresentationForHKFeatureAttributes(self->_localFeatureAttributes);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __66__HDPairedFeaturePropertiesSyncManager_synchronizeLocalProperties__block_invoke;
  v11[3] = &unk_1E6304A50;
  v11[4] = self;
  [v3 enumerateKeysAndObjectsUsingBlock:v11];

  objc_super v4 = [(HDLocalCountrySetAvailabilityProvider *)self->_localCountrySetAvailabilityProvider countrySet];
  id v5 = NSDictionaryPreferencesSyncRepresentationForHKCountrySet(v4);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __66__HDPairedFeaturePropertiesSyncManager_synchronizeLocalProperties__block_invoke_2;
  v10[3] = &unk_1E6304A50;
  v10[4] = self;
  [v5 enumerateKeysAndObjectsUsingBlock:v10];

  _HKInitializeLogging();
  id v6 = HKLogInfrastructure();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_opt_class();
    featureIdentifier = self->_featureIdentifier;
    *(_DWORD *)buf = 138543618;
    id v13 = v7;
    __int16 v14 = 2114;
    id v15 = featureIdentifier;
    id v9 = v7;
    _os_log_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@:%{public}@] Initiating NanoPreferencesSync of feature properties", buf, 0x16u);
  }
  [(HDFeaturePropertiesWriting *)self->_localWriteSource synchronize];
}

uint64_t __66__HDPairedFeaturePropertiesSyncManager_synchronizeLocalProperties__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(*(void *)(a1 + 32) + 48) setObject:a3 forKey:a2];
}

uint64_t __66__HDPairedFeaturePropertiesSyncManager_synchronizeLocalProperties__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(*(void *)(a1 + 32) + 48) setObject:a3 forKey:a2];
}

- (HKPairedFeatureAttributes)currentPairedFeatureAttributes
{
  v3 = HKRemoteFeaturePropertiesDefaultsDomainForFeatureIdentifier(self->_featureIdentifier);
  objc_super v4 = (*((void (**)(void))self->_activeRemoteReadSourceProvider + 2))();
  id v5 = HKFeatureAttributesFromSource(v4);
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F2B318]) initWithLocalAttributes:self->_localFeatureAttributes pairedAttributes:v5];

  return (HKPairedFeatureAttributes *)v6;
}

- (id)pairedFeatureAttributesForPairedDevice:(id)a3
{
  featureIdentifier = self->_featureIdentifier;
  id v5 = a3;
  id v6 = HKRemoteFeaturePropertiesDefaultsDomainForFeatureIdentifier(featureIdentifier);
  v7 = (*((void (**)(void))self->_remoteReadSourceForDeviceProvider + 2))();

  int v8 = HKFeatureAttributesFromSource(v7);
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F2B318]) initWithLocalAttributes:self->_localFeatureAttributes pairedAttributes:v8];

  return v9;
}

- (HKCountrySet)localCountrySet
{
  return [(HDLocalCountrySetAvailabilityProvider *)self->_localCountrySetAvailabilityProvider countrySet];
}

- (HKCountrySet)activeRemoteCountrySet
{
  v3 = HKRemoteFeaturePropertiesDefaultsDomainForFeatureIdentifier(self->_featureIdentifier);
  objc_super v4 = (*((void (**)(void))self->_activeRemoteReadSourceProvider + 2))();
  id v5 = HKCountrySetFromSource(v4);

  return (HKCountrySet *)v5;
}

- (id)remoteCountrySetForDevice:(id)a3
{
  featureIdentifier = self->_featureIdentifier;
  id v5 = a3;
  id v6 = HKRemoteFeaturePropertiesDefaultsDomainForFeatureIdentifier(featureIdentifier);
  v7 = (*((void (**)(void))self->_remoteReadSourceForDeviceProvider + 2))();

  int v8 = HKCountrySetFromSource(v7);

  return v8;
}

void __89__HDPairedFeaturePropertiesSyncManager__registerForNanoPreferencesSyncChangeNotification__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    _HKInitializeLogging();
    v1 = HKLogInfrastructure();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
    {
      id v2 = objc_opt_class();
      uint64_t v3 = *((void *)WeakRetained + 1);
      *(_DWORD *)buf = 138543618;
      int v8 = v2;
      __int16 v9 = 2114;
      uint64_t v10 = v3;
      id v4 = v2;
      _os_log_impl(&dword_1BCB7D000, v1, OS_LOG_TYPE_DEFAULT, "[%{public}@:%{public}@] Notifying observers for received NPS change notification", buf, 0x16u);
    }
    id v5 = objc_loadWeakRetained((id *)WeakRetained + 8);
    [v5 allowedCountriesDataSourceDidUpdateActiveRemoteCountrySet:WeakRetained];
  }
}

- (void)reloadLocalCountrySetWithCompletion:(id)a3
{
}

- (void)regionAvailabilityProvidingDidUpdate:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  id v4 = HKLogInfrastructure();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = objc_opt_class();
    featureIdentifier = self->_featureIdentifier;
    int v9 = 138543618;
    uint64_t v10 = v5;
    __int16 v11 = 2114;
    int v12 = featureIdentifier;
    id v7 = v5;
    _os_log_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@:%{public}@] Notifying observers for local country set update", (uint8_t *)&v9, 0x16u);
  }
  [(HDPairedFeaturePropertiesSyncManager *)self synchronizeLocalProperties];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained allowedCountriesDataSourceDidUpdateLocalCountrySet:self];
}

- (NSString)featureIdentifier
{
  return self->_featureIdentifier;
}

- (HDAllowedCountriesDataSourceObserver)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HDAllowedCountriesDataSourceObserver *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_localWriteSource, 0);
  objc_storeStrong(&self->_remoteReadSourceForDeviceProvider, 0);
  objc_storeStrong(&self->_activeRemoteReadSourceProvider, 0);
  objc_storeStrong((id *)&self->_localCountrySetAvailabilityProvider, 0);
  objc_storeStrong((id *)&self->_localFeatureAttributes, 0);

  objc_storeStrong((id *)&self->_featureIdentifier, 0);
}

@end