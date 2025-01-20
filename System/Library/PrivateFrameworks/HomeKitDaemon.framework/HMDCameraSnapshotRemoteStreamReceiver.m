@interface HMDCameraSnapshotRemoteStreamReceiver
+ (id)logCategory;
- (HMDCameraSnapshotIDSStreamReceiver)relayReceiver;
- (HMDCameraSnapshotRemoteStreamReceiver)initWithSessionID:(id)a3 workQueue:(id)a4 accessory:(id)a5 delegate:(id)a6 delegateQueue:(id)a7 uniqueIdentifier:(id)a8 snapshotRequestHandler:(id)a9 residentMessageHandler:(id)a10 remoteDevice:(id)a11;
- (HMDCameraSnapshotRemoteStreamReceiverDelegate)delegate;
- (id)logIdentifier;
- (void)_callDidSaveImageDelegateWithError:(id)a3;
- (void)_callGettingImageDelegate:(id)a3;
- (void)_getSnapshot:(unint64_t)a3;
- (void)dealloc;
- (void)getSnapshot:(unint64_t)a3;
- (void)setRelayReceiver:(id)a3;
- (void)snapShotSendFailed:(id)a3;
- (void)streamReceiver:(id)a3 didReceiveFileWithError:(id)a4;
@end

@implementation HMDCameraSnapshotRemoteStreamReceiver

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relayReceiver, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setRelayReceiver:(id)a3
{
}

- (HMDCameraSnapshotIDSStreamReceiver)relayReceiver
{
  return self->_relayReceiver;
}

- (HMDCameraSnapshotRemoteStreamReceiverDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDCameraSnapshotRemoteStreamReceiverDelegate *)WeakRetained;
}

- (void)streamReceiver:(id)a3 didReceiveFileWithError:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [(HMDCameraSnapshotReceiver *)self workQueue];
  dispatch_assert_queue_V2(v8);

  v9 = (void *)MEMORY[0x230FBD990]();
  v10 = self;
  v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = HMFGetLogIdentifier();
    int v13 = 138543618;
    v14 = v12;
    __int16 v15 = 2112;
    id v16 = v7;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Image receive has completed with error: %@", (uint8_t *)&v13, 0x16u);
  }
  [(HMDCameraSnapshotRemoteStreamReceiver *)v10 _callDidSaveImageDelegateWithError:v7];
  [(HMDCameraSnapshotReceiver *)v10 _sendConfirmationToResident:&__block_literal_global_42_215761];
}

- (void)_callDidSaveImageDelegateWithError:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [MEMORY[0x263F424F0] currentActivity];
  [v5 markWithReason:@"Calling delegate"];

  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = self;
  v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = HMFGetLogIdentifier();
    v10 = [(HMDCameraSnapshotReceiver *)v7 snapshotFile];
    v11 = [(HMDCameraSnapshotReceiver *)v7 sessionID];
    *(_DWORD *)buf = 138544130;
    v19 = v9;
    __int16 v20 = 2112;
    v21 = v10;
    __int16 v22 = 2112;
    id v23 = v4;
    __int16 v24 = 2112;
    v25 = v11;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Calling delegate that download of image %@ has completed with error %@ for session %@", buf, 0x2Au);
  }
  v12 = [(HMDCameraSnapshotRemoteStreamReceiver *)v7 delegate];
  if (objc_opt_respondsToSelector())
  {
    int v13 = [(HMDCameraSnapshotReceiver *)v7 delegateQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __76__HMDCameraSnapshotRemoteStreamReceiver__callDidSaveImageDelegateWithError___block_invoke;
    block[3] = &unk_264A2F2F8;
    id v15 = v12;
    id v16 = v7;
    id v17 = v4;
    dispatch_async(v13, block);
  }
}

void __76__HMDCameraSnapshotRemoteStreamReceiver__callDidSaveImageDelegateWithError___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  id v6 = [v3 snapshotFile];
  uint64_t v4 = *(void *)(a1 + 48);
  v5 = [*(id *)(a1 + 40) sessionID];
  [v2 snapshotStreamReceiver:v3 didSaveSnapshotFile:v6 error:v4 sessionID:v5];
}

