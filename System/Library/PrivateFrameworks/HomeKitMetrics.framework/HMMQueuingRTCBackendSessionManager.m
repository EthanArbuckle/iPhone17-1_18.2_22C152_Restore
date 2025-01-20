@interface HMMQueuingRTCBackendSessionManager
+ (id)logCategory;
+ (id)sharedSessionManager;
- (BOOL)_isTimeValid;
- (HMMQueuingRTCBackendSessionManager)initWithRTCFactory:(id)a3 timeSourceBlock:(id)a4;
- (HMMRTCReportingFactory)rtcFactory;
- (NSOperationQueue)queue;
- (id)logBackendSessionWithServiceName:(id)a3 sessionUUID:(id)a4 isRealtime:(BOOL)a5;
- (id)timeSourceBlock;
- (void)addBarrierBlock:(id)a3;
- (void)checkForStaleSessions;
- (void)sendMetaEventWithName:(id)a3 forServiceName:(id)a4;
- (void)submitMessages:(id)a3 serviceName:(id)a4 sessionUUID:(id)a5 isRealtime:(BOOL)a6;
@end

@implementation HMMQueuingRTCBackendSessionManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_timeSourceBlock, 0);
  objc_storeStrong((id *)&self->_rtcFactory, 0);
  objc_storeStrong((id *)&self->_activeSessions, 0);
}

- (NSOperationQueue)queue
{
  return self->_queue;
}

- (id)timeSourceBlock
{
  return self->_timeSourceBlock;
}

- (HMMRTCReportingFactory)rtcFactory
{
  return self->_rtcFactory;
}

- (void)addBarrierBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(HMMQueuingRTCBackendSessionManager *)self queue];
  [v5 addBarrierBlock:v4];
}

- (void)checkForStaleSessions
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  double v3 = (*((double (**)(void))self->_timeSourceBlock + 2))();
  if (v3 >= self->_nextStaleCheckTime)
  {
    id v4 = (void *)MEMORY[0x1D944E970]();
    id v5 = self;
    HMFGetOSLogHandle();
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v25 = v7;
      _os_log_impl(&dword_1D4999000, v6, OS_LOG_TYPE_INFO, "%{public}@Checking for stale backend sessions", buf, 0xCu);
    }
    unint64_t v8 = 0;
    while (v8 < [(NSPointerArray *)v5->_activeSessions count])
    {
      v9 = [(NSPointerArray *)v5->_activeSessions pointerAtIndex:v8];
      v10 = v9;
      if (v9 && (uint64_t v11 = [v9 lastEventTime], v3 - v12 > 3600.0))
      {
        v13 = (void *)MEMORY[0x1D944E970](v11);
        v14 = v5;
        HMFGetOSLogHandle();
        v15 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          id v16 = (id)objc_claimAutoreleasedReturnValue();
          v17 = [v10 serviceName];
          *(_DWORD *)buf = 138543618;
          id v25 = v16;
          __int16 v26 = 2112;
          v27 = v17;
          _os_log_impl(&dword_1D4999000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@Found stale session for service %@", buf, 0x16u);
        }
        v22[0] = @"HMFSessionIdentifier";
        v18 = [v10 sessionUUID];
        v23[0] = v18;
        v23[1] = @"HMFLogging.StaleSession";
        v22[1] = @"HMFEventName";
        v22[2] = @"HMFTimestamp";
        v19 = [NSNumber numberWithDouble:v3];
        v23[2] = v19;
        v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:3];
        [v10 sendMessage:v20];

        [v10 close];
        [(NSPointerArray *)v5->_activeSessions removePointerAtIndex:v8];
      }
      else
      {
        ++v8;
      }
    }
    self->_nextStaleCheckTime = v3 + 3600.0;
  }
  os_unfair_lock_unlock(lock);
}

