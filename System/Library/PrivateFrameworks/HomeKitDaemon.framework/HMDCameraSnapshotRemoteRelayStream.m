@interface HMDCameraSnapshotRemoteRelayStream
+ (id)logCategory;
- (HMDCameraSnapshotRemoteRelayReceiver)relayReceiver;
- (HMDCameraSnapshotRemoteRelayStream)initWithSessionID:(id)a3 workQueue:(id)a4 sourceDevice:(id)a5 remoteDevice:(id)a6 accessory:(id)a7 delegate:(id)a8 delegateQueue:(id)a9 uniqueIdentifier:(id)a10 snapshotRequestHandler:(id)a11 residentMessageHandler:(id)a12;
- (HMDCameraSnapshotRemoteRelayStreamDelegate)delegate;
- (HMDCameraSnapshotRemoteStreamSender)streamSender;
- (OS_dispatch_queue)delegateQueue;
- (OS_dispatch_queue)workQueue;
- (id)logIdentifier;
- (void)_callDidCompleteSendImageDelegate:(id)a3;
- (void)_callDidStartCaptureImageDelegate:(id)a3;
- (void)_sendImageSendFailure:(id)a3;
- (void)dealloc;
- (void)getSnapshot:(unint64_t)a3;
- (void)snapShotSendFailed:(id)a3;
- (void)snapShotTransferComplete;
- (void)snapshotRelayReceiver:(id)a3 didSaveSnapshotFile:(id)a4 error:(id)a5 sessionID:(id)a6;
- (void)snapshotRelayReceiver:(id)a3 didStartGettingImage:(id)a4 sessionID:(id)a5;
- (void)snapshotStreamSender:(id)a3 didCompleteSendImage:(id)a4 sessionID:(id)a5;
- (void)snapshotStreamSender:(id)a3 didStartCaptureImage:(id)a4 sessionID:(id)a5;
@end

@implementation HMDCameraSnapshotRemoteRelayStream

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_relayReceiver, 0);
  objc_storeStrong((id *)&self->_streamSender, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (HMDCameraSnapshotRemoteRelayStreamDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDCameraSnapshotRemoteRelayStreamDelegate *)WeakRetained;
}

- (HMDCameraSnapshotRemoteRelayReceiver)relayReceiver
{
  return self->_relayReceiver;
}

- (HMDCameraSnapshotRemoteStreamSender)streamSender
{
  return self->_streamSender;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)snapshotStreamSender:(id)a3 didCompleteSendImage:(id)a4 sessionID:(id)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)MEMORY[0x230FBD990]();
  v12 = self;
  v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = HMFGetLogIdentifier();
    int v15 = 138543618;
    v16 = v14;
    __int16 v17 = 2112;
    id v18 = v9;
    _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Received delegate call back that the image transfer has completed with error %@", (uint8_t *)&v15, 0x16u);
  }
  [(HMDCameraSnapshotRemoteRelayStream *)v12 _callDidCompleteSendImageDelegate:v9];
}

- (void)snapshotStreamSender:(id)a3 didStartCaptureImage:(id)a4 sessionID:(id)a5
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)MEMORY[0x230FBD990]();
  v12 = self;
  v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = HMFGetLogIdentifier();
    int v15 = 138543362;
    v16 = v14;
    _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Received delegate call back that the image transfer to watch has begun", (uint8_t *)&v15, 0xCu);
  }
  if (v9)
  {
    [(HMDCameraSnapshotRemoteRelayStream *)v12 _sendImageSendFailure:v9];
    [(HMDCameraSnapshotRemoteRelayStream *)v12 _callDidCompleteSendImageDelegate:v9];
  }
}