- (void)_callGettingImageDelegate:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    v9 = [(HMDCameraSnapshotReceiver *)v6 sessionID];
    *(_DWORD *)buf = 138543874;
    id v17 = v8;
    __int16 v18 = 2112;
    id v19 = v4;
    __int16 v20 = 2112;
    v21 = v9;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Calling getting image delegate with error %@ for session %@", buf, 0x20u);
  }
  v10 = [(HMDCameraSnapshotRemoteStreamReceiver *)v6 delegate];
  if (objc_opt_respondsToSelector())
  {
    v11 = [(HMDCameraSnapshotReceiver *)v6 delegateQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __67__HMDCameraSnapshotRemoteStreamReceiver__callGettingImageDelegate___block_invoke;
    block[3] = &unk_264A2F2F8;
    id v13 = v10;
    v14 = v6;
    id v15 = v4;
    dispatch_async(v11, block);
  }
}

void __67__HMDCameraSnapshotRemoteStreamReceiver__callGettingImageDelegate___block_invoke(void *a1)
{
  v1 = (void *)a1[4];
  v2 = (void *)a1[5];
  uint64_t v3 = a1[6];
  id v4 = [v2 sessionID];
  [v1 snapshotStreamReceiver:v2 didStartGettingImage:v3 sessionID:v4];
}

- (void)snapShotSendFailed:(id)a3
{
  id v4 = a3;
  v5 = [(HMDCameraSnapshotReceiver *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __60__HMDCameraSnapshotRemoteStreamReceiver_snapShotSendFailed___block_invoke;
  v7[3] = &unk_264A2F820;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __60__HMDCameraSnapshotRemoteStreamReceiver_snapShotSendFailed___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = HMFGetLogIdentifier();
    id v6 = [*(id *)(a1 + 32) sessionID];
    int v8 = 138543618;
    v9 = v5;
    __int16 v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Send failed on snapshot session %@", (uint8_t *)&v8, 0x16u);
  }
  id v7 = *(id *)(a1 + 40);
  if (!v7)
  {
    id v7 = [MEMORY[0x263F087E8] hmInternalErrorWithCode:1036];
  }
  [*(id *)(a1 + 32) _callDidSaveImageDelegateWithError:v7];
}

- (void)_getSnapshot:(unint64_t)a3
{
  objc_initWeak(&location, self);
  id v17 = (id)[objc_alloc(MEMORY[0x263F424F0]) initWithName:@"Snapshot Stream Receiver"];
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  id v13 = __54__HMDCameraSnapshotRemoteStreamReceiver__getSnapshot___block_invoke;
  v14 = &unk_264A2D420;
  id v15 = v17;
  objc_copyWeak(&v16, &location);
  [(HMDCameraSnapshotReceiver *)self _sendRequestWithTierType:a3 toResident:&v11];
  v5 = [HMDCameraSnapshotIDSStreamReceiver alloc];
  id v6 = [(HMDCameraSnapshotReceiver *)self sessionID];
  id v7 = [(HMDCameraSnapshotReceiver *)self workQueue];
  int v8 = [(HMDCameraSnapshotReceiver *)self snapshotFile];
  v9 = [(HMDCameraSnapshotReceiver *)self remoteDevice];
  __int16 v10 = [(HMDCameraSnapshotIDSStreamReceiver *)v5 initWithSessionID:v6 workQueue:v7 snapshotFile:v8 delegate:self remoteDevice:v9];
  [(HMDCameraSnapshotRemoteStreamReceiver *)self setRelayReceiver:v10];

  objc_destroyWeak(&v16);
  __HMFActivityScopeLeave();

  objc_destroyWeak(&location);
}

void __54__HMDCameraSnapshotRemoteStreamReceiver__getSnapshot___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) begin];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v8 = WeakRetained;
  if (WeakRetained)
  {
    if (v5)
    {
      v9 = (void *)MEMORY[0x230FBD990]();
      id v10 = v8;
      uint64_t v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        uint64_t v12 = HMFGetLogIdentifier();
        int v13 = 138543618;
        v14 = v12;
        __int16 v15 = 2112;
        id v16 = v5;
        _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Take snapshot relayed to resident has ended in error %@", (uint8_t *)&v13, 0x16u);
      }
      [v10 _callDidSaveImageDelegateWithError:v5];
    }
    else
    {
      [WeakRetained _callGettingImageDelegate:0];
    }
    [*(id *)(a1 + 32) end];
    [*(id *)(a1 + 32) invalidate];
  }
}

