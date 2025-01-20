@interface HMDAccessorySessionMetric
+ (id)logCategory;
- (BOOL)hasActiveSession;
- (BOOL)isBonjourUpdateForced;
- (BOOL)isCurrentPrimaryResident;
- (BOOL)isFromPrimary;
- (BOOL)isHomeThreadCapable;
- (BOOL)isPrimaryResidentThreadCapable;
- (BOOL)isReachable;
- (BOOL)isThreadNetworkUp;
- (HAP2AccessorySessionInfo)sessionInfo;
- (HMDAccessorySessionMetric)initWithAccessory:(id)a3 workQueue:(id)a4;
- (HMDAccessorySessionMetric)initWithAccessory:(id)a3 workQueue:(id)a4 hapSessionTTRTimer:(id)a5 hapSessionTTRAllowList:(id)a6 radarInitiator:(id)a7;
- (HMDHAPAccessory)accessory;
- (HMFTimer)hapSessionTTRTimer;
- (HMMRadarInitiating)radarInitiator;
- (NSArray)hapSessionTTRAllowList;
- (NSDate)metricCollectionStartTime;
- (NSDate)reachableStartTime;
- (NSDate)sessionStartTime;
- (NSDictionary)state;
- (NSError)topError;
- (NSMutableDictionary)errorCounts;
- (NSString)accessoryTransport;
- (NSString)expectedTransport;
- (OS_dispatch_queue)workQueue;
- (double)activeSessionDurationSec;
- (double)reachableDurationSec;
- (double)sessionCheckIntervalSec;
- (double)submissionIntervalSec;
- (id)attributeDescriptions;
- (id)logIdentifier;
- (unint64_t)sessionFailures;
- (unint64_t)successfulSessionRetries;
- (void)_resetSessionMetric;
- (void)_submitMetric;
- (void)_updateSessionState:(BOOL)a3 linkLayerType:(int64_t)a4 sessionInfo:(id)a5 bookkeeping:(id)a6 withError:(id)a7;
- (void)resetSessionMetric;
- (void)setAccessoryTransport:(id)a3;
- (void)setActiveSessionDurationSec:(double)a3;
- (void)setErrorCounts:(id)a3;
- (void)setHasActiveSession:(BOOL)a3;
- (void)setIsFromPrimary:(BOOL)a3;
- (void)setIsReachable:(BOOL)a3;
- (void)setMetricCollectionStartTime:(id)a3;
- (void)setReachableDurationSec:(double)a3;
- (void)setReachableStartTime:(id)a3;
- (void)setSessionFailures:(unint64_t)a3;
- (void)setSessionInfo:(id)a3;
- (void)setSessionStartTime:(id)a3;
- (void)setSubmissionIntervalSec:(double)a3;
- (void)setSuccessfulSessionRetries:(unint64_t)a3;
- (void)setTopError:(id)a3;
- (void)submitMetric;
- (void)timerDidFire:(id)a3;
- (void)updateReachableState:(BOOL)a3;
- (void)updateSessionState:(BOOL)a3 linkLayerType:(int64_t)a4 sessionInfo:(id)a5 bookkeeping:(id)a6 withError:(id)a7;
@end

@implementation HMDAccessorySessionMetric

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorCounts, 0);
  objc_storeStrong((id *)&self->_metricCollectionStartTime, 0);
  objc_storeStrong((id *)&self->_reachableStartTime, 0);
  objc_storeStrong((id *)&self->_sessionStartTime, 0);
  objc_destroyWeak((id *)&self->_radarInitiator);
  objc_storeStrong((id *)&self->_hapSessionTTRAllowList, 0);
  objc_storeStrong((id *)&self->_hapSessionTTRTimer, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_accessory);
  objc_storeStrong((id *)&self->_sessionInfo, 0);
  objc_storeStrong((id *)&self->_expectedTransport, 0);
  objc_storeStrong((id *)&self->_topError, 0);
  objc_storeStrong((id *)&self->_accessoryTransport, 0);
}

- (void)setErrorCounts:(id)a3
{
}

- (NSMutableDictionary)errorCounts
{
  return self->_errorCounts;
}

- (void)setMetricCollectionStartTime:(id)a3
{
}

- (NSDate)metricCollectionStartTime
{
  return self->_metricCollectionStartTime;
}

- (void)setIsReachable:(BOOL)a3
{
  self->_isReachable = a3;
}

- (BOOL)isReachable
{
  return self->_isReachable;
}

- (void)setReachableStartTime:(id)a3
{
}

- (NSDate)reachableStartTime
{
  return self->_reachableStartTime;
}

- (void)setHasActiveSession:(BOOL)a3
{
  self->_hasActiveSession = a3;
}

- (BOOL)hasActiveSession
{
  return self->_hasActiveSession;
}

- (void)setSessionStartTime:(id)a3
{
}

- (NSDate)sessionStartTime
{
  return self->_sessionStartTime;
}

- (HMMRadarInitiating)radarInitiator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_radarInitiator);
  return (HMMRadarInitiating *)WeakRetained;
}

- (NSArray)hapSessionTTRAllowList
{
  return self->_hapSessionTTRAllowList;
}

- (HMFTimer)hapSessionTTRTimer
{
  return self->_hapSessionTTRTimer;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (HMDHAPAccessory)accessory
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessory);
  return (HMDHAPAccessory *)WeakRetained;
}

- (void)setSessionInfo:(id)a3
{
}

- (HAP2AccessorySessionInfo)sessionInfo
{
  return self->_sessionInfo;
}

- (NSString)expectedTransport
{
  return self->_expectedTransport;
}

- (BOOL)isBonjourUpdateForced
{
  return self->_isBonjourUpdateForced;
}

