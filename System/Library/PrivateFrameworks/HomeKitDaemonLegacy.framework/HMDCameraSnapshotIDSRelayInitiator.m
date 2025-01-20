@interface HMDCameraSnapshotIDSRelayInitiator
+ (id)logCategory;
- (BOOL)idsSessionStarted;
- (HMDCameraSnapshotIDSRelayInitiator)initWithSessionID:(id)a3 logIdentifier:(id)a4 workQueue:(id)a5 device:(id)a6 delegate:(id)a7;
- (HMDCameraSnapshotIDSRelayInitiatorDelegate)delegate;
- (HMDDevice)device;
- (IDSSession)idsSession;
- (NSMutableData)data;
- (OS_dispatch_source)socketSource;
- (void)_callFileTransferFailed:(id)a3;
- (void)_sendData;
- (void)_startDataTransfer;
- (void)dealloc;
- (void)sendData:(id)a3;
- (void)sendIDSInvitation;
- (void)session:(id)a3 receivedInvitationAcceptFromID:(id)a4;
- (void)session:(id)a3 receivedInvitationCancelFromID:(id)a4;
- (void)session:(id)a3 receivedInvitationDeclineFromID:(id)a4;
- (void)sessionEnded:(id)a3 withReason:(unsigned int)a4 error:(id)a5;
- (void)sessionStarted:(id)a3;
- (void)setData:(id)a3;
- (void)setIdsSession:(id)a3;
- (void)setIdsSessionStarted:(BOOL)a3;
- (void)setSocketSource:(id)a3;
@end

@implementation HMDCameraSnapshotIDSRelayInitiator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_socketSource, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_idsSession, 0);
  objc_storeStrong((id *)&self->_activity, 0);
}

- (void)setSocketSource:(id)a3
{
}

- (OS_dispatch_source)socketSource
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 96, 1);
}

- (void)setData:(id)a3
{
}

- (NSMutableData)data
{
  return (NSMutableData *)objc_getProperty(self, a2, 88, 1);
}

- (HMDDevice)device
{
  return (HMDDevice *)objc_getProperty(self, a2, 80, 1);
}

- (void)setIdsSessionStarted:(BOOL)a3
{
  self->_idsSessionStarted = a3;
}

- (BOOL)idsSessionStarted
{
  return self->_idsSessionStarted;
}

- (HMDCameraSnapshotIDSRelayInitiatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDCameraSnapshotIDSRelayInitiatorDelegate *)WeakRetained;
}

- (void)setIdsSession:(id)a3
{
}

- (IDSSession)idsSession
{
  return (IDSSession *)objc_getProperty(self, a2, 64, 1);
}

- (void)_callFileTransferFailed:(id)a3
{
  id v4 = a3;
  v5 = [(HMDCameraSnapshotIDSRelay *)self workQueue];
  dispatch_assert_queue_V2(v5);

  v6 = [(HMDCameraSnapshotIDSRelayInitiator *)self socketSource];

  if (v6)
  {
    v7 = [(HMDCameraSnapshotIDSRelayInitiator *)self socketSource];
    dispatch_source_cancel(v7);

    [(HMDCameraSnapshotIDSRelayInitiator *)self setSocketSource:0];
  }
  v8 = [(HMDCameraSnapshotIDSRelayInitiator *)self delegate];
  [v8 relayInitiator:self didEndIDSSessionWithError:v4];

  [(HMFActivity *)self->_activity invalidate];
  activity = self->_activity;
  self->_activity = 0;
}

- (void)sessionEnded:(id)a3 withReason:(unsigned int)a4 error:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  [(HMFActivity *)self->_activity markWithReason:@"Session Ended"];
  v10 = [(HMDCameraSnapshotIDSRelay *)self workQueue];
  dispatch_assert_queue_V2(v10);

  v11 = (void *)MEMORY[0x1D9452090]();
  v12 = self;
  v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = HMFGetLogIdentifier();
    int v16 = 138544130;
    v17 = v14;
    __int16 v18 = 2114;
    id v19 = v8;
    __int16 v20 = 1026;
    unsigned int v21 = a4;
    __int16 v22 = 2114;
    id v23 = v9;
    _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@IDSSession %{public}@ has ended with reason: %{public}u and error %{public}@", (uint8_t *)&v16, 0x26u);
  }
  v15 = [MEMORY[0x1E4F28C58] hmInternalErrorWithCode:1030 underlyingError:v9];
  [(HMDCameraSnapshotIDSRelayInitiator *)v12 _callFileTransferFailed:v15];
}