- (void)getSnapshot:(unint64_t)a3
{
  id v5 = [(HMDCameraSnapshotReceiver *)self workQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __53__HMDCameraSnapshotRemoteStreamReceiver_getSnapshot___block_invoke;
  v6[3] = &unk_264A2C6A0;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);
}

uint64_t __53__HMDCameraSnapshotRemoteStreamReceiver_getSnapshot___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _getSnapshot:*(void *)(a1 + 40)];
}

- (id)logIdentifier
{
  v2 = [(HMDCameraSnapshotReceiver *)self sessionID];
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
    v9 = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Resetting HMDCameraSnapshotRemoteStreamReceiver", buf, 0xCu);
  }
  v7.receiver = v4;
  v7.super_class = (Class)HMDCameraSnapshotRemoteStreamReceiver;
  [(HMDCameraSnapshotRemoteStreamReceiver *)&v7 dealloc];
}

- (HMDCameraSnapshotRemoteStreamReceiver)initWithSessionID:(id)a3 workQueue:(id)a4 accessory:(id)a5 delegate:(id)a6 delegateQueue:(id)a7 uniqueIdentifier:(id)a8 snapshotRequestHandler:(id)a9 residentMessageHandler:(id)a10 remoteDevice:(id)a11
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  id v23 = a9;
  id v24 = a10;
  id v25 = a11;
  if (!v17)
  {
    _HMFPreconditionFailure();
    goto LABEL_13;
  }
  if (!v18)
  {
LABEL_13:
    _HMFPreconditionFailure();
    goto LABEL_14;
  }
  if (!v19)
  {
LABEL_14:
    _HMFPreconditionFailure();
    goto LABEL_15;
  }
  if (!v21)
  {
LABEL_15:
    _HMFPreconditionFailure();
    goto LABEL_16;
  }
  if (!v22)
  {
LABEL_16:
    _HMFPreconditionFailure();
    goto LABEL_17;
  }
  if (!v23)
  {
LABEL_17:
    _HMFPreconditionFailure();
    goto LABEL_18;
  }
  if (!v24)
  {
LABEL_18:
    _HMFPreconditionFailure();
    goto LABEL_19;
  }
  uint64_t v26 = v25;
  if (!v25)
  {
LABEL_19:
    v30 = (void *)_HMFPreconditionFailure();
    return (HMDCameraSnapshotRemoteStreamReceiver *)+[HMDCameraSnapshotRemoteStreamReceiver logCategory];
  }
  v32.receiver = self;
  v32.super_class = (Class)HMDCameraSnapshotRemoteStreamReceiver;
  v27 = [(HMDCameraSnapshotReceiver *)&v32 initWithSessionID:v17 workQueue:v18 accessory:v19 delegateQueue:v21 uniqueIdentifier:v22 snapshotRequestHandler:v23 residentMessageHandler:v24 remoteDevice:v25];
  v28 = v27;
  if (v27) {
    objc_storeWeak((id *)&v27->_delegate, v20);
  }

  return v28;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_215813 != -1) {
    dispatch_once(&logCategory__hmf_once_t1_215813, &__block_literal_global_215814);
  }
  v2 = (void *)logCategory__hmf_once_v2_215815;
  return v2;
}

void __52__HMDCameraSnapshotRemoteStreamReceiver_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v2_215815;
  logCategory__hmf_once_v2_215815 = v0;
}

@end