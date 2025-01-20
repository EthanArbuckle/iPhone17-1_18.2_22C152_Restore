@interface HMDHouseholdMetricsClient
+ (id)logCategory;
- (HMDEventCountersManager)countersManager;
- (HMDHouseholdMetricsClient)initWithCountersManager:(id)a3 dateProvider:(id)a4 remoteMessageDispatcher:(id)a5 requestCountProvider:(id)a6 logEventFactories:(id)a7;
- (HMDHouseholdMetricsClient)initWithCountersManager:(id)a3 dateProvider:(id)a4 remoteMessageDispatcher:(id)a5 requestCountProvider:(id)a6 logEventFactories:(id)a7 isDNUEnabledBlock:(id)a8;
- (HMDHouseholdMetricsMessaging)remoteMessageDispatcher;
- (HMDHouseholdMetricsRequestCountProvider)requestCountProvider;
- (HMMDateProvider)dateProvider;
- (NSDictionary)logEventFactories;
- (id)handleRequestMessageWithPayload:(id)a3 outError:(id *)a4;
- (id)householdMetricsForHomeWithUUID:(id)a3 associatedWithDate:(id)a4;
- (id)isDNUEnabledBlock;
- (void)dealloc;
- (void)deleteExpiredCounters;
- (void)handleRequest:(id)a3;
@end

@implementation HMDHouseholdMetricsClient

- (void).cxx_destruct
{
  objc_storeStrong(&self->_isDNUEnabledBlock, 0);
  objc_storeStrong((id *)&self->_logEventFactories, 0);
  objc_destroyWeak((id *)&self->_requestCountProvider);
  objc_destroyWeak((id *)&self->_remoteMessageDispatcher);
  objc_storeStrong((id *)&self->_dateProvider, 0);
  objc_storeStrong((id *)&self->_countersManager, 0);
}

- (id)isDNUEnabledBlock
{
  return self->_isDNUEnabledBlock;
}

- (NSDictionary)logEventFactories
{
  return self->_logEventFactories;
}

- (HMDHouseholdMetricsRequestCountProvider)requestCountProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_requestCountProvider);
  return (HMDHouseholdMetricsRequestCountProvider *)WeakRetained;
}

- (HMDHouseholdMetricsMessaging)remoteMessageDispatcher
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_remoteMessageDispatcher);
  return (HMDHouseholdMetricsMessaging *)WeakRetained;
}

- (HMMDateProvider)dateProvider
{
  return self->_dateProvider;
}

- (HMDEventCountersManager)countersManager
{
  return self->_countersManager;
}

- (void)deleteExpiredCounters
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = [(HMDHouseholdMetricsClient *)self dateProvider];
  v4 = [v3 startOfDayByAddingDayCount:-3];

  v5 = [(HMDHouseholdMetricsClient *)self dateProvider];
  v6 = [v5 startOfDayByAddingDayCount:1];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v7 = [(HMDHouseholdMetricsClient *)self logEventFactories];
  v8 = [v7 objectEnumerator];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        [v13 deleteCountersBeforeDate:v4];
        [v13 deleteCountersAfterDate:v6];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }
}

- (id)householdMetricsForHomeWithUUID:(id)a3 associatedWithDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(HMDHouseholdMetricsClient *)self requestCountProvider];
  [v8 incrementRequestCountForHomeUUID:v6 date:v7];

  id v9 = objc_alloc(MEMORY[0x1E4F1CA60]);
  uint64_t v10 = [(HMDHouseholdMetricsClient *)self logEventFactories];
  uint64_t v11 = objc_msgSend(v9, "initWithCapacity:", objc_msgSend(v10, "count"));

  v12 = [(HMDHouseholdMetricsClient *)self logEventFactories];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __80__HMDHouseholdMetricsClient_householdMetricsForHomeWithUUID_associatedWithDate___block_invoke;
  v18[3] = &unk_1E6A05530;
  id v19 = v6;
  id v20 = v7;
  id v21 = v11;
  id v13 = v11;
  id v14 = v7;
  id v15 = v6;
  [v12 enumerateKeysAndObjectsUsingBlock:v18];

  long long v16 = (void *)[v13 copy];
  return v16;
}

void __80__HMDHouseholdMetricsClient_householdMetricsForHomeWithUUID_associatedWithDate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  v5 = [a3 logEventsPopulatedForHomeWithUUID:*(void *)(a1 + 32) associatedWithDate:*(void *)(a1 + 40)];
  if (v5) {
    [*(id *)(a1 + 48) setObject:v5 forKey:v6];
  }
}