- (void)snapshotRelayReceiver:(id)a3 didSaveSnapshotFile:(id)a4 error:(id)a5 sessionID:(id)a6
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = (void *)MEMORY[0x230FBD990]();
  int v15 = self;
  v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    uint64_t v17 = HMFGetLogIdentifier();
    int v19 = 138543874;
    v20 = v17;
    __int16 v21 = 2112;
    id v22 = v11;
    __int16 v23 = 2112;
    id v24 = v12;
    _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Received delegate call back that the image %@ has been saved after relay with error %@", (uint8_t *)&v19, 0x20u);
  }
  if (v12)
  {
    [(HMDCameraSnapshotRemoteRelayStream *)v15 _sendImageSendFailure:v12];
    [(HMDCameraSnapshotRemoteRelayStream *)v15 _callDidCompleteSendImageDelegate:v12];
  }
  else
  {
    id v18 = [(HMDCameraSnapshotRemoteRelayStream *)v15 streamSender];
    [v18 sendSnapshotAtPath:v11];
  }
}

- (void)snapshotRelayReceiver:(id)a3 didStartGettingImage:(id)a4 sessionID:(id)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)MEMORY[0x230FBD990]();
  id v12 = self;
  id v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = HMFGetLogIdentifier();
    int v15 = 138543618;
    v16 = v14;
    __int16 v17 = 2112;
    id v18 = v9;
    _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Received delegate call back for getting image with error %@", (uint8_t *)&v15, 0x16u);
  }
  [(HMDCameraSnapshotRemoteRelayStream *)v12 _callDidStartCaptureImageDelegate:v9];
}

- (void)_sendImageSendFailure:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HMDCameraSnapshotRemoteRelayStream *)self streamSender];
  v6 = [v5 device];
  v7 = [v6 remoteDestinationString];

  id v8 = (void *)MEMORY[0x230FBD990]();
  id v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v29 = v11;
    __int16 v30 = 2112;
    v31 = v7;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Sending image send failure to %@", buf, 0x16u);
  }
  id v12 = [(HMDCameraSnapshotRemoteRelayStream *)v9 streamSender];
  id v13 = [v12 accessory];
  v14 = [v13 home];
  int v15 = [v14 homeManager];

  v16 = [MEMORY[0x263EFF9A0] dictionary];
  __int16 v17 = [(HMDCameraSnapshotRemoteRelayStream *)v9 streamSender];
  id v18 = [v17 sessionID];
  uint64_t v19 = [v18 sessionID];
  [v16 setObject:v19 forKeyedSubscript:@"kCameraSessionID"];

  if (v4)
  {
    v20 = [MEMORY[0x263F08910] archivedDataWithRootObject:v4 requiringSecureCoding:1 error:0];
    [v16 setObject:v20 forKeyedSubscript:@"kCameraSessionError"];
  }
  __int16 v21 = [MEMORY[0x263F42590] internalMessageWithName:@"kTakeSnapshotSendFailedNotificationKey" messagePayload:v16];
  [v21 setQualityOfService:33];
  id v22 = (void *)[v21 copy];
  objc_initWeak((id *)buf, v9);
  __int16 v23 = [(HMDCameraSnapshotRemoteRelayStream *)v9 streamSender];
  id v24 = [v23 uniqueIdentifier];
  uint64_t v25 = [(HMDCameraSnapshotRemoteRelayStream *)v9 workQueue];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __60__HMDCameraSnapshotRemoteRelayStream__sendImageSendFailure___block_invoke;
  v26[3] = &unk_264A2D490;
  objc_copyWeak(&v27, (id *)buf);
  [v15 sendSecureMessage:v22 target:v24 userID:0 destination:v7 responseQueue:v25 responseHandler:v26];

  objc_destroyWeak(&v27);
  objc_destroyWeak((id *)buf);
}

void __60__HMDCameraSnapshotRemoteRelayStream__sendImageSendFailure___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  v7 = (void *)MEMORY[0x230FBD990]();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    int v11 = 138543362;
    id v12 = v10;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Received response for image send failure notification", (uint8_t *)&v11, 0xCu);
  }
}

