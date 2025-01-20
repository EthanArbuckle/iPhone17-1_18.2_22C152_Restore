@interface HMDBackgroundTaskLogger
+ (id)logCategory;
- (HMDBackgroundTaskLogger)init;
- (HMDBackgroundTaskLogger)initWithLogEventSubmitter:(id)a3;
- (HMMLogEventSubmitting)submitter;
- (void)submitLogEventForTask:(id)a3;
- (void)submitNotFiredLogEventForTask:(id)a3;
@end

@implementation HMDBackgroundTaskLogger

- (void).cxx_destruct
{
}

- (HMMLogEventSubmitting)submitter
{
  return self->_submitter;
}

- (void)submitNotFiredLogEventForTask:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)MEMORY[0x230FBD990]();
  v6 = [v4 expectedFireDate];
  v7 = [MEMORY[0x263EFF910] now];
  uint64_t v8 = [v6 compare:v7];

  if (v8 != 1)
  {
    v9 = [HMDBackgroundTaskLogEvent alloc];
    v10 = [MEMORY[0x263EFF910] now];
    v11 = [(HMDBackgroundTaskLogEvent *)v9 initWithTask:v4 didFire:0 now:v10];

    v12 = (void *)MEMORY[0x230FBD990]();
    v13 = self;
    v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v15 = HMFGetLogIdentifier();
      v16 = [v4 identifier];
      int v18 = 138543874;
      v19 = v15;
      __int16 v20 = 2112;
      v21 = v11;
      __int16 v22 = 2112;
      v23 = v16;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_DEBUG, "%{public}@Submitting never fired log %@ with identifier %@", (uint8_t *)&v18, 0x20u);
    }
    v17 = [(HMDBackgroundTaskLogger *)v13 submitter];
    [v17 submitLogEvent:v11];
  }
}

- (void)submitLogEventForTask:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)MEMORY[0x230FBD990]();
  v6 = [HMDBackgroundTaskLogEvent alloc];
  v7 = [MEMORY[0x263EFF910] now];
  uint64_t v8 = [(HMDBackgroundTaskLogEvent *)v6 initWithTask:v4 didFire:1 now:v7];

  v9 = (void *)MEMORY[0x230FBD990]();
  v10 = self;
  v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v12 = HMFGetLogIdentifier();
    v13 = [v4 identifier];
    int v15 = 138543874;
    v16 = v12;
    __int16 v17 = 2112;
    int v18 = v8;
    __int16 v19 = 2112;
    __int16 v20 = v13;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Submitting log %@ with identifier %@", (uint8_t *)&v15, 0x20u);
  }
  v14 = [(HMDBackgroundTaskLogger *)v10 submitter];
  [v14 submitLogEvent:v8];
}

- (HMDBackgroundTaskLogger)init
{
  v3 = +[HMDMetricsManager sharedLogEventSubmitter];
  id v4 = [(HMDBackgroundTaskLogger *)self initWithLogEventSubmitter:v3];

  return v4;
}

- (HMDBackgroundTaskLogger)initWithLogEventSubmitter:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDBackgroundTaskLogger;
  v6 = [(HMDBackgroundTaskLogger *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_submitter, a3);
  }

  return v7;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t2_249312 != -1) {
    dispatch_once(&logCategory__hmf_once_t2_249312, &__block_literal_global_249313);
  }
  v2 = (void *)logCategory__hmf_once_v3_249314;
  return v2;
}

void __38__HMDBackgroundTaskLogger_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v3_249314;
  logCategory__hmf_once_v3_249314 = v0;
}

@end