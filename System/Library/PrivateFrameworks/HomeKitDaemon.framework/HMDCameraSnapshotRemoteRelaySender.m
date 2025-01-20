@interface HMDCameraSnapshotRemoteRelaySender
+ (id)logCategory;
- (HMDCameraSnapshotIDSRelayInitiator)relayInitiator;
- (HMDCameraSnapshotLocal)snapshotLocal;
- (HMDCameraSnapshotRemoteRelaySender)initWithSessionID:(id)a3 workQueue:(id)a4 device:(id)a5 accessory:(id)a6 delegate:(id)a7 delegateQueue:(id)a8 uniqueIdentifier:(id)a9 snapshotRequestHandler:(id)a10;
- (HMDCameraSnapshotRemoteRelaySenderDelegate)delegate;
- (id)logIdentifier;
- (void)_callDidCompleteSendImageDelegate:(id)a3;
- (void)_callDidSaveSnapshotFileDelegate:(id)a3;
- (void)_callDidStartCaptureImageDelegate:(id)a3;
- (void)dealloc;
- (void)getSnapshot:(unint64_t)a3;
- (void)relayInitiator:(id)a3 didEndIDSSessionWithError:(id)a4;
- (void)relayInitiator:(id)a3 didSendData:(id)a4;
- (void)relayInitiatorDidSendDataSuccessfully:(id)a3;
- (void)relayInitiatorDidSendIDSInvitation:(id)a3;
- (void)relayInitiatorDidStartDataSend:(id)a3;
- (void)relayInitiatorIDSSessionDidStart:(id)a3;
- (void)snapShotTransferComplete;
- (void)snapshotLocal:(id)a3 didSaveSnapshotFile:(id)a4 error:(id)a5 sessionID:(id)a6;
@end

@implementation HMDCameraSnapshotRemoteRelaySender

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relayInitiator, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_snapshotLocal, 0);
}

- (HMDCameraSnapshotIDSRelayInitiator)relayInitiator
{
  return self->_relayInitiator;
}

- (HMDCameraSnapshotRemoteRelaySenderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDCameraSnapshotRemoteRelaySenderDelegate *)WeakRetained;
}

- (HMDCameraSnapshotLocal)snapshotLocal
{
  return self->_snapshotLocal;
}

- (void)relayInitiatorDidSendIDSInvitation:(id)a3
{
  v4 = [(HMDCameraSnapshotSender *)self workQueue];
  dispatch_assert_queue_V2(v4);

  id v5 = [(HMDCameraSnapshotSender *)self sessionID];
  [v5 markMilestoneFor:@"IDSSessionInvitationSent"];
}

- (void)relayInitiator:(id)a3 didSendData:(id)a4
{
  id v6 = a4;
  id v5 = [(HMDCameraSnapshotSender *)self workQueue];
  dispatch_assert_queue_V2(v5);

  [(HMDCameraSnapshotSender *)self _sendImageSendFailure:v6];
  [(HMDCameraSnapshotRemoteRelaySender *)self _callDidCompleteSendImageDelegate:v6];
}

- (void)relayInitiatorDidStartDataSend:(id)a3
{
  v3 = [(HMDCameraSnapshotSender *)self workQueue];
  dispatch_assert_queue_V2(v3);
}

- (void)relayInitiatorIDSSessionDidStart:(id)a3
{
  v4 = [(HMDCameraSnapshotSender *)self workQueue];
  dispatch_assert_queue_V2(v4);

  id v5 = [(HMDCameraSnapshotSender *)self sessionID];
  [v5 markMilestoneFor:@"IDSSessionStartedOnInitiator"];
}

- (void)relayInitiatorDidSendDataSuccessfully:(id)a3
{
  v4 = [(HMDCameraSnapshotSender *)self workQueue];
  dispatch_assert_queue_V2(v4);

  id v5 = [(HMDCameraSnapshotSender *)self sessionID];
  [v5 markMilestoneFor:@"IDSTransferSentImage"];
}

- (void)relayInitiator:(id)a3 didEndIDSSessionWithError:(id)a4
{
  v4 = [(HMDCameraSnapshotSender *)self workQueue];
  dispatch_assert_queue_V2(v4);
}