- (void)setIsFromPrimary:(BOOL)a3
{
  self->_isFromPrimary = a3;
}

- (BOOL)isFromPrimary
{
  return self->_isFromPrimary;
}

- (void)setSubmissionIntervalSec:(double)a3
{
  self->_submissionIntervalSec = a3;
}

- (double)submissionIntervalSec
{
  return self->_submissionIntervalSec;
}

- (void)setTopError:(id)a3
{
}

- (void)setSuccessfulSessionRetries:(unint64_t)a3
{
  self->_successfulSessionRetries = a3;
}

- (unint64_t)successfulSessionRetries
{
  return self->_successfulSessionRetries;
}

- (void)setSessionFailures:(unint64_t)a3
{
  self->_sessionFailures = a3;
}

- (unint64_t)sessionFailures
{
  return self->_sessionFailures;
}

- (void)setReachableDurationSec:(double)a3
{
  self->_reachableDurationSec = a3;
}

- (double)reachableDurationSec
{
  return self->_reachableDurationSec;
}

- (void)setActiveSessionDurationSec:(double)a3
{
  self->_activeSessionDurationSec = a3;
}

- (double)activeSessionDurationSec
{
  return self->_activeSessionDurationSec;
}

- (void)setAccessoryTransport:(id)a3
{
}

- (NSString)accessoryTransport
{
  return self->_accessoryTransport;
}

- (id)logIdentifier
{
  v2 = [(HMDAccessorySessionMetric *)self accessory];
  v3 = NSString;
  v4 = [v2 name];
  v5 = [v2 identifier];
  v6 = [v3 stringWithFormat:@"%@/%@", v4, v5];

  return v6;
}

- (void)timerDidFire:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMDAccessorySessionMetric *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDAccessorySessionMetric *)self hapSessionTTRTimer];

  if (v6 == v4)
  {
    v7 = [(HMDAccessorySessionMetric *)self accessory];
    v8 = (void *)MEMORY[0x1D9452090]();
    v9 = self;
    v10 = HMFGetOSLogHandle();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
    if (v7)
    {
      if (v11)
      {
        v12 = HMFGetLogIdentifier();
        v13 = [v7 shortDescription];
        *(_DWORD *)buf = 138543618;
        v21 = v12;
        __int16 v22 = 2114;
        v23 = v13;
        _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@HAP session TTR timer fired. Initiating radar for allowed accessory: %{public}@", buf, 0x16u);
      }
      v14 = [(HMDAccessorySessionMetric *)v9 radarInitiator];
      v15 = NSString;
      v16 = [v7 manufacturer];
      v17 = [v7 model];
      v18 = [v15 stringWithFormat:@"Lost connection with Accessory: %@ Model: %@", v16, v17];
      [v14 requestRadarWithDisplayReason:@"a HAP session failure was detected" radarTitle:v18];
    }
    else
    {
      if (v11)
      {
        v19 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v21 = v19;
        _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Accessory reference is nil when handling HAP session TTR timer", buf, 0xCu);
      }
    }
  }
}

- (void)updateReachableState:(BOOL)a3
{
  v5 = [(HMDAccessorySessionMetric *)self workQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__HMDAccessorySessionMetric_updateReachableState___block_invoke;
  v6[3] = &unk_1E6A19B58;
  BOOL v7 = a3;
  v6[4] = self;
  dispatch_async(v5, v6);
}

void __50__HMDAccessorySessionMetric_updateReachableState___block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 40))
  {
    v2 = [*(id *)(a1 + 32) reachableStartTime];

    if (v2)
    {
      v3 = (void *)MEMORY[0x1D9452090]();
      id v4 = *(id *)(a1 + 32);
      v5 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        id v6 = HMFGetLogIdentifier();
        BOOL v7 = [*(id *)(a1 + 32) accessory];
        v8 = [v7 shortDescription];
        int v29 = 138543618;
        v30 = v6;
        __int16 v31 = 2112;
        v32 = v8;
        v9 = "%{public}@Was already reachable for: %@";
        v10 = v5;
        os_log_type_t v11 = OS_LOG_TYPE_DEBUG;
LABEL_10:
        _os_log_impl(&dword_1D49D5000, v10, v11, v9, (uint8_t *)&v29, 0x16u);

        goto LABEL_11;
      }
      goto LABEL_11;
    }
    BOOL v12 = *(unsigned char *)(a1 + 40) != 0;
  }
  else
  {
    BOOL v12 = 0;
  }
  [*(id *)(a1 + 32) setIsReachable:v12];
  if (*(unsigned char *)(a1 + 40))
  {
    v13 = [MEMORY[0x1E4F1C9C8] date];
    [*(id *)(a1 + 32) setReachableStartTime:v13];

    v3 = (void *)MEMORY[0x1D9452090]();
    id v4 = *(id *)(a1 + 32);
    v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = HMFGetLogIdentifier();
      BOOL v7 = [*(id *)(a1 + 32) accessory];
      v8 = [v7 shortDescription];
      int v29 = 138543618;
      v30 = v6;
      __int16 v31 = 2114;
      v32 = v8;
      v9 = "%{public}@Reachable started for accessory: %{public}@";
      v10 = v5;
      os_log_type_t v11 = OS_LOG_TYPE_INFO;
      goto LABEL_10;
    }
