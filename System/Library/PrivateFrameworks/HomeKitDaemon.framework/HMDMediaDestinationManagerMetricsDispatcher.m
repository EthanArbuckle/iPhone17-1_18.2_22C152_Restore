@interface HMDMediaDestinationManagerMetricsDispatcher
+ (id)logCategory;
- (HMDMediaDestinationManagerMetricsDispatcher)initWithIdentifier:(id)a3 logEventSubmitter:(id)a4;
- (HMMLogEventSubmitting)logEventSubmitter;
- (NSUUID)identifier;
- (id)logIdentifier;
- (void)submitFailureEventWithFailureCode:(unint64_t)a3 error:(id)a4;
@end

@implementation HMDMediaDestinationManagerMetricsDispatcher

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
  v2 = [(HMDMediaDestinationManagerMetricsDispatcher *)self identifier];
  v3 = [v2 UUIDString];

  return v3;
}

- (void)submitFailureEventWithFailureCode:(unint64_t)a3 error:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a4;
  v7 = (void *)MEMORY[0x230FBD990]();
  v8 = self;
  v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = HMFGetLogIdentifier();
    v11 = HMDMediaDestinationManagerFailureCodeAsString(a3);
    int v14 = 138543874;
    v15 = v10;
    __int16 v16 = 2112;
    v17 = v11;
    __int16 v18 = 2112;
    id v19 = v6;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Submitting failure event with failure code: %@ error: %@", (uint8_t *)&v14, 0x20u);
  }
  v12 = [[HMDMediaDestinationManagerFailureEvent alloc] initWithFailureCode:a3 error:v6];
  v13 = [(HMDMediaDestinationManagerMetricsDispatcher *)v8 logEventSubmitter];
  [v13 submitLogEvent:v12];
}

- (HMDMediaDestinationManagerMetricsDispatcher)initWithIdentifier:(id)a3 logEventSubmitter:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDMediaDestinationManagerMetricsDispatcher;
  v9 = [(HMDMediaDestinationManagerMetricsDispatcher *)&v12 init];
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
  if (logCategory__hmf_once_t1_267097 != -1) {
    dispatch_once(&logCategory__hmf_once_t1_267097, &__block_literal_global_267098);
  }
  v2 = (void *)logCategory__hmf_once_v2_267099;
  return v2;
}

void __58__HMDMediaDestinationManagerMetricsDispatcher_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v2_267099;
  logCategory__hmf_once_v2_267099 = v0;
}

@end