- (void)snapshotLocal:(id)a3 didSaveSnapshotFile:(id)a4 error:(id)a5 sessionID:(id)a6
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v12)
  {
    v14 = (void *)MEMORY[0x230FBD990]();
    v15 = self;
    v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = HMFGetLogIdentifier();
      int v28 = 138543618;
      v29 = v17;
      __int16 v30 = 2112;
      id v31 = v12;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@Snapshot local capture has ended in %@", (uint8_t *)&v28, 0x16u);
    }
    [(HMDCameraSnapshotSender *)v15 _sendImageSendFailure:v12];
    [(HMDCameraSnapshotRemoteRelaySender *)v15 _callDidCompleteSendImageDelegate:v12];
  }
  else
  {
    v18 = [v11 encodedDataForIDSSend];
    if (v18)
    {
      v19 = (void *)MEMORY[0x230FBD990]([(HMDCameraSnapshotRemoteRelaySender *)self _callDidSaveSnapshotFileDelegate:v11]);
      v20 = self;
      v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        v22 = HMFGetLogIdentifier();
        int v28 = 138543618;
        v29 = v22;
        __int16 v30 = 2112;
        id v31 = v11;
        _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_INFO, "%{public}@Scheduling the transfer of file %@ through IDS", (uint8_t *)&v28, 0x16u);
      }
      v23 = [(HMDCameraSnapshotRemoteRelaySender *)v20 relayInitiator];
      [v23 sendData:v18];
    }
    else
    {
      v24 = (void *)MEMORY[0x230FBD990]();
      v25 = self;
      v26 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v27 = HMFGetLogIdentifier();
        int v28 = 138543362;
        v29 = v27;
        _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_ERROR, "%{public}@Failed to encode snapshot file to send over IDS", (uint8_t *)&v28, 0xCu);
      }
      [(HMDCameraSnapshotSender *)v25 _sendImageSendFailure:0];
      [(HMDCameraSnapshotRemoteRelaySender *)v25 _callDidCompleteSendImageDelegate:0];
    }
  }
}

- (void)_callDidSaveSnapshotFileDelegate:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    v9 = [(HMDCameraSnapshotRemoteRelaySender *)v6 snapshotLocal];
    id v10 = [v9 sessionID];
    *(_DWORD *)buf = 138543618;
    v18 = v8;
    __int16 v19 = 2112;
    v20 = v10;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Calling delegate that snapshot file has been saved for session %@", buf, 0x16u);
  }
  id v11 = [(HMDCameraSnapshotRemoteRelaySender *)v6 delegate];
  if (objc_opt_respondsToSelector())
  {
    id v12 = [(HMDCameraSnapshotSender *)v6 delegateQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __71__HMDCameraSnapshotRemoteRelaySender__callDidSaveSnapshotFileDelegate___block_invoke;
    block[3] = &unk_264A2F2F8;
    id v14 = v11;
    v15 = v6;
    id v16 = v4;
    dispatch_async(v12, block);
  }
}

void __71__HMDCameraSnapshotRemoteRelaySender__callDidSaveSnapshotFileDelegate___block_invoke(void *a1)
{
  v1 = (void *)a1[4];
  v2 = (void *)a1[5];
  uint64_t v3 = a1[6];
  id v5 = [v2 snapshotLocal];
  id v4 = [v5 sessionID];
  [v1 snapshotRelaySender:v2 didSaveSnapshotFile:v3 sessionID:v4];
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
    v8 = HMFGetLogIdentifier();
    v9 = [(HMDCameraSnapshotRemoteRelaySender *)v6 snapshotLocal];
    id v10 = [v9 sessionID];
    *(_DWORD *)buf = 138543874;
    v18 = v8;
    __int16 v19 = 2112;
    id v20 = v4;
    __int16 v21 = 2112;
    v22 = v10;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Calling delegate that transfer of image has completed with error %@ for session %@", buf, 0x20u);
  }
  id v11 = [(HMDCameraSnapshotRemoteRelaySender *)v6 delegate];
  if (objc_opt_respondsToSelector())
  {
    id v12 = [(HMDCameraSnapshotSender *)v6 delegateQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __72__HMDCameraSnapshotRemoteRelaySender__callDidCompleteSendImageDelegate___block_invoke;
    block[3] = &unk_264A2F2F8;
    id v14 = v11;
    v15 = v6;
    id v16 = v4;
    dispatch_async(v12, block);
  }
}

void __72__HMDCameraSnapshotRemoteRelaySender__callDidCompleteSendImageDelegate___block_invoke(void *a1)
{
  v1 = (void *)a1[4];
  v2 = (void *)a1[5];
  uint64_t v3 = a1[6];
  id v5 = [v2 snapshotLocal];
  id v4 = [v5 sessionID];
  [v1 snapshotRelaySender:v2 didCompleteSendImage:v3 sessionID:v4];
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
    v8 = HMFGetLogIdentifier();
    v9 = [(HMDCameraSnapshotRemoteRelaySender *)v6 snapshotLocal];
    id v10 = [v9 sessionID];
    *(_DWORD *)buf = 138543874;
    v18 = v8;
    __int16 v19 = 2112;
    id v20 = v4;
    __int16 v21 = 2112;
    v22 = v10;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Calling delegate that capture of image has started with error %@ for session %@", buf, 0x20u);
  }
  id v11 = [(HMDCameraSnapshotRemoteRelaySender *)v6 delegate];
  if (objc_opt_respondsToSelector())
  {
    id v12 = [(HMDCameraSnapshotSender *)v6 delegateQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __72__HMDCameraSnapshotRemoteRelaySender__callDidStartCaptureImageDelegate___block_invoke;
    block[3] = &unk_264A2F2F8;
    id v14 = v11;
    v15 = v6;
    id v16 = v4;
    dispatch_async(v12, block);
  }
}

