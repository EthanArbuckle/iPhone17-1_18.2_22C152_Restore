@interface HMDCloudManagerMetricsDispatcher
+ (id)logCategory;
- (HMDCloudManagerMetricsDispatcher)initWithLogEventDispatcher:(id)a3;
- (HMMLogEventSubmitting)logEventSubmitter;
- (void)submitFailureEventWithModelType:(id)a3 failureCode:(unint64_t)a4 error:(id)a5;
@end

@implementation HMDCloudManagerMetricsDispatcher

- (void).cxx_destruct
{
}

- (HMMLogEventSubmitting)logEventSubmitter
{
  return (HMMLogEventSubmitting *)objc_getProperty(self, a2, 8, 1);
}

- (void)submitFailureEventWithModelType:(id)a3 failureCode:(unint64_t)a4 error:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  v10 = (void *)MEMORY[0x1D9452090]();
  v11 = self;
  v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = HMFGetLogIdentifier();
    if (a4 == 1)
    {
      v14 = @"NoAddTransaction";
    }
    else
    {
      v15 = NSString;
      v16 = [NSNumber numberWithUnsignedInteger:a4];
      v14 = [v15 stringWithFormat:@"failureCode(%@)", v16];
    }
    *(_DWORD *)buf = 138544130;
    v20 = v13;
    __int16 v21 = 2112;
    id v22 = v8;
    __int16 v23 = 2112;
    v24 = v14;
    __int16 v25 = 2112;
    id v26 = v9;
    _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@Submitting failure event with model type: %@ failure code: %@ error: %@", buf, 0x2Au);
  }
  v17 = [[HMDCloudManagerModelFailureEvent alloc] initWithModel:v8 failureCode:a4 error:v9];
  v18 = [(HMDCloudManagerMetricsDispatcher *)v11 logEventSubmitter];
  [v18 submitLogEvent:v17];
}

- (HMDCloudManagerMetricsDispatcher)initWithLogEventDispatcher:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDCloudManagerMetricsDispatcher;
  v6 = [(HMDCloudManagerMetricsDispatcher *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_logEventSubmitter, a3);
  }

  return v7;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_183967 != -1) {
    dispatch_once(&logCategory__hmf_once_t1_183967, &__block_literal_global_183968);
  }
  v2 = (void *)logCategory__hmf_once_v2_183969;
  return v2;
}

uint64_t __47__HMDCloudManagerMetricsDispatcher_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v2_183969;
  logCategory__hmf_once_v2_183969 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end