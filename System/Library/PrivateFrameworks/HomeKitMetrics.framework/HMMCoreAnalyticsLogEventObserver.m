@interface HMMCoreAnalyticsLogEventObserver
+ (id)logCategory;
- (BOOL)filterAcceptsEvent:(id)a3;
- (HMMCoreAnalyticsLogEventObserver)initWithDelegate:(id)a3 filters:(id)a4;
- (HMMCoreAnalyticsLogEventObserver)initWithDelegate:(id)a3 filters:(id)a4 submissionBlock:(id)a5;
- (HMMCoreAnalyticsLogEventObserverDelegate)delegate;
- (NSHashTable)filters;
- (id)dictionaryFromEvent:(id)a3;
- (id)submissionBlock;
- (void)addAccessoryDetailsForLogEvent:(id)a3 toEventDictionary:(id)a4;
- (void)addErrorDetailsForLogEvent:(id)a3 toEventDictionary:(id)a4;
- (void)addHomeSummaryForLogEvent:(id)a3 toEventDictionary:(id)a4;
- (void)didReceiveEventFromDispatcher:(id)a3;
@end

@implementation HMMCoreAnalyticsLogEventObserver

- (void).cxx_destruct
{
  objc_storeStrong(&self->_submissionBlock, 0);
  objc_storeStrong((id *)&self->_filters, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (id)submissionBlock
{
  return self->_submissionBlock;
}

- (NSHashTable)filters
{
  return self->_filters;
}

- (HMMCoreAnalyticsLogEventObserverDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMMCoreAnalyticsLogEventObserverDelegate *)WeakRetained;
}

- (void)didReceiveEventFromDispatcher:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1D944E970]();
  v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    int v19 = 138543618;
    v20 = v8;
    __int16 v21 = 2114;
    uint64_t v22 = objc_opt_class();
    _os_log_impl(&dword_1D4999000, v7, OS_LOG_TYPE_INFO, "%{public}@[CA] Received event from dispatcher: %{public}@", (uint8_t *)&v19, 0x16u);
  }
  id v9 = v4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v10 = v9;
  }
  else {
    v10 = 0;
  }
  id v11 = v10;

  if (v11)
  {
    v12 = [v11 coreAnalyticsEventName];
    if ([(HMMCoreAnalyticsLogEventObserver *)v6 filterAcceptsEvent:v11])
    {
      v13 = [(HMMCoreAnalyticsLogEventObserver *)v6 submissionBlock];
      v14 = [(HMMCoreAnalyticsLogEventObserver *)v6 dictionaryFromEvent:v11];
      ((void (**)(void, void *, void *))v13)[2](v13, v12, v14);
    }
    else
    {
      v15 = (void *)MEMORY[0x1D944E970]();
      v16 = v6;
      v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        v18 = HMFGetLogIdentifier();
        int v19 = 138543618;
        v20 = v18;
        __int16 v21 = 2114;
        uint64_t v22 = (uint64_t)v12;
        _os_log_impl(&dword_1D4999000, v17, OS_LOG_TYPE_DEBUG, "%{public}@Event %{public}@ is not submitted due to filtering.", (uint8_t *)&v19, 0x16u);
      }
    }
  }
}

- (BOOL)filterAcceptsEvent:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v5 = [(HMMCoreAnalyticsLogEventObserver *)self filters];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        if (![*(id *)(*((void *)&v12 + 1) + 8 * i) isEventInSample:v4])
        {
          BOOL v10 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 1;
LABEL_11:

  return v10;
}

- (id)dictionaryFromEvent:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 coreAnalyticsEventDictionary];
  uint64_t v6 = (void *)[v5 mutableCopy];

  uint64_t v7 = [(HMMCoreAnalyticsLogEventObserver *)self delegate];
  [v7 addCommonDimensionsToEventDictionary:v6];
  [(HMMCoreAnalyticsLogEventObserver *)self addErrorDetailsForLogEvent:v4 toEventDictionary:v6];
  [(HMMCoreAnalyticsLogEventObserver *)self addAccessoryDetailsForLogEvent:v4 toEventDictionary:v6];
  uint64_t v8 = [v4 error];

  id v9 = (void *)MEMORY[0x1D944E970]();
  BOOL v10 = self;
  id v11 = HMFGetOSLogHandle();
  long long v12 = v11;
  if (v8)
  {
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    long long v13 = HMFGetLogIdentifier();
    int v18 = 138543874;
    int v19 = v13;
    __int16 v20 = 2114;
    uint64_t v21 = objc_opt_class();
    __int16 v22 = 2112;
    uint64_t v23 = v6;
    long long v14 = v12;
    os_log_type_t v15 = OS_LOG_TYPE_ERROR;
  }
  else
  {
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_7;
    }
    long long v13 = HMFGetLogIdentifier();
    int v18 = 138543874;
    int v19 = v13;
    __int16 v20 = 2114;
    uint64_t v21 = objc_opt_class();
    __int16 v22 = 2112;
    uint64_t v23 = v6;
    long long v14 = v12;
    os_log_type_t v15 = OS_LOG_TYPE_DEBUG;
  }
  _os_log_impl(&dword_1D4999000, v14, v15, "%{public}@[CA] Submitting event: %{public}@/%@", (uint8_t *)&v18, 0x20u);