LABEL_11:

    return;
  }
  v14 = [*(id *)(a1 + 32) reachableStartTime];

  if (v14)
  {
    v15 = *(void **)(a1 + 32);
    v16 = [v15 reachableStartTime];
    [v16 timeIntervalSinceNow];
    double v18 = fabs(v17);
    [v15 reachableDurationSec];
    [v15 setReachableDurationSec:v19 + v18];

    v20 = (void *)MEMORY[0x1D9452090]();
    id v21 = *(id *)(a1 + 32);
    __int16 v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v23 = HMFGetLogIdentifier();
      uint64_t v24 = [*(id *)(a1 + 32) accessory];
      v25 = [v24 shortDescription];
      int v29 = 138543618;
      v30 = v23;
      __int16 v31 = 2114;
      v32 = v25;
      v26 = "%{public}@Reachable stopped for accessory: %{public}@";
      v27 = v22;
      os_log_type_t v28 = OS_LOG_TYPE_INFO;
LABEL_17:
      _os_log_impl(&dword_1D49D5000, v27, v28, v26, (uint8_t *)&v29, 0x16u);
    }
  }
  else
  {
    v20 = (void *)MEMORY[0x1D9452090]();
    id v21 = *(id *)(a1 + 32);
    __int16 v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      v23 = HMFGetLogIdentifier();
      uint64_t v24 = [*(id *)(a1 + 32) accessory];
      v25 = [v24 shortDescription];
      int v29 = 138543618;
      v30 = v23;
      __int16 v31 = 2112;
      v32 = v25;
      v26 = "%{public}@Was not reachable for: %@";
      v27 = v22;
      os_log_type_t v28 = OS_LOG_TYPE_DEBUG;
      goto LABEL_17;
    }
  }

  [*(id *)(a1 + 32) setReachableStartTime:0];
}

- (void)_resetSessionMetric
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = [(HMDAccessorySessionMetric *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)MEMORY[0x1D9452090]();
  v5 = self;
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    BOOL v7 = HMFGetLogIdentifier();
    v8 = [(HMDAccessorySessionMetric *)v5 accessory];
    v9 = [v8 shortDescription];
    int v13 = 138543618;
    v14 = v7;
    __int16 v15 = 2114;
    v16 = v9;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Resetting session metric - accessory: %{public}@", (uint8_t *)&v13, 0x16u);
  }
  v10 = [MEMORY[0x1E4F1C9C8] date];
  [(HMDAccessorySessionMetric *)v5 setReachableStartTime:0];
  [(HMDAccessorySessionMetric *)v5 setSessionStartTime:0];
  os_log_type_t v11 = [(HMDAccessorySessionMetric *)v5 errorCounts];
  [v11 removeAllObjects];

  [(HMDAccessorySessionMetric *)v5 setMetricCollectionStartTime:v10];
  [(HMDAccessorySessionMetric *)v5 setActiveSessionDurationSec:0.0];
  [(HMDAccessorySessionMetric *)v5 setReachableDurationSec:0.0];
  [(HMDAccessorySessionMetric *)v5 setSessionFailures:0];
  [(HMDAccessorySessionMetric *)v5 setSuccessfulSessionRetries:0];
  if ([(HMDAccessorySessionMetric *)v5 isReachable]) {
    [(HMDAccessorySessionMetric *)v5 setReachableStartTime:v10];
  }
  if ([(HMDAccessorySessionMetric *)v5 hasActiveSession]) {
    [(HMDAccessorySessionMetric *)v5 setSessionStartTime:v10];
  }
  BOOL v12 = [(HMDAccessorySessionMetric *)v5 sessionInfo];
  [v12 resetWithNumIPs:0 numIPsTried:0 numBonjourNames:0];
}

- (void)resetSessionMetric
{
  v3 = [(HMDAccessorySessionMetric *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__HMDAccessorySessionMetric_resetSessionMetric__block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __47__HMDAccessorySessionMetric_resetSessionMetric__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _resetSessionMetric];
}

- (void)_submitMetric
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  v3 = [(HMDAccessorySessionMetric *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDAccessorySessionMetric *)self metricCollectionStartTime];
  [v4 timeIntervalSinceNow];
  [(HMDAccessorySessionMetric *)self setSubmissionIntervalSec:fabs(v5)];

  id v6 = [(HMDAccessorySessionMetric *)self sessionStartTime];

  if (v6)
  {
    BOOL v7 = [(HMDAccessorySessionMetric *)self sessionStartTime];
    [v7 timeIntervalSinceNow];
    double v9 = fabs(v8);
    [(HMDAccessorySessionMetric *)self activeSessionDurationSec];
    [(HMDAccessorySessionMetric *)self setActiveSessionDurationSec:v10 + v9];
  }
  os_log_type_t v11 = [(HMDAccessorySessionMetric *)self reachableStartTime];

  if (v11)
  {
    BOOL v12 = [(HMDAccessorySessionMetric *)self reachableStartTime];
    [v12 timeIntervalSinceNow];
    double v14 = fabs(v13);
    [(HMDAccessorySessionMetric *)self reachableDurationSec];
    [(HMDAccessorySessionMetric *)self setReachableDurationSec:v15 + v14];
  }
  v16 = [(HMDAccessorySessionMetric *)self accessory];
  uint64_t v17 = [[HMDAccessorySessionMetricEvent alloc] initWithAccessory:v16 sessionMetric:self];
  double v18 = (void *)MEMORY[0x1D9452090]();
  double v19 = self;
  v20 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    id v21 = HMFGetLogIdentifier();
    __int16 v22 = [v16 name];
    v23 = [v16 identifier];
    uint64_t v24 = [(HMDAccessorySessionMetricEvent *)v17 coreAnalyticsEventDictionary];
    int v36 = 138544130;
    v37 = v21;
    __int16 v38 = 2112;
    v39 = v22;
    __int16 v40 = 2114;
    v41 = v23;
    __int16 v42 = 2114;
    v43 = v24;
    _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_INFO, "%{public}@Submitting SessionMetric for accessory: %@/%{public}@ - %{public}@", (uint8_t *)&v36, 0x2Au);
  }
  v25 = [(HMDAccessorySessionMetric *)v19 expectedTransport];
  if ([v25 isEqualToString:@"BLE"])
  {
  }
  else
  {
    [(HMDAccessorySessionMetric *)v19 submissionIntervalSec];
    double v27 = v26;

    if (v27 >= 3600.0)
    {
      v34 = [v16 home];
      v35 = [v34 logEventSubmitter];
      [v35 submitLogEvent:v17];

      goto LABEL_14;
    }
  }
  os_log_type_t v28 = (void *)MEMORY[0x1D9452090]();
  int v29 = v19;
  v30 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    __int16 v31 = HMFGetLogIdentifier();
    v32 = [v16 name];
    uint64_t v33 = [v16 identifier];
    int v36 = 138543874;
    v37 = v31;
    __int16 v38 = 2112;
    v39 = v32;
    __int16 v40 = 2114;
    v41 = v33;
    _os_log_impl(&dword_1D49D5000, v30, OS_LOG_TYPE_INFO, "%{public}@Skipped Submitting SessionMetric for %@/%{public}@", (uint8_t *)&v36, 0x20u);
  }
