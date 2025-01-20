@interface HMDCameraRecordingSessionRetryContext
- (HMDCameraRecordingSessionRetryContext)initWithWorkQueue:(id)a3;
- (HMDCameraRecordingSessionRetryContext)initWithWorkQueue:(id)a3 preferences:(id)a4;
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
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (double)maxRetryInterval
{
  return self->_maxRetryInterval;
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

- (HMDCameraRecordingSessionRetryContext)initWithWorkQueue:(id)a3 preferences:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v24.receiver = self;
  v24.super_class = (Class)HMDCameraRecordingSessionRetryContext;
  v9 = [(HMDCameraRecordingSessionRetryContext *)&v24 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_workQueue, a3);
    v11 = [v8 preferenceForKey:@"recordingSessionInitialRetryInterval"];
    v12 = [v11 numberValue];
    [v12 doubleValue];
    v10->_double retryInterval = v13;

    v14 = [v8 preferenceForKey:@"recordingSessionMaxRetryInterval"];
    v15 = [v14 numberValue];
    [v15 doubleValue];
    v10->_double maxRetryInterval = v16;

    v17 = (void *)MEMORY[0x230FBD990]();
    v18 = v10;
    v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v20 = HMFGetLogIdentifier();
      double retryInterval = v10->_retryInterval;
      double maxRetryInterval = v10->_maxRetryInterval;
      *(_DWORD *)buf = 138543874;
      v26 = v20;
      __int16 v27 = 2048;
      double v28 = retryInterval;
      __int16 v29 = 2048;
      double v30 = maxRetryInterval;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, "%{public}@Recording session retry interval is: %f and max retry interval is: %f", buf, 0x20u);
    }
  }

  return v10;
}

- (HMDCameraRecordingSessionRetryContext)initWithWorkQueue:(id)a3
{
  double v4 = (void *)MEMORY[0x263F42608];
  id v5 = a3;
  double v6 = [v4 sharedPreferences];
  id v7 = [(HMDCameraRecordingSessionRetryContext *)self initWithWorkQueue:v5 preferences:v6];

  return v7;
}

@end