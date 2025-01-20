@interface HDOTAFeatureDisableAndExpiryProvider
- (HDFeatureDisableAndExpiryProvidingDelegate)delegate;
- (HDOTAFeatureDisableAndExpiryProvider)initWithDaemon:(id)a3 featureIdentifier:(id)a4;
- (HDOTAFeatureDisableAndExpiryProvider)initWithDaemon:(id)a3 remoteDisableCondition:(id)a4 seedExpirationCondition:(id)a5;
- (id)description;
- (id)rescindedStatusForCountryCode:(id)a3 device:(id)a4 error:(id *)a5;
- (id)rescindedStatusOnActivePairedDeviceForCountryCode:(id)a3 error:(id *)a4;
- (void)OTAFeatureAvailabilityManagerDidUpdateFeatureAvailabilityInfo:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation HDOTAFeatureDisableAndExpiryProvider

- (HDOTAFeatureDisableAndExpiryProvider)initWithDaemon:(id)a3 featureIdentifier:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  _HKInitializeLogging();
  loggingCategory = self->_loggingCategory;
  if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543618;
    v14 = self;
    __int16 v15 = 2114;
    id v16 = v6;
    _os_log_debug_impl(&dword_1BCB7D000, loggingCategory, OS_LOG_TYPE_DEBUG, "[%{public}@] Initializing with a featureIdentifier: %{public}@", buf, 0x16u);
  }
  v9 = [NSString stringWithFormat:@"Disable%@", v6];
  v10 = [NSString stringWithFormat:@"Expire%@", v6];
  v11 = [(HDOTAFeatureDisableAndExpiryProvider *)self initWithDaemon:v7 remoteDisableCondition:v9 seedExpirationCondition:v10];

  return v11;
}

- (HDOTAFeatureDisableAndExpiryProvider)initWithDaemon:(id)a3 remoteDisableCondition:(id)a4 seedExpirationCondition:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)HDOTAFeatureDisableAndExpiryProvider;
  v11 = [(HDOTAFeatureDisableAndExpiryProvider *)&v23 init];
  if (v11)
  {
    uint64_t v12 = [v9 copy];
    remoteDisableCondition = v11->_remoteDisableCondition;
    v11->_remoteDisableCondition = (NSString *)v12;

    uint64_t v14 = [v10 copy];
    seedExpirationCondition = v11->_seedExpirationCondition;
    v11->_seedExpirationCondition = (NSString *)v14;

    uint64_t v16 = HKLogInfrastructure();
    loggingCategory = v11->_loggingCategory;
    v11->_loggingCategory = (OS_os_log *)v16;

    uint64_t v18 = [v8 OTAFeatureAvailabilityManager];
    OTAFeatureAvailabilityManager = v11->_OTAFeatureAvailabilityManager;
    v11->_OTAFeatureAvailabilityManager = (HDOTAFeatureAvailabilityManager *)v18;

    uint64_t v20 = [v8 nanoRegistryDeviceCapabilityProvider];
    nanoRegistryDeviceCapabilityProvider = v11->_nanoRegistryDeviceCapabilityProvider;
    v11->_nanoRegistryDeviceCapabilityProvider = (HDPairedDeviceCapabilityProviding *)v20;

    [(HDOTAFeatureAvailabilityManager *)v11->_OTAFeatureAvailabilityManager registerObserver:v11 queue:0];
  }

  return v11;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"%@:%@|%@", objc_opt_class(), self->_remoteDisableCondition, self->_seedExpirationCondition];
}

- (id)rescindedStatusOnActivePairedDeviceForCountryCode:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (self)
  {
    id v7 = [(HDPairedDeviceCapabilityProviding *)self->_nanoRegistryDeviceCapabilityProvider activePairedDevice];
  }
  else
  {
    id v7 = 0;
  }
  id v8 = [(HDOTAFeatureDisableAndExpiryProvider *)self rescindedStatusForCountryCode:v6 device:v7 error:a4];

  return v8;
}

