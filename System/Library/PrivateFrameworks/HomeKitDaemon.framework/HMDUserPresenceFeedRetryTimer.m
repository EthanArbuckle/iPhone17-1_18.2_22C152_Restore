@interface HMDUserPresenceFeedRetryTimer
+ (id)logCategory;
- (BOOL)shouldRetryImmediately:(double)a3;
- (HMDUserPresenceFeedRetryTimer)init;
- (HMFTimer)retryTimer;
- (NSUUID)timerID;
- (double)retryTimeInterval;
- (id)attributeDescriptions;
- (id)logIdentifier;
- (unint64_t)retryCount;
- (void)cancel;
- (void)setRetryCount:(unint64_t)a3;
- (void)setRetryTimer:(id)a3;
- (void)startWithDelegate:(id)a3 delegateQueue:(id)a4 responseTime:(double)a5;
@end

@implementation HMDUserPresenceFeedRetryTimer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timerID, 0);
  objc_storeStrong((id *)&self->_retryTimer, 0);
}

- (NSUUID)timerID
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (void)setRetryCount:(unint64_t)a3
{
  self->_retryCount = a3;
}

- (unint64_t)retryCount
{
  return self->_retryCount;
}

- (void)setRetryTimer:(id)a3
{
}

- (HMFTimer)retryTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 8, 1);
}

- (id)logIdentifier
{
  v2 = [(HMDUserPresenceFeedRetryTimer *)self timerID];
  v3 = [v2 UUIDString];

  return v3;
}

- (BOOL)shouldRetryImmediately:(double)a3
{
  [(HMDUserPresenceFeedRetryTimer *)self retryTimeInterval];
  return v4 <= a3;
}

- (double)retryTimeInterval
{
  unint64_t v2 = [(HMDUserPresenceFeedRetryTimer *)self retryCount];
  double result = 300.0;
  if (v2 <= 0xA) {
    return 30.0;
  }
  return result;
}

- (void)cancel
{
  v3 = [(HMDUserPresenceFeedRetryTimer *)self retryTimer];
  [v3 suspend];

  [(HMDUserPresenceFeedRetryTimer *)self setRetryTimer:0];
}

- (void)startWithDelegate:(id)a3 delegateQueue:(id)a4 responseTime:(double)a5
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v10 = (void *)MEMORY[0x230FBD990]();
  v11 = self;
  v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = HMFGetLogIdentifier();
    v14 = [NSNumber numberWithDouble:a5];
    v15 = NSNumber;
    [(HMDUserPresenceFeedRetryTimer *)v11 retryTimeInterval];
    v16 = objc_msgSend(v15, "numberWithDouble:");
    int v29 = 138543874;
    v30 = v13;
    __int16 v31 = 2112;
    v32 = v14;
    __int16 v33 = 2112;
    v34 = v16;
    _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Starting the timer after response time %@ and retry time interval %@", (uint8_t *)&v29, 0x20u);
  }
  if ([(HMDUserPresenceFeedRetryTimer *)v11 shouldRetryImmediately:a5])
  {
    v17 = (void *)MEMORY[0x230FBD990]();
    v18 = v11;
    v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v20 = HMFGetLogIdentifier();
      v21 = [NSNumber numberWithDouble:a5];
      v22 = NSNumber;
      [(HMDUserPresenceFeedRetryTimer *)v18 retryTimeInterval];
      v23 = objc_msgSend(v22, "numberWithDouble:");
      int v29 = 138543874;
      v30 = v20;
      __int16 v31 = 2112;
      v32 = v21;
      __int16 v33 = 2112;
      v34 = v23;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, "%{public}@Response time %@ is more than retry timer %@", (uint8_t *)&v29, 0x20u);
    }
    v24 = [(HMDUserPresenceFeedRetryTimer *)v18 retryTimer];
    [v8 timerDidFire:v24];
  }
  else
  {
    [(HMDUserPresenceFeedRetryTimer *)v11 retryTimeInterval];
    v26 = (void *)[objc_alloc(MEMORY[0x263F42658]) initWithTimeInterval:1 options:v25 - a5];
    [(HMDUserPresenceFeedRetryTimer *)v11 setRetryTimer:v26];

    v27 = [(HMDUserPresenceFeedRetryTimer *)v11 retryTimer];
    [v27 setDelegate:v8];

    v28 = [(HMDUserPresenceFeedRetryTimer *)v11 retryTimer];
    [v28 setDelegateQueue:v9];

    v24 = [(HMDUserPresenceFeedRetryTimer *)v11 retryTimer];
    [v24 resume];
  }
}

- (id)attributeDescriptions
{
  v11[2] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  double v4 = [(HMDUserPresenceFeedRetryTimer *)self timerID];
  v5 = (void *)[v3 initWithName:@"TID" value:v4];
  v11[0] = v5;
  id v6 = objc_alloc(MEMORY[0x263F424F8]);
  v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDUserPresenceFeedRetryTimer retryCount](self, "retryCount"));
  id v8 = (void *)[v6 initWithName:@"RC" value:v7];
  v11[1] = v8;
  id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:2];

  return v9;
}

- (HMDUserPresenceFeedRetryTimer)init
{
  v6.receiver = self;
  v6.super_class = (Class)HMDUserPresenceFeedRetryTimer;
  unint64_t v2 = [(HMDUserPresenceFeedRetryTimer *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F08C38] UUID];
    timerID = v2->_timerID;
    v2->_timerID = (NSUUID *)v3;
  }
  return v2;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t2_9196 != -1) {
    dispatch_once(&logCategory__hmf_once_t2_9196, &__block_literal_global_9197);
  }
  unint64_t v2 = (void *)logCategory__hmf_once_v3_9198;
  return v2;
}

void __44__HMDUserPresenceFeedRetryTimer_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v3_9198;
  logCategory__hmf_once_v3_9198 = v0;
}

@end