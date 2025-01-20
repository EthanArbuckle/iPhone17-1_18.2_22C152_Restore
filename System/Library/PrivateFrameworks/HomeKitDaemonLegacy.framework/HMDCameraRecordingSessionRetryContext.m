@interface HMDCameraRecordingSessionRetryContext
- (HMDCameraRecordingSessionRetryContext)initWithWorkQueue:(id)a3 homePresenceByPairingIdentity:(id)a4;
- (HMDCameraRecordingSessionRetryContext)initWithWorkQueue:(id)a3 homePresenceByPairingIdentity:(id)a4 preferences:(id)a5;
- (NSDictionary)homePresenceByPairingIdentity;
- (OS_dispatch_queue)workQueue;
- (double)maxRetryInterval;
- (double)retryInterval;
- (int64_t)retryCount;
- (void)computeNextRetryInterval;
- (void)setRetryCount:(int64_t)a3;
- (void)setRetryInterval:(double)a3;
@end

@implementation HMDCameraRecordingSessionRetryContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_homePresenceByPairingIdentity, 0);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (double)maxRetryInterval
{
  return self->_maxRetryInterval;
}

- (NSDictionary)homePresenceByPairingIdentity
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setRetryCount:(int64_t)a3
{
  self->_retryCount = a3;
}

- (int64_t)retryCount
{
  return self->_retryCount;
}

- (void)computeNextRetryInterval
{
  v3 = [(HMDCameraRecordingSessionRetryContext *)self workQueue];
  dispatch_assert_queue_V2(v3);

  [(HMDCameraRecordingSessionRetryContext *)self setRetryCount:[(HMDCameraRecordingSessionRetryContext *)self retryCount] + 1];
  [(HMDCameraRecordingSessionRetryContext *)self retryInterval];
  double v5 = v4;
  [(HMDCameraRecordingSessionRetryContext *)self maxRetryInterval];
  if (v5 < v6)
  {
    [(HMDCameraRecordingSessionRetryContext *)self retryInterval];
    double v8 = v7 + v7;
    [(HMDCameraRecordingSessionRetryContext *)self setRetryInterval:v8];
  }
}

- (double)retryInterval
{
  v3 = [(HMDCameraRecordingSessionRetryContext *)self workQueue];
  dispatch_assert_queue_V2(v3);

  return self->_retryInterval;
}

- (void)setRetryInterval:(double)a3
{
  double v5 = [(HMDCameraRecordingSessionRetryContext *)self workQueue];
  dispatch_assert_queue_V2(v5);

  self->_retryInterval = a3;
}

- (HMDCameraRecordingSessionRetryContext)initWithWorkQueue:(id)a3 homePresenceByPairingIdentity:(id)a4 preferences:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v27.receiver = self;
  v27.super_class = (Class)HMDCameraRecordingSessionRetryContext;
  v12 = [(HMDCameraRecordingSessionRetryContext *)&v27 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_workQueue, a3);
    objc_storeStrong((id *)&v13->_homePresenceByPairingIdentity, a4);
    v14 = [v11 preferenceForKey:@"recordingSessionInitialRetryInterval"];
    v15 = [v14 numberValue];
    [v15 doubleValue];
    v13->_double retryInterval = v16;

    v17 = [v11 preferenceForKey:@"recordingSessionMaxRetryInterval"];
    v18 = [v17 numberValue];
    [v18 doubleValue];
    v13->_double maxRetryInterval = v19;

    v20 = (void *)MEMORY[0x1D9452090]();
    v21 = v13;
    v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v23 = HMFGetLogIdentifier();
      double retryInterval = v13->_retryInterval;
      double maxRetryInterval = v13->_maxRetryInterval;
      *(_DWORD *)buf = 138543874;
      v29 = v23;
      __int16 v30 = 2048;
      double v31 = retryInterval;
      __int16 v32 = 2048;
      double v33 = maxRetryInterval;
      _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_INFO, "%{public}@Recording session retry interval is: %f and max retry interval is: %f", buf, 0x20u);
    }
  }

  return v13;
}

- (HMDCameraRecordingSessionRetryContext)initWithWorkQueue:(id)a3 homePresenceByPairingIdentity:(id)a4
{
  double v6 = (void *)MEMORY[0x1E4F65530];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 sharedPreferences];
  id v10 = [(HMDCameraRecordingSessionRetryContext *)self initWithWorkQueue:v8 homePresenceByPairingIdentity:v7 preferences:v9];

  return v10;
}

@end