LABEL_7:
  [v6 setObject:&unk_1F2C877A8 forKeyedSubscript:@"numEvents"];
  [(HMMCoreAnalyticsLogEventObserver *)v10 addHomeSummaryForLogEvent:v4 toEventDictionary:v6];
  v16 = (void *)[v6 copy];

  return v16;
}

- (void)addErrorDetailsForLogEvent:(id)a3 toEventDictionary:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 error];
  if (!v8) {
    goto LABEL_15;
  }
  int v9 = HMFIsInternalBuild();
  BOOL v10 = (void *)MEMORY[0x1D944E970]();
  id v11 = self;
  long long v12 = HMFGetOSLogHandle();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
  if (v9)
  {
    if (v13)
    {
      long long v14 = HMFGetLogIdentifier();
      *(_DWORD *)v30 = 138543874;
      *(void *)&v30[4] = v14;
      *(_WORD *)&v30[12] = 2114;
      *(void *)&v30[14] = objc_opt_class();
      *(_WORD *)&v30[22] = 2114;
      v31 = v8;
      os_log_type_t v15 = "%{public}@[CA] Adding error details from %{public}@: %{public}@";
LABEL_7:
      _os_log_impl(&dword_1D4999000, v12, OS_LOG_TYPE_INFO, v15, v30, 0x20u);
    }
  }
  else if (v13)
  {
    long long v14 = HMFGetLogIdentifier();
    *(_DWORD *)v30 = 138543875;
    *(void *)&v30[4] = v14;
    *(_WORD *)&v30[12] = 2114;
    *(void *)&v30[14] = objc_opt_class();
    *(_WORD *)&v30[22] = 2113;
    v31 = v8;
    os_log_type_t v15 = "%{public}@[CA] Adding error details from %{public}@: %{private}@";
    goto LABEL_7;
  }

  v16 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v8, "code"));
  [v7 setObject:v16 forKeyedSubscript:@"errorCode"];

  uint64_t v17 = [v8 domain];
  [v7 setObject:v17 forKeyedSubscript:@"errorDomain"];

  int v18 = [v8 underlyingErrors];
  int v19 = [v18 firstObject];

  if (v19)
  {
    __int16 v20 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v19, "code"));
    [v7 setObject:v20 forKeyedSubscript:@"underlyingErrorCode"];

    uint64_t v21 = [v19 domain];
    [v7 setObject:v21 forKeyedSubscript:@"underlyingErrorDomain"];
  }
  __int16 v22 = objc_msgSend(v19, "underlyingErrors", *(_OWORD *)v30, *(void *)&v30[16], v31);
  uint64_t v23 = [v22 firstObject];

  if (v23)
  {
    uint64_t v24 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v23, "code"));
    [v7 setObject:v24 forKeyedSubscript:@"underlyingErrorCode2"];

    v25 = [v23 domain];
    [v7 setObject:v25 forKeyedSubscript:@"underlyingErrorDomain2"];
  }
  v26 = [v23 underlyingErrors];
  v27 = [v26 firstObject];

  if (v27)
  {
    v28 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v27, "code"));
    [v7 setObject:v28 forKeyedSubscript:@"underlyingErrorCode3"];

    v29 = [v27 domain];
    [v7 setObject:v29 forKeyedSubscript:@"underlyingErrorDomain3"];
  }
  [v7 setObject:&unk_1F2C877A8 forKeyedSubscript:@"numErrorEvents"];

LABEL_15:
}

