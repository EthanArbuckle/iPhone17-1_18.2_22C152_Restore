@interface HMDXPCMessageCountTracker
+ (HMDXPCMessageCountTracker)sharedTracker;
+ (id)logCategory;
- (HMDXPCMessageCountTracker)init;
- (HMDXPCMessageCountTracker)initWithLogEventSubmitter:(id)a3 submissionTimer:(id)a4;
- (HMFTimer)submissionTimer;
- (HMMLogEventSubmitting)logEventSubmitter;
- (NSDate)lastResetDate;
- (NSDictionary)stateDump;
- (NSMutableDictionary)acceptedRequests;
- (NSMutableDictionary)erroredRequests;
- (NSMutableDictionary)sentNotifications;
- (id)countersOfType:(int64_t)a3;
- (id)mutableCountersOfType:(int64_t)a3;
- (id)sampleCountersAndReset:(BOOL)a3;
- (void)_resetCounters;
- (void)configure;
- (void)incrementCounterOfType:(int64_t)a3 clientIdentifier:(id)a4 messageName:(id)a5;
- (void)setLastResetDate:(id)a3;
- (void)submitCounters;
- (void)timerDidFire:(id)a3;
@end

@implementation HMDXPCMessageCountTracker

- (void)incrementCounterOfType:(int64_t)a3 clientIdentifier:(id)a4 messageName:(id)a5
{
  id v16 = a4;
  id v8 = a5;
  v9 = [v16 stringByAppendingFormat:@"/%@", v8];
  v10 = objc_msgSend(v9, "hmf_stringWithSmallestEncoding");

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v12 = [(HMDXPCMessageCountTracker *)self mutableCountersOfType:a3];
  v13 = objc_msgSend(v12, "hmf_numberForKey:", v10);
  uint64_t v14 = [v13 unsignedLongValue];

  v15 = [NSNumber numberWithUnsignedLong:v14 + 1];
  [v12 setValue:v15 forKey:v10];

  os_unfair_lock_unlock(p_lock);
}

- (id)mutableCountersOfType:(int64_t)a3
{
  os_unfair_lock_assert_owner(&self->_lock);
  if (a3 == 2)
  {
    v5 = [(HMDXPCMessageCountTracker *)self sentNotifications];
  }
  else if (a3 == 1)
  {
    v5 = [(HMDXPCMessageCountTracker *)self erroredRequests];
  }
  else
  {
    if (a3)
    {
      v7 = (HMDXPCClientConnection *)_HMFPreconditionFailureWithFormat();
      return [(HMDXPCClientConnection *)v7 messageCountTracker];
    }
    v5 = [(HMDXPCMessageCountTracker *)self acceptedRequests];
  }
  return v5;
}

- (NSMutableDictionary)sentNotifications
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (NSMutableDictionary)acceptedRequests
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (NSMutableDictionary)erroredRequests
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

+ (HMDXPCMessageCountTracker)sharedTracker
{
  if (sharedTracker_onceToken != -1) {
    dispatch_once(&sharedTracker_onceToken, &__block_literal_global_68946);
  }
  v2 = (void *)sharedTracker_sharedTracker;
  return (HMDXPCMessageCountTracker *)v2;
}