- (void)sessionStarted:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(HMFActivity *)self->_activity markWithReason:@"Session Started"];
  v5 = [(HMDCameraSnapshotIDSRelay *)self workQueue];
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x1D9452090]();
  v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    int v11 = 138543618;
    v12 = v9;
    __int16 v13 = 2114;
    id v14 = v4;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@IDSSession %{public}@ has started", (uint8_t *)&v11, 0x16u);
  }
  v10 = [(HMDCameraSnapshotIDSRelayInitiator *)v7 delegate];
  [v10 relayInitiatorIDSSessionDidStart:v7];

  [(HMDCameraSnapshotIDSRelayInitiator *)v7 setIdsSessionStarted:1];
  [(HMDCameraSnapshotIDSRelayInitiator *)v7 _sendData];
}

- (void)session:(id)a3 receivedInvitationCancelFromID:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDCameraSnapshotIDSRelay *)self workQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = (void *)MEMORY[0x1D9452090]();
  v10 = self;
  int v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = HMFGetLogIdentifier();
    int v14 = 138543874;
    uint64_t v15 = v12;
    __int16 v16 = 2112;
    id v17 = v6;
    __int16 v18 = 2112;
    id v19 = v7;
    _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Invitation for IDSSession %@ was canceled by: %@", (uint8_t *)&v14, 0x20u);
  }
  __int16 v13 = [MEMORY[0x1E4F28C58] hmInternalErrorWithCode:1029];
  [(HMDCameraSnapshotIDSRelayInitiator *)v10 _callFileTransferFailed:v13];
}

- (void)session:(id)a3 receivedInvitationDeclineFromID:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDCameraSnapshotIDSRelay *)self workQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = (void *)MEMORY[0x1D9452090]();
  v10 = self;
  int v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = HMFGetLogIdentifier();
    int v14 = 138543874;
    uint64_t v15 = v12;
    __int16 v16 = 2112;
    id v17 = v6;
    __int16 v18 = 2112;
    id v19 = v7;
    _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Invitation for IDSSession %@ has been declined by: %@", (uint8_t *)&v14, 0x20u);
  }
  __int16 v13 = [MEMORY[0x1E4F28C58] hmInternalErrorWithCode:1028];
  [(HMDCameraSnapshotIDSRelayInitiator *)v10 _callFileTransferFailed:v13];
}

- (void)session:(id)a3 receivedInvitationAcceptFromID:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDCameraSnapshotIDSRelay *)self workQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = (void *)MEMORY[0x1D9452090]();
  v10 = self;
  int v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = HMFGetLogIdentifier();
    int v13 = 138543874;
    int v14 = v12;
    __int16 v15 = 2114;
    id v16 = v6;
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Invitation for IDSSession %{public}@ has been accepted by: %@, waiting for session to get started", (uint8_t *)&v13, 0x20u);
  }
}

- (void)dealloc
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1D9452090](self, a2);
  id v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v12 = v6;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Resetting the HMDCameraSnapshotIDSRelayInitiator", buf, 0xCu);
  }
  id v7 = [(HMDCameraSnapshotIDSRelayInitiator *)v4 idsSession];
  [v7 endSession];

  id v8 = [(HMDCameraSnapshotIDSRelayInitiator *)v4 socketSource];

  if (v8)
  {
    id v9 = [(HMDCameraSnapshotIDSRelayInitiator *)v4 socketSource];
    dispatch_source_cancel(v9);
  }
  v10.receiver = v4;
  v10.super_class = (Class)HMDCameraSnapshotIDSRelayInitiator;
  [(HMDCameraSnapshotIDSRelay *)&v10 dealloc];
}

- (void)_startDataTransfer
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = [(HMDCameraSnapshotIDSRelay *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDCameraSnapshotIDSRelayInitiator *)self delegate];
  [v4 relayInitiatorDidStartDataSend:self];

  v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    id v9 = [(HMDCameraSnapshotIDSRelayInitiator *)v6 data];
    *(_DWORD *)buf = 138543618;
    uint64_t v19 = v8;
    __int16 v20 = 2048;
    uint64_t v21 = [v9 length];
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Total number of bytes to send: %tu", buf, 0x16u);
  }
  objc_super v10 = [(HMDCameraSnapshotIDSRelayInitiator *)v6 idsSession];
  int v11 = [v10 socket];
  v12 = [(HMDCameraSnapshotIDSRelay *)v6 workQueue];
  dispatch_source_t v13 = dispatch_source_create(MEMORY[0x1E4F144B0], v11, 0, v12);
  [(HMDCameraSnapshotIDSRelayInitiator *)v6 setSocketSource:v13];

  objc_initWeak((id *)buf, v6);
  int v14 = [(HMDCameraSnapshotIDSRelayInitiator *)v6 socketSource];
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __56__HMDCameraSnapshotIDSRelayInitiator__startDataTransfer__block_invoke;
  handler[3] = &unk_1E6A16E40;
  objc_copyWeak(&v17, (id *)buf);
  dispatch_source_set_event_handler(v14, handler);

  __int16 v15 = [(HMDCameraSnapshotIDSRelayInitiator *)v6 socketSource];
  dispatch_resume(v15);

  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);
}

