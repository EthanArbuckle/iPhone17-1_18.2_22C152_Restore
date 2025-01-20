@interface HMDMicroLocationLogEventObserver
+ (id)logCategory;
- (HMDMicroLocationLogEventObserver)initWithDataSource:(id)a3 microLocationManager:(id)a4;
- (id)isEligibleForDonationWithHAPServiceType:(void *)a3 HAPCharacteristicType:;
- (void)didReceiveEventFromDispatcher:(id)a3;
@end

@implementation HMDMicroLocationLogEventObserver

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_microLocationManager, 0);
}

- (void)didReceiveEventFromDispatcher:(id)a3
{
  id v12 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    int v4 = [v12 shouldTriggerMicroLocationRecordingScanForLogEventObserver:self];
    int v5 = [v12 shouldTriggerMicroLocationLocalizationScanForLogEventObserver:self];
    int v6 = v5;
    if ((v4 & 1) != 0 || v5)
    {
      v7 = [v12 microLocationMetadataForLogEventObserver:self];
      uint64_t v9 = [v12 microLocationScanTriggerTypeForLogEventObserver:self];
      if (v6)
      {
        if (self) {
          id Property = objc_getProperty(self, v8, 8, 1);
        }
        else {
          id Property = 0;
        }
        [Property triggerThrottledMicroLocationLocalizationScanWithMetadata:v7 triggerType:v9];
      }
      if (v4)
      {
        if (self) {
          id v11 = objc_getProperty(self, v8, 8, 1);
        }
        else {
          id v11 = 0;
        }
        [v11 triggerThrottledMicroLocationRecordingScanWithMetadata:v7 triggerType:v9];
      }
    }
  }
}

- (HMDMicroLocationLogEventObserver)initWithDataSource:(id)a3 microLocationManager:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HMDMicroLocationLogEventObserver;
  v8 = [(HMDMicroLocationLogEventObserver *)&v11 init];
  uint64_t v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_dataSource, v6);
    objc_storeStrong((id *)&v9->_microLocationManager, a4);
  }

  return v9;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_4534 != -1) {
    dispatch_once(&logCategory__hmf_once_t1_4534, &__block_literal_global_4535);
  }
  v2 = (void *)logCategory__hmf_once_v2_4536;
  return v2;
}

void __47__HMDMicroLocationLogEventObserver_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v2_4536;
  logCategory__hmf_once_v2_4536 = v0;
}

- (id)isEligibleForDonationWithHAPServiceType:(void *)a3 HAPCharacteristicType:
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 2);
    v8 = WeakRetained;
    if (WeakRetained)
    {
      uint64_t v9 = [WeakRetained hapMetadataForMicroLocationLogEventObserver:a1];
      if (([v5 isEqualToString:@"00000228-0000-1000-8000-0026BB765291"] & 1) != 0
        || ([v9 shouldFilterServiceOfTypeFromApp:v5] & 1) == 0)
      {
        int v10 = [v9 isStandardServiceType:v5];
      }
      else
      {
        int v10 = 0;
      }
      if ([v9 shouldFilterCharacteristicOfTypeFromApp:v6]) {
        unsigned int v11 = 0;
      }
      else {
        unsigned int v11 = [v9 isStandardCharacteristicType:v6];
      }
      a1 = (id *)(v10 & v11);
    }
    else
    {
      id v12 = (void *)MEMORY[0x230FBD990]();
      v13 = a1;
      v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v15 = HMFGetLogIdentifier();
        int v17 = 138543362;
        v18 = v15;
        _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, "%{public}@Event ineligible for donation because data source is nil", (uint8_t *)&v17, 0xCu);
      }
      a1 = 0;
    }
  }
  return a1;
}

@end