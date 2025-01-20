@interface HMDHomeMetricsDispatcher
+ (id)logCategory;
- (HMDHomeMetricsDispatcher)initWithIdentifier:(id)a3 logEventSubmitter:(id)a4;
- (HMMLogEventSubmitting)logEventSubmitter;
- (NSUUID)identifier;
- (id)logIdentifier;
- (void)submitMigrationEventMetricsForModel:(id)a3 reason:(id)a4;
- (void)submitMigrationEventMetricsForModels:(id)a3 reason:(id)a4;
@end

@implementation HMDHomeMetricsDispatcher

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logEventSubmitter, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (HMMLogEventSubmitting)logEventSubmitter
{
  return (HMMLogEventSubmitting *)objc_getProperty(self, a2, 16, 1);
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (id)logIdentifier
{
  v2 = [(HMDHomeMetricsDispatcher *)self identifier];
  v3 = [v2 UUIDString];

  return v3;
}

- (void)submitMigrationEventMetricsForModel:(id)a3 reason:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x230FBD990]();
  v9 = self;
  v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = HMFGetLogIdentifier();
    int v14 = 138543874;
    v15 = v11;
    __int16 v16 = 2112;
    id v17 = v6;
    __int16 v18 = 2112;
    id v19 = v7;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Submitting migration event metric for model: %@ reason: %@", (uint8_t *)&v14, 0x20u);
  }
  v12 = [[HMDHomeMigrationEvent alloc] initWithModel:v6 reason:v7];
  v13 = [(HMDHomeMetricsDispatcher *)v9 logEventSubmitter];
  [v13 submitLogEvent:v12];
}

- (void)submitMigrationEventMetricsForModels:(id)a3 reason:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __72__HMDHomeMetricsDispatcher_submitMigrationEventMetricsForModels_reason___block_invoke;
  v8[3] = &unk_264A15DB0;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  objc_msgSend(a3, "na_each:", v8);
}

uint64_t __72__HMDHomeMetricsDispatcher_submitMigrationEventMetricsForModels_reason___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) submitMigrationEventMetricsForModel:a2 reason:*(void *)(a1 + 40)];
}

- (HMDHomeMetricsDispatcher)initWithIdentifier:(id)a3 logEventSubmitter:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDHomeMetricsDispatcher;
  id v9 = [(HMDHomeMetricsDispatcher *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    objc_storeStrong((id *)&v10->_logEventSubmitter, a4);
  }

  return v10;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_10479 != -1) {
    dispatch_once(&logCategory__hmf_once_t1_10479, &__block_literal_global_10480);
  }
  v2 = (void *)logCategory__hmf_once_v2_10481;
  return v2;
}

void __39__HMDHomeMetricsDispatcher_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v2_10481;
  logCategory__hmf_once_v2_10481 = v0;
}

@end