- (id)rescindedStatusForCountryCode:(id)a3 device:(id)a4 error:(id *)a5
{
  v45[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = [[HDWatchRemoteFeatureAvailabilityDataSource alloc] initWithDevice:v9];

  [(HDWatchRemoteFeatureAvailabilityDataSource *)v10 setOnboardingCountryCode:v8];
  OTAFeatureAvailabilityManager = self->_OTAFeatureAvailabilityManager;
  id v36 = 0;
  uint64_t v12 = [(HDOTAFeatureAvailabilityManager *)OTAFeatureAvailabilityManager disableAndExpiryConditionsDictionaryWithError:&v36];
  id v13 = v36;
  uint64_t v14 = v13;
  if (v12)
  {
    id v15 = objc_alloc(MEMORY[0x1E4F2B418]);
    uint64_t v16 = (void *)MEMORY[0x1E4F1CAD0];
    seedExpirationCondition = self->_seedExpirationCondition;
    v45[0] = self->_remoteDisableCondition;
    v45[1] = seedExpirationCondition;
    uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:2];
    v19 = [v16 setWithArray:v18];
    id v20 = (id)[v15 initWithRawValue:v12 dataSource:v10 supportedConditions:v19];

    v21 = [v20 evaluateAll];
    v22 = [v21 objectForKeyedSubscript:self->_remoteDisableCondition];
    uint64_t v23 = [v22 BOOLValue];

    v24 = [v21 objectForKeyedSubscript:self->_seedExpirationCondition];
    uint64_t v25 = [v24 BOOLValue];

    _HKInitializeLogging();
    loggingCategory = self->_loggingCategory;
    if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_DEBUG))
    {
      v33 = NSNumber;
      log = loggingCategory;
      v34 = [v33 numberWithBool:v23];
      uint64_t v31 = [NSNumber numberWithBool:v25];
      *(_DWORD *)buf = 138544130;
      v38 = self;
      __int16 v39 = 2112;
      id v40 = v8;
      __int16 v41 = 2112;
      v42 = v34;
      __int16 v43 = 2112;
      uint64_t v44 = v31;
      v32 = (void *)v31;
      _os_log_debug_impl(&dword_1BCB7D000, log, OS_LOG_TYPE_DEBUG, "[%{public}@] rescindedStatusForCountryCode: %@ -> (isDisabled: %@, isExpired: %@)", buf, 0x2Au);
    }
    v27 = &unk_1F17EEBE0;
    if (v23) {
      v27 = &unk_1F17EEC10;
    }
    if (v25) {
      v28 = &unk_1F17EEBF8;
    }
    else {
      v28 = v27;
    }

    goto LABEL_10;
  }
  if (objc_msgSend(v13, "hk_isHealthKitErrorWithCode:", 11))
  {
    v28 = &unk_1F17EEBE0;
    goto LABEL_11;
  }
  id v30 = v14;
  id v20 = v30;
  if (!v30) {
    goto LABEL_18;
  }
  if (!a5)
  {
    _HKLogDroppedError();
LABEL_18:
    v28 = 0;
    goto LABEL_10;
  }
  id v20 = v30;
  v28 = 0;
  *a5 = v20;
LABEL_10:

LABEL_11:
  return v28;
}

- (void)OTAFeatureAvailabilityManagerDidUpdateFeatureAvailabilityInfo:(id)a3
{
  id v4 = [(HDOTAFeatureDisableAndExpiryProvider *)self delegate];
  [v4 disableAndExpiryProviderDidUpdate:self];
}

- (HDFeatureDisableAndExpiryProvidingDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HDFeatureDisableAndExpiryProvidingDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_OTAFeatureAvailabilityManager, 0);
  objc_storeStrong((id *)&self->_nanoRegistryDeviceCapabilityProvider, 0);
  objc_storeStrong((id *)&self->_loggingCategory, 0);
  objc_storeStrong((id *)&self->_seedExpirationCondition, 0);

  objc_storeStrong((id *)&self->_remoteDisableCondition, 0);
}

@end