- (void)addAccessoryDetailsForLogEvent:(id)a3 toEventDictionary:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (([v6 coreAnalyticsEventOptions] & 4) != 0)
  {
    if (objc_opt_respondsToSelector())
    {
      uint64_t v8 = [(HMMCoreAnalyticsLogEventObserver *)self delegate];
      int v9 = [v6 accessoryIdentifier];
      [v8 addDimensionsForAccessoryIdentifier:v9 toEventDictionary:v7];

      if (([v6 coreAnalyticsEventOptions] & 0x80000000) != 0)
      {
        BOOL v10 = [v7 objectForKeyedSubscript:@"accessoryManufacturer"];
        [v7 setObject:v10 forKeyedSubscript:@"cameraManufacturer"];

        id v11 = [v7 objectForKeyedSubscript:@"accessoryModel"];
        [v7 setObject:v11 forKeyedSubscript:@"cameraModel"];

        long long v12 = [v7 objectForKeyedSubscript:@"accessoryFirmwareVersion"];
        [v7 setObject:v12 forKeyedSubscript:@"cameraFirmware"];
      }
    }
    else
    {
      BOOL v13 = (void *)MEMORY[0x1D944E970]();
      long long v14 = self;
      os_log_type_t v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = HMFGetLogIdentifier();
        int v17 = 138543618;
        int v18 = v16;
        __int16 v19 = 2114;
        uint64_t v20 = objc_opt_class();
        _os_log_impl(&dword_1D4999000, v15, OS_LOG_TYPE_ERROR, "%{public}@Core Analytics event uses accessory identifier but doesn't define accessoryIdentifier property: %{public}@", (uint8_t *)&v17, 0x16u);
      }
    }
  }
}

- (void)addHomeSummaryForLogEvent:(id)a3 toEventDictionary:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMMCoreAnalyticsLogEventObserver *)self delegate];
  if ([v6 coreAnalyticsEventOptions]) {
    [v8 addAggregatedHomeDimensionsToEventDictionary:v7];
  }
  if (([v6 coreAnalyticsEventOptions] & 2) != 0)
  {
    if (objc_opt_respondsToSelector())
    {
      uint64_t v9 = [v6 homeUUID];
      if (v9)
      {
        BOOL v10 = (void *)v9;
        [v8 addDimensionsForHome:v9 toEventDictionary:v7];
      }
    }
    else
    {
      id v11 = (void *)MEMORY[0x1D944E970]();
      long long v12 = self;
      BOOL v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        long long v14 = HMFGetLogIdentifier();
        int v15 = 138543618;
        v16 = v14;
        __int16 v17 = 2114;
        uint64_t v18 = objc_opt_class();
        _os_log_impl(&dword_1D4999000, v13, OS_LOG_TYPE_ERROR, "%{public}@Core Analytics event uses home UUID but doesn't define homeUUID property: %{public}@", (uint8_t *)&v15, 0x16u);
      }
    }
  }
}

- (HMMCoreAnalyticsLogEventObserver)initWithDelegate:(id)a3 filters:(id)a4 submissionBlock:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v27.receiver = self;
  v27.super_class = (Class)HMMCoreAnalyticsLogEventObserver;
  id v11 = [(HMMCoreAnalyticsLogEventObserver *)&v27 init];
  long long v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_delegate, v8);
    uint64_t v13 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    filters = v12->_filters;
    v12->_filters = (NSHashTable *)v13;

    uint64_t v15 = MEMORY[0x1D944EB70](v10);
    id submissionBlock = v12->_submissionBlock;
    v12->_id submissionBlock = (id)v15;

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v17 = v9;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v24;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v24 != v20) {
            objc_enumerationMutation(v17);
          }
          -[NSHashTable addObject:](v12->_filters, "addObject:", *(void *)(*((void *)&v23 + 1) + 8 * v21++), (void)v23);
        }
        while (v19 != v21);
        uint64_t v19 = [v17 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v19);
    }
  }
  return v12;
}

- (HMMCoreAnalyticsLogEventObserver)initWithDelegate:(id)a3 filters:(id)a4
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61__HMMCoreAnalyticsLogEventObserver_initWithDelegate_filters___block_invoke;
  v8[3] = &unk_1E69FD720;
  id v9 = self;
  id v6 = [(HMMCoreAnalyticsLogEventObserver *)v9 initWithDelegate:a3 filters:a4 submissionBlock:v8];

  return v6;
}

void __61__HMMCoreAnalyticsLogEventObserver_initWithDelegate_filters___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ((AnalyticsSendEventLazy() & 1) == 0)
  {
    id v7 = (void *)MEMORY[0x1D944E970]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      id v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      long long v12 = v10;
      __int16 v13 = 2114;
      id v14 = v5;
      _os_log_impl(&dword_1D4999000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Event %{public}@ was not in the CoreAnalytics config and was dropped", buf, 0x16u);
    }
  }
}

id __61__HMMCoreAnalyticsLogEventObserver_initWithDelegate_filters___block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t10 != -1) {
    dispatch_once(&logCategory__hmf_once_t10, &__block_literal_global_1062);
  }
  v2 = (void *)logCategory__hmf_once_v11;
  return v2;
}

uint64_t __47__HMMCoreAnalyticsLogEventObserver_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v11;
  logCategory__hmf_once_id v11 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end