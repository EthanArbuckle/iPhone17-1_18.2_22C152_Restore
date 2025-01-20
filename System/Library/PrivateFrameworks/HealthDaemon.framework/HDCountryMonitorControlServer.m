@interface HDCountryMonitorControlServer
+ (id)createTaskServerWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 error:(id *)a7;
+ (id)requiredEntitlements;
+ (id)taskIdentifier;
- (id)exportedInterface;
- (id)remoteInterface;
- (void)remote_fetchCurrentISOCountryCodeAndNotifyObserversWithCompletion:(id)a3;
@end

@implementation HDCountryMonitorControlServer

- (void)remote_fetchCurrentISOCountryCodeAndNotifyObserversWithCompletion:(id)a3
{
  id v4 = a3;
  OTAFeatureAvailabilityManager = self->_OTAFeatureAvailabilityManager;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __99__HDCountryMonitorControlServer_remote_fetchCurrentISOCountryCodeAndNotifyObserversWithCompletion___block_invoke;
  v8[3] = &unk_1E62F2978;
  v8[4] = self;
  [(HDOTAFeatureAvailabilityManager *)OTAFeatureAvailabilityManager downloadWithCompletion:v8];
  countryMonitor = self->_countryMonitor;
  if (countryMonitor)
  {
    [(HDPeriodicCountryMonitor *)countryMonitor fetchCurrentISOCountryCodeAndNotifyObserversWithCompletion:v4];
  }
  else
  {
    v7 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 110, @"Country monitoring not available");
    (*((void (**)(id, void, void, void *))v4 + 2))(v4, 0, 0, v7);
  }
}

void __99__HDCountryMonitorControlServer_remote_fetchCurrentISOCountryCodeAndNotifyObserversWithCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    v5 = HKLogInfrastructure();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138543618;
      id v8 = (id)objc_opt_class();
      __int16 v9 = 2114;
      id v10 = v4;
      id v6 = v8;
      _os_log_error_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_ERROR, "[%{public}@] Error performing immediate download: %{public}@", (uint8_t *)&v7, 0x16u);
    }
  }
}

+ (id)createTaskServerWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 error:(id *)a7
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = [v11 profile];
  v15 = [v14 periodicCountryMonitor];

  v16 = [(HDStandardTaskServer *)[HDCountryMonitorControlServer alloc] initWithUUID:v13 configuration:v12 client:v11 delegate:v10];
  countryMonitor = v16->_countryMonitor;
  v16->_countryMonitor = v15;
  v18 = v15;

  v19 = [v11 profile];

  v20 = [v19 daemon];
  uint64_t v21 = [v20 OTAFeatureAvailabilityManager];
  OTAFeatureAvailabilityManager = v16->_OTAFeatureAvailabilityManager;
  v16->_OTAFeatureAvailabilityManager = (HDOTAFeatureAvailabilityManager *)v21;

  return v16;
}

- (id)exportedInterface
{
  return (id)MEMORY[0x1F40E7B88](self, a2);
}

- (id)remoteInterface
{
  return (id)MEMORY[0x1F40E7B80](self, a2);
}

+ (id)taskIdentifier
{
  return (id)[MEMORY[0x1E4F2AE68] taskIdentifier];
}

+ (id)requiredEntitlements
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = *MEMORY[0x1E4F2A548];
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_OTAFeatureAvailabilityManager, 0);

  objc_storeStrong((id *)&self->_countryMonitor, 0);
}

@end