@interface HMDCameraStreamControlManager
+ (id)logCategory;
- (HMDCameraStreamControlManager)initWithSessionID:(id)a3 workQueue:(id)a4 streamSnapshotHandler:(id)a5 delegate:(id)a6 accessory:(id)a7 streamManagementService:(id)a8 isLocal:(BOOL)a9;
- (HMDCameraStreamControlManagerDelegate)delegate;
- (HMDCameraStreamMetrics)streamMetrics;
- (HMDCameraStreamSessionID)sessionID;
- (HMDCameraStreamSnapshotHandler)streamSnapshotHandler;
- (HMDHAPAccessory)accessory;
- (HMDService)streamManagementService;
- (OS_dispatch_queue)workQueue;
- (id)logIdentifier;
- (id)managerProtocol;
- (void)_callStreamFirstFrameReceived;
- (void)_callStreamNegotiated:(id)a3;
- (void)_callStreamReconfigured;
- (void)_callStreamRemoteConnectionSetup;
- (void)_callStreamStarted;
- (void)_callStreamStoppedWithError:(id)a3;
- (void)_cleanUpStreamSessionWithError:(id)a3;
- (void)_reportErrorCode:(int64_t)a3;
- (void)_reportInternalErrorCode:(int64_t)a3;
- (void)setAccessory:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation HMDCameraStreamControlManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streamMetrics, 0);
  objc_storeStrong((id *)&self->_streamSnapshotHandler, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_streamManagementService, 0);
  objc_destroyWeak((id *)&self->_accessory);
  objc_destroyWeak((id *)&self->_delegate);
}

- (HMDCameraStreamMetrics)streamMetrics
{
  return self->_streamMetrics;
}

- (HMDCameraStreamSnapshotHandler)streamSnapshotHandler
{
  return self->_streamSnapshotHandler;
}

- (HMDCameraStreamSessionID)sessionID
{
  return self->_sessionID;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (HMDService)streamManagementService
{
  return self->_streamManagementService;
}

- (void)setAccessory:(id)a3
{
}

- (HMDHAPAccessory)accessory
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessory);
  return (HMDHAPAccessory *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (HMDCameraStreamControlManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDCameraStreamControlManagerDelegate *)WeakRetained;
}

- (id)logIdentifier
{
  v2 = [(HMDCameraStreamControlManager *)self sessionID];
  v3 = [v2 description];

  return v3;
}

- (void)_callStreamStoppedWithError:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMDCameraStreamControlManager *)self sessionID];
  v6 = (void *)MEMORY[0x1D9452090]();
  v7 = self;
  v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = HMFGetLogIdentifier();
    int v12 = 138543874;
    v13 = v9;
    __int16 v14 = 2112;
    v15 = v5;
    __int16 v16 = 2112;
    id v17 = v4;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Stream with session ID %@ stopped with error %@", (uint8_t *)&v12, 0x20u);
  }
  v10 = [(HMDCameraStreamControlManager *)v7 managerProtocol];
  v11 = [(HMDCameraStreamControlManager *)v7 delegate];
  if (objc_opt_respondsToSelector()) {
    [v11 streamControlManager:v10 didStopStreamWithSessionID:v5 error:v4];
  }
  [(HMDCameraStreamControlManager *)v7 _cleanUpStreamSessionWithError:v4];
}

- (void)_callStreamReconfigured
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1D9452090](self, a2);
  id v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = HMFGetLogIdentifier();
    int v9 = 138543362;
    v10 = v6;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Stream reconfigured", (uint8_t *)&v9, 0xCu);
  }
  v7 = [(HMDCameraStreamControlManager *)v4 managerProtocol];
  v8 = [(HMDCameraStreamControlManager *)v4 delegate];
  if (objc_opt_respondsToSelector()) {
    [v8 streamControlManagerDidReconfigureStream:v7];
  }
}

- (void)_callStreamFirstFrameReceived
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1D9452090](self, a2);
  id v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = HMFGetLogIdentifier();
    int v9 = 138543362;
    v10 = v6;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@First frame received", (uint8_t *)&v9, 0xCu);
  }
  v7 = [(HMDCameraStreamControlManager *)v4 managerProtocol];
  v8 = [(HMDCameraStreamControlManager *)v4 delegate];
  if (objc_opt_respondsToSelector()) {
    [v8 streamControlManagerDidReceiveFirstFrame:v7];
  }
}