- (void)_callDidCompleteSendImageDelegate:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    id v9 = [(HMDCameraSnapshotRemoteRelayStream *)v6 streamSender];
    id v10 = [v9 sessionID];
    *(_DWORD *)buf = 138543874;
    id v18 = v8;
    __int16 v19 = 2112;
    id v20 = v4;
    __int16 v21 = 2112;
    id v22 = v10;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Calling delegate that transfer of image has completed with error %@ for session %@", buf, 0x20u);
  }
  int v11 = [(HMDCameraSnapshotRemoteRelayStream *)v6 delegate];
  if (objc_opt_respondsToSelector())
  {
    id v12 = [(HMDCameraSnapshotRemoteRelayStream *)v6 delegateQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __72__HMDCameraSnapshotRemoteRelayStream__callDidCompleteSendImageDelegate___block_invoke;
    block[3] = &unk_264A2F2F8;
    id v14 = v11;
    int v15 = v6;
    id v16 = v4;
    dispatch_async(v12, block);
  }
}

void __72__HMDCameraSnapshotRemoteRelayStream__callDidCompleteSendImageDelegate___block_invoke(void *a1)
{
  v1 = (void *)a1[4];
  v2 = (void *)a1[5];
  uint64_t v3 = a1[6];
  id v5 = [v2 streamSender];
  id v4 = [v5 sessionID];
  [v1 snapshotRelayStream:v2 didCompleteSendImage:v3 sessionID:v4];
}

- (void)_callDidStartCaptureImageDelegate:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    id v9 = [(HMDCameraSnapshotRemoteRelayStream *)v6 relayReceiver];
    id v10 = [v9 sessionID];
    *(_DWORD *)buf = 138543874;
    id v18 = v8;
    __int16 v19 = 2112;
    id v20 = v4;
    __int16 v21 = 2112;
    id v22 = v10;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Calling delegate that capture of image has started with error %@ for session %@", buf, 0x20u);
  }
  int v11 = [(HMDCameraSnapshotRemoteRelayStream *)v6 delegate];
  if (objc_opt_respondsToSelector())
  {
    id v12 = [(HMDCameraSnapshotRemoteRelayStream *)v6 delegateQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __72__HMDCameraSnapshotRemoteRelayStream__callDidStartCaptureImageDelegate___block_invoke;
    block[3] = &unk_264A2F2F8;
    id v14 = v11;
    int v15 = v6;
    id v16 = v4;
    dispatch_async(v12, block);
  }
}

void __72__HMDCameraSnapshotRemoteRelayStream__callDidStartCaptureImageDelegate___block_invoke(void *a1)
{
  v1 = (void *)a1[4];
  v2 = (void *)a1[5];
  uint64_t v3 = a1[6];
  id v5 = [v2 relayReceiver];
  id v4 = [v5 sessionID];
  [v1 snapshotRelayStream:v2 didStartCaptureImage:v3 sessionID:v4];
}

- (void)snapShotSendFailed:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDCameraSnapshotRemoteRelayStream *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__HMDCameraSnapshotRemoteRelayStream_snapShotSendFailed___block_invoke;
  v7[3] = &unk_264A2F820;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __57__HMDCameraSnapshotRemoteRelayStream_snapShotSendFailed___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) relayReceiver];
  [v2 snapShotSendFailed:*(void *)(a1 + 40)];
}

- (void)snapShotTransferComplete
{
  uint64_t v3 = [(HMDCameraSnapshotRemoteRelayStream *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__HMDCameraSnapshotRemoteRelayStream_snapShotTransferComplete__block_invoke;
  block[3] = &unk_264A2F7F8;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __62__HMDCameraSnapshotRemoteRelayStream_snapShotTransferComplete__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    int v7 = 138543362;
    id v8 = v5;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Snapshot transfer to remote receiver is complete", (uint8_t *)&v7, 0xCu);
  }
  id v6 = [*(id *)(a1 + 32) streamSender];
  [v6 snapShotTransferComplete];
}

- (void)getSnapshot:(unint64_t)a3
{
  id v5 = [(HMDCameraSnapshotRemoteRelayStream *)self workQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __50__HMDCameraSnapshotRemoteRelayStream_getSnapshot___block_invoke;
  v6[3] = &unk_264A2C6A0;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);
}

void __50__HMDCameraSnapshotRemoteRelayStream_getSnapshot___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    int v7 = 138543362;
    id v8 = v5;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Getting the snapshot from local snapshot handler", (uint8_t *)&v7, 0xCu);
  }
  id v6 = [*(id *)(a1 + 32) relayReceiver];
  [v6 getSnapshot:*(void *)(a1 + 40)];
}

