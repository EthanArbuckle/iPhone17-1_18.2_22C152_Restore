@interface HMDCameraSnapshotIDSStreamInitiator
+ (id)logCategory;
- (HMDCameraSnapshotIDSStreamInitiator)initWithSessionID:(id)a3 workQueue:(id)a4 destinationID:(id)a5 delegate:(id)a6 delegateQueue:(id)a7;
- (HMDCameraSnapshotIDSStreamInitiator)initWithSessionID:(id)a3 workQueue:(id)a4 proxyService:(id)a5 destinationID:(id)a6 delegate:(id)a7 delegateQueue:(id)a8;
- (HMDCameraSnapshotIDSStreamInitiatorDelegate)delegate;
- (HMDSnapshotFile)snapshotFile;
- (NSString)destinationID;
- (NSString)sendFileIdentifier;
- (OS_dispatch_queue)delegateQueue;
- (id)logIdentifier;
- (void)_callFileTransferFailedWithError:(id)a3;
- (void)_sendFile:(id)a3;
- (void)dealloc;
- (void)sendFile:(id)a3;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)setDelegate:(id)a3;
- (void)setSendFileIdentifier:(id)a3;
- (void)setSnapshotFile:(id)a3;
@end

@implementation HMDCameraSnapshotIDSStreamInitiator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sendFileIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_destinationID, 0);
  objc_storeStrong((id *)&self->_snapshotFile, 0);
}

- (void)setSendFileIdentifier:(id)a3
{
}

- (NSString)sendFileIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setDelegate:(id)a3
{
}

- (HMDCameraSnapshotIDSStreamInitiatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDCameraSnapshotIDSStreamInitiatorDelegate *)WeakRetained;
}

- (OS_dispatch_queue)delegateQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 56, 1);
}

- (NSString)destinationID
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSnapshotFile:(id)a3
{
}

- (HMDSnapshotFile)snapshotFile
{
  return (HMDSnapshotFile *)objc_getProperty(self, a2, 40, 1);
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  uint64_t v15 = [(HMDCameraSnapshotIDSStreamInitiator *)self sendFileIdentifier];
  if (v15)
  {
    v16 = (void *)v15;
    v17 = [(HMDCameraSnapshotIDSStreamInitiator *)self sendFileIdentifier];
    int v18 = [v13 isEqualToString:v17];

    if (v18)
    {
      v19 = (void *)MEMORY[0x1D9452090]();
      v20 = self;
      v21 = HMFGetOSLogHandle();
      v22 = v21;
      if (v14)
      {
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          v23 = HMFGetLogIdentifier();
          int v25 = 138543874;
          v26 = v23;
          __int16 v27 = 2112;
          id v28 = v13;
          __int16 v29 = 2112;
          id v30 = v14;
          _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_ERROR, "%{public}@Received confirmation from IDS that the file send failed for identifier %@: %@", (uint8_t *)&v25, 0x20u);
        }
        [(HMDCameraSnapshotIDSStreamInitiator *)v20 _callFileTransferFailedWithError:v14];
      }
      else
      {
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          v24 = HMFGetLogIdentifier();
          int v25 = 138543618;
          v26 = v24;
          __int16 v27 = 2112;
          id v28 = v13;
          _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_INFO, "%{public}@Received confirmation from IDS that the file send succeeded for identifier: %@", (uint8_t *)&v25, 0x16u);
        }
      }
    }
  }
}

- (id)logIdentifier
{
  v2 = [(HMDCameraSnapshotIDSStream *)self sessionID];
  v3 = [v2 description];

  return v3;
}

- (void)_callFileTransferFailedWithError:(id)a3
{
  id v4 = a3;
  v5 = [(HMDCameraSnapshotIDSStreamInitiator *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    v6 = [(HMDCameraSnapshotIDSStreamInitiator *)self delegateQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __72__HMDCameraSnapshotIDSStreamInitiator__callFileTransferFailedWithError___block_invoke;
    block[3] = &unk_1E6A19668;
    id v8 = v5;
    v9 = self;
    id v10 = v4;
    dispatch_async(v6, block);
  }
}

uint64_t __72__HMDCameraSnapshotIDSStreamInitiator__callFileTransferFailedWithError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) streamInitiator:*(void *)(a1 + 40) didFailToSendFileWithError:*(void *)(a1 + 48)];
}