void __72__HMDCameraSnapshotRemoteRelaySender__callDidStartCaptureImageDelegate___block_invoke(void *a1)
{
  v1 = (void *)a1[4];
  v2 = (void *)a1[5];
  uint64_t v3 = a1[6];
  id v5 = [v2 snapshotLocal];
  id v4 = [v5 sessionID];
  [v1 snapshotRelaySender:v2 didStartCaptureImage:v3 sessionID:v4];
}

- (void)snapShotTransferComplete
{
  uint64_t v3 = [(HMDCameraSnapshotSender *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__HMDCameraSnapshotRemoteRelaySender_snapShotTransferComplete__block_invoke;
  block[3] = &unk_264A2F7F8;
  void block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __62__HMDCameraSnapshotRemoteRelaySender_snapShotTransferComplete__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    int v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Snapshot transfer to remote receiver is complete", (uint8_t *)&v7, 0xCu);
  }
  return [*(id *)(a1 + 32) _callDidCompleteSendImageDelegate:0];
}

- (void)getSnapshot:(unint64_t)a3
{
  id v5 = [(HMDCameraSnapshotSender *)self workQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __50__HMDCameraSnapshotRemoteRelaySender_getSnapshot___block_invoke;
  v6[3] = &unk_264A2C6A0;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);
}

uint64_t __50__HMDCameraSnapshotRemoteRelaySender_getSnapshot___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    int v9 = 138543362;
    id v10 = v5;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Getting the snapshot from local snapshot handler", (uint8_t *)&v9, 0xCu);
  }
  id v6 = [*(id *)(a1 + 32) relayInitiator];
  [v6 sendIDSInvitation];

  int v7 = [*(id *)(a1 + 32) snapshotLocal];
  [v7 getSnapshot:*(void *)(a1 + 40)];

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
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x230FBD990](self, a2);
  id v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    int v9 = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Resetting HMDCameraSnapshotRemoteRelaySender", buf, 0xCu);
  }
  v7.receiver = v4;
  v7.super_class = (Class)HMDCameraSnapshotRemoteRelaySender;
  [(HMDCameraSnapshotRemoteRelaySender *)&v7 dealloc];
}

- (HMDCameraSnapshotRemoteRelaySender)initWithSessionID:(id)a3 workQueue:(id)a4 device:(id)a5 accessory:(id)a6 delegate:(id)a7 delegateQueue:(id)a8 uniqueIdentifier:(id)a9 snapshotRequestHandler:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a10;
  v34.receiver = self;
  v34.super_class = (Class)HMDCameraSnapshotRemoteRelaySender;
  v22 = [(HMDCameraSnapshotSender *)&v34 initWithSessionID:v16 workQueue:v17 device:v18 accessory:v19 delegateQueue:a8 uniqueIdentifier:a9];
  uint64_t v23 = v22;
  if (v22)
  {
    objc_storeWeak((id *)&v22->_delegate, v20);
    v24 = [[HMDCameraSnapshotLocal alloc] initWithSessionID:v16 workQueue:v17 accessory:v19 delegate:v23 delegateQueue:v17 snapshotRequestHandler:v21];
    snapshotLocal = v23->_snapshotLocal;
    v23->_snapshotLocal = v24;

    id v26 = objc_alloc(MEMORY[0x263F08C38]);
    v27 = [v16 sessionID];
    int v28 = (void *)[v26 initWithUUIDString:v27];

    v29 = [HMDCameraSnapshotIDSRelayInitiator alloc];
    __int16 v30 = [v16 description];
    uint64_t v31 = [(HMDCameraSnapshotIDSRelayInitiator *)v29 initWithSessionID:v28 logIdentifier:v30 workQueue:v17 device:v18 delegate:v23];
    relayInitiator = v23->_relayInitiator;
    v23->_relayInitiator = (HMDCameraSnapshotIDSRelayInitiator *)v31;
  }
  return v23;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_221298 != -1) {
    dispatch_once(&logCategory__hmf_once_t1_221298, &__block_literal_global_221299);
  }
  v2 = (void *)logCategory__hmf_once_v2_221300;
  return v2;
}

void __49__HMDCameraSnapshotRemoteRelaySender_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v2_221300;
  logCategory__hmf_once_v2_221300 = v0;
}

@end