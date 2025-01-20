@interface HMDNetworkRouterFirewallRuleManagerBackingStoreFetchHelper
+ (id)logCategory;
+ (unint64_t)__integerForPreferenceKey:(id)a3 defaultValue:(unint64_t)a4;
+ (unint64_t)maxOperationDurationSeconds;
+ (unint64_t)maxRetryCount;
- (BOOL)finished;
- (BOOL)shouldRetry;
- (CKOperationGroup)operationGroup;
- (HMBProcessingOptions)options;
- (HMDNetworkRouterFirewallRuleManagerBackingStoreFetchHelper)initWithActivity:(id)a3 options:(id)a4 container:(id)a5 useAnonymousRequests:(BOOL)a6 promise:(id)a7;
- (HMFActivity)activity;
- (NSDate)operationStartTime;
- (double)retryIntervalSeconds;
- (unint64_t)retryCount;
- (void)dealloc;
- (void)finishWithError:(id)a3;
- (void)finishWithResult:(id)a3;
- (void)finishWithResult:(id)a3 error:(id)a4;
- (void)setOperationStartTime:(id)a3;
- (void)setRetryCount:(unint64_t)a3;
- (void)setRetryIntervalSeconds:(double)a3;
- (void)setShouldRetry:(BOOL)a3;
@end

@implementation HMDNetworkRouterFirewallRuleManagerBackingStoreFetchHelper

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationStartTime, 0);
  objc_storeStrong((id *)&self->_operationGroup, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_promise, 0);
}

- (BOOL)finished
{
  return self->_finished;
}

- (void)setOperationStartTime:(id)a3
{
}

- (NSDate)operationStartTime
{
  return self->_operationStartTime;
}

- (void)setRetryCount:(unint64_t)a3
{
  self->_retryCount = a3;
}

- (unint64_t)retryCount
{
  return self->_retryCount;
}

- (double)retryIntervalSeconds
{
  return self->_retryIntervalSeconds;
}

- (CKOperationGroup)operationGroup
{
  return self->_operationGroup;
}

- (HMBProcessingOptions)options
{
  return self->_options;
}

- (HMFActivity)activity
{
  return self->_activity;
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (self->_finished)
  {
    v18 = (void *)MEMORY[0x1D9452090]();
    v19 = self;
    v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
    {
      v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v25 = v21;
      _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Finished more than once!", buf, 0xCu);
    }
    v22 = [[HMDAssertionLogEvent alloc] initWithReason:@"Finished more than once!"];
    v23 = +[HMDMetricsManager sharedLogEventSubmitter];
    [v23 submitLogEvent:v22];
  }
  self->_finished = 1;
  v8 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreFetchHelper *)self activity];
  v9 = v8;
  if (v7)
  {
    [v8 markWithFormat:@"Fetch failed with error: %@", v7];

    v10 = (void *)MEMORY[0x1D9452090]();
    v11 = self;
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v25 = v13;
      __int16 v26 = 2112;
      id v27 = v7;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_ERROR, "%{public}@Fetch failed with error: %@", buf, 0x16u);
    }
    [(NAPromise *)v11->_promise finishWithError:v7];
  }
  else
  {
    [v8 markWithFormat:@"Fetch succeeded"];

    v14 = (void *)MEMORY[0x1D9452090]();
    v15 = self;
    v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v25 = v17;
      _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@Fetch succeeded", buf, 0xCu);
    }
    [(NAPromise *)v15->_promise finishWithResult:v6];
  }
}

- (void)finishWithError:(id)a3
{
}

- (void)finishWithResult:(id)a3
{
}

- (void)setRetryIntervalSeconds:(double)a3
{
  if (a3 < 0.0) {
    a3 = *MEMORY[0x1E4F69E28];
  }
  self->_retryIntervalSeconds = a3;
}

- (void)setShouldRetry:(BOOL)a3
{
  if (a3)
  {
    if (self->_retryIntervalSeconds == *MEMORY[0x1E4F69E28]) {
      self->_retryIntervalSeconds = 0.0;
    }
  }
  else
  {
    self->_retryIntervalSeconds = *(double *)MEMORY[0x1E4F69E28];
  }
}

