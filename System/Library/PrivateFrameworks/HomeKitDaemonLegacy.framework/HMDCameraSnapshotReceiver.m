@interface HMDCameraSnapshotReceiver
+ (id)logCategory;
- (HMDAccessory)accessory;
- (HMDCameraResidentMessageHandler)residentMessageHandler;
- (HMDCameraSnapshotReceiver)initWithSessionID:(id)a3 workQueue:(id)a4 accessory:(id)a5 delegateQueue:(id)a6 uniqueIdentifier:(id)a7 snapshotRequestHandler:(id)a8 residentMessageHandler:(id)a9 remoteDevice:(id)a10;
- (HMDCameraSnapshotSessionID)sessionID;
- (HMDDevice)remoteDevice;
- (HMDSnapshotFile)snapshotFile;
- (HMDSnapshotRequestHandler)snapshotRequestHandler;
- (NSUUID)uniqueIdentifier;
- (OS_dispatch_queue)delegateQueue;
- (OS_dispatch_queue)workQueue;
- (id)logIdentifier;
- (void)_sendConfirmationToResident:(id)a3;
- (void)_sendMessageWithName:(id)a3 payload:(id)a4 responseHandler:(id)a5;
- (void)_sendRequestWithTierType:(unint64_t)a3 toResident:(id)a4;
- (void)setAccessory:(id)a3;
- (void)setSnapshotFile:(id)a3;
@end

@implementation HMDCameraSnapshotReceiver

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteDevice, 0);
  objc_storeStrong((id *)&self->_residentMessageHandler, 0);
  objc_storeStrong((id *)&self->_snapshotRequestHandler, 0);
  objc_storeStrong((id *)&self->_snapshotFile, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_accessory);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

- (HMDDevice)remoteDevice
{
  return self->_remoteDevice;
}

- (HMDCameraResidentMessageHandler)residentMessageHandler
{
  return self->_residentMessageHandler;
}

- (HMDSnapshotRequestHandler)snapshotRequestHandler
{
  return self->_snapshotRequestHandler;
}

- (void)setSnapshotFile:(id)a3
{
}

- (HMDSnapshotFile)snapshotFile
{
  return self->_snapshotFile;
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setAccessory:(id)a3
{
}

- (HMDAccessory)accessory
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessory);
  return (HMDAccessory *)WeakRetained;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (HMDCameraSnapshotSessionID)sessionID
{
  return self->_sessionID;
}

- (NSUUID)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (id)logIdentifier
{
  v2 = [(HMDCameraSnapshotReceiver *)self sessionID];
  v3 = [v2 description];

  return v3;
}

- (void)_sendMessageWithName:(id)a3 payload:(id)a4 responseHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v15 = [(HMDCameraSnapshotReceiver *)self residentMessageHandler];
  v11 = [(HMDCameraSnapshotReceiver *)self sessionID];
  v12 = [(HMDCameraSnapshotReceiver *)self uniqueIdentifier];
  v13 = [(HMDCameraSnapshotReceiver *)self remoteDevice];
  v14 = [(HMDCameraSnapshotReceiver *)self workQueue];
  [v15 sendMessageWithName:v10 cameraSessionID:v11 payload:v9 target:v12 device:v13 responseQueue:v14 responseHandler:v8];
}

- (void)_sendConfirmationToResident:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1D9452090]();
  v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    id v9 = [(HMDCameraSnapshotReceiver *)v6 sessionID];
    *(_DWORD *)buf = 138543618;
    v16 = v8;
    __int16 v17 = 2112;
    v18 = v9;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Informing the resident that image download task is completed for session ID %@", buf, 0x16u);
  }
  id v10 = [(HMDCameraSnapshotReceiver *)v6 sessionID];
  v11 = [v10 sessionID];
  v14 = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v14 forKeys:&v13 count:1];

  [(HMDCameraSnapshotReceiver *)v6 _sendMessageWithName:@"kTakeSnapshotRemoteReceivedKey" payload:v12 responseHandler:v4];
}

