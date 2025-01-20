@interface HMDMessageHandlerMetricsDispatcher
+ (id)logCategory;
- (HMDMessageHandlerMetricsDispatcher)initWithIdentifier:(id)a3 logEventSubmitter:(id)a4;
- (HMMLogEventSubmitting)logEventSubmitter;
- (NSUUID)identifier;
- (id)attributeDescriptions;
- (id)logIdentifier;
- (void)submitFailureEventOfType:(unint64_t)a3 message:(id)a4;
@end

@implementation HMDMessageHandlerMetricsDispatcher

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

- (id)attributeDescriptions
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v4 = [(HMDMessageHandlerMetricsDispatcher *)self identifier];
  v5 = (void *)[v3 initWithName:@"identifier" value:v4];
  v8[0] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];

  return v6;
}

- (id)logIdentifier
{
  v2 = [(HMDMessageHandlerMetricsDispatcher *)self identifier];
  id v3 = [v2 UUIDString];

  return v3;
}

- (void)submitFailureEventOfType:(unint64_t)a3 message:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = (void *)MEMORY[0x1D9452090]();
  v8 = self;
  v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = HMFGetLogIdentifier();
    v11 = (void *)v10;
    if (a3 > 2) {
      v12 = @"unknown";
    }
    else {
      v12 = off_1E6A0FE50[a3];
    }
    int v17 = 138543874;
    uint64_t v18 = v10;
    __int16 v19 = 2112;
    v20 = v12;
    __int16 v21 = 2112;
    id v22 = v6;
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Submitting failure event: %@ for message: %@", (uint8_t *)&v17, 0x20u);
  }
  v13 = [HMDMessageHandlerFailureMetricEvent alloc];
  v14 = [v6 name];
  v15 = [(HMDMessageHandlerFailureMetricEvent *)v13 initWithFailureType:a3 messageName:v14];

  v16 = [(HMDMessageHandlerMetricsDispatcher *)v8 logEventSubmitter];
  [v16 submitLogEvent:v15];
}

- (HMDMessageHandlerMetricsDispatcher)initWithIdentifier:(id)a3 logEventSubmitter:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  v9 = v8;
  if (!v8)
  {
LABEL_7:
    v13 = (void *)_HMFPreconditionFailure();
    return (HMDMessageHandlerMetricsDispatcher *)+[HMDMessageHandlerMetricsDispatcher logCategory];
  }
  v15.receiver = self;
  v15.super_class = (Class)HMDMessageHandlerMetricsDispatcher;
  uint64_t v10 = [(HMDMessageHandlerMetricsDispatcher *)&v15 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_identifier, a3);
    objc_storeStrong((id *)&v11->_logEventSubmitter, a4);
  }

  return v11;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_115537 != -1) {
    dispatch_once(&logCategory__hmf_once_t1_115537, &__block_literal_global_115538);
  }
  v2 = (void *)logCategory__hmf_once_v2_115539;
  return v2;
}

uint64_t __49__HMDMessageHandlerMetricsDispatcher_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v2_115539;
  logCategory__hmf_once_v2_115539 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end