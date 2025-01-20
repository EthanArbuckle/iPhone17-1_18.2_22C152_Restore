@interface HMDCameraSnapshotRemoteRelayReceiver
+ (id)logCategory;
- (HMDCameraSnapshotIDSRelayReceiver)relayReceiver;
- (HMDCameraSnapshotRemoteRelayReceiver)initWithSessionID:(id)a3 workQueue:(id)a4 accessory:(id)a5 delegate:(id)a6 delegateQueue:(id)a7 uniqueIdentifier:(id)a8 snapshotRequestHandler:(id)a9 residentMessageHandler:(id)a10 remoteDevice:(id)a11;
- (HMDCameraSnapshotRemoteRelayReceiverDelegate)delegate;
- (id)logIdentifier;
- (void)_callDidSaveImageDelegateWithError:(id)a3;
- (void)_callGettingImageDelegate:(id)a3;
- (void)_getSnapshot:(unint64_t)a3;
- (void)dealloc;
- (void)getSnapshot:(unint64_t)a3;
- (void)relayReceiver:(id)a3 didReceiveData:(id)a4 error:(id)a5;
- (void)relayReceiverDidAcceptIDSInvitation:(id)a3;
- (void)relayReceiverIDSSessionDidStart:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setRelayReceiver:(id)a3;
- (void)snapShotSendFailed:(id)a3;
@end

@implementation HMDCameraSnapshotRemoteRelayReceiver

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relayReceiver, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setRelayReceiver:(id)a3
{
}

- (HMDCameraSnapshotIDSRelayReceiver)relayReceiver
{
  return self->_relayReceiver;
}

- (void)setDelegate:(id)a3
{
}

- (HMDCameraSnapshotRemoteRelayReceiverDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDCameraSnapshotRemoteRelayReceiverDelegate *)WeakRetained;
}

- (void)relayReceiverIDSSessionDidStart:(id)a3
{
  id v3 = [(HMDCameraSnapshotReceiver *)self sessionID];
  [v3 markMilestoneFor:@"IDSSessionStartedOnReceiver"];
}

- (void)relayReceiverDidAcceptIDSInvitation:(id)a3
{
  id v3 = [(HMDCameraSnapshotReceiver *)self sessionID];
  [v3 markMilestoneFor:@"IDSSessionInvitationReceived"];
}

- (void)relayReceiver:(id)a3 didReceiveData:(id)a4 error:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(HMDCameraSnapshotReceiver *)self workQueue];
  dispatch_assert_queue_V2(v11);

  v12 = (void *)MEMORY[0x1D9452090]();
  v13 = self;
  v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v15 = HMFGetLogIdentifier();
    int v20 = 138543618;
    v21 = v15;
    __int16 v22 = 2112;
    id v23 = v10;
    _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_INFO, "%{public}@Image receive has completed with error: %@", (uint8_t *)&v20, 0x16u);
  }
  if (!v10)
  {
    v16 = [(HMDCameraSnapshotRemoteRelayReceiver *)v13 relayReceiver];
    v17 = [v16 snapshotRelayTransaction];

    v18 = [(HMDCameraSnapshotReceiver *)v13 snapshotFile];
    char v19 = [v18 decodeIDSDataReceived:v9 snapshotDataTransaction:v17];

    if (v19)
    {
      id v10 = 0;
    }
    else
    {
      id v10 = [MEMORY[0x1E4F28C58] hmInternalErrorWithCode:1035];
    }
  }
  [(HMDCameraSnapshotRemoteRelayReceiver *)v13 _callDidSaveImageDelegateWithError:v10];
  [(HMDCameraSnapshotReceiver *)v13 _sendConfirmationToResident:&__block_literal_global_48];
}

- (void)_callDidSaveImageDelegateWithError:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1D9452090]();
  v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    id v9 = [(HMDCameraSnapshotReceiver *)v6 snapshotFile];
    id v10 = [(HMDCameraSnapshotReceiver *)v6 sessionID];
    *(_DWORD *)buf = 138544130;
    char v19 = v8;
    __int16 v20 = 2112;
    v21 = v9;
    __int16 v22 = 2112;
    id v23 = v4;
    __int16 v24 = 2112;
    v25 = v10;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Calling delegate that download of image %@ has completed with error %@ for session %@", buf, 0x2Au);
  }
  v11 = [MEMORY[0x1E4F653F0] currentActivity];
  [v11 markWithReason:@"Calling delegate"];

  v12 = [(HMDCameraSnapshotRemoteRelayReceiver *)v6 delegate];
  if (objc_opt_respondsToSelector())
  {
    v13 = [(HMDCameraSnapshotReceiver *)v6 delegateQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __75__HMDCameraSnapshotRemoteRelayReceiver__callDidSaveImageDelegateWithError___block_invoke;
    block[3] = &unk_1E6A19668;
    id v15 = v12;
    v16 = v6;
    id v17 = v4;
    dispatch_async(v13, block);
  }
}