- (void)submitCounters
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1D9452090](self, a2);
  v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v43 = v6;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Submitting counters", buf, 0xCu);
  }
  [(HMDXPCMessageCountTracker *)v4 sampleCountersAndReset:1];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  v25 = long long v39 = 0u;
  id obj = [v25 allKeys];
  uint64_t v7 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v37;
    uint64_t v24 = *(void *)v37;
    do
    {
      uint64_t v10 = 0;
      uint64_t v26 = v8;
      do
      {
        if (*(void *)v37 != v9) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v36 + 1) + 8 * v10);
        v31 = HMDXPCCounterTypeAsString(objc_msgSend(v11, "unsignedIntegerValue", v24));
        if (([v31 isEqualToString:@"XPCErroredRequests"] & 1) == 0)
        {
          uint64_t v28 = v10;
          v12 = [v25 objectForKeyedSubscript:v11];
          long long v32 = 0u;
          long long v33 = 0u;
          long long v34 = 0u;
          long long v35 = 0u;
          v30 = v12;
          id v29 = [v12 allKeys];
          uint64_t v13 = [v29 countByEnumeratingWithState:&v32 objects:v40 count:16];
          if (v13)
          {
            uint64_t v14 = v13;
            uint64_t v15 = *(void *)v33;
            do
            {
              for (uint64_t i = 0; i != v14; ++i)
              {
                if (*(void *)v33 != v15) {
                  objc_enumerationMutation(v29);
                }
                v17 = *(void **)(*((void *)&v32 + 1) + 8 * i);
                v18 = objc_msgSend(v30, "hmf_numberForKey:", v17);
                v19 = [v17 componentsSeparatedByString:@"/"];
                v20 = [v19 firstObject];
                v21 = [v19 lastObject];
                v22 = +[HMDXPCMessageCountersLogEvent XPCMessageCountersLogEventWithType:v31 peerInformation:v20 messageName:v21 count:v18];
                v23 = [(HMDXPCMessageCountTracker *)v4 logEventSubmitter];
                [v23 submitLogEvent:v22];
              }
              uint64_t v14 = [v29 countByEnumeratingWithState:&v32 objects:v40 count:16];
            }
            while (v14);
          }

          uint64_t v9 = v24;
          uint64_t v8 = v26;
          uint64_t v10 = v28;
        }

        ++v10;
      }
      while (v10 != v8);
      uint64_t v8 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
    }
    while (v8);
  }
}

- (HMMLogEventSubmitting)logEventSubmitter
{
  return (HMMLogEventSubmitting *)objc_getProperty(self, a2, 16, 1);
}

- (id)sampleCountersAndReset:(BOOL)a3
{
  BOOL v3 = a3;
  v15[3] = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v14[0] = &unk_1F2DC7FF0;
  v6 = [(HMDXPCMessageCountTracker *)self acceptedRequests];
  uint64_t v7 = (void *)[v6 copy];
  v15[0] = v7;
  v14[1] = &unk_1F2DC8008;
  uint64_t v8 = [(HMDXPCMessageCountTracker *)self erroredRequests];
  uint64_t v9 = (void *)[v8 copy];
  v15[1] = v9;
  v14[2] = &unk_1F2DC8020;
  uint64_t v10 = [(HMDXPCMessageCountTracker *)self sentNotifications];
  v11 = (void *)[v10 copy];
  v15[2] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];

  if (v3) {
    [(HMDXPCMessageCountTracker *)self _resetCounters];
  }
  os_unfair_lock_unlock(p_lock);
  return v12;
}

- (void)_resetCounters
{
  os_unfair_lock_assert_owner(&self->_lock);
  BOOL v3 = [(HMDXPCMessageCountTracker *)self acceptedRequests];
  [v3 removeAllObjects];

  v4 = [(HMDXPCMessageCountTracker *)self erroredRequests];
  [v4 removeAllObjects];

  v5 = [(HMDXPCMessageCountTracker *)self sentNotifications];
  [v5 removeAllObjects];

  id v6 = [MEMORY[0x1E4F1C9C8] date];
  [(HMDXPCMessageCountTracker *)self setLastResetDate:v6];
}

- (void)setLastResetDate:(id)a3
{
}

- (void)timerDidFire:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDXPCMessageCountTracker *)self submissionTimer];

  if (v5 == v4)
  {
    [(HMDXPCMessageCountTracker *)self submitCounters];
  }
}

- (HMFTimer)submissionTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 48, 1);
}