- (void)submitMessages:(id)a3 serviceName:(id)a4 sessionUUID:(id)a5 isRealtime:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = (void *)MEMORY[0x1D944E970]();
  v14 = self;
  v15 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    id v16 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    v23 = v16;
    __int16 v24 = 2112;
    id v25 = v12;
    __int16 v26 = 2048;
    uint64_t v27 = [v10 count];
    _os_log_impl(&dword_1D4999000, v15, OS_LOG_TYPE_DEBUG, "%{public}@[%@] Queuing session containing %lu messages for submission", buf, 0x20u);
  }
  v17 = [(HMMQueuingRTCBackendSessionManager *)v14 queue];
  v18 = [HMMQueuingRTCBackendOperation alloc];
  v19 = [(HMMQueuingRTCBackendSessionManager *)v14 rtcFactory];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __88__HMMQueuingRTCBackendSessionManager_submitMessages_serviceName_sessionUUID_isRealtime___block_invoke;
  v21[3] = &unk_1E69FD5B8;
  v21[4] = v14;
  v20 = [(HMMQueuingRTCBackendOperation *)v18 initWithMessages:v10 serviceName:v11 sessionUUID:v12 isRealtime:v6 rtcFactory:v19 staleSessionBlock:v21];
  [v17 addOperation:v20];
}

uint64_t __88__HMMQueuingRTCBackendSessionManager_submitMessages_serviceName_sessionUUID_isRealtime___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) checkForStaleSessions];
}

- (void)sendMetaEventWithName:(id)a3 forServiceName:(id)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  v15[0] = a3;
  BOOL v6 = NSNumber;
  id v7 = a4;
  id v8 = a3;
  v9 = [(HMMQueuingRTCBackendSessionManager *)self timeSourceBlock];
  v9[2]();
  id v10 = objc_msgSend(v6, "numberWithDouble:");
  v14[2] = @"HMFCorrespondingServiceName";
  v15[1] = v10;
  v15[2] = v7;
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];
  v16[0] = v11;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  v13 = [MEMORY[0x1E4F29128] UUID];

  [(HMMQueuingRTCBackendSessionManager *)self submitMessages:v12 serviceName:@"HMFMeta" sessionUUID:v13 isRealtime:0];
}

- (id)logBackendSessionWithServiceName:(id)a3 sessionUUID:(id)a4 isRealtime:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  os_unfair_lock_lock_with_options();
  if (![(HMMQueuingRTCBackendSessionManager *)self _isTimeValid])
  {
    id v10 = 0;
    goto LABEL_5;
  }
  [(NSPointerArray *)self->_activeSessions addPointer:0];
  [(NSPointerArray *)self->_activeSessions compact];
  if ([(NSPointerArray *)self->_activeSessions count] <= 0x3E7)
  {
    id v10 = [[HMMQueuingRTCBackendSession alloc] initWithServiceName:v8 sessionUUID:v9 isRealtime:v5 submitter:self timeSourceBlock:self->_timeSourceBlock];
    [(NSPointerArray *)self->_activeSessions hmf_addObject:v10];
LABEL_5:
    os_unfair_lock_unlock(&self->_lock);
    goto LABEL_9;
  }
  os_unfair_lock_unlock(&self->_lock);
  id v11 = (void *)MEMORY[0x1D944E970]();
  id v12 = self;
  v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    v14 = HMFGetLogIdentifier();
    NSUInteger v15 = [(NSPointerArray *)self->_activeSessions count];
    int v17 = 138543874;
    v18 = v14;
    __int16 v19 = 2048;
    NSUInteger v20 = v15;
    __int16 v21 = 2112;
    id v22 = v8;
    _os_log_impl(&dword_1D4999000, v13, OS_LOG_TYPE_ERROR, "%{public}@%lu sessions already queued; creating a nil session for service %@",
      (uint8_t *)&v17,
      0x20u);
  }
  [(HMMQueuingRTCBackendSessionManager *)v12 sendMetaEventWithName:@"ExceededSessionMax" forServiceName:v8];
  id v10 = 0;