void __75__HMDCameraSnapshotRemoteRelayReceiver__callDidSaveImageDelegateWithError___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  id v6 = [v3 snapshotFile];
  uint64_t v4 = *(void *)(a1 + 48);
  v5 = [*(id *)(a1 + 40) sessionID];
  [v2 snapshotRelayReceiver:v3 didSaveSnapshotFile:v6 error:v4 sessionID:v5];
}

- (void)_callGettingImageDelegate:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    id v9 = [(HMDCameraSnapshotReceiver *)v6 sessionID];
    *(_DWORD *)buf = 138543874;
    v18 = v8;
    __int16 v19 = 2112;
    id v20 = v4;
    __int16 v21 = 2112;
    __int16 v22 = v9;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Calling getting image delegate with error %@ for session %@", buf, 0x20u);
  }
  id v10 = [MEMORY[0x1E4F653F0] currentActivity];
  [v10 markWithReason:@"Did start getting image"];

  v11 = [(HMDCameraSnapshotRemoteRelayReceiver *)v6 delegate];
  if (objc_opt_respondsToSelector())
  {
    v12 = [(HMDCameraSnapshotReceiver *)v6 delegateQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __66__HMDCameraSnapshotRemoteRelayReceiver__callGettingImageDelegate___block_invoke;
    block[3] = &unk_1E6A19668;
    id v14 = v11;
    id v15 = v6;
    id v16 = v4;
    dispatch_async(v12, block);
  }
}

void __66__HMDCameraSnapshotRemoteRelayReceiver__callGettingImageDelegate___block_invoke(void *a1)
{
  v1 = (void *)a1[4];
  v2 = (void *)a1[5];
  uint64_t v3 = a1[6];
  id v4 = [v2 sessionID];
  [v1 snapshotRelayReceiver:v2 didStartGettingImage:v3 sessionID:v4];
}

