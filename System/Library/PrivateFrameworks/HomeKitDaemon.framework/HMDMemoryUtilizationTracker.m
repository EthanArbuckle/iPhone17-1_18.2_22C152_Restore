@interface HMDMemoryUtilizationTracker
+ (id)logCategory;
- (HMDMemoryUtilizationTracker)init;
- (HMDMemoryUtilizationTracker)initWithLogEventSubmitter:(id)a3;
- (HMMLogEventSubmitting)logEventSubmitter;
- (void)trackMemoryUsageWithReason:(int64_t)a3;
@end

@implementation HMDMemoryUtilizationTracker

- (void).cxx_destruct
{
}

- (HMMLogEventSubmitting)logEventSubmitter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_logEventSubmitter);
  return (HMMLogEventSubmitting *)WeakRetained;
}

- (void)trackMemoryUsageWithReason:(int64_t)a3
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  *(_OWORD *)buffer = 0u;
  pid_t v5 = getpid();
  if (proc_pid_rusage(v5, 6, buffer))
  {
    v6 = (void *)MEMORY[0x230FBD990]();
    v7 = self;
    v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = HMFGetLogIdentifier();
      int v18 = 138543362;
      v19 = v9;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_ERROR, "%{public}@Unable to retrieve memory foot-print", (uint8_t *)&v18, 0xCu);
    }
  }
  else
  {
    uint64_t v10 = *((void *)&v28 + 1);
    uint64_t v11 = *((void *)&v41 + 1);
    getpid();
    proc_reset_footprint_interval();
    v12 = [[HMDMemoryLogEvent alloc] initWithReason:a3 currentMemoryUsage:v10 intervalMaxMemoryUsage:v11];
    v13 = (void *)MEMORY[0x230FBD990]();
    v14 = self;
    v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = HMFGetLogIdentifier();
      int v18 = 138543874;
      v19 = v16;
      __int16 v20 = 2048;
      uint64_t v21 = [(HMDMemoryLogEvent *)v12 currentMemoryUsage];
      __int16 v22 = 2048;
      uint64_t v23 = [(HMDMemoryLogEvent *)v12 intervalMaxMemoryUsage];
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Current process memory utilization: %lld, Interval peak memory utilization (Since last timer-based sample): %lld", (uint8_t *)&v18, 0x20u);
    }
    v17 = [(HMDMemoryUtilizationTracker *)v14 logEventSubmitter];
    [v17 submitLogEvent:v12];
  }
}

- (HMDMemoryUtilizationTracker)initWithLogEventSubmitter:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    pid_t v5 = v4;
    v11.receiver = self;
    v11.super_class = (Class)HMDMemoryUtilizationTracker;
    v6 = [(HMDMemoryUtilizationTracker *)&v11 init];
    v7 = v6;
    if (v6) {
      objc_storeWeak((id *)&v6->_logEventSubmitter, v5);
    }

    return v7;
  }
  else
  {
    v9 = (HMDMemoryUtilizationTracker *)_HMFPreconditionFailure();
    return [(HMDMemoryUtilizationTracker *)v9 init];
  }
}

- (HMDMemoryUtilizationTracker)init
{
  v3 = +[HMDMetricsManager sharedLogEventSubmitter];
  id v4 = [(HMDMemoryUtilizationTracker *)self initWithLogEventSubmitter:v3];

  return v4;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t2_255825 != -1) {
    dispatch_once(&logCategory__hmf_once_t2_255825, &__block_literal_global_255826);
  }
  v2 = (void *)logCategory__hmf_once_v3_255827;
  return v2;
}

void __42__HMDMemoryUtilizationTracker_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v3_255827;
  logCategory__hmf_once_v3_255827 = v0;
}

@end