- (void)_sendRequestWithTierType:(unint64_t)a3 toResident:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = (void *)MEMORY[0x1D9452090]();
  id v8 = self;
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    v11 = [(HMDCameraSnapshotReceiver *)v8 sessionID];
    int v24 = 138543618;
    v25 = v10;
    __int16 v26 = 2112;
    v27 = v11;
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Relaying request to resident to take image snapshot with session ID %@", (uint8_t *)&v24, 0x16u);
  }
  v12 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v13 = [(HMDCameraSnapshotReceiver *)v8 sessionID];
  v14 = [v13 sessionID];
  [v12 setObject:v14 forKeyedSubscript:@"kCameraSessionID"];

  id v15 = [(HMDCameraSnapshotReceiver *)v8 sessionID];
  v16 = [v15 hostProcessBundleIdentifier];
  [v12 setObject:v16 forKeyedSubscript:@"kCameraSessionApplicationID"];

  __int16 v17 = [NSNumber numberWithUnsignedInteger:a3];
  [v12 setObject:v17 forKeyedSubscript:@"kCameraStreamingTierType"];

  v18 = [(HMDCameraSnapshotReceiver *)v8 sessionID];
  uint64_t v19 = [v18 snapshotCharacteristicEventUUID];
  [v12 setObject:v19 forKeyedSubscript:@"kCameraProactiveSessionID"];

  v20 = [HMDSnapshotFile alloc];
  v21 = [(HMDCameraSnapshotReceiver *)v8 snapshotRequestHandler];
  v22 = [v21 imageCacheDirectory];
  v23 = [(HMDSnapshotFile *)v20 initWithImageDirectory:v22];
  [(HMDCameraSnapshotReceiver *)v8 setSnapshotFile:v23];

  [(HMDCameraSnapshotReceiver *)v8 _sendMessageWithName:@"kTakeSnapshotRemoteRequestKey" payload:v12 responseHandler:v6];
}

- (HMDCameraSnapshotReceiver)initWithSessionID:(id)a3 workQueue:(id)a4 accessory:(id)a5 delegateQueue:(id)a6 uniqueIdentifier:(id)a7 snapshotRequestHandler:(id)a8 residentMessageHandler:(id)a9 remoteDevice:(id)a10
{
  id v16 = a3;
  id obj = a4;
  id v17 = a4;
  id v18 = a5;
  id v33 = a6;
  id v19 = a6;
  id v34 = a7;
  id v20 = a7;
  id v35 = a8;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  if (!v16)
  {
    _HMFPreconditionFailure();
    goto LABEL_13;
  }
  if (!v17)
  {
LABEL_13:
    _HMFPreconditionFailure();
    goto LABEL_14;
  }
  if (!v18)
  {
LABEL_14:
    _HMFPreconditionFailure();
    goto LABEL_15;
  }
  if (!v19)
  {
LABEL_15:
    _HMFPreconditionFailure();
    goto LABEL_16;
  }
  if (!v20)
  {
LABEL_16:
    _HMFPreconditionFailure();
    goto LABEL_17;
  }
  if (!v21)
  {
LABEL_17:
    _HMFPreconditionFailure();
    goto LABEL_18;
  }
  if (!v22)
  {
LABEL_18:
    _HMFPreconditionFailure();
    goto LABEL_19;
  }
  int v24 = v23;
  if (!v23)
  {
LABEL_19:
    v30 = (void *)_HMFPreconditionFailure();
    return (HMDCameraSnapshotReceiver *)+[HMDCameraSnapshotReceiver logCategory];
  }
  v25 = v18;
  __int16 v26 = v22;
  v37.receiver = self;
  v37.super_class = (Class)HMDCameraSnapshotReceiver;
  v27 = [(HMDCameraSnapshotReceiver *)&v37 init];
  uint64_t v28 = v27;
  if (v27)
  {
    objc_storeStrong((id *)&v27->_sessionID, a3);
    objc_storeWeak((id *)&v28->_accessory, v25);
    objc_storeStrong((id *)&v28->_workQueue, obj);
    objc_storeStrong((id *)&v28->_delegateQueue, v33);
    objc_storeStrong((id *)&v28->_uniqueIdentifier, v34);
    objc_storeStrong((id *)&v28->_snapshotRequestHandler, v35);
    objc_storeStrong((id *)&v28->_residentMessageHandler, a9);
    objc_storeStrong((id *)&v28->_remoteDevice, a10);
  }

  return v28;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t2_120835 != -1) {
    dispatch_once(&logCategory__hmf_once_t2_120835, &__block_literal_global_120836);
  }
  v2 = (void *)logCategory__hmf_once_v3_120837;
  return v2;
}

uint64_t __40__HMDCameraSnapshotReceiver_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v3_120837;
  logCategory__hmf_once_v3_120837 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end