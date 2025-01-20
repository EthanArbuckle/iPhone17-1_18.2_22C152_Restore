@interface HMDCameraRecordingLoadBalancingAttempt
+ (id)logCategory;
- (HMDCameraRecordingLoadBalancingAttempt)initWithLocalResponseTimeout:(double)a3 logIdentifier:(id)a4;
- (HMDCameraRecordingLoadBalancingAttempt)initWithLocalResponseTimer:(id)a3 logIdentifier:(id)a4;
- (HMFTimer)localResponseTimer;
- (NSString)logIdentifier;
- (id)completion;
- (void)setCompletion:(id)a3;
- (void)startWithMessage:(id)a3 messageDispatcher:(id)a4 completion:(id)a5;
- (void)timerDidFire:(id)a3;
@end

@implementation HMDCameraRecordingLoadBalancingAttempt

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_localResponseTimer, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
}

- (void)setCompletion:(id)a3
{
}

- (id)completion
{
  return objc_getProperty(self, a2, 32, 1);
}

- (HMFTimer)localResponseTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)logIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)timerDidFire:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDCameraRecordingLoadBalancingAttempt *)self localResponseTimer];

  if (v5 == v4)
  {
    os_unfair_lock_lock_with_options();
    v6 = [(HMDCameraRecordingLoadBalancingAttempt *)self completion];
    [(HMDCameraRecordingLoadBalancingAttempt *)self setCompletion:0];
    os_unfair_lock_unlock(&self->_lock);
    if (v6)
    {
      v7 = (void *)MEMORY[0x1D9452090]();
      v8 = self;
      v9 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = HMFGetLogIdentifier();
        int v12 = 138543362;
        v13 = v10;
        _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_ERROR, "%{public}@Timed out waiting for load balancing message response", (uint8_t *)&v12, 0xCu);
      }
      v11 = [MEMORY[0x1E4F28C58] hmErrorWithCode:8 description:@"Timed out waiting for load balancing message response" reason:0 suggestion:0];
      ((void (**)(void, void *))v6)[2](v6, v11);
    }
  }
}

- (void)startWithMessage:(id)a3 messageDispatcher:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  if (!v9)
  {
LABEL_7:
    _HMFPreconditionFailure();
    goto LABEL_8;
  }
  v11 = v10;
  if (!v10)
  {
LABEL_8:
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  int v12 = [(HMDCameraRecordingLoadBalancingAttempt *)self completion];

  if (!v12)
  {
    [(HMDCameraRecordingLoadBalancingAttempt *)self setCompletion:v11];
    v13 = [(HMDCameraRecordingLoadBalancingAttempt *)self localResponseTimer];
    [v13 setDelegate:self];

    uint64_t v14 = [(HMDCameraRecordingLoadBalancingAttempt *)self localResponseTimer];
    [v14 resume];

    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __88__HMDCameraRecordingLoadBalancingAttempt_startWithMessage_messageDispatcher_completion___block_invoke;
    v18[3] = &unk_1E6A18C18;
    v18[4] = self;
    [v8 setResponseHandler:v18];
    [v9 sendMessage:v8];

    return;
  }
LABEL_9:
  uint64_t v15 = _HMFPreconditionFailure();
  __88__HMDCameraRecordingLoadBalancingAttempt_startWithMessage_messageDispatcher_completion___block_invoke(v15, v16, v17);
}

void __88__HMDCameraRecordingLoadBalancingAttempt_startWithMessage_messageDispatcher_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  v6 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 8);
  os_unfair_lock_lock_with_options();
  v7 = [*(id *)(a1 + 32) completion];
  [*(id *)(a1 + 32) setCompletion:0];
  os_unfair_lock_unlock(v6);
  if (v7) {
    ((void (**)(void, id))v7)[2](v7, v8);
  }
}

- (HMDCameraRecordingLoadBalancingAttempt)initWithLocalResponseTimer:(id)a3 logIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMDCameraRecordingLoadBalancingAttempt;
  id v9 = [(HMDCameraRecordingLoadBalancingAttempt *)&v14 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_localResponseTimer, a3);
    uint64_t v11 = [v8 copy];
    logIdentifier = v10->_logIdentifier;
    v10->_logIdentifier = (NSString *)v11;
  }
  return v10;
}

- (HMDCameraRecordingLoadBalancingAttempt)initWithLocalResponseTimeout:(double)a3 logIdentifier:(id)a4
{
  v6 = (objc_class *)MEMORY[0x1E4F65580];
  id v7 = a4;
  id v8 = (void *)[[v6 alloc] initWithTimeInterval:2 options:a3];
  id v9 = [(HMDCameraRecordingLoadBalancingAttempt *)self initWithLocalResponseTimer:v8 logIdentifier:v7];

  return v9;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_67884 != -1) {
    dispatch_once(&logCategory__hmf_once_t1_67884, &__block_literal_global_67885);
  }
  v2 = (void *)logCategory__hmf_once_v2_67886;
  return v2;
}

uint64_t __53__HMDCameraRecordingLoadBalancingAttempt_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v2_67886;
  logCategory__hmf_once_v2_67886 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end