void __56__HMDCameraSnapshotIDSRelayInitiator__startDataTransfer__block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = [WeakRetained data];
    if ((unint64_t)[v3 length] > 0x3FF)
    {
      size_t v5 = 1024;
    }
    else
    {
      id v4 = [v2 data];
      size_t v5 = [v4 length];
    }
    id v6 = [v2 idsSession];
    int v7 = [v6 socket];
    id v8 = [v2 data];
    ssize_t v9 = send(v7, (const void *)[v8 bytes], v5, 0);

    objc_super v10 = (void *)MEMORY[0x1D9452090]();
    int v11 = v2;
    v12 = HMFGetOSLogHandle();
    dispatch_source_t v13 = v12;
    if (v9 == -1)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v25 = HMFGetLogIdentifier();
        int v26 = 138543618;
        v27 = v25;
        __int16 v28 = 2048;
        size_t v29 = v5;
        _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to send the data of size %tu", (uint8_t *)&v26, 0x16u);
      }
      id v24 = [MEMORY[0x1E4F28C58] hmInternalErrorWithCode:1025];
      [v11 _callFileTransferFailed:v24];
      goto LABEL_15;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v14 = HMFGetLogIdentifier();
      int v26 = 138543618;
      v27 = v14;
      __int16 v28 = 2048;
      size_t v29 = v9;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Sent %lu bytes", (uint8_t *)&v26, 0x16u);
    }
    __int16 v15 = [v11 data];
    objc_msgSend(v15, "replaceBytesInRange:withBytes:length:", 0, v9, 0, 0);

    id v16 = [v11 data];
    uint64_t v17 = [v16 length];

    if (!v17)
    {
      id v18 = (void *)MEMORY[0x1D9452090]([v11[6] markWithReason:@"Transfer completed"]);
      uint64_t v19 = v11;
      __int16 v20 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        uint64_t v21 = HMFGetLogIdentifier();
        int v26 = 138543362;
        v27 = v21;
        _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_INFO, "%{public}@File transfer is complete with total transferred bytes", (uint8_t *)&v26, 0xCu);
      }
      uint64_t v22 = [v19 delegate];
      [v22 relayInitiatorDidSendDataSuccessfully:v19];

      id v23 = [v19 socketSource];
      dispatch_source_cancel(v23);

      [v19 setSocketSource:0];
      [v11[6] invalidate];
      id v24 = v11[6];
      v11[6] = 0;
LABEL_15:
    }
  }
}

- (void)sendIDSInvitation
{
  v39[3] = *MEMORY[0x1E4F143B8];
  v3 = [(HMDCameraSnapshotIDSRelay *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDCameraSnapshotIDSRelay *)self idsStreamService];
  size_t v5 = [v4 accounts];

  if ([v5 count] && (objc_msgSend(v5, "anyObject"), (uint64_t v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    int v7 = (void *)v6;
    uint64_t v8 = *MEMORY[0x1E4F6AAB0];
    v38[0] = *MEMORY[0x1E4F6AAB8];
    v38[1] = v8;
    v39[0] = &unk_1F2DC9C10;
    v39[1] = MEMORY[0x1E4F1CC28];
    v38[2] = *MEMORY[0x1E4F6AA90];
    v39[2] = &unk_1F2DC9C28;
    ssize_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:3];
    objc_super v10 = (void *)MEMORY[0x1E4F6ABA0];
    int v11 = [(HMDCameraSnapshotIDSRelayInitiator *)self device];
    v12 = objc_msgSend(v10, "hmd_sessionWithAccount:device:options:", v7, v11, v9);
    [(HMDCameraSnapshotIDSRelayInitiator *)self setIdsSession:v12];

    dispatch_source_t v13 = [(HMDCameraSnapshotIDSRelayInitiator *)self idsSession];
    int v14 = [(HMDCameraSnapshotIDSRelay *)self workQueue];
    [v13 setDelegate:self queue:v14];

    __int16 v15 = (void *)MEMORY[0x1D9452090]();
    id v16 = self;
    uint64_t v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      id v18 = HMFGetLogIdentifier();
      uint64_t v19 = [(HMDCameraSnapshotIDSRelayInitiator *)v16 idsSession];
      __int16 v20 = [(HMDCameraSnapshotIDSRelayInitiator *)v16 device];
      uint64_t v21 = [v20 shortDescription];
      *(_DWORD *)buf = 138544130;
      v31 = v18;
      __int16 v32 = 2112;
      v33 = v19;
      __int16 v34 = 2112;
      v35 = v21;
      __int16 v36 = 2112;
      v37 = v9;
      _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_INFO, "%{public}@Sending out invitation for IDSSession %@ to device %@ with options: %@", buf, 0x2Au);
    }
    uint64_t v22 = [(HMDCameraSnapshotIDSRelay *)v16 sessionID];
    id v23 = [v22 UUIDString];
    size_t v29 = v23;
    id v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];

    v25 = encodeRootObject();
    int v26 = [(HMDCameraSnapshotIDSRelayInitiator *)v16 idsSession];
    [v26 sendInvitationWithData:v25];

    v27 = [(HMDCameraSnapshotIDSRelayInitiator *)v16 delegate];
    [v27 relayInitiatorDidSendIDSInvitation:v16];
  }
  else
  {
    int v7 = [MEMORY[0x1E4F28C58] hmInternalErrorWithCode:1024];
    [(HMDCameraSnapshotIDSRelayInitiator *)self _callFileTransferFailed:v7];
  }
}

