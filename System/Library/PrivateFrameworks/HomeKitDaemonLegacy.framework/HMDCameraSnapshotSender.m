@interface HMDCameraSnapshotSender
+ (id)logCategory;
- (HMDAccessory)accessory;
- (HMDCameraSnapshotSender)initWithSessionID:(id)a3 workQueue:(id)a4 device:(id)a5 accessory:(id)a6 delegateQueue:(id)a7 uniqueIdentifier:(id)a8;
- (HMDCameraSnapshotSessionID)sessionID;
- (HMDDevice)device;
- (NSUUID)uniqueIdentifier;
- (OS_dispatch_queue)delegateQueue;
- (OS_dispatch_queue)workQueue;
- (id)logIdentifier;
- (void)_sendImageSendFailure:(id)a3;
@end

@implementation HMDCameraSnapshotSender

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_destroyWeak((id *)&self->_accessory);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (HMDCameraSnapshotSessionID)sessionID
{
  return self->_sessionID;
}

- (HMDAccessory)accessory
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessory);
  return (HMDAccessory *)WeakRetained;
}

- (HMDDevice)device
{
  return self->_device;
}

- (NSUUID)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)_sendImageSendFailure:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMDCameraSnapshotSender *)self device];
  v6 = [v5 remoteDestinationString];

  v7 = (void *)MEMORY[0x1D9452090]();
  v8 = self;
  v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v25 = v10;
    __int16 v26 = 2112;
    v27 = v6;
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Sending image send failure to %@", buf, 0x16u);
  }
  v11 = [(HMDCameraSnapshotSender *)v8 accessory];
  v12 = [v11 home];
  v13 = [v12 homeManager];

  v14 = [MEMORY[0x1E4F1CA60] dictionary];
  v15 = [(HMDCameraSnapshotSender *)v8 sessionID];
  v16 = [v15 sessionID];
  [v14 setObject:v16 forKeyedSubscript:@"kCameraSessionID"];

  if (v4)
  {
    v17 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v4 requiringSecureCoding:1 error:0];
    [v14 setObject:v17 forKeyedSubscript:@"kCameraSessionError"];
  }
  v18 = [MEMORY[0x1E4F654B0] internalMessageWithName:@"kTakeSnapshotSendFailedNotificationKey" messagePayload:v14];
  [v18 setQualityOfService:33];
  v19 = (void *)[v18 copy];
  objc_initWeak((id *)buf, v8);
  v20 = [(HMDCameraSnapshotSender *)v8 uniqueIdentifier];
  v21 = [(HMDCameraSnapshotSender *)v8 workQueue];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __49__HMDCameraSnapshotSender__sendImageSendFailure___block_invoke;
  v22[3] = &unk_1E6A17A08;
  objc_copyWeak(&v23, (id *)buf);
  [v13 sendSecureMessage:v19 target:v20 userID:0 destination:v6 responseQueue:v21 responseHandler:v22];

  objc_destroyWeak(&v23);
  objc_destroyWeak((id *)buf);
}

void __49__HMDCameraSnapshotSender__sendImageSendFailure___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = (void *)MEMORY[0x1D9452090]();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = HMFGetLogIdentifier();
    int v11 = 138543362;
    v12 = v10;
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Received response for image send failure notification", (uint8_t *)&v11, 0xCu);
  }
}

- (id)logIdentifier
{
  v2 = [(HMDCameraSnapshotSender *)self sessionID];
  v3 = [v2 description];

  return v3;
}

- (HMDCameraSnapshotSender)initWithSessionID:(id)a3 workQueue:(id)a4 device:(id)a5 accessory:(id)a6 delegateQueue:(id)a7 uniqueIdentifier:(id)a8
{
  id v15 = a3;
  id v24 = a4;
  id v23 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v25.receiver = self;
  v25.super_class = (Class)HMDCameraSnapshotSender;
  v19 = [(HMDCameraSnapshotSender *)&v25 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_sessionID, a3);
    objc_storeStrong((id *)&v20->_device, a5);
    objc_storeWeak((id *)&v20->_accessory, v16);
    objc_storeStrong((id *)&v20->_workQueue, a4);
    objc_storeStrong((id *)&v20->_delegateQueue, a7);
    objc_storeStrong((id *)&v20->_uniqueIdentifier, a8);
    v21 = +[HMDCameraPowerAssertionHandler sharedHandler];
    [v21 registerRemoteRequestHandler:v20 forSessionID:v15];
  }
  return v20;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_53753 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_53753, &__block_literal_global_53754);
  }
  v2 = (void *)logCategory__hmf_once_v1_53755;
  return v2;
}

uint64_t __38__HMDCameraSnapshotSender_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v1_53755;
  logCategory__hmf_once_v1_53755 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end