- (id)logIdentifier
{
  id v2 = [(HMDCameraSnapshotRemoteRelayStream *)self streamSender];
  id v3 = [v2 sessionID];
  id v4 = [v3 description];

  return v4;
}

- (void)dealloc
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x230FBD990](self, a2);
  id v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v9 = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Resetting HMDCameraSnapshotRemoteRelayStream", buf, 0xCu);
  }
  v7.receiver = v4;
  v7.super_class = (Class)HMDCameraSnapshotRemoteRelayStream;
  [(HMDCameraSnapshotRemoteRelayStream *)&v7 dealloc];
}

- (HMDCameraSnapshotRemoteRelayStream)initWithSessionID:(id)a3 workQueue:(id)a4 sourceDevice:(id)a5 remoteDevice:(id)a6 accessory:(id)a7 delegate:(id)a8 delegateQueue:(id)a9 uniqueIdentifier:(id)a10 snapshotRequestHandler:(id)a11 residentMessageHandler:(id)a12
{
  id v17 = a3;
  id obj = a4;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v37 = a8;
  id v38 = a9;
  id v22 = a10;
  id v23 = a11;
  id v24 = a12;
  if (!v17)
  {
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
  if (!v38)
  {
LABEL_18:
    _HMFPreconditionFailure();
    goto LABEL_19;
  }
  if (!v22)
  {
LABEL_19:
    _HMFPreconditionFailure();
    goto LABEL_20;
  }
  if (!v23)
  {
LABEL_20:
    _HMFPreconditionFailure();
    goto LABEL_21;
  }
  uint64_t v25 = v24;
  if (!v24)
  {
LABEL_21:
    v33 = (void *)_HMFPreconditionFailure();
    return (HMDCameraSnapshotRemoteRelayStream *)+[HMDCameraSnapshotRemoteRelayStream logCategory];
  }
  v39.receiver = self;
  v39.super_class = (Class)HMDCameraSnapshotRemoteRelayStream;
  v26 = [(HMDCameraSnapshotRemoteRelayStream *)&v39 init];
  id v27 = v26;
  if (v26)
  {
    objc_storeStrong((id *)&v26->_workQueue, obj);
    objc_storeWeak((id *)&v27->_delegate, v37);
    objc_storeStrong((id *)&v27->_delegateQueue, a9);
    v28 = [[HMDCameraSnapshotRemoteStreamSender alloc] initWithSessionID:v17 workQueue:v18 device:v19 accessory:v21 delegate:v27 delegateQueue:v18 uniqueIdentifier:v22 snapshotRequestHandler:v23];
    streamSender = v27->_streamSender;
    v27->_streamSender = v28;

    __int16 v30 = [[HMDCameraSnapshotRemoteRelayReceiver alloc] initWithSessionID:v17 workQueue:v18 accessory:v21 delegate:v27 delegateQueue:v18 uniqueIdentifier:v22 snapshotRequestHandler:v23 residentMessageHandler:v25 remoteDevice:v20];
    relayReceiver = v27->_relayReceiver;
    v27->_relayReceiver = v30;
  }
  return v27;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_106868 != -1) {
    dispatch_once(&logCategory__hmf_once_t1_106868, &__block_literal_global_106869);
  }
  id v2 = (void *)logCategory__hmf_once_v2_106870;
  return v2;
}

void __49__HMDCameraSnapshotRemoteRelayStream_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v2_106870;
  logCategory__hmf_once_v2_106870 = v0;
}

@end