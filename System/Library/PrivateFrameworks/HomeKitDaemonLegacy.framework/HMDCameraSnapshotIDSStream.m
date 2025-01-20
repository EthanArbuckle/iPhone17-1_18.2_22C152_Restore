@interface HMDCameraSnapshotIDSStream
+ (id)logCategory;
- (HMDCameraSnapshotIDSStream)initWithSessionID:(id)a3 workQueue:(id)a4 proxyService:(id)a5;
- (HMDCameraSnapshotSessionID)sessionID;
- (HMDIDSService)idsProxyService;
- (HMFOSTransaction)snapshotStreamTransaction;
- (OS_dispatch_queue)workQueue;
- (id)logIdentifier;
- (void)dealloc;
@end

@implementation HMDCameraSnapshotIDSStream

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotStreamTransaction, 0);
  objc_storeStrong((id *)&self->_idsProxyService, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

- (HMFOSTransaction)snapshotStreamTransaction
{
  return (HMFOSTransaction *)objc_getProperty(self, a2, 32, 1);
}

- (HMDIDSService)idsProxyService
{
  return (HMDIDSService *)objc_getProperty(self, a2, 24, 1);
}

- (HMDCameraSnapshotSessionID)sessionID
{
  return (HMDCameraSnapshotSessionID *)objc_getProperty(self, a2, 16, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (id)logIdentifier
{
  v2 = [(HMDCameraSnapshotIDSStream *)self sessionID];
  v3 = [v2 description];

  return v3;
}

- (void)dealloc
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1D9452090](self, a2);
  v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v10 = v6;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Resetting the HMDCameraSnapshotIDSStream", buf, 0xCu);
  }
  v7 = [(HMDCameraSnapshotIDSStream *)v4 idsProxyService];
  [v7 removeDelegate:v4];

  v8.receiver = v4;
  v8.super_class = (Class)HMDCameraSnapshotIDSStream;
  [(HMDCameraSnapshotIDSStream *)&v8 dealloc];
}

- (HMDCameraSnapshotIDSStream)initWithSessionID:(id)a3 workQueue:(id)a4 proxyService:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    _HMFPreconditionFailure();
    goto LABEL_8;
  }
  if (!v10)
  {
LABEL_8:
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  v12 = v11;
  if (!v11)
  {
LABEL_9:
    v21 = (void *)_HMFPreconditionFailure();
    return (HMDCameraSnapshotIDSStream *)+[HMDCameraSnapshotIDSStream logCategory];
  }
  v23.receiver = self;
  v23.super_class = (Class)HMDCameraSnapshotIDSStream;
  v13 = [(HMDCameraSnapshotIDSStream *)&v23 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_workQueue, a4);
    objc_storeStrong((id *)&v14->_sessionID, a3);
    objc_storeStrong((id *)&v14->_idsProxyService, a5);
    uint64_t v15 = [objc_alloc(MEMORY[0x1E4F654E0]) initWithName:@"com.apple.homed.snapshot-stream"];
    snapshotStreamTransaction = v14->_snapshotStreamTransaction;
    v14->_snapshotStreamTransaction = (HMFOSTransaction *)v15;

    idsProxyService = v14->_idsProxyService;
    v18 = [(HMDCameraSnapshotIDSStream *)v14 workQueue];
    [(HMDIDSService *)idsProxyService addDelegate:v14 queue:v18];

    v19 = +[HMDIDSServiceManager sharedManager];
    [v19 addProxyServiceLinkPreferencesAssertionHolder:v14];
  }
  return v14;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_87525 != -1) {
    dispatch_once(&logCategory__hmf_once_t1_87525, &__block_literal_global_87526);
  }
  v2 = (void *)logCategory__hmf_once_v2_87527;
  return v2;
}

uint64_t __41__HMDCameraSnapshotIDSStream_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v2_87527;
  logCategory__hmf_once_v2_87527 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end