@interface HMDCameraIDSSessionHandler
+ (id)logCategory;
- (HMDCameraIDSSessionHandler)initWithSessionID:(id)a3 workQueue:(id)a4;
- (HMDCameraStreamSessionID)sessionID;
- (HMDIDSService)idsStreamService;
- (IDSSession)idsSession;
- (OS_dispatch_queue)workQueue;
- (id)logIdentifier;
- (void)dealloc;
- (void)setIdsSession:(id)a3;
@end

@implementation HMDCameraIDSSessionHandler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsSession, 0);
  objc_storeStrong((id *)&self->_idsStreamService, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

- (void)setIdsSession:(id)a3
{
}

- (IDSSession)idsSession
{
  return self->_idsSession;
}

- (HMDIDSService)idsStreamService
{
  return self->_idsStreamService;
}

- (HMDCameraStreamSessionID)sessionID
{
  return self->_sessionID;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (id)logIdentifier
{
  v2 = [(HMDCameraIDSSessionHandler *)self sessionID];
  v3 = [v2 description];

  return v3;
}

- (void)dealloc
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1D9452090](self, a2);
  v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v9 = v6;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Resetting the IDS session handler", buf, 0xCu);
  }
  [(IDSSession *)v4->_idsSession endSession];
  [(HMDIDSService *)v4->_idsStreamService removeDelegate:v4];
  v7.receiver = v4;
  v7.super_class = (Class)HMDCameraIDSSessionHandler;
  [(HMDCameraIDSSessionHandler *)&v7 dealloc];
}

- (HMDCameraIDSSessionHandler)initWithSessionID:(id)a3 workQueue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  v9 = v8;
  if (!v8)
  {
LABEL_7:
    v16 = (void *)_HMFPreconditionFailure();
    return (HMDCameraIDSSessionHandler *)+[HMDCameraIDSSessionHandler logCategory];
  }
  v18.receiver = self;
  v18.super_class = (Class)HMDCameraIDSSessionHandler;
  uint64_t v10 = [(HMDCameraIDSSessionHandler *)&v18 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_workQueue, a4);
    objc_storeStrong((id *)&v11->_sessionID, a3);
    v12 = +[HMDIDSServiceManager sharedManager];
    uint64_t v13 = [v12 streamService];
    idsStreamService = v11->_idsStreamService;
    v11->_idsStreamService = (HMDIDSService *)v13;

    [(HMDIDSService *)v11->_idsStreamService addDelegate:v11 queue:v11->_workQueue];
  }

  return v11;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_103882 != -1) {
    dispatch_once(&logCategory__hmf_once_t1_103882, &__block_literal_global_103883);
  }
  v2 = (void *)logCategory__hmf_once_v2_103884;
  return v2;
}

uint64_t __41__HMDCameraIDSSessionHandler_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v2_103884;
  logCategory__hmf_once_v2_103884 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end