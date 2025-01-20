@interface HMDKeyTransferAgent
+ (id)logCategory;
- (HMDHomeManager)homeManager;
- (HMDKeyTransferAgent)initWithHomeManager:(id)a3;
- (HMFMessageDestination)messageDestination;
- (NSString)progressState;
- (NSUUID)uuid;
- (OS_dispatch_queue)workQueue;
- (unint64_t)residentProvisioningStatus;
- (void)beginPairingWithCompletionHandler:(id)a3;
- (void)resetConfig;
- (void)setHomeManager:(id)a3;
- (void)setProgressState:(id)a3;
- (void)setUuid:(id)a3;
- (void)setWorkQueue:(id)a3;
@end

@implementation HMDKeyTransferAgent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_destroyWeak((id *)&self->_homeManager);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_progressState, 0);
}

- (void)setUuid:(id)a3
{
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setHomeManager:(id)a3
{
}

- (HMDHomeManager)homeManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_homeManager);
  return (HMDHomeManager *)WeakRetained;
}

- (void)setWorkQueue:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (unint64_t)residentProvisioningStatus
{
  return self->_residentProvisioningStatus;
}

- (void)setProgressState:(id)a3
{
}

- (NSString)progressState
{
  return self->_progressState;
}

- (HMFMessageDestination)messageDestination
{
  id v3 = objc_alloc(MEMORY[0x1E4F65488]);
  v4 = [(HMDKeyTransferAgent *)self messageTargetUUID];
  v5 = (void *)[v3 initWithTarget:v4];

  return (HMFMessageDestination *)v5;
}

- (void)resetConfig
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1D9452090](self, a2);
  v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v6 = HMFGetLogIdentifier();
    int v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_ERROR, "%{public}@- (void)resetConfig is only useful on a Client", (uint8_t *)&v7, 0xCu);
  }
}

- (void)beginPairingWithCompletionHandler:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, void *))a3;
  v5 = (void *)MEMORY[0x1D9452090]();
  v6 = self;
  int v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v8 = HMFGetLogIdentifier();
    int v10 = 138543362;
    v11 = v8;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_ERROR, "%{public}@- (void)beginPairingWithCompletionHandler: may only be called on an Server.", (uint8_t *)&v10, 0xCu);
  }
  uint64_t v9 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F2D140] code:10 userInfo:0];
  v4[2](v4, v9);
}

- (HMDKeyTransferAgent)initWithHomeManager:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)HMDKeyTransferAgent;
  v5 = [(HMDKeyTransferAgent *)&v18 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_homeManager, v4);
    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"234BC343-7465-4AEE-AE7B-F2DC3F80C9FF"];
    uuid = v6->_uuid;
    v6->_uuid = (NSUUID *)v7;

    uint64_t v9 = [(NSUUID *)v6->_uuid UUIDString];
    int v10 = [@"com.apple.hmd.kta." stringByAppendingString:v9];

    id v11 = v10;
    uint64_t v12 = (const char *)[v11 UTF8String];
    v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v14 = dispatch_queue_create(v12, v13);
    workQueue = v6->_workQueue;
    v6->_workQueue = (OS_dispatch_queue *)v14;

    v6->_residentProvisioningStatus = 0;
    progressState = v6->_progressState;
    v6->_progressState = 0;
  }
  return v6;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t2_96013 != -1) {
    dispatch_once(&logCategory__hmf_once_t2_96013, &__block_literal_global_96014);
  }
  v2 = (void *)logCategory__hmf_once_v3_96015;
  return v2;
}

uint64_t __34__HMDKeyTransferAgent_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v3_96015;
  logCategory__hmf_once_v3_96015 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end