LABEL_14:
}

- (void)submitMetric
{
  v3 = [(HMDAccessorySessionMetric *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__HMDAccessorySessionMetric_submitMetric__block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __41__HMDAccessorySessionMetric_submitMetric__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _submitMetric];
}

- (void)_updateSessionState:(BOOL)a3 linkLayerType:(int64_t)a4 sessionInfo:(id)a5 bookkeeping:(id)a6 withError:(id)a7
{
  BOOL v9 = a3;
  uint64_t v126 = *MEMORY[0x1E4F143B8];
  id v11 = a5;
  id v12 = a6;
  id v13 = a7;
  double v14 = [(HMDAccessorySessionMetric *)self workQueue];
  dispatch_assert_queue_V2(v14);

  if (v9)
  {
    double v15 = [(HMDAccessorySessionMetric *)self sessionStartTime];

    if (v15)
    {
      v16 = HAPLinkLayerTypeDescription();
      [(HMDAccessorySessionMetric *)self setAccessoryTransport:v16];

      uint64_t v17 = (void *)MEMORY[0x1D9452090]();
      double v18 = self;
      double v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        v20 = HMFGetLogIdentifier();
        id v21 = [(HMDAccessorySessionMetric *)v18 accessoryTransport];
        __int16 v22 = [(HMDAccessorySessionMetric *)v18 accessory];
        [v22 shortDescription];
        v23 = id v105 = v12;
        *(_DWORD *)buf = 138543874;
        v119 = v20;
        __int16 v120 = 2112;
        v121 = v21;
        __int16 v122 = 2112;
        id v123 = v23;
        _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_DEBUG, "%{public}@Session was already started on %@ for: %@", buf, 0x20u);

        id v12 = v105;
      }

      goto LABEL_64;
    }
  }
  [(HMDAccessorySessionMetric *)self setHasActiveSession:v9];
  uint64_t v24 = [(HMDAccessorySessionMetric *)self sessionInfo];
  v25 = v24;
  if (v11)
  {
    uint64_t v26 = [v11 numIPAddresses];
    uint64_t v27 = [v11 numIPAddressesTried];
    uint64_t v28 = [v11 numBonjourNames];
    uint64_t v24 = v25;
    uint64_t v29 = v26;
    uint64_t v30 = v27;
  }
  else
  {
    uint64_t v29 = 0;
    uint64_t v30 = 0;
    uint64_t v28 = 0;
  }
  [v24 resetWithNumIPs:v29 numIPsTried:v30 numBonjourNames:v28];

  __int16 v31 = (void *)MEMORY[0x1D9452090]();
  v32 = self;
  uint64_t v33 = HMFGetOSLogHandle();
  BOOL v34 = os_log_type_enabled(v33, OS_LOG_TYPE_INFO);
  if (v9)
  {
    if (v34)
    {
      v35 = HMFGetLogIdentifier();
      int v36 = [(HMDAccessorySessionMetric *)v32 accessoryTransport];
      [(HMDAccessorySessionMetric *)v32 accessory];
      __int16 v38 = v37 = v12;
      v39 = [v38 shortDescription];
      [v37 lastDiscoveryMethod];
      HAPAccessoryServerDiscoveryMethodToString();
      v107 = v32;
      v41 = id v40 = v13;
      *(_DWORD *)buf = 138544130;
      v119 = v35;
      __int16 v120 = 2114;
      v121 = v36;
      __int16 v122 = 2114;
      id v123 = v39;
      __int16 v124 = 2112;
      v125 = v41;
      _os_log_impl(&dword_1D49D5000, v33, OS_LOG_TYPE_INFO, "%{public}@Session started on %{public}@ for accessory: %{public}@ discovered by %@", buf, 0x2Au);

      id v12 = v37;
      id v13 = v40;
      v32 = v107;
    }
    __int16 v42 = [MEMORY[0x1E4F1C9C8] date];
    [(HMDAccessorySessionMetric *)v32 setSessionStartTime:v42];

    [(HMDAccessorySessionMetric *)v32 setSuccessfulSessionRetries:[(HMDAccessorySessionMetric *)v32 successfulSessionRetries] + 1];
    v43 = HAPLinkLayerTypeDescription();
    [(HMDAccessorySessionMetric *)v32 setAccessoryTransport:v43];

    [(HMDAccessorySessionMetric *)v32 setIsFromPrimary:[(HMDAccessorySessionMetric *)v32 isCurrentPrimaryResident]];
    if (v12) {
      v32->_isBonjourUpdateForced = [v12 lastDiscoveryMethod] == 2;
    }
    goto LABEL_64;
  }
  if (v34)
  {
    uint64_t v44 = HMFGetLogIdentifier();
    v45 = [(HMDAccessorySessionMetric *)v32 accessoryTransport];
    v46 = [(HMDAccessorySessionMetric *)v32 accessory];
    v47 = [v46 shortDescription];
    *(_DWORD *)buf = 138544130;
    v119 = v44;
    __int16 v120 = 2114;
    v121 = v45;
    __int16 v122 = 2114;
    id v123 = v13;
    __int16 v124 = 2112;
    v125 = v47;
    _os_log_impl(&dword_1D49D5000, v33, OS_LOG_TYPE_INFO, "%{public}@Session ended on %{public}@ with error: %{public}@ for accessory: %@", buf, 0x2Au);
  }
  id v48 = v12;

  v49 = [(HMDAccessorySessionMetric *)v32 sessionStartTime];

  if (v49)
  {
    v50 = [(HMDAccessorySessionMetric *)v32 sessionStartTime];
    [v50 timeIntervalSinceNow];
    double v52 = fabs(v51);
    [(HMDAccessorySessionMetric *)v32 activeSessionDurationSec];
    [(HMDAccessorySessionMetric *)v32 setActiveSessionDurationSec:v53 + v52];
  }
  v54 = [(HMDAccessorySessionMetric *)v32 accessory];
  if (!v13) {
    goto LABEL_54;
  }
  v55 = [(HMDAccessorySessionMetric *)v32 radarInitiator];

  if (!v55) {
    goto LABEL_54;
  }
  id v103 = v13;
  id v104 = v11;
  id v106 = v48;
  v56 = (void *)MEMORY[0x1D9452090]();
  v108 = v32;
  v57 = v32;
  v58 = HMFGetOSLogHandle();
  v110 = v54;
  if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
  {
    v59 = HMFGetLogIdentifier();
    v60 = [v54 manufacturer];
    v61 = [v54 model];
    v62 = [v54 firmwareVersion];
    *(_DWORD *)buf = 138544130;
    v119 = v59;
    __int16 v120 = 2114;
    v121 = v60;
    __int16 v122 = 2114;
    id v123 = v61;
    __int16 v124 = 2114;
    v125 = v62;
      buf,
      0x2Au);

    v54 = v110;
  }

  long long v115 = 0u;
  long long v116 = 0u;
  long long v113 = 0u;
  long long v114 = 0u;
  v63 = [(HMDAccessorySessionMetric *)v57 hapSessionTTRAllowList];
  uint64_t v112 = [v63 countByEnumeratingWithState:&v113 objects:v117 count:16];
  if (!v112) {
    goto LABEL_53;
  }
  uint64_t v111 = *(void *)v114;
  v109 = v63;
  while (2)
  {
    for (uint64_t i = 0; i != v112; ++i)
    {
      if (*(void *)v114 != v111) {
        objc_enumerationMutation(v63);
      }
      v65 = *(void **)(*((void *)&v113 + 1) + 8 * i);
      v66 = [v65 objectForKeyedSubscript:@"Manufacturer"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v67 = v66;
      }
      else {
        v67 = 0;
      }
      id v68 = v67;

      v69 = [v65 objectForKeyedSubscript:@"Model"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v70 = v69;
      }
      else {
        v70 = 0;
      }
      id v71 = v70;

      v72 = [v65 objectForKeyedSubscript:@"FirmwareVersion"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v73 = v72;
      }
      else {
        v73 = 0;
      }
      id v74 = v73;

      v75 = [v54 manufacturer];
      if (![v75 isEqualToString:v68]) {
        goto LABEL_41;
      }
      v76 = [v54 model];
      if (([v76 isEqualToString:v71] & 1) == 0)
      {

LABEL_41:
        goto LABEL_42;
      }
      v77 = [v54 firmwareVersion];
      v78 = [v77 versionString];
      int v79 = [v78 isEqualToString:v74];

      v63 = v109;
      v54 = v110;

      if (v79)
      {
        v80 = [(HMDAccessorySessionMetric *)v57 hapSessionTTRTimer];
        int v81 = [v80 isRunning];

        v82 = (void *)MEMORY[0x1D9452090]();
        v83 = v57;
        v84 = HMFGetOSLogHandle();
        BOOL v85 = os_log_type_enabled(v84, OS_LOG_TYPE_INFO);
        if (v81)
        {
          if (v85)
          {
            v86 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            v119 = v86;
            _os_log_impl(&dword_1D49D5000, v84, OS_LOG_TYPE_INFO, "%{public}@Not starting timer to initiate radar for accessory because one is already running", buf, 0xCu);
          }
        }
        else
        {
          if (v85)
          {
            v87 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            v119 = v87;
            _os_log_impl(&dword_1D49D5000, v84, OS_LOG_TYPE_INFO, "%{public}@Starting timer to initiate radar for accessory", buf, 0xCu);
          }
          v88 = [(HMDAccessorySessionMetric *)v83 hapSessionTTRTimer];
          [v88 resume];
        }
        v63 = v109;
        goto LABEL_53;
      }
LABEL_42:
    }
    uint64_t v112 = [v63 countByEnumeratingWithState:&v113 objects:v117 count:16];
    if (v112) {
      continue;
    }
    break;
  }