- (id)handleRequestMessageWithPayload:(id)a3 outError:(id *)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v6 = (char *)a3;
  id v7 = (void *)MEMORY[0x1D9452090]();
  v8 = self;
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v10 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v44 = (uint64_t)v10;
    __int16 v45 = 2112;
    v46 = v6;
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Processing request, payload=%@", buf, 0x16u);
  }
  uint64_t v11 = [(HMDHouseholdMetricsClient *)v8 isDNUEnabledBlock];
  char v12 = v11[2]();

  if (v12)
  {
    id v13 = [MEMORY[0x1E4F1CA60] dictionary];
    id v14 = [v6 objectForKeyedSubscript:@"homeUUID"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v15 = v14;
    }
    else {
      id v15 = 0;
    }
    id v16 = v15;

    if (v16) {
      long long v17 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v16];
    }
    else {
      long long v17 = 0;
    }
    v23 = [v6 objectForKeyedSubscript:@"date"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v24 = v23;
    }
    else {
      v24 = 0;
    }
    id v25 = v24;

    if (v17 && v25)
    {
      v26 = [(HMDHouseholdMetricsClient *)v8 householdMetricsForHomeWithUUID:v17 associatedWithDate:v25];
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __70__HMDHouseholdMetricsClient_handleRequestMessageWithPayload_outError___block_invoke;
      v41[3] = &unk_1E6A17CB0;
      v41[4] = v8;
      id v27 = v13;
      id v42 = v27;
      v28 = (void *)MEMORY[0x1D9452090]([v26 enumerateKeysAndObjectsUsingBlock:v41]);
      v29 = v8;
      v30 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v31 = v40 = v13;
        *(_DWORD *)buf = 138543618;
        uint64_t v44 = (uint64_t)v31;
        __int16 v45 = 2112;
        v46 = (const char *)v27;
        _os_log_impl(&dword_1D49D5000, v30, OS_LOG_TYPE_DEBUG, "%{public}@Responding with payload=%@", buf, 0x16u);

        id v13 = v40;
      }

      v22 = (void *)[v27 copy];
    }
    else
    {
      v32 = (void *)MEMORY[0x1D9452090]();
      v33 = v8;
      v34 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        uint64_t v35 = HMFGetLogIdentifier();
        v36 = (void *)v35;
        v37 = "home UUID and date";
        if (v25) {
          v37 = "home UUID";
        }
        v38 = "date";
        if (v25) {
          v38 = "<impossible>";
        }
        if (v17) {
          v37 = v38;
        }
        *(_DWORD *)buf = 138543618;
        uint64_t v44 = v35;
        __int16 v45 = 2080;
        v46 = v37;
        _os_log_impl(&dword_1D49D5000, v34, OS_LOG_TYPE_ERROR, "%{public}@Missing %s in request, responding with error", buf, 0x16u);
      }
      if (a4)
      {
        [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F64ED0] code:20 userInfo:0];
        v22 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v22 = 0;
      }
    }
  }
  else
  {
    v18 = (void *)MEMORY[0x1D9452090]();
    id v19 = v8;
    id v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      id v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v44 = (uint64_t)v21;
      _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_INFO, "%{public}@DNU disabled, responding with error", buf, 0xCu);
    }
    if (a4)
    {
      [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F64ED0] code:17 userInfo:0];
      v22 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = 0;
    }
  }

  return v22;
}

