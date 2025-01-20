@interface HMDAccessoryDiagnosticsManagerInternal
+ (id)logCategory;
- (HMDAccessory)accessory;
- (HMDAccessoryDiagnosticsManagerInternal)initWithAccessory:(id)a3;
- (HMDAccessoryDiagnosticsSessionInternal)currentDiagnosticsSession;
- (HMFMessageDispatcher)msgDispatcher;
- (NSString)clientIdentifier;
- (NSUUID)messageTargetUUID;
- (OS_dispatch_queue)workQueue;
- (id)attributeDescriptions;
- (id)logIdentifier;
- (void)_handleDiagnosticsTransferRequest:(id)a3;
- (void)_registerForMessages;
- (void)handleDiagnosticsTransferWithOptions:(id)a3 message:(id)a4;
- (void)notifyClientsOfDiagnosticsTransferSupport:(BOOL)a3 supportDiagnosticsTransfer:(id)a4;
- (void)setCurrentDiagnosticsSession:(id)a3;
- (void)shutDown;
- (void)start;
@end

@implementation HMDAccessoryDiagnosticsManagerInternal

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentDiagnosticsSession, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_msgDispatcher, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_accessory);
}

- (void)setCurrentDiagnosticsSession:(id)a3
{
}

- (HMDAccessoryDiagnosticsSessionInternal)currentDiagnosticsSession
{
  return (HMDAccessoryDiagnosticsSessionInternal *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)clientIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (HMFMessageDispatcher)msgDispatcher
{
  return (HMFMessageDispatcher *)objc_getProperty(self, a2, 24, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (HMDAccessory)accessory
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessory);
  return (HMDAccessory *)WeakRetained;
}

- (id)logIdentifier
{
  v2 = [(HMDAccessoryDiagnosticsManagerInternal *)self accessory];
  v3 = [v2 logIdentifier];

  return v3;
}

- (id)attributeDescriptions
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v4 = [(HMDAccessoryDiagnosticsManagerInternal *)self accessory];
  v5 = [v4 uuid];
  v6 = (void *)[v3 initWithName:@"Accessory UUID" value:v5];
  v9[0] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];

  return v7;
}

- (void)handleDiagnosticsTransferWithOptions:(id)a3 message:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v9 = *MEMORY[0x1E4F1C3B8];
  v10 = NSString;
  v11 = NSStringFromSelector(a2);
  v12 = [v10 stringWithFormat:@"You must override %@ in a subclass", v11];
  id v13 = [v8 exceptionWithName:v9 reason:v12 userInfo:0];

  objc_exception_throw(v13);
}

- (void)shutDown
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = NSString;
  v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (void)start
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = NSString;
  v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (NSUUID)messageTargetUUID
{
  v2 = [(HMDAccessoryDiagnosticsManagerInternal *)self accessory];
  uint64_t v3 = [v2 uuid];

  return (NSUUID *)v3;
}

- (void)notifyClientsOfDiagnosticsTransferSupport:(BOOL)a3 supportDiagnosticsTransfer:(id)a4
{
  id v6 = a4;
  id v7 = [(HMDAccessoryDiagnosticsManagerInternal *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __111__HMDAccessoryDiagnosticsManagerInternal_notifyClientsOfDiagnosticsTransferSupport_supportDiagnosticsTransfer___block_invoke;
  block[3] = &unk_1E6A18708;
  BOOL v12 = a3;
  id v10 = v6;
  v11 = self;
  id v8 = v6;
  dispatch_async(v7, block);
}

void __111__HMDAccessoryDiagnosticsManagerInternal_notifyClientsOfDiagnosticsTransferSupport_supportDiagnosticsTransfer___block_invoke(uint64_t a1)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  uint64_t v10 = *MEMORY[0x1E4F2C338];
  v2 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 48)];
  v11[0] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  v4 = (void *)[v3 mutableCopy];

  if (*(void *)(a1 + 32))
  {
    v5 = encodeRootObject();
    [v4 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F2C768]];
  }
  id v6 = [MEMORY[0x1E4F65480] messageWithName:*MEMORY[0x1E4F2C340] messagePayload:v4];
  id v7 = [*(id *)(a1 + 40) msgDispatcher];
  id v8 = [*(id *)(a1 + 40) accessory];
  uint64_t v9 = [v8 uuid];
  [v7 sendMessage:v6 target:v9];
}

