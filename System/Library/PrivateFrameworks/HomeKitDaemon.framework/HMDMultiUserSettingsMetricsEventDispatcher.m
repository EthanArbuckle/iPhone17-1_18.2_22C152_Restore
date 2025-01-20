@interface HMDMultiUserSettingsMetricsEventDispatcher
+ (id)logCategory;
- (HMDLogEventDailyScheduler)dailyScheduler;
- (HMDMultiUserSettingsMetricsEventDispatcher)initWithIdentifier:(id)a3 logEventSubmitter:(id)a4 dailyScheduler:(id)a5;
- (HMDMultiUserSettingsMetricsEventDispatcherDataSource)dataSource;
- (HMMLogEventSubmitting)logEventSubmitter;
- (NSUUID)identifier;
- (id)logIdentifier;
- (void)registerForDailyMultiUserSettingsEvents;
- (void)setDataSource:(id)a3;
- (void)submitMultiUserSettingsDailyEvent;
@end

@implementation HMDMultiUserSettingsMetricsEventDispatcher

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dailyScheduler, 0);
  objc_storeStrong((id *)&self->_logEventSubmitter, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_dataSource);
}

- (HMDLogEventDailyScheduler)dailyScheduler
{
  return (HMDLogEventDailyScheduler *)objc_getProperty(self, a2, 32, 1);
}

- (HMMLogEventSubmitting)logEventSubmitter
{
  return (HMMLogEventSubmitting *)objc_getProperty(self, a2, 24, 1);
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDataSource:(id)a3
{
}

- (HMDMultiUserSettingsMetricsEventDispatcherDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (HMDMultiUserSettingsMetricsEventDispatcherDataSource *)WeakRetained;
}

- (id)logIdentifier
{
  v2 = [(HMDMultiUserSettingsMetricsEventDispatcher *)self identifier];
  v3 = [v2 UUIDString];

  return v3;
}

- (void)submitMultiUserSettingsDailyEvent
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v3 = [(HMDMultiUserSettingsMetricsEventDispatcher *)self dataSource];
  v4 = (void *)MEMORY[0x230FBD990]();
  v5 = self;
  v6 = HMFGetOSLogHandle();
  v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v8 = HMFGetLogIdentifier();
      int v21 = 138543362;
      v22 = v8;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Submitting multi user settings daily event", (uint8_t *)&v21, 0xCu);
    }
    v9 = [v3 multiUserSettingsForMultiUserSettingsMetricsEventDispatcherDataSource];
    v10 = [v9 numSharedUsers];
    if ([v10 intValue])
    {
      v11 = [v9 numSharedUsers];
      int v12 = [v11 intValue];

      if (v12 < 11)
      {
        v13 = [[HMDMultiUserSettingsLogEvent alloc] initWithMultiUserSettings:v9];
        v14 = [(HMDMultiUserSettingsMetricsEventDispatcher *)v5 logEventSubmitter];
        [v14 submitLogEvent:v13];

LABEL_14:
        goto LABEL_15;
      }
    }
    else
    {
    }
    v16 = (void *)MEMORY[0x230FBD990]();
    v17 = v5;
    v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v19 = HMFGetLogIdentifier();
      v20 = [v9 numSharedUsers];
      int v21 = 138543618;
      v22 = v19;
      __int16 v23 = 2112;
      v24 = v20;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@numSharedUsers is %@. Don't submit logs", (uint8_t *)&v21, 0x16u);
    }
    goto LABEL_14;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v15 = HMFGetLogIdentifier();
    int v21 = 138543362;
    v22 = v15;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_ERROR, "%{public}@No DataSource is set for submitMultiUserSettingsDailyEvent", (uint8_t *)&v21, 0xCu);
  }
LABEL_15:
}

- (void)registerForDailyMultiUserSettingsEvents
{
  id v3 = [(HMDMultiUserSettingsMetricsEventDispatcher *)self dailyScheduler];
  [v3 registerDailyTaskRunner:self];
}

- (HMDMultiUserSettingsMetricsEventDispatcher)initWithIdentifier:(id)a3 logEventSubmitter:(id)a4 dailyScheduler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMDMultiUserSettingsMetricsEventDispatcher;
  int v12 = [(HMDMultiUserSettingsMetricsEventDispatcher *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_identifier, a3);
    objc_storeStrong((id *)&v13->_logEventSubmitter, a4);
    objc_storeStrong((id *)&v13->_dailyScheduler, a5);
  }

  return v13;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t3_33995 != -1) {
    dispatch_once(&logCategory__hmf_once_t3_33995, &__block_literal_global_33996);
  }
  v2 = (void *)logCategory__hmf_once_v4_33997;
  return v2;
}

void __57__HMDMultiUserSettingsMetricsEventDispatcher_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v4_33997;
  logCategory__hmf_once_v4_33997 = v0;
}

@end