void __70__HMDHouseholdMetricsClient_handleRequestMessageWithPayload_outError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) logEventFactories];
  v8 = [v7 objectForKeyedSubscript:v5];

  if (v8 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v9 = [v8 serializeLogEvents:v6];
    if (v9)
    {
      if ([MEMORY[0x1E4F28F98] propertyList:v9 isValidForFormat:200])
      {
        [*(id *)(a1 + 40) setObject:v9 forKeyedSubscript:v5];
LABEL_15:

        goto LABEL_16;
      }
      id v14 = (void *)MEMORY[0x1D9452090]();
      id v15 = *(id *)(a1 + 32);
      id v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        long long v17 = HMFGetLogIdentifier();
        int v21 = 138543618;
        v22 = v17;
        __int16 v23 = 2114;
        id v24 = v5;
        v18 = "%{public}@Dropping %{public}@ because the metrics can't be serialized as a property list";
        id v19 = v16;
        os_log_type_t v20 = OS_LOG_TYPE_ERROR;
        goto LABEL_13;
      }
    }
    else
    {
      id v14 = (void *)MEMORY[0x1D9452090]();
      id v15 = *(id *)(a1 + 32);
      id v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        long long v17 = HMFGetLogIdentifier();
        int v21 = 138543618;
        v22 = v17;
        __int16 v23 = 2114;
        id v24 = v5;
        v18 = "%{public}@Factory didn't return serialized data for %{public}@";
        id v19 = v16;
        os_log_type_t v20 = OS_LOG_TYPE_DEFAULT;
LABEL_13:
        _os_log_impl(&dword_1D49D5000, v19, v20, v18, (uint8_t *)&v21, 0x16u);
      }
    }

    goto LABEL_15;
  }
  uint64_t v10 = (void *)MEMORY[0x1D9452090]();
  id v11 = *(id *)(a1 + 32);
  char v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    id v13 = HMFGetLogIdentifier();
    int v21 = 138543618;
    v22 = v13;
    __int16 v23 = 2114;
    id v24 = v5;
    _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_ERROR, "%{public}@Dropping %{public}@ because it's factory doesn't serialize", (uint8_t *)&v21, 0x16u);
  }
LABEL_16:
}

- (void)handleRequest:(id)a3
{
  id v4 = a3;
  id v5 = [v4 messagePayload];
  id v8 = 0;
  id v6 = [(HMDHouseholdMetricsClient *)self handleRequestMessageWithPayload:v5 outError:&v8];
  id v7 = v8;
  [v4 respondWithPayload:v6 error:v7];
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_remoteMessageDispatcher);
  [WeakRetained deregisterForMessage:@"HMDHouseholdMetricsHomeDataLogEventRequest"];

  v4.receiver = self;
  v4.super_class = (Class)HMDHouseholdMetricsClient;
  [(HMDHouseholdMetricsClient *)&v4 dealloc];
}

- (HMDHouseholdMetricsClient)initWithCountersManager:(id)a3 dateProvider:(id)a4 remoteMessageDispatcher:(id)a5 requestCountProvider:(id)a6 logEventFactories:(id)a7 isDNUEnabledBlock:(id)a8
{
  id v26 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v27.receiver = self;
  v27.super_class = (Class)HMDHouseholdMetricsClient;
  os_log_type_t v20 = [(HMDHouseholdMetricsClient *)&v27 init];
  int v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_countersManager, a3);
    objc_storeStrong((id *)&v21->_dateProvider, a4);
    objc_storeWeak((id *)&v21->_remoteMessageDispatcher, v16);
    objc_storeWeak((id *)&v21->_requestCountProvider, v17);
    objc_storeStrong((id *)&v21->_logEventFactories, a7);
    v22 = _Block_copy(v19);
    id isDNUEnabledBlock = v21->_isDNUEnabledBlock;
    v21->_id isDNUEnabledBlock = v22;

    [v16 registerForMessage:@"HMDHouseholdMetricsHomeDataLogEventRequest" selector:sel_handleRequest_];
    id v24 = v21;
  }

  return v21;
}

- (HMDHouseholdMetricsClient)initWithCountersManager:(id)a3 dateProvider:(id)a4 remoteMessageDispatcher:(id)a5 requestCountProvider:(id)a6 logEventFactories:(id)a7
{
  return [(HMDHouseholdMetricsClient *)self initWithCountersManager:a3 dateProvider:a4 remoteMessageDispatcher:a5 requestCountProvider:a6 logEventFactories:a7 isDNUEnabledBlock:&__block_literal_global_2322];
}

uint64_t __129__HMDHouseholdMetricsClient_initWithCountersManager_dateProvider_remoteMessageDispatcher_requestCountProvider_logEventFactories___block_invoke()
{
  v0 = [MEMORY[0x1E4F74230] sharedConnection];
  uint64_t v1 = [v0 isDiagnosticSubmissionAllowed];

  return v1;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t9 != -1) {
    dispatch_once(&logCategory__hmf_once_t9, &__block_literal_global_21);
  }
  v2 = (void *)logCategory__hmf_once_v10;
  return v2;
}

uint64_t __40__HMDHouseholdMetricsClient_logCategory__block_invoke()
{
  logCategory__hmf_once_uint64_t v10 = HMFCreateOSLogHandle();
  return MEMORY[0x1F41817F8]();
}

@end