LABEL_9:

  return v10;
}

- (BOOL)_isTimeValid
{
  os_unfair_lock_assert_owner(&self->_lock);
  if (self->__isTimeValid) {
    return 1;
  }
  if (_isTimeValid_onceToken != -1) {
    dispatch_once(&_isTimeValid_onceToken, &__block_literal_global_115);
  }
  BOOL result = (*((double (**)(void))self->_timeSourceBlock + 2))() >= *(double *)&_isTimeValid_minAllowedTime;
  self->__isTimeValid = result;
  return result;
}

void __50__HMMQueuingRTCBackendSessionManager__isTimeValid__block_invoke()
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  [v5 setDay:1];
  [v5 setMonth:1];
  [v5 setYear:2022];
  id v0 = objc_alloc(MEMORY[0x1E4F1C9A8]);
  v1 = (void *)[v0 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
  v2 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
  [v1 setTimeZone:v2];

  double v3 = [v1 dateFromComponents:v5];
  [v3 timeIntervalSince1970];
  _isTimeValid_minAllowedTime = v4;
}

- (HMMQueuingRTCBackendSessionManager)initWithRTCFactory:(id)a3 timeSourceBlock:(id)a4
{
  id v7 = a3;
  id v8 = (double (**)(void))a4;
  v18.receiver = self;
  v18.super_class = (Class)HMMQueuingRTCBackendSessionManager;
  id v9 = [(HMMQueuingRTCBackendSessionManager *)&v18 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_rtcFactory, a3);
    uint64_t v11 = MEMORY[0x1D944EB70](v8);
    timeSourceBos_unfair_lock_t lock = v10->_timeSourceBlock;
    v10->_timeSourceBos_unfair_lock_t lock = (id)v11;

    v13 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    queue = v10->_queue;
    v10->_queue = v13;

    [(NSOperationQueue *)v10->_queue setMaxConcurrentOperationCount:1];
    [(NSOperationQueue *)v10->_queue setQualityOfService:9];
    uint64_t v15 = [MEMORY[0x1E4F28F50] weakObjectsPointerArray];
    activeSessions = v10->_activeSessions;
    v10->_activeSessions = (NSPointerArray *)v15;

    v10->_nextStaleCheckTime = v8[2](v8) + 1800.0;
  }

  return v10;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t19 != -1) {
    dispatch_once(&logCategory__hmf_once_t19, &__block_literal_global_129);
  }
  v2 = (void *)logCategory__hmf_once_v20;
  return v2;
}

uint64_t __49__HMMQueuingRTCBackendSessionManager_logCategory__block_invoke()
{
  logCategory__hmf_once_NSUInteger v20 = HMFCreateOSLogHandle();
  return MEMORY[0x1F41817F8]();
}

+ (id)sharedSessionManager
{
  if (sharedSessionManager__hmf_once_t11 != -1) {
    dispatch_once(&sharedSessionManager__hmf_once_t11, &__block_literal_global_107);
  }
  v2 = (void *)sharedSessionManager__hmf_once_v12;
  return v2;
}

void __58__HMMQueuingRTCBackendSessionManager_sharedSessionManager__block_invoke()
{
  id v0 = [HMMQueuingRTCBackendSessionManager alloc];
  double v3 = objc_alloc_init(HMMRTCReportingFactory);
  uint64_t v1 = [(HMMQueuingRTCBackendSessionManager *)v0 initWithRTCFactory:v3 timeSourceBlock:&__block_literal_global_112];
  v2 = (void *)sharedSessionManager__hmf_once_v12;
  sharedSessionManager__hmf_once_id v12 = v1;
}

double __58__HMMQueuingRTCBackendSessionManager_sharedSessionManager__block_invoke_2()
{
  id v0 = [MEMORY[0x1E4F1C9C8] date];
  [v0 timeIntervalSince1970];
  double v2 = v1;

  return v2;
}

@end