- (BOOL)shouldRetry
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(id)objc_opt_class() maxRetryCount];
  if ([(HMDNetworkRouterFirewallRuleManagerBackingStoreFetchHelper *)self retryCount] <= v3)
  {
    v10 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreFetchHelper *)self operationStartTime];

    if (!v10) {
      return self->_retryIntervalSeconds != *MEMORY[0x1E4F69E28];
    }
    uint64_t v11 = [(id)objc_opt_class() maxOperationDurationSeconds];
    v12 = [MEMORY[0x1E4F1C9C8] now];
    v13 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreFetchHelper *)self operationStartTime];
    [v12 timeIntervalSinceDate:v13];
    int64_t v15 = llround(v14);

    if (v15 < v11) {
      return self->_retryIntervalSeconds != *MEMORY[0x1E4F69E28];
    }
    v17 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreFetchHelper *)self activity];
    objc_msgSend(v17, "markWithFormat:", @"Cannot retry because we've exceeded the maximum operation duration (%ld)", v11);

    v5 = (void *)MEMORY[0x1D9452090]();
    id v6 = self;
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v19 = v8;
      __int16 v20 = 2048;
      unint64_t v21 = v11;
      v9 = "%{public}@Cannot retry because we've exceeded the maximum operation duration (%ld)";
      goto LABEL_9;
    }
  }
  else
  {
    v4 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreFetchHelper *)self activity];
    objc_msgSend(v4, "markWithFormat:", @"Cannot retry because we've exceeded the maximum number of retries (%lu)", v3);

    v5 = (void *)MEMORY[0x1D9452090]();
    id v6 = self;
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v19 = v8;
      __int16 v20 = 2048;
      unint64_t v21 = v3;
      v9 = "%{public}@Cannot retry because we've exceeded the maximum number of retries (%lu)";
LABEL_9:
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_ERROR, v9, buf, 0x16u);
    }
  }

  return 0;
}

- (void)dealloc
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (!self->_finished)
  {
    unint64_t v3 = (void *)MEMORY[0x1D9452090]();
    v4 = self;
    v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      id v6 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v11 = v6;
      _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Forgot to call finishWithError", buf, 0xCu);
    }
    id v7 = [[HMDAssertionLogEvent alloc] initWithReason:@"Forgot to call finishWithError"];
    v8 = +[HMDMetricsManager sharedLogEventSubmitter];
    [v8 submitLogEvent:v7];
  }
  v9.receiver = self;
  v9.super_class = (Class)HMDNetworkRouterFirewallRuleManagerBackingStoreFetchHelper;
  [(HMDNetworkRouterFirewallRuleManagerBackingStoreFetchHelper *)&v9 dealloc];
}

- (HMDNetworkRouterFirewallRuleManagerBackingStoreFetchHelper)initWithActivity:(id)a3 options:(id)a4 container:(id)a5 useAnonymousRequests:(BOOL)a6 promise:(id)a7
{
  BOOL v8 = a6;
  id v24 = a3;
  id v13 = a4;
  id v14 = a7;
  int64_t v15 = (objc_class *)MEMORY[0x1E4F1A208];
  id v16 = a5;
  id v17 = objc_alloc_init(v15);
  [v17 setContainer:v16];

  [v17 setPreferAnonymousRequests:v8];
  if ([v13 qualityOfService] != -1) {
    objc_msgSend(v17, "setQualityOfService:", objc_msgSend(v13, "qualityOfService"));
  }
  id v18 = objc_alloc_init(MEMORY[0x1E4F1A218]);
  v19 = [v13 label];
  [v18 setName:v19];

  [v18 setDefaultConfiguration:v17];
  v25.receiver = self;
  v25.super_class = (Class)HMDNetworkRouterFirewallRuleManagerBackingStoreFetchHelper;
  __int16 v20 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreFetchHelper *)&v25 init];
  unint64_t v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_activity, a3);
    objc_storeStrong((id *)&v21->_options, a4);
    objc_storeStrong((id *)&v21->_operationGroup, v18);
    v21->_retryIntervalSeconds = *(double *)MEMORY[0x1E4F69E28];
    objc_storeStrong((id *)&v21->_promise, a7);
    v21->_finished = 0;
    uint64_t v22 = v21;
  }

  return v21;
}

+ (unint64_t)maxOperationDurationSeconds
{
  return objc_msgSend(a1, "__integerForPreferenceKey:defaultValue:", @"HMDNetworkRouterFirewallRuleManagerBackingStoreFetchHelperMaxOperationDurationSeconds", 300);
}

+ (unint64_t)maxRetryCount
{
  return objc_msgSend(a1, "__integerForPreferenceKey:defaultValue:", @"HMDNetworkRouterFirewallRuleManagerBackingStoreFetchHelperMaxRetryCount", 5);
}

+ (unint64_t)__integerForPreferenceKey:(id)a3 defaultValue:(unint64_t)a4
{
  v5 = (void *)MEMORY[0x1E4F65530];
  id v6 = a3;
  id v7 = [v5 sharedPreferences];
  BOOL v8 = [v7 preferenceForKey:v6];

  objc_super v9 = [v8 numberValue];

  if (v9)
  {
    v10 = [v8 numberValue];
    a4 = [v10 unsignedIntegerValue];
  }
  return a4;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0 != -1) {
    dispatch_once(&logCategory__hmf_once_t0, &__block_literal_global_407);
  }
  v2 = (void *)logCategory__hmf_once_v1;
  return v2;
}

uint64_t __73__HMDNetworkRouterFirewallRuleManagerBackingStoreFetchHelper_logCategory__block_invoke()
{
  logCategory__hmf_once_v1 = HMFCreateOSLogHandle();
  return MEMORY[0x1F41817F8]();
}

@end