@interface HMMigrationBoost
- (HMFMessageDispatcher)messageDispatcher;
- (HMMigrationBoost)initWithMessageTarget:(id)a3 notificationCenter:(id)a4 messageDispatcher:(id)a5 queue:(id)a6;
- (NSNotificationCenter)notificationCenter;
- (NSUUID)messageTarget;
- (OS_dispatch_queue)queue;
- (void)_handleDaemonDisconnect:(id)a3;
- (void)startBoost;
- (void)stopBoost;
@end

@implementation HMMigrationBoost

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);

  objc_storeStrong((id *)&self->_messageTarget, 0);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (HMFMessageDispatcher)messageDispatcher
{
  return self->_messageDispatcher;
}

- (NSNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (NSUUID)messageTarget
{
  return self->_messageTarget;
}

- (void)_handleDaemonDisconnect:(id)a3
{
  v4 = [(HMMigrationBoost *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__HMMigrationBoost__handleDaemonDisconnect___block_invoke;
  block[3] = &unk_1E59452E8;
  block[4] = self;
  dispatch_async(v4, block);
}

void __44__HMMigrationBoost__handleDaemonDisconnect___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v14 = v5;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@Sending boost message after daemon disconnect", buf, 0xCu);
  }
  v6 = (void *)MEMORY[0x1E4F654B0];
  id v7 = objc_alloc(MEMORY[0x1E4F65488]);
  v8 = [*(id *)(a1 + 32) messageTarget];
  v9 = (void *)[v7 initWithTarget:v8];
  v10 = [v6 messageWithName:@"HMHM.upgradeToHH2Boost" destination:v9 payload:0];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __44__HMMigrationBoost__handleDaemonDisconnect___block_invoke_4;
  v12[3] = &unk_1E5943FA0;
  v12[4] = *(void *)(a1 + 32);
  [v10 setResponseHandler:v12];
  v11 = [*(id *)(a1 + 32) messageDispatcher];
  [v11 sendMessage:v10 completionHandler:0];
}

void __44__HMMigrationBoost__handleDaemonDisconnect___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x19F3A64A0]();
  id v8 = *(id *)(a1 + 32);
  v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = HMFGetLogIdentifier();
    int v11 = 138543874;
    v12 = v10;
    __int16 v13 = 2112;
    id v14 = v6;
    __int16 v15 = 2112;
    id v16 = v5;
    _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_INFO, "%{public}@Received response to boost message: %@, error: %@", (uint8_t *)&v11, 0x20u);
  }
  [*(id *)(a1 + 32) stopBoost];
}

- (void)stopBoost
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x19F3A64A0](self, a2);
  v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    int v8 = 138543362;
    v9 = v6;
    _os_log_impl(&dword_19D1A8000, v5, OS_LOG_TYPE_INFO, "%{public}@No longer waiting for daemon disconnect to trigger a boost", (uint8_t *)&v8, 0xCu);
  }
  id v7 = [(HMMigrationBoost *)v4 notificationCenter];
  [v7 removeObserver:v4];
}

- (void)startBoost
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x19F3A64A0](self, a2);
  v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    int v8 = 138543362;
    v9 = v6;
    _os_log_impl(&dword_19D1A8000, v5, OS_LOG_TYPE_INFO, "%{public}@Waiting for daemon disconnect to trigger a boost", (uint8_t *)&v8, 0xCu);
  }
  id v7 = [(HMMigrationBoost *)v4 notificationCenter];
  [v7 addObserver:v4 selector:sel__handleDaemonDisconnect_ name:@"kHomeKitDaemonInterruptedNotification" object:0];
}

- (HMMigrationBoost)initWithMessageTarget:(id)a3 notificationCenter:(id)a4 messageDispatcher:(id)a5 queue:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)HMMigrationBoost;
  __int16 v15 = [(HMMigrationBoost *)&v18 init];
  id v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_messageTarget, a3);
    objc_storeStrong((id *)&v16->_notificationCenter, a4);
    objc_storeStrong((id *)&v16->_messageDispatcher, a5);
    objc_storeStrong((id *)&v16->_queue, a6);
  }

  return v16;
}

@end