LABEL_53:

  id v11 = v104;
  id v48 = v106;
  id v13 = v103;
  v32 = v108;
LABEL_54:
  if (v11)
  {
    v89 = [v54 home];
    v90 = [v89 homeManager];
    v91 = [v90 metricsManager];
    v92 = [v91 threadNetworkObserver];

    if (v92) {
      [v92 requestThreadNetworkStateCaptureForAccessory:v54 failingScenario:2];
    }
  }
  v93 = [v13 underlyingErrors];
  uint64_t v94 = [v93 firstObject];
  v95 = (void *)v94;
  if (v94) {
    v96 = (void *)v94;
  }
  else {
    v96 = v13;
  }
  id v97 = v96;

  if (v97)
  {
    [(HMDAccessorySessionMetric *)v32 setSessionFailures:[(HMDAccessorySessionMetric *)v32 sessionFailures] + 1];
    v98 = [(HMDAccessorySessionMetric *)v32 errorCounts];
    v99 = [v98 objectForKeyedSubscript:v97];
    uint64_t v100 = [v99 integerValue];

    v101 = [NSNumber numberWithUnsignedInteger:v100 + 1];
    v102 = [(HMDAccessorySessionMetric *)v32 errorCounts];
    [v102 setObject:v101 forKeyedSubscript:v97];
  }
  [(HMDAccessorySessionMetric *)v32 setSessionStartTime:0];

  id v12 = v48;
