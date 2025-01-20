@interface HMDAppleMediaAccessoriesStateManagerMetricsDispatcher
+ (id)logCategory;
- (HMDAppleMediaAccessoriesStateManagerMetricsDispatcher)initWithIdentifier:(id)a3 logEventSubmitter:(id)a4;
- (HMMLogEventSubmitting)logEventSubmitter;
- (NSUUID)identifier;
- (id)logIdentifier;
- (void)submitMatchingIdentifierEventWithMatchingCount:(int64_t)a3;
- (void)submitMatchingIdentifierRemovalEventWithRemovalCount:(int64_t)a3;
@end

@implementation HMDAppleMediaAccessoriesStateManagerMetricsDispatcher

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
  v2 = [(HMDAppleMediaAccessoriesStateManagerMetricsDispatcher *)self identifier];
  v3 = [v2 UUIDString];

  return v3;
}

- (void)submitMatchingIdentifierRemovalEventWithRemovalCount:(int64_t)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v5 = (void *)MEMORY[0x1D9452090](self, a2);
  v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    v9 = [NSNumber numberWithInteger:a3];
    int v12 = 138543618;
    v13 = v8;
    __int16 v14 = 2112;
    v15 = v9;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Submitting matching identifier removal event with count: %@", (uint8_t *)&v12, 0x16u);
  }
  v10 = [[HMDAppleMediaAccessoryMatchingIdentifierRemovalEvent alloc] initWithRemovalCount:a3];
  v11 = [(HMDAppleMediaAccessoriesStateManagerMetricsDispatcher *)v6 logEventSubmitter];
  [v11 submitLogEvent:v10];
}

- (void)submitMatchingIdentifierEventWithMatchingCount:(int64_t)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v5 = (void *)MEMORY[0x1D9452090](self, a2);
  v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    v9 = [NSNumber numberWithInteger:a3];
    int v12 = 138543618;
    v13 = v8;
    __int16 v14 = 2112;
    v15 = v9;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Submitting matching identifiers event with matching count: %@", (uint8_t *)&v12, 0x16u);
  }
  v10 = [[HMDAppleMediaAccessoryMatchingIdentifierEvent alloc] initWithMatchingIdentifiersCount:a3];
  v11 = [(HMDAppleMediaAccessoriesStateManagerMetricsDispatcher *)v6 logEventSubmitter];
  [v11 submitLogEvent:v10];
}

- (HMDAppleMediaAccessoriesStateManagerMetricsDispatcher)initWithIdentifier:(id)a3 logEventSubmitter:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  v8 = v7;
  if (!v7)
  {
LABEL_7:
    v13 = (void *)_HMFPreconditionFailure();
    return (HMDAppleMediaAccessoriesStateManagerMetricsDispatcher *)+[HMDAppleMediaAccessoriesStateManagerMetricsDispatcher logCategory];
  }
  v15.receiver = self;
  v15.super_class = (Class)HMDAppleMediaAccessoriesStateManagerMetricsDispatcher;
  v9 = [(HMDAppleMediaAccessoriesStateManagerMetricsDispatcher *)&v15 init];
  if (v9)
  {
    uint64_t v10 = [v6 copy];
    identifier = v9->_identifier;
    v9->_identifier = (NSUUID *)v10;

    objc_storeStrong((id *)&v9->_logEventSubmitter, a4);
  }

  return v9;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t2_146714 != -1) {
    dispatch_once(&logCategory__hmf_once_t2_146714, &__block_literal_global_146715);
  }
  v2 = (void *)logCategory__hmf_once_v3_146716;
  return v2;
}

uint64_t __68__HMDAppleMediaAccessoriesStateManagerMetricsDispatcher_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v3_146716;
  logCategory__hmf_once_v3_146716 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end