- (void)_callStreamStarted
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1D9452090](self, a2);
  id v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = HMFGetLogIdentifier();
    int v9 = 138543362;
    v10 = v6;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Stream started", (uint8_t *)&v9, 0xCu);
  }
  v7 = [(HMDCameraStreamControlManager *)v4 managerProtocol];
  v8 = [(HMDCameraStreamControlManager *)v4 delegate];
  if (objc_opt_respondsToSelector()) {
    [v8 streamControlManagerDidStartStream:v7];
  }
}

- (void)_callStreamRemoteConnectionSetup
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1D9452090](self, a2);
  id v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = HMFGetLogIdentifier();
    int v9 = 138543362;
    v10 = v6;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Stream remote connection setup", (uint8_t *)&v9, 0xCu);
  }
  v7 = [(HMDCameraStreamControlManager *)v4 managerProtocol];
  v8 = [(HMDCameraStreamControlManager *)v4 delegate];
  if (objc_opt_respondsToSelector()) {
    [v8 streamControlManagerDidSetUpRemoteConnection:v7];
  }
}

- (void)_callStreamNegotiated:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1D9452090]();
  v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    int v11 = 138543362;
    int v12 = v8;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Stream negotiated", (uint8_t *)&v11, 0xCu);
  }
  int v9 = [(HMDCameraStreamControlManager *)v6 managerProtocol];
  v10 = [(HMDCameraStreamControlManager *)v6 delegate];
  if (objc_opt_respondsToSelector()) {
    [v10 streamControlManager:v9 didNegotiateStreamWithSelectedParameters:v4];
  }
}

- (id)managerProtocol
{
  if ([(HMDCameraStreamControlManager *)self conformsToProtocol:&unk_1F2E16ED8]) {
    v3 = self;
  }
  else {
    v3 = 0;
  }
  return v3;
}

- (void)_reportInternalErrorCode:(int64_t)a3
{
  id v4 = [MEMORY[0x1E4F28C58] hmInternalErrorWithCode:a3];
  [(HMDCameraStreamControlManager *)self _cleanUpStreamSessionWithError:v4];
}

- (void)_reportErrorCode:(int64_t)a3
{
  id v4 = [MEMORY[0x1E4F28C58] hmErrorWithCode:a3];
  [(HMDCameraStreamControlManager *)self _cleanUpStreamSessionWithError:v4];
}

- (void)_cleanUpStreamSessionWithError:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  v7 = NSString;
  v8 = NSStringFromSelector(a2);
  int v9 = [v7 stringWithFormat:@"You must override %@ in a subclass", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (HMDCameraStreamControlManager)initWithSessionID:(id)a3 workQueue:(id)a4 streamSnapshotHandler:(id)a5 delegate:(id)a6 accessory:(id)a7 streamManagementService:(id)a8 isLocal:(BOOL)a9
{
  id v16 = a3;
  id obj = a4;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  if (!v16)
  {
    _HMFPreconditionFailure();
    goto LABEL_10;
  }
  if (!v17)
  {
LABEL_10:
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  if (!v18)
  {
LABEL_11:
    _HMFPreconditionFailure();
    goto LABEL_12;
  }
  if (!v20)
  {
LABEL_12:
    _HMFPreconditionFailure();
    goto LABEL_13;
  }
  v22 = v21;
  if (!v21)
  {
LABEL_13:
    v28 = (void *)_HMFPreconditionFailure();
    return (HMDCameraStreamControlManager *)+[HMDCameraStreamControlManager logCategory];
  }
  v31.receiver = self;
  v31.super_class = (Class)HMDCameraStreamControlManager;
  v23 = [(HMDCameraStreamControlManager *)&v31 init];
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_sessionID, a3);
    objc_storeStrong((id *)&v24->_streamSnapshotHandler, a5);
    objc_storeStrong((id *)&v24->_workQueue, obj);
    objc_storeWeak((id *)&v24->_delegate, v19);
    objc_storeWeak((id *)&v24->_accessory, v20);
    objc_storeStrong((id *)&v24->_streamManagementService, a8);
    v25 = [[HMDCameraStreamMetrics alloc] initWithSessionID:v16 cameraAccessory:v20 isLocal:a9];
    streamMetrics = v24->_streamMetrics;
    v24->_streamMetrics = v25;
  }
  return v24;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t6_142411 != -1) {
    dispatch_once(&logCategory__hmf_once_t6_142411, &__block_literal_global_142412);
  }
  v2 = (void *)logCategory__hmf_once_v7_142413;
  return v2;
}

uint64_t __44__HMDCameraStreamControlManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v7_142413;
  logCategory__hmf_once_v7_142413 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end