LABEL_64:
}

- (void)updateSessionState:(BOOL)a3 linkLayerType:(int64_t)a4 sessionInfo:(id)a5 bookkeeping:(id)a6 withError:(id)a7
{
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  double v15 = [(HMDAccessorySessionMetric *)self workQueue];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __96__HMDAccessorySessionMetric_updateSessionState_linkLayerType_sessionInfo_bookkeeping_withError___block_invoke;
  v19[3] = &unk_1E6A19B08;
  BOOL v24 = a3;
  id v22 = v14;
  int64_t v23 = a4;
  v19[4] = self;
  id v20 = v12;
  id v21 = v13;
  id v16 = v14;
  id v17 = v13;
  id v18 = v12;
  dispatch_async(v15, v19);
}

uint64_t __96__HMDAccessorySessionMetric_updateSessionState_linkLayerType_sessionInfo_bookkeeping_withError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateSessionState:*(unsigned __int8 *)(a1 + 72) linkLayerType:*(void *)(a1 + 64) sessionInfo:*(void *)(a1 + 40) bookkeeping:*(void *)(a1 + 48) withError:*(void *)(a1 + 56)];
}

- (NSError)topError
{
  v2 = [(HMDAccessorySessionMetric *)self errorCounts];
  v3 = (void *)[v2 copy];

  id v4 = [v3 keysSortedByValueUsingComparator:&__block_literal_global_191949];
  double v5 = [v4 firstObject];

  return (NSError *)v5;
}

uint64_t __37__HMDAccessorySessionMetric_topError__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = [v4 integerValue];
  if (v6 == [v5 integerValue])
  {
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v8 = [v4 integerValue];
    if (v8 < [v5 integerValue]) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = -1;
    }
  }

  return v7;
}

- (BOOL)isPrimaryResidentThreadCapable
{
  v2 = [(HMDAccessorySessionMetric *)self accessory];
  v3 = [v2 home];
  id v4 = [v3 primaryResident];
  id v5 = [v4 capabilities];
  char v6 = [v5 supportsThreadBorderRouter];

  return v6;
}

- (BOOL)isThreadNetworkUp
{
  v2 = [(HMDAccessorySessionMetric *)self accessory];
  v3 = [v2 home];
  char v4 = [v3 isThreadNetworkUp];

  return v4;
}

- (BOOL)isHomeThreadCapable
{
  v2 = [(HMDAccessorySessionMetric *)self accessory];
  v3 = [v2 home];
  char v4 = [v3 isThreadCapable];

  return v4;
}

- (BOOL)isCurrentPrimaryResident
{
  v2 = [(HMDAccessorySessionMetric *)self accessory];
  v3 = [v2 home];
  char v4 = [v3 isCurrentDevicePrimaryResident];

  return v4;
}

- (double)sessionCheckIntervalSec
{
  v2 = [(HMDAccessorySessionMetric *)self accessory];
  [v2 sessionCheckPeriod];
  double v4 = v3;

  return v4;
}