uint64_t __40__HMDXPCMessageCountTracker_logCategory__block_invoke()
{
  logCategory__hmf_once_v5_68941 = HMFCreateOSLogHandle();
  return MEMORY[0x1F41817F8]();
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t4_68939 != -1) {
    dispatch_once(&logCategory__hmf_once_t4_68939, &__block_literal_global_29_68940);
  }
  v2 = (void *)logCategory__hmf_once_v5_68941;
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastResetDate, 0);
  objc_storeStrong((id *)&self->_submissionTimer, 0);
  objc_storeStrong((id *)&self->_sentNotifications, 0);
  objc_storeStrong((id *)&self->_erroredRequests, 0);
  objc_storeStrong((id *)&self->_acceptedRequests, 0);
  objc_storeStrong((id *)&self->_logEventSubmitter, 0);
}

- (NSDate)lastResetDate
{
  return (NSDate *)objc_getProperty(self, a2, 56, 1);
}

- (NSDictionary)stateDump
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = [(HMDXPCMessageCountTracker *)self sampleCountersAndReset:0];
  BOOL v3 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v2, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = objc_msgSend(v2, "allKeys", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v10 = [v2 objectForKey:v9];
        v11 = HMDXPCCounterTypeAsString([v9 unsignedIntegerValue]);
        [v3 setObject:v10 forKeyedSubscript:v11];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  v12 = (void *)[v3 copy];
  return (NSDictionary *)v12;
}

- (id)countersOfType:(int64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uint64_t v6 = [(HMDXPCMessageCountTracker *)self mutableCountersOfType:a3];
  uint64_t v7 = (void *)[v6 copy];

  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (void)configure
{
  BOOL v3 = [(HMDXPCMessageCountTracker *)self submissionTimer];
  [v3 setDelegate:self];

  id v4 = [(HMDXPCMessageCountTracker *)self submissionTimer];
  [v4 resume];
}

- (HMDXPCMessageCountTracker)initWithLogEventSubmitter:(id)a3 submissionTimer:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)HMDXPCMessageCountTracker;
  uint64_t v9 = [(HMDXPCMessageCountTracker *)&v20 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_logEventSubmitter, a3);
    objc_storeStrong((id *)&v10->_submissionTimer, a4);
    uint64_t v11 = [MEMORY[0x1E4F1CA60] dictionary];
    acceptedRequests = v10->_acceptedRequests;
    v10->_acceptedRequests = (NSMutableDictionary *)v11;

    uint64_t v13 = [MEMORY[0x1E4F1CA60] dictionary];
    erroredRequests = v10->_erroredRequests;
    v10->_erroredRequests = (NSMutableDictionary *)v13;

    uint64_t v15 = [MEMORY[0x1E4F1CA60] dictionary];
    sentNotifications = v10->_sentNotifications;
    v10->_sentNotifications = (NSMutableDictionary *)v15;

    uint64_t v17 = [MEMORY[0x1E4F1C9C8] date];
    lastResetDate = v10->_lastResetDate;
    v10->_lastResetDate = (NSDate *)v17;
  }
  return v10;
}

- (HMDXPCMessageCountTracker)init
{
  BOOL v3 = [MEMORY[0x1E4F65530] sharedPreferences];
  id v4 = [v3 preferenceForKey:@"xpcMessageCountTrackerSubmissionTimeInterval"];
  uint64_t v5 = [v4 numberValue];

  id v6 = objc_alloc(MEMORY[0x1E4F65580]);
  [v5 doubleValue];
  id v7 = objc_msgSend(v6, "initWithTimeInterval:options:", 12);
  id v8 = +[HMDMetricsManager sharedLogEventSubmitter];
  uint64_t v9 = [(HMDXPCMessageCountTracker *)self initWithLogEventSubmitter:v8 submissionTimer:v7];

  return v9;
}

uint64_t __42__HMDXPCMessageCountTracker_sharedTracker__block_invoke()
{
  v0 = objc_alloc_init(HMDXPCMessageCountTracker);
  v1 = (void *)sharedTracker_sharedTracker;
  sharedTracker_sharedTracker = (uint64_t)v0;

  v2 = (void *)sharedTracker_sharedTracker;
  return [v2 configure];
}

@end