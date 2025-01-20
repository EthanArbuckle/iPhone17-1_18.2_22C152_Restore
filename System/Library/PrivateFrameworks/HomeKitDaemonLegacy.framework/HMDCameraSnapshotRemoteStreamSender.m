@interface HMDCameraSnapshotRemoteStreamSender
+ (id)logCategory;
- (HMDCameraSnapshotIDSStreamInitiator)streamInitiator;
- (HMDCameraSnapshotLocal)snapshotLocal;
- (HMDCameraSnapshotRemoteStreamSender)initWithSessionID:(id)a3 workQueue:(id)a4 device:(id)a5 accessory:(id)a6 delegate:(id)a7 delegateQueue:(id)a8 uniqueIdentifier:(id)a9 snapshotRequestHandler:(id)a10;
- (HMDCameraSnapshotRemoteStreamSenderDelegate)delegate;
- (id)logIdentifier;
- (void)_callDidCompleteSendImageDelegate:(id)a3;
- (void)_callDidStartCaptureImageDelegate:(id)a3;
- (void)dealloc;
- (void)getSnapshot:(unint64_t)a3;
- (void)sendSnapshotAtPath:(id)a3;
- (void)snapShotTransferComplete;
- (void)snapshotLocal:(id)a3 didSaveSnapshotFile:(id)a4 error:(id)a5 sessionID:(id)a6;
- (void)streamInitiator:(id)a3 didFailToSendFileWithError:(id)a4;
@end

@implementation HMDCameraSnapshotRemoteStreamSender

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streamInitiator, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_snapshotLocal, 0);
}

- (HMDCameraSnapshotIDSStreamInitiator)streamInitiator
{
  return self->_streamInitiator;
}

- (HMDCameraSnapshotRemoteStreamSenderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDCameraSnapshotRemoteStreamSenderDelegate *)WeakRetained;
}

- (HMDCameraSnapshotLocal)snapshotLocal
{
  return self->_snapshotLocal;
}

- (void)streamInitiator:(id)a3 didFailToSendFileWithError:(id)a4
{
  id v5 = a4;
  [(HMDCameraSnapshotSender *)self _sendImageSendFailure:v5];
  [(HMDCameraSnapshotRemoteStreamSender *)self _callDidCompleteSendImageDelegate:v5];
}

- (void)snapshotLocal:(id)a3 didSaveSnapshotFile:(id)a4 error:(id)a5 sessionID:(id)a6
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = (void *)MEMORY[0x1D9452090]();
  v15 = self;
  v16 = HMFGetOSLogHandle();
  BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_INFO);
  if (v12)
  {
    if (v17)
    {
      v18 = HMFGetLogIdentifier();
      int v21 = 138543618;
      v22 = v18;
      __int16 v23 = 2112;
      id v24 = v12;
      _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_INFO, "%{public}@Snapshot local capture has ended in %@", (uint8_t *)&v21, 0x16u);
    }
    [(HMDCameraSnapshotSender *)v15 _sendImageSendFailure:v12];
    [(HMDCameraSnapshotRemoteStreamSender *)v15 _callDidCompleteSendImageDelegate:v12];
  }
  else
  {
    if (v17)
    {
      v19 = HMFGetLogIdentifier();
      int v21 = 138543618;
      v22 = v19;
      __int16 v23 = 2112;
      id v24 = v11;
      _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_INFO, "%{public}@Scheduling the transfer of file %@ through IDS", (uint8_t *)&v21, 0x16u);
    }
    v20 = [(HMDCameraSnapshotRemoteStreamSender *)v15 streamInitiator];
    [v20 sendFile:v11];
  }
}

- (void)_callDidCompleteSendImageDelegate:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1D9452090]();
  v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    v9 = [(HMDCameraSnapshotRemoteStreamSender *)v6 snapshotLocal];
    id v10 = [v9 sessionID];
    *(_DWORD *)buf = 138543874;
    v18 = v8;
    __int16 v19 = 2112;
    id v20 = v4;
    __int16 v21 = 2112;
    v22 = v10;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Calling delegate that transfer of image has completed with error %@ for session %@", buf, 0x20u);
  }
  id v11 = [(HMDCameraSnapshotRemoteStreamSender *)v6 delegate];
  if (objc_opt_respondsToSelector())
  {
    id v12 = [(HMDCameraSnapshotSender *)v6 delegateQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __73__HMDCameraSnapshotRemoteStreamSender__callDidCompleteSendImageDelegate___block_invoke;
    block[3] = &unk_1E6A19668;
    id v14 = v11;
    v15 = v6;
    id v16 = v4;
    dispatch_async(v12, block);
  }
}

void __73__HMDCameraSnapshotRemoteStreamSender__callDidCompleteSendImageDelegate___block_invoke(void *a1)
{
  v1 = (void *)a1[4];
  v2 = (void *)a1[5];
  uint64_t v3 = a1[6];
  id v5 = [v2 snapshotLocal];
  id v4 = [v5 sessionID];
  [v1 snapshotStreamSender:v2 didCompleteSendImage:v3 sessionID:v4];
}