- (id)attributeDescriptions
{
  v63[15] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  double v4 = NSNumber;
  [(HMDAccessorySessionMetric *)self submissionIntervalSec];
  v62 = objc_msgSend(v4, "numberWithDouble:");
  v61 = (void *)[v3 initWithName:@"submissionInterval" value:v62];
  v63[0] = v61;
  id v5 = objc_alloc(MEMORY[0x1E4F653F8]);
  char v6 = NSNumber;
  [(HMDAccessorySessionMetric *)self activeSessionDurationSec];
  v60 = objc_msgSend(v6, "numberWithDouble:");
  v59 = (void *)[v5 initWithName:@"activeSessionDurationSec" value:v60];
  v63[1] = v59;
  id v7 = objc_alloc(MEMORY[0x1E4F653F8]);
  uint64_t v8 = NSNumber;
  [(HMDAccessorySessionMetric *)self reachableDurationSec];
  v58 = objc_msgSend(v8, "numberWithDouble:");
  v57 = (void *)[v7 initWithName:@"reachableDurationSec" value:v58];
  v63[2] = v57;
  id v9 = objc_alloc(MEMORY[0x1E4F653F8]);
  double v10 = NSNumber;
  [(HMDAccessorySessionMetric *)self sessionCheckIntervalSec];
  v56 = objc_msgSend(v10, "numberWithDouble:");
  v55 = (void *)[v9 initWithName:@"sessionCheckIntervalSec" value:v56];
  v63[3] = v55;
  id v11 = objc_alloc(MEMORY[0x1E4F653F8]);
  v54 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDAccessorySessionMetric sessionFailures](self, "sessionFailures"));
  double v53 = (void *)[v11 initWithName:@"sessionFailures" value:v54];
  v63[4] = v53;
  id v12 = objc_alloc(MEMORY[0x1E4F653F8]);
  double v52 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDAccessorySessionMetric successfulSessionRetries](self, "successfulSessionRetries"));
  double v51 = (void *)[v12 initWithName:@"successfulSessionRetries" value:v52];
  v63[5] = v51;
  id v13 = objc_alloc(MEMORY[0x1E4F653F8]);
  v50 = [(HMDAccessorySessionMetric *)self topError];
  v49 = [v50 domain];
  id v48 = (void *)[v13 initWithName:@"topErrorDomain" value:v49];
  v63[6] = v48;
  id v14 = objc_alloc(MEMORY[0x1E4F653F8]);
  double v15 = NSNumber;
  v47 = [(HMDAccessorySessionMetric *)self topError];
  v46 = objc_msgSend(v15, "numberWithInteger:", objc_msgSend(v47, "code"));
  v45 = (void *)[v14 initWithName:@"topErrorCode" value:v46];
  v63[7] = v45;
  id v16 = objc_alloc(MEMORY[0x1E4F653F8]);
  uint64_t v44 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDAccessorySessionMetric isFromPrimary](self, "isFromPrimary"));
  v43 = (void *)[v16 initWithName:@"isFromPrimary" value:v44];
  v63[8] = v43;
  id v17 = objc_alloc(MEMORY[0x1E4F653F8]);
  __int16 v42 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDAccessorySessionMetric isHomeThreadCapable](self, "isHomeThreadCapable"));
  v41 = (void *)[v17 initWithName:@"isHomeThreadCapable" value:v42];
  v63[9] = v41;
  id v18 = objc_alloc(MEMORY[0x1E4F653F8]);
  id v40 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDAccessorySessionMetric isPrimaryResidentThreadCapable](self, "isPrimaryResidentThreadCapable"));
  v39 = (void *)[v18 initWithName:@"isPrimaryResidentThreadCapable" value:v40];
  v63[10] = v39;
  id v19 = objc_alloc(MEMORY[0x1E4F653F8]);
  __int16 v38 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDAccessorySessionMetric isThreadNetworkUp](self, "isThreadNetworkUp"));
  id v20 = (void *)[v19 initWithName:@"isThreadNetworkUp" value:v38];
  v63[11] = v20;
  id v21 = objc_alloc(MEMORY[0x1E4F653F8]);
  id v22 = NSNumber;
  int64_t v23 = [(HMDAccessorySessionMetric *)self sessionInfo];
  BOOL v24 = objc_msgSend(v22, "numberWithUnsignedInteger:", objc_msgSend(v23, "numIPAddresses"));
  v25 = (void *)[v21 initWithName:@"numIPAddressesResolved" value:v24];
  v63[12] = v25;
  id v26 = objc_alloc(MEMORY[0x1E4F653F8]);
  uint64_t v27 = NSNumber;
  uint64_t v28 = [(HMDAccessorySessionMetric *)self sessionInfo];
  uint64_t v29 = objc_msgSend(v27, "numberWithUnsignedInteger:", objc_msgSend(v28, "numIPAddressesTried"));
  uint64_t v30 = (void *)[v26 initWithName:@"numIPAddressesTried" value:v29];
  v63[13] = v30;
  id v31 = objc_alloc(MEMORY[0x1E4F653F8]);
  v32 = NSNumber;
  uint64_t v33 = [(HMDAccessorySessionMetric *)self sessionInfo];
  BOOL v34 = objc_msgSend(v32, "numberWithUnsignedInteger:", objc_msgSend(v33, "numBonjourNames"));
  v35 = (void *)[v31 initWithName:@"numBonjourNamesSeen" value:v34];
  v63[14] = v35;
  id v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v63 count:15];

  return v37;
}

