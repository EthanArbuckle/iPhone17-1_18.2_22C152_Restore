@interface HMDCameraSnapshotIDSRelay
+ (id)logCategory;
- (HMDCameraSnapshotIDSRelay)initWithSessionID:(id)a3 logIdentifier:(id)a4 workQueue:(id)a5;
- (HMDIDSService)idsStreamService;
- (HMFOSTransaction)snapshotRelayTransaction;
- (NSString)logIdentifier;
- (NSUUID)sessionID;
- (OS_dispatch_queue)workQueue;
- (void)dealloc;
@end

@implementation HMDCameraSnapshotIDSRelay

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_storeStrong((id *)&self->_snapshotRelayTransaction, 0);
  objc_storeStrong((id *)&self->_idsStreamService, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

- (NSString)logIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (HMFOSTransaction)snapshotRelayTransaction
{
  return (HMFOSTransaction *)objc_getProperty(self, a2, 32, 1);
}

- (HMDIDSService)idsStreamService
{
  return (HMDIDSService *)objc_getProperty(self, a2, 24, 1);
}

- (NSUUID)sessionID
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (void)dealloc
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x230FBD990](self, a2);
  v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v10 = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Resetting the SnapshotIDSRelay", buf, 0xCu);
  }
  v7 = [(HMDCameraSnapshotIDSRelay *)v4 idsStreamService];
  [v7 removeDelegate:v4];

  v8.receiver = v4;
  v8.super_class = (Class)HMDCameraSnapshotIDSRelay;
  [(HMDCameraSnapshotIDSRelay *)&v8 dealloc];
}

- (HMDCameraSnapshotIDSRelay)initWithSessionID:(id)a3 logIdentifier:(id)a4 workQueue:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)HMDCameraSnapshotIDSRelay;
  v12 = [(HMDCameraSnapshotIDSRelay *)&v22 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_workQueue, a5);
    objc_storeStrong((id *)&v13->_sessionID, a3);
    objc_storeStrong((id *)&v13->_logIdentifier, a4);
    v14 = +[HMDIDSServiceManager sharedManager];
    uint64_t v15 = [v14 streamService];
    idsStreamService = v13->_idsStreamService;
    v13->_idsStreamService = (HMDIDSService *)v15;

    uint64_t v17 = [objc_alloc(MEMORY[0x263F425C0]) initWithName:@"com.apple.homed.snapshot-relay"];
    snapshotRelayTransaction = v13->_snapshotRelayTransaction;
    v13->_snapshotRelayTransaction = (HMFOSTransaction *)v17;

    v19 = v13->_idsStreamService;
    v20 = [(HMDCameraSnapshotIDSRelay *)v13 workQueue];
    [(HMDIDSService *)v19 addDelegate:v13 queue:v20];
  }
  return v13;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_163166 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_163166, &__block_literal_global_163167);
  }
  v2 = (void *)logCategory__hmf_once_v1_163168;
  return v2;
}

void __40__HMDCameraSnapshotIDSRelay_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v1_163168;
  logCategory__hmf_once_v1_163168 = v0;
}

@end