- (void)_callDidStartCaptureImageDelegate:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1D9452090]();
  v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    v9 = [(HMDCameraSnapshotRemoteStreamSender *)v6 snapshotLocal];
    id v10 = [v9 sessionID];
    *(_DWORD *)buf = 138543874;
    v18 = v8;
    __int16 v19 = 2112;
    id v20 = v4;
    __int16 v21 = 2112;
    v22 = v10;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Calling delegate that capture of image has started with error %@ for session %@", buf, 0x20u);
  }
  id v11 = [(HMDCameraSnapshotRemoteStreamSender *)v6 delegate];
  if (objc_opt_respondsToSelector())
  {
    id v12 = [(HMDCameraSnapshotSender *)v6 delegateQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __73__HMDCameraSnapshotRemoteStreamSender__callDidStartCaptureImageDelegate___block_invoke;
    block[3] = &unk_1E6A19668;
    id v14 = v11;
    v15 = v6;
    id v16 = v4;
    dispatch_async(v12, block);
  }
}

void __73__HMDCameraSnapshotRemoteStreamSender__callDidStartCaptureImageDelegate___block_invoke(void *a1)
{
  v1 = (void *)a1[4];
  v2 = (void *)a1[5];
  uint64_t v3 = a1[6];
  id v5 = [v2 snapshotLocal];
  id v4 = [v5 sessionID];
  [v1 snapshotStreamSender:v2 didStartCaptureImage:v3 sessionID:v4];
}

- (void)snapShotTransferComplete
{
  uint64_t v3 = [(HMDCameraSnapshotSender *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__HMDCameraSnapshotRemoteStreamSender_snapShotTransferComplete__block_invoke;
  block[3] = &unk_1E6A19B30;
  void block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __63__HMDCameraSnapshotRemoteStreamSender_snapShotTransferComplete__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    int v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@Snapshot transfer to remote receiver is complete", (uint8_t *)&v7, 0xCu);
  }
  return [*(id *)(a1 + 32) _callDidCompleteSendImageDelegate:0];
}

- (void)sendSnapshotAtPath:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDCameraSnapshotSender *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__HMDCameraSnapshotRemoteStreamSender_sendSnapshotAtPath___block_invoke;
  v7[3] = &unk_1E6A197C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __58__HMDCameraSnapshotRemoteStreamSender_sendSnapshotAtPath___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    int v8 = 138543618;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@Sending the snapshot %@", (uint8_t *)&v8, 0x16u);
  }
  int v7 = [*(id *)(a1 + 32) streamInitiator];
  [v7 sendFile:*(void *)(a1 + 40)];
}

- (void)getSnapshot:(unint64_t)a3
{
  id v5 = [(HMDCameraSnapshotSender *)self workQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__HMDCameraSnapshotRemoteStreamSender_getSnapshot___block_invoke;
  v6[3] = &unk_1E6A189D0;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);
}

uint64_t __51__HMDCameraSnapshotRemoteStreamSender_getSnapshot___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    int v8 = 138543362;
    uint64_t v9 = v5;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@Getting the snapshot from local snapshot handler", (uint8_t *)&v8, 0xCu);
  }
  uint64_t v6 = [*(id *)(a1 + 32) snapshotLocal];
  [v6 getSnapshot:*(void *)(a1 + 40)];

  return [*(id *)(a1 + 32) _callDidStartCaptureImageDelegate:0];
}

- (id)logIdentifier
{
  v2 = [(HMDCameraSnapshotSender *)self sessionID];
  id v3 = [v2 description];

  return v3;
}

- (void)dealloc
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1D9452090](self, a2);
  id v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v9 = v6;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Resetting HMDCameraSnapshotRemoteStreamSender", buf, 0xCu);
  }
  v7.receiver = v4;
  v7.super_class = (Class)HMDCameraSnapshotRemoteStreamSender;
  [(HMDCameraSnapshotRemoteStreamSender *)&v7 dealloc];
}

- (HMDCameraSnapshotRemoteStreamSender)initWithSessionID:(id)a3 workQueue:(id)a4 device:(id)a5 accessory:(id)a6 delegate:(id)a7 delegateQueue:(id)a8 uniqueIdentifier:(id)a9 snapshotRequestHandler:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a10;
  v31.receiver = self;
  v31.super_class = (Class)HMDCameraSnapshotRemoteStreamSender;
  v22 = [(HMDCameraSnapshotSender *)&v31 initWithSessionID:v16 workQueue:v17 device:v18 accessory:v19 delegateQueue:a8 uniqueIdentifier:a9];
  uint64_t v23 = v22;
  if (v22)
  {
    objc_storeWeak((id *)&v22->_delegate, v20);
    id v24 = [[HMDCameraSnapshotLocal alloc] initWithSessionID:v16 workQueue:v17 accessory:v19 delegate:v23 delegateQueue:v17 snapshotRequestHandler:v21];
    snapshotLocal = v23->_snapshotLocal;
    v23->_snapshotLocal = v24;

    v26 = [HMDCameraSnapshotIDSStreamInitiator alloc];
    v27 = [v18 remoteDestinationString];
    uint64_t v28 = [(HMDCameraSnapshotIDSStreamInitiator *)v26 initWithSessionID:v16 workQueue:v17 destinationID:v27 delegate:v23 delegateQueue:v17];
    streamInitiator = v23->_streamInitiator;
    v23->_streamInitiator = (HMDCameraSnapshotIDSStreamInitiator *)v28;
  }
  return v23;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_11529 != -1) {
    dispatch_once(&logCategory__hmf_once_t1_11529, &__block_literal_global_11530);
  }
  v2 = (void *)logCategory__hmf_once_v2_11531;
  return v2;
}

uint64_t __50__HMDCameraSnapshotRemoteStreamSender_logCategory__block_invoke()
{
  logCategory__hmf_once_v2_11531 = HMFCreateOSLogHandle();
  return MEMORY[0x1F41817F8]();
}

@end