- (NSDictionary)state
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  double v4 = [(HMDAccessorySessionMetric *)self accessory];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  id v7 = [v6 manufacturer];
  [v3 setObject:v7 forKeyedSubscript:@"Manufacturer"];

  uint64_t v8 = [v6 model];
  [v3 setObject:v8 forKeyedSubscript:@"Model"];

  id v9 = [v6 firmwareVersion];
  double v10 = [v9 shortVersionString];
  [v3 setObject:v10 forKeyedSubscript:@"FirmwareVersion"];

  id v11 = [v6 serialNumber];
  [v3 setObject:v11 forKeyedSubscript:@"SerialNumber"];

  id v12 = [MEMORY[0x1E4F65530] sharedPreferences];
  id v13 = [v12 preferenceForKey:@"HMDAccessorySessionMetricSubmissionInterval"];
  id v14 = [v13 numberValue];
  [v3 setObject:v14 forKeyedSubscript:@"submissionInterval"];

  double v15 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDAccessorySessionMetric hasActiveSession](self, "hasActiveSession"));
  [v3 setObject:v15 forKeyedSubscript:@"hasActiveSession"];

  id v16 = NSNumber;
  id v17 = [(HMDAccessorySessionMetric *)self sessionStartTime];
  [v17 timeIntervalSinceNow];
  id v19 = [v16 numberWithDouble:fabs(v18)];
  [v3 setObject:v19 forKeyedSubscript:@"activeSessionDurationSec"];

  id v20 = NSNumber;
  id v21 = [(HMDAccessorySessionMetric *)self reachableStartTime];
  [v21 timeIntervalSinceNow];
  int64_t v23 = [v20 numberWithDouble:fabs(v22)];
  [v3 setObject:v23 forKeyedSubscript:@"reachableDurationSec"];

  BOOL v24 = NSNumber;
  [(HMDAccessorySessionMetric *)self sessionCheckIntervalSec];
  v25 = objc_msgSend(v24, "numberWithDouble:");
  [v3 setObject:v25 forKeyedSubscript:@"sessionCheckIntervalSec"];

  id v26 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDAccessorySessionMetric sessionFailures](self, "sessionFailures"));
  [v3 setObject:v26 forKeyedSubscript:@"sessionFailures"];

  uint64_t v27 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDAccessorySessionMetric successfulSessionRetries](self, "successfulSessionRetries"));
  [v3 setObject:v27 forKeyedSubscript:@"successfulSessionRetries"];

  uint64_t v28 = [(HMDAccessorySessionMetric *)self errorCounts];
  uint64_t v29 = [v28 description];
  [v3 setObject:v29 forKeyedSubscript:@"sessionErrors"];

  uint64_t v30 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDAccessorySessionMetric isFromPrimary](self, "isFromPrimary"));
  [v3 setObject:v30 forKeyedSubscript:@"isFromPrimary"];

  id v31 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "numActiveSessionClients"));
  [v3 setObject:v31 forKeyedSubscript:@"numActiveClients"];

  v32 = [v6 currentActiveSessionRestoreClients];
  [v3 setObject:v32 forKeyedSubscript:@"activeClients"];

  uint64_t v33 = [v6 expectedTransport];

  [v3 setObject:v33 forKeyedSubscript:@"expectedTransport"];
  BOOL v34 = [(HMDAccessorySessionMetric *)self accessoryTransport];
  [v3 setObject:v34 forKeyedSubscript:@"currentTransport"];

  return (NSDictionary *)v3;
}

- (HMDAccessorySessionMetric)initWithAccessory:(id)a3 workQueue:(id)a4 hapSessionTTRTimer:(id)a5 hapSessionTTRAllowList:(id)a6 radarInitiator:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v33.receiver = self;
  v33.super_class = (Class)HMDAccessorySessionMetric;
  id v17 = [(HMDAccessorySessionMetric *)&v33 init];
  double v18 = v17;
  if (v17)
  {
    objc_storeWeak((id *)&v17->_accessory, v12);
    objc_storeStrong((id *)&v18->_workQueue, a4);
    id v19 = [MEMORY[0x1E4F1C9C8] date];
    if ([v12 isReachable])
    {
      v18->_isReachable = 1;
      objc_storeStrong((id *)&v18->_reachableStartTime, v19);
    }
    if ([v12 hasActiveSession])
    {
      v18->_hasActiveSession = 1;
      objc_storeStrong((id *)&v18->_sessionStartTime, v19);
    }
    uint64_t v20 = [MEMORY[0x1E4F1CA60] dictionary];
    errorCounts = v18->_errorCounts;
    v18->_errorCounts = (NSMutableDictionary *)v20;

    uint64_t v22 = [MEMORY[0x1E4F1C9C8] date];
    metricCollectionStartTime = v18->_metricCollectionStartTime;
    v18->_metricCollectionStartTime = (NSDate *)v22;

    uint64_t v24 = [objc_alloc(MEMORY[0x1E4F5BBA0]) initWithNumIPs:0 numIPsTried:0 numBonjourNames:0];
    sessionInfo = v18->_sessionInfo;
    v18->_sessionInfo = (HAP2AccessorySessionInfo *)v24;

    [v12 linkLayerType];
    uint64_t v26 = HAPLinkLayerTypeDescription();
    accessoryTransport = v18->_accessoryTransport;
    v18->_accessoryTransport = (NSString *)v26;

    uint64_t v28 = [v12 expectedTransport];
    expectedTransport = v18->_expectedTransport;
    v18->_expectedTransport = (NSString *)v28;

    if (v16)
    {
      uint64_t v30 = [v15 copy];
      hapSessionTTRAllowList = v18->_hapSessionTTRAllowList;
      v18->_hapSessionTTRAllowList = (NSArray *)v30;

      objc_storeWeak((id *)&v18->_radarInitiator, v16);
      objc_storeStrong((id *)&v18->_hapSessionTTRTimer, a5);
      [(HMFTimer *)v18->_hapSessionTTRTimer setDelegateQueue:v18->_workQueue];
      [(HMFTimer *)v18->_hapSessionTTRTimer setDelegate:v18];
    }
  }
  return v18;
}

- (HMDAccessorySessionMetric)initWithAccessory:(id)a3 workQueue:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = +[HMDTTRManager sharedManager];
  if (v8)
  {
    id v9 = [MEMORY[0x1E4F65530] sharedPreferences];
    double v10 = [v9 preferenceForKey:@"HAPSessionTTRAllowList"];
    id v11 = [v10 value];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v12 = v11;
    }
    else {
      id v12 = 0;
    }
    id v13 = v12;
  }
  else
  {
    id v13 = 0;
  }
  id v14 = (void *)[objc_alloc(MEMORY[0x1E4F65580]) initWithTimeInterval:0 options:30.0];
  id v15 = [(HMDAccessorySessionMetric *)self initWithAccessory:v7 workQueue:v6 hapSessionTTRTimer:v14 hapSessionTTRAllowList:v13 radarInitiator:v8];

  return v15;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t20_192034 != -1) {
    dispatch_once(&logCategory__hmf_once_t20_192034, &__block_literal_global_102_192035);
  }
  v2 = (void *)logCategory__hmf_once_v21_192036;
  return v2;
}

uint64_t __40__HMDAccessorySessionMetric_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v21_192036;
  logCategory__hmf_once_v21_192036 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end