- (void)_sendData
{
  v3 = [(HMDCameraSnapshotIDSRelay *)self workQueue];
  dispatch_assert_queue_V2(v3);

  if ([(HMDCameraSnapshotIDSRelayInitiator *)self idsSessionStarted])
  {
    id v4 = [(HMDCameraSnapshotIDSRelayInitiator *)self data];

    if (v4)
    {
      [(HMDCameraSnapshotIDSRelayInitiator *)self _startDataTransfer];
    }
  }
}

- (void)sendData:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  size_t v5 = [(HMDCameraSnapshotIDSRelay *)self workQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = [(HMDCameraSnapshotIDSRelayInitiator *)self data];

  if (v6)
  {
    int v7 = (void *)MEMORY[0x1D9452090]();
    uint64_t v8 = self;
    ssize_t v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_super v10 = HMFGetLogIdentifier();
      *(_DWORD *)int v14 = 138543362;
      *(void *)&v14[4] = v10;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_ERROR, "%{public}@Data send already in progress", v14, 0xCu);
    }
  }
  else
  {
    *(void *)int v14 = [v4 length];
    int v11 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v14 length:8];
    v12 = (void *)[v11 mutableCopy];
    [(HMDCameraSnapshotIDSRelayInitiator *)self setData:v12];

    dispatch_source_t v13 = [(HMDCameraSnapshotIDSRelayInitiator *)self data];
    [v13 appendData:v4];

    [(HMDCameraSnapshotIDSRelayInitiator *)self _sendData];
  }
}

- (HMDCameraSnapshotIDSRelayInitiator)initWithSessionID:(id)a3 logIdentifier:(id)a4 workQueue:(id)a5 device:(id)a6 delegate:(id)a7
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  v25.receiver = self;
  v25.super_class = (Class)HMDCameraSnapshotIDSRelayInitiator;
  uint64_t v15 = [(HMDCameraSnapshotIDSRelay *)&v25 initWithSessionID:v12 logIdentifier:a4 workQueue:a5];
  if (v15)
  {
    id v16 = objc_alloc(MEMORY[0x1E4F653F0]);
    uint64_t v17 = NSString;
    id v18 = (objc_class *)objc_opt_class();
    uint64_t v19 = NSStringFromClass(v18);
    __int16 v20 = [v12 UUIDString];
    uint64_t v21 = [v17 stringWithFormat:@"%@ (%@)", v19, v20];
    uint64_t v22 = [v16 initWithName:v21 parent:0 options:16];
    activity = v15->_activity;
    v15->_activity = (HMFActivity *)v22;

    objc_storeWeak((id *)&v15->_delegate, v14);
    objc_storeStrong((id *)&v15->_device, a6);
    v15->_idsSessionStarted = 0;
  }

  return v15;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_167231 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_167231, &__block_literal_global_167232);
  }
  v2 = (void *)logCategory__hmf_once_v1_167233;
  return v2;
}

uint64_t __49__HMDCameraSnapshotIDSRelayInitiator_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v1_167233;
  logCategory__hmf_once_v1_167233 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end