- (void)_handleDiagnosticsTransferRequest:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v25 = v8;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Received message to start diagnostics transfer", buf, 0xCu);
  }
  uint64_t v9 = [(HMDAccessoryDiagnosticsManagerInternal *)v6 accessory];
  char v10 = [v9 isReachable];

  if (v10)
  {
    v11 = [v4 messagePayload];
    BOOL v12 = [v11 objectForKeyedSubscript:@"kAccessoryDiagnosticsOptions"];

    if (v12)
    {
      id v23 = 0;
      id v13 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v12 error:&v23];
      id v14 = v23;
    }
    else
    {
      id v13 = 0;
      id v14 = 0;
    }
    v19 = (void *)MEMORY[0x1D9452090]();
    v20 = v6;
    v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v25 = v22;
      __int16 v26 = 2112;
      id v27 = v14;
      _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_INFO, "%{public}@Decoded diagnostics options with error %@", buf, 0x16u);
    }
    if (v14) {
      [v4 respondWithError:v14];
    }
    else {
      [(HMDAccessoryDiagnosticsManagerInternal *)v20 handleDiagnosticsTransferWithOptions:v13 message:v4];
    }
  }
  else
  {
    v15 = (void *)MEMORY[0x1D9452090]();
    v16 = v6;
    v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v25 = v18;
      __int16 v26 = 2112;
      id v27 = v4;
      _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_INFO, "%{public}@Diagnostics transfer request message: %@ when accessory is not reachable", buf, 0x16u);
    }
    id v14 = [MEMORY[0x1E4F28C58] hmErrorWithCode:4];
    [v4 respondWithError:v14];
  }
}

- (void)_registerForMessages
{
  v11[3] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(HMDAccessoryDiagnosticsManagerInternal *)self msgDispatcher];
  uint64_t v4 = *MEMORY[0x1E4F2C328];
  v5 = +[HMDXPCMessagePolicy policyWithEntitlements:32773];
  id v6 = +[HMDRemoteMessagePolicy defaultSecurePolicy];
  v11[1] = v6;
  id v7 = [(HMDAccessoryDiagnosticsManagerInternal *)self accessory];
  id v8 = [v7 home];
  uint64_t v9 = +[HMDUserMessagePolicy userMessagePolicyWithHome:v8 userPrivilege:4 remoteAccessRequired:0];
  void v11[2] = v9;
  char v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:3];
  [v3 registerForMessage:v4 receiver:self policies:v10 selector:sel__handleDiagnosticsTransferRequest_];
}

- (HMDAccessoryDiagnosticsManagerInternal)initWithAccessory:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HMDAccessoryDiagnosticsManagerInternal;
  v5 = [(HMDAccessoryDiagnosticsManagerInternal *)&v17 init];
  id v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_accessory, v4);
    uint64_t v7 = [v4 msgDispatcher];
    msgDispatcher = v6->_msgDispatcher;
    v6->_msgDispatcher = (HMFMessageDispatcher *)v7;

    uint64_t v9 = [v4 workQueue];
    workQueue = v6->_workQueue;
    v6->_workQueue = (OS_dispatch_queue *)v9;

    v11 = NSString;
    BOOL v12 = [MEMORY[0x1E4F29128] UUID];
    id v13 = [v12 UUIDString];
    uint64_t v14 = [v11 stringWithFormat:@"%@.HMDAccessoryDiagnosticsManager.%@", @"com.apple.HomeKitDaemon", v13];
    clientIdentifier = v6->_clientIdentifier;
    v6->_clientIdentifier = (NSString *)v14;

    [(HMDAccessoryDiagnosticsManagerInternal *)v6 _registerForMessages];
  }

  return v6;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t3_42799 != -1) {
    dispatch_once(&logCategory__hmf_once_t3_42799, &__block_literal_global_42800);
  }
  v2 = (void *)logCategory__hmf_once_v4_42801;
  return v2;
}

uint64_t __53__HMDAccessoryDiagnosticsManagerInternal_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v4_42801;
  logCategory__hmf_once_v4_42801 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end