- (void)_sendFile:(id)a3
{
  v46[1] = *MEMORY[0x1E4F143B8];
  id v33 = a3;
  -[HMDCameraSnapshotIDSStreamInitiator setSnapshotFile:](self, "setSnapshotFile:");
  id v4 = (void *)MEMORY[0x1E4F1CB10];
  v5 = [(HMDCameraSnapshotIDSStreamInitiator *)self snapshotFile];
  v6 = [v5 filePath];
  uint64_t v7 = [v4 fileURLWithPath:v6];

  id v8 = (void *)MEMORY[0x1E4F1CAD0];
  v9 = [(HMDCameraSnapshotIDSStreamInitiator *)self destinationID];
  v46[0] = v9;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:1];
  id v11 = [v8 setWithArray:v10];

  uint64_t v44 = *MEMORY[0x1E4F6A9A0];
  uint64_t v45 = MEMORY[0x1E4F1CC38];
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v45 forKeys:&v44 count:1];
  v42[0] = @"kCameraSessionID";
  id v13 = [(HMDCameraSnapshotIDSStream *)self sessionID];
  id v14 = [v13 sessionID];
  v43[0] = v14;
  v42[1] = *MEMORY[0x1E4F2EE80];
  uint64_t v15 = [(HMDCameraSnapshotIDSStreamInitiator *)self snapshotFile];
  v16 = [v15 snapshotTimestamp];
  v43[1] = v16;
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:v42 count:2];

  int v18 = [(HMDCameraSnapshotIDSStream *)self idsProxyService];
  id v34 = 0;
  id v35 = 0;
  v32 = (void *)v7;
  [v18 sendResourceAtURL:v7 metadata:v17 toDestinations:v11 priority:300 options:v12 identifier:&v35 error:&v34];
  id v19 = v35;
  id v20 = v34;

  if (v20)
  {
    v21 = (void *)MEMORY[0x1D9452090]();
    v22 = self;
    v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = HMFGetLogIdentifier();
      int v25 = [(HMDCameraSnapshotIDSStreamInitiator *)v22 snapshotFile];
      *(_DWORD *)buf = 138543874;
      v37 = v24;
      __int16 v38 = 2112;
      id v39 = v25;
      __int16 v40 = 2112;
      id v41 = v20;
      _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_ERROR, "%{public}@Sending file %@ failed with error %@", buf, 0x20u);
    }
    [(HMDCameraSnapshotIDSStreamInitiator *)v22 _callFileTransferFailedWithError:v20];
    v26 = v33;
  }
  else
  {
    __int16 v27 = (void *)MEMORY[0x1D9452090]([(HMDCameraSnapshotIDSStreamInitiator *)self setSendFileIdentifier:v19]);
    id v28 = self;
    __int16 v29 = HMFGetOSLogHandle();
    v26 = v33;
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      id v30 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v37 = v30;
      __int16 v38 = 2112;
      id v39 = v33;
      __int16 v40 = 2112;
      id v41 = v19;
      _os_log_impl(&dword_1D49D5000, v29, OS_LOG_TYPE_INFO, "%{public}@Sent the resource transfer request for %@ with identifier %@", buf, 0x20u);
    }
    uint64_t v31 = [(HMDCameraSnapshotIDSStream *)v28 sessionID];
    [v31 markMilestoneFor:@"IDSTransferSentImage"];
  }
}

- (void)sendFile:(id)a3
{
  id v4 = a3;
  v5 = [(HMDCameraSnapshotIDSStream *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__HMDCameraSnapshotIDSStreamInitiator_sendFile___block_invoke;
  v7[3] = &unk_1E6A197C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __48__HMDCameraSnapshotIDSStreamInitiator_sendFile___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendFile:*(void *)(a1 + 40)];
}

- (void)dealloc
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1D9452090](self, a2);
  id v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v9 = v6;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Resetting the HMDCameraSnapshotIDSStreamInitiator", buf, 0xCu);
  }
  v7.receiver = v4;
  v7.super_class = (Class)HMDCameraSnapshotIDSStreamInitiator;
  [(HMDCameraSnapshotIDSStream *)&v7 dealloc];
}

- (HMDCameraSnapshotIDSStreamInitiator)initWithSessionID:(id)a3 workQueue:(id)a4 proxyService:(id)a5 destinationID:(id)a6 delegate:(id)a7 delegateQueue:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  if (!v14)
  {
    _HMFPreconditionFailure();
    goto LABEL_10;
  }
  if (!v15)
  {
LABEL_10:
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  if (!v16)
  {
LABEL_11:
    _HMFPreconditionFailure();
    goto LABEL_12;
  }
  if (!v17)
  {
LABEL_12:
    _HMFPreconditionFailure();
    goto LABEL_13;
  }
  id v20 = v19;
  if (!v19)
  {
LABEL_13:
    v26 = (HMDCameraSnapshotIDSStreamInitiator *)_HMFPreconditionFailure();
    return [(HMDCameraSnapshotIDSStreamInitiator *)v26 initWithSessionID:v28 workQueue:v29 destinationID:v30 delegate:v31 delegateQueue:v32];
  }
  v33.receiver = self;
  v33.super_class = (Class)HMDCameraSnapshotIDSStreamInitiator;
  v21 = [(HMDCameraSnapshotIDSStream *)&v33 initWithSessionID:v14 workQueue:v15 proxyService:v16];
  v22 = v21;
  if (v21)
  {
    objc_storeWeak((id *)&v21->_delegate, v18);
    objc_storeStrong((id *)&v22->_delegateQueue, a8);
    uint64_t v23 = [v17 copy];
    destinationID = v22->_destinationID;
    v22->_destinationID = (NSString *)v23;
  }
  return v22;
}

- (HMDCameraSnapshotIDSStreamInitiator)initWithSessionID:(id)a3 workQueue:(id)a4 destinationID:(id)a5 delegate:(id)a6 delegateQueue:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (!v12)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  if (!v13)
  {
LABEL_7:
    _HMFPreconditionFailure();
    goto LABEL_8;
  }
  if (!v14)
  {
LABEL_8:
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  id v17 = v16;
  if (v16)
  {
    id v18 = +[HMDIDSServiceManager sharedManager];
    id v19 = [v18 proxyService];
    id v20 = [(HMDCameraSnapshotIDSStreamInitiator *)self initWithSessionID:v12 workQueue:v13 proxyService:v19 destinationID:v14 delegate:v15 delegateQueue:v17];

    return v20;
  }
LABEL_9:
  v22 = (void *)_HMFPreconditionFailure();
  return (HMDCameraSnapshotIDSStreamInitiator *)+[HMDCameraSnapshotIDSStreamInitiator logCategory];
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t3_189768 != -1) {
    dispatch_once(&logCategory__hmf_once_t3_189768, &__block_literal_global_189769);
  }
  v2 = (void *)logCategory__hmf_once_v4_189770;
  return v2;
}

uint64_t __50__HMDCameraSnapshotIDSStreamInitiator_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v4_189770;
  logCategory__hmf_once_v4_189770 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end