- (void)snapShotSendFailed:(id)a3
{
  id v4 = a3;
  v5 = [(HMDCameraSnapshotReceiver *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__HMDCameraSnapshotRemoteRelayReceiver_snapShotSendFailed___block_invoke;
  v7[3] = &unk_1E6A197C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __59__HMDCameraSnapshotRemoteRelayReceiver_snapShotSendFailed___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = HMFGetLogIdentifier();
    id v6 = [*(id *)(a1 + 32) sessionID];
    int v8 = 138543618;
    id v9 = v5;
    __int16 v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@Send failed on snapshot session %@", (uint8_t *)&v8, 0x16u);
  }
  id v7 = *(id *)(a1 + 40);
  if (!v7)
  {
    id v7 = [MEMORY[0x1E4F28C58] hmInternalErrorWithCode:1036];
  }
  [*(id *)(a1 + 32) _callDidSaveImageDelegateWithError:v7];
}

- (void)_getSnapshot:(unint64_t)a3
{
  objc_initWeak(&location, self);
  id v26 = (id)[objc_alloc(MEMORY[0x1E4F653F0]) initWithName:@"Snapshot Relay Receiver"];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __53__HMDCameraSnapshotRemoteRelayReceiver__getSnapshot___block_invoke;
  v24[3] = &unk_1E6A17A08;
  objc_copyWeak(&v25, &location);
  [(HMDCameraSnapshotReceiver *)self _sendRequestWithTierType:a3 toResident:v24];
  v5 = [HMDCameraIDSSessionInviterDeviceVerifier alloc];
  id v6 = [(HMDCameraSnapshotReceiver *)self sessionID];
  id v7 = [v6 sessionID];
  int v8 = [(HMDCameraSnapshotReceiver *)self remoteDevice];
  id v9 = [(HMDCameraIDSSessionInviterDeviceVerifier *)v5 initWithSessionID:v7 expectedInviter:v8];

  id v10 = objc_alloc(MEMORY[0x1E4F29128]);
  v11 = [(HMDCameraSnapshotReceiver *)self sessionID];
  uint64_t v12 = [v11 sessionID];
  v13 = (void *)[v10 initWithUUIDString:v12];

  id v14 = +[HMDApplicationVendorIDStore sharedStore];
  id v15 = [(HMDCameraSnapshotReceiver *)self sessionID];
  id v16 = [v15 hostProcessBundleIdentifier];
  id v17 = [v14 machUUIDsForApplication:v16];

  v18 = [HMDCameraSnapshotIDSRelayReceiver alloc];
  __int16 v19 = [(HMDCameraSnapshotReceiver *)self sessionID];
  id v20 = [v19 sessionID];
  __int16 v21 = [v17 firstObject];
  __int16 v22 = [(HMDCameraSnapshotReceiver *)self workQueue];
  uint64_t v23 = [(HMDCameraSnapshotIDSRelayReceiver *)v18 initWithSessionID:v13 logIdentifier:v20 machOUUID:v21 workQueue:v22 sessionInviterDeviceVerifier:v9 delegate:self];
  [(HMDCameraSnapshotRemoteRelayReceiver *)self setRelayReceiver:v23];

  objc_destroyWeak(&v25);
  __HMFActivityScopeLeave();

  objc_destroyWeak(&location);
}

void __53__HMDCameraSnapshotRemoteRelayReceiver__getSnapshot___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v8 = WeakRetained;
  if (WeakRetained)
  {
    if (v5)
    {
      id v9 = (void *)MEMORY[0x1D9452090]();
      id v10 = v8;
      v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        uint64_t v12 = HMFGetLogIdentifier();
        int v13 = 138543618;
        id v14 = v12;
        __int16 v15 = 2112;
        id v16 = v5;
        _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_ERROR, "%{public}@Take snapshot relayed to resident has failed: %@", (uint8_t *)&v13, 0x16u);
      }
      [v10 _callDidSaveImageDelegateWithError:v5];
    }
    else
    {
      [WeakRetained _callGettingImageDelegate:0];
    }
  }
}

- (void)getSnapshot:(unint64_t)a3
{
  id v5 = [(HMDCameraSnapshotReceiver *)self workQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__HMDCameraSnapshotRemoteRelayReceiver_getSnapshot___block_invoke;
  v6[3] = &unk_1E6A189D0;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);
}

uint64_t __52__HMDCameraSnapshotRemoteRelayReceiver_getSnapshot___block_invoke(uint64_t a1)
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
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1D9452090](self, a2);
  id v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v9 = v6;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Resetting HMDCameraSnapshotRemoteRelayReceiver", buf, 0xCu);
  }
  v7.receiver = v4;
  v7.super_class = (Class)HMDCameraSnapshotRemoteRelayReceiver;
  [(HMDCameraSnapshotRemoteRelayReceiver *)&v7 dealloc];
}

- (HMDCameraSnapshotRemoteRelayReceiver)initWithSessionID:(id)a3 workQueue:(id)a4 accessory:(id)a5 delegate:(id)a6 delegateQueue:(id)a7 uniqueIdentifier:(id)a8 snapshotRequestHandler:(id)a9 residentMessageHandler:(id)a10 remoteDevice:(id)a11
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
  id v26 = v25;
  if (!v25)
  {
LABEL_19:
    v30 = (void *)_HMFPreconditionFailure();
    return (HMDCameraSnapshotRemoteRelayReceiver *)+[HMDCameraSnapshotRemoteRelayReceiver logCategory];
  }
  v32.receiver = self;
  v32.super_class = (Class)HMDCameraSnapshotRemoteRelayReceiver;
  v27 = [(HMDCameraSnapshotReceiver *)&v32 initWithSessionID:v17 workQueue:v18 accessory:v19 delegateQueue:v21 uniqueIdentifier:v22 snapshotRequestHandler:v23 residentMessageHandler:v24 remoteDevice:v25];
  v28 = v27;
  if (v27) {
    objc_storeWeak((id *)&v27->_delegate, v20);
  }

  return v28;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_103399 != -1) {
    dispatch_once(&logCategory__hmf_once_t1_103399, &__block_literal_global_103400);
  }
  v2 = (void *)logCategory__hmf_once_v2_103401;
  return v2;
}

uint64_t __51__HMDCameraSnapshotRemoteRelayReceiver_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v2_103401;
  logCategory__hmf_once_v2_103401 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end