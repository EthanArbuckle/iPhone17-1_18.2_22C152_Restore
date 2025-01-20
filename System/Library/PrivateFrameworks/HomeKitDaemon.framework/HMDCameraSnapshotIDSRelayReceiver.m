@interface HMDCameraSnapshotIDSRelayReceiver
+ (id)logCategory;
- (HMDCameraIDSSessionInviterDeviceVerifier)sessionInviterDeviceVerifier;
- (HMDCameraSnapshotIDSRelayReceiver)initWithSessionID:(id)a3 logIdentifier:(id)a4 machOUUID:(id)a5 workQueue:(id)a6 sessionInviterDeviceVerifier:(id)a7 delegate:(id)a8;
- (HMDCameraSnapshotIDSRelayReceiverDelegate)delegate;
- (IDSSession)idsSession;
- (NSMutableData)expectedByteCountData;
- (NSMutableData)relayData;
- (NSUUID)machOUUID;
- (OS_dispatch_source)socketSource;
- (id)logIdentifier;
- (unint64_t)expectedByteCount;
- (unint64_t)receivedByteCount;
- (void)_didReceiveData:(id)a3 error:(id)a4;
- (void)_handleDataFromSocket:(id)a3;
- (void)_startDataReceive;
- (void)dealloc;
- (void)service:(id)a3 account:(id)a4 inviteReceivedForSession:(id)a5 fromID:(id)a6 withContext:(id)a7;
- (void)sessionEnded:(id)a3 withReason:(unsigned int)a4 error:(id)a5;
- (void)sessionStarted:(id)a3;
- (void)setExpectedByteCount:(unint64_t)a3;
- (void)setIdsSession:(id)a3;
- (void)setReceivedByteCount:(unint64_t)a3;
- (void)setSocketSource:(id)a3;
@end

@implementation HMDCameraSnapshotIDSRelayReceiver

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_socketSource, 0);
  objc_storeStrong((id *)&self->_expectedByteCountData, 0);
  objc_storeStrong((id *)&self->_relayData, 0);
  objc_storeStrong((id *)&self->_machOUUID, 0);
  objc_storeStrong((id *)&self->_sessionInviterDeviceVerifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_idsSession, 0);
  objc_storeStrong((id *)&self->_activity, 0);
}

- (void)setSocketSource:(id)a3
{
}

- (OS_dispatch_source)socketSource
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 120, 1);
}

- (void)setReceivedByteCount:(unint64_t)a3
{
  self->_receivedByteCount = a3;
}

- (unint64_t)receivedByteCount
{
  return self->_receivedByteCount;
}

- (void)setExpectedByteCount:(unint64_t)a3
{
  self->_expectedByteCount = a3;
}

- (unint64_t)expectedByteCount
{
  return self->_expectedByteCount;
}

- (NSMutableData)expectedByteCountData
{
  return (NSMutableData *)objc_getProperty(self, a2, 96, 1);
}

- (NSMutableData)relayData
{
  return (NSMutableData *)objc_getProperty(self, a2, 88, 1);
}

- (NSUUID)machOUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 80, 1);
}

- (HMDCameraIDSSessionInviterDeviceVerifier)sessionInviterDeviceVerifier
{
  return (HMDCameraIDSSessionInviterDeviceVerifier *)objc_getProperty(self, a2, 72, 1);
}

- (HMDCameraSnapshotIDSRelayReceiverDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDCameraSnapshotIDSRelayReceiverDelegate *)WeakRetained;
}

- (void)setIdsSession:(id)a3
{
}

- (IDSSession)idsSession
{
  return (IDSSession *)objc_getProperty(self, a2, 56, 1);
}

- (void)sessionEnded:(id)a3 withReason:(unsigned int)a4 error:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  [(HMFActivity *)self->_activity markWithReason:@"Session ended"];
  v10 = [(HMDCameraSnapshotIDSRelay *)self workQueue];
  dispatch_assert_queue_V2(v10);

  v11 = (void *)MEMORY[0x230FBD990]();
  v12 = self;
  v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = HMFGetLogIdentifier();
    int v15 = 138544130;
    v16 = v14;
    __int16 v17 = 2114;
    id v18 = v8;
    __int16 v19 = 1026;
    unsigned int v20 = a4;
    __int16 v21 = 2114;
    id v22 = v9;
    _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Session %{public}@ has ended with reason: %{public}u and error: %{public}@", (uint8_t *)&v15, 0x26u);
  }
  [(HMDCameraSnapshotIDSRelayReceiver *)v12 _didReceiveData:0 error:v9];
}

- (void)sessionStarted:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(HMFActivity *)self->_activity markWithReason:@"Session started"];
  v5 = [(HMDCameraSnapshotIDSRelay *)self workQueue];
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x230FBD990]();
  v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    int v11 = 138543618;
    v12 = v9;
    __int16 v13 = 2114;
    id v14 = v4;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Session %{public}@ has started", (uint8_t *)&v11, 0x16u);
  }
  v10 = [(HMDCameraSnapshotIDSRelayReceiver *)v7 delegate];
  [v10 relayReceiverIDSSessionDidStart:v7];

  [(HMDCameraSnapshotIDSRelayReceiver *)v7 _startDataReceive];
}

- (void)service:(id)a3 account:(id)a4 inviteReceivedForSession:(id)a5 fromID:(id)a6 withContext:(id)a7
{
  uint64_t v87 = *MEMORY[0x263EF8340];
  id v77 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v16 = [(HMDCameraSnapshotIDSRelay *)self workQueue];
  dispatch_assert_queue_V2(v16);

  __int16 v17 = +[HMDDeviceHandle deviceHandleForDestination:v14];
  if (!v17)
  {
    v49 = (void *)MEMORY[0x230FBD990]();
    v50 = self;
    v51 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
    {
      v52 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v82 = v52;
      __int16 v83 = 2112;
      id v84 = v14;
      v53 = "%{public}@Could not determine device handle for fromID: %@";
      v54 = v51;
      os_log_type_t v55 = OS_LOG_TYPE_ERROR;
LABEL_21:
      _os_log_impl(&dword_22F52A000, v54, v55, v53, buf, 0x16u);
    }
LABEL_22:

    goto LABEL_39;
  }
  id v18 = [(HMDCameraSnapshotIDSRelayReceiver *)self sessionInviterDeviceVerifier];
  char v19 = [v18 canAcceptInvitationFromDeviceWithHandle:v17];

  if ((v19 & 1) == 0)
  {
    v49 = (void *)MEMORY[0x230FBD990]();
    v50 = self;
    v51 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
    {
      v52 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v82 = v52;
      __int16 v83 = 2112;
      id v84 = v17;
      v53 = "%{public}@Ignoring invitation from %@";
      v54 = v51;
      os_log_type_t v55 = OS_LOG_TYPE_INFO;
      goto LABEL_21;
    }
    goto LABEL_22;
  }
  unsigned int v20 = (void *)MEMORY[0x263F08928];
  __int16 v21 = getIDSSessionOptionsAllowedClasses();
  id v78 = 0;
  id v22 = [v20 unarchivedObjectOfClasses:v21 fromData:v15 error:&v78];
  id v76 = v78;

  if (v22)
  {
    v75 = v22;
    id v23 = v22;
    objc_opt_class();
    int v24 = objc_opt_isKindOfClass() & 1;
    if (v24) {
      v25 = v23;
    }
    else {
      v25 = 0;
    }
    id v26 = v25;

    if (v24)
    {
      uint64_t v27 = [v23 objectForKeyedSubscript:@"kCameraSessionID"];
      v71 = (void *)v27;
      if (v27)
      {
        uint64_t v28 = v27;
        id v72 = v26;
        v29 = [(HMDCameraSnapshotIDSRelayReceiver *)self sessionInviterDeviceVerifier];
        char v30 = [v29 canAcceptInvitationForSessionWithIdentifier:v28];

        v31 = (void *)MEMORY[0x230FBD990]();
        v32 = self;
        v33 = HMFGetOSLogHandle();
        v34 = v33;
        if (v30)
        {
          if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
          {
            v35 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543874;
            v82 = v35;
            __int16 v83 = 2112;
            id v84 = v13;
            __int16 v85 = 2112;
            id v86 = v14;
            _os_log_impl(&dword_22F52A000, v34, OS_LOG_TYPE_INFO, "%{public}@Received invitation for session %@ from %@", buf, 0x20u);
          }
          [(HMFActivity *)v32->_activity markWithReason:@"Received invitation"];
          [(HMDCameraSnapshotIDSRelayReceiver *)v32 setIdsSession:v13];
          v36 = [(HMDCameraSnapshotIDSRelayReceiver *)v32 idsSession];
          v37 = [(HMDCameraSnapshotIDSRelay *)v32 workQueue];
          [v36 setDelegate:v32 queue:v37];

          v38 = [(HMDCameraSnapshotIDSRelayReceiver *)v32 machOUUID];

          if (v38)
          {
            v39 = [(HMDCameraSnapshotIDSRelayReceiver *)v32 idsSession];
            uint64_t v79 = *MEMORY[0x263F49FC8];
            v40 = [(HMDCameraSnapshotIDSRelayReceiver *)v32 machOUUID];
            v41 = [v40 UUIDString];
            v80 = v41;
            v42 = [NSDictionary dictionaryWithObjects:&v80 forKeys:&v79 count:1];
            [v39 setPreferences:v42];
          }
          v43 = [(HMDCameraSnapshotIDSRelayReceiver *)v32 idsSession];
          [v43 acceptInvitation];

          v44 = (void *)MEMORY[0x230FBD990]();
          v45 = v32;
          v46 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
          {
            v47 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            v82 = v47;
            _os_log_impl(&dword_22F52A000, v46, OS_LOG_TYPE_INFO, "%{public}@Accepted invitation", buf, 0xCu);
          }
          v48 = [(HMDCameraSnapshotIDSRelayReceiver *)v45 delegate];
          [v48 relayReceiverDidAcceptIDSInvitation:v45];
        }
        else
        {
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
          {
            v70 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v82 = v70;
            __int16 v83 = 2112;
            id v84 = v71;
            _os_log_impl(&dword_22F52A000, v34, OS_LOG_TYPE_DEBUG, "%{public}@Ignoring invitation for camera session ID: %@", buf, 0x16u);
          }
        }
        id v26 = v72;
      }
      else
      {
        v66 = (void *)MEMORY[0x230FBD990]();
        v67 = self;
        v68 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v69 = id v74 = v26;
          *(_DWORD *)buf = 138543618;
          v82 = v69;
          __int16 v83 = 2112;
          id v84 = v23;
          _os_log_impl(&dword_22F52A000, v68, OS_LOG_TYPE_ERROR, "%{public}@Could not find camera session ID in payload: %@", buf, 0x16u);

          id v26 = v74;
        }
      }
    }
    else
    {
      v60 = (void *)MEMORY[0x230FBD990]();
      v61 = self;
      v62 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v63 = id v73 = v26;
        v64 = objc_opt_class();
        *(_DWORD *)buf = 138543874;
        v82 = v63;
        __int16 v83 = 2112;
        id v84 = v23;
        __int16 v85 = 2112;
        id v86 = v64;
        id v65 = v64;
        _os_log_impl(&dword_22F52A000, v62, OS_LOG_TYPE_ERROR, "%{public}@Unarchived payload was not an NSDictionary: %@ (%@)", buf, 0x20u);

        id v26 = v73;
      }
    }
    id v22 = v75;
  }
  else
  {
    v56 = (void *)MEMORY[0x230FBD990]();
    v57 = self;
    v58 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
    {
      v59 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v82 = v59;
      __int16 v83 = 2112;
      id v84 = v76;
      _os_log_impl(&dword_22F52A000, v58, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive payload from context data: %@", buf, 0x16u);
    }
  }

LABEL_39:
}

- (void)_didReceiveData:(id)a3 error:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HMDCameraSnapshotIDSRelay *)self workQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = [(HMDCameraSnapshotIDSRelayReceiver *)self socketSource];

  if (v9)
  {
    v10 = [(HMDCameraSnapshotIDSRelayReceiver *)self socketSource];
    dispatch_source_cancel(v10);

    [(HMDCameraSnapshotIDSRelayReceiver *)self setSocketSource:0];
  }
  int v11 = [(HMDCameraSnapshotIDSRelayReceiver *)self delegate];
  [v11 relayReceiver:self didReceiveData:v7 error:v6];

  [(HMFActivity *)self->_activity invalidate];
  activity = self->_activity;
  self->_activity = 0;
}

- (void)dealloc
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x230FBD990](self, a2);
  id v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v12 = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Resetting the HMDCameraSnapshotIDSRelayReceiver", buf, 0xCu);
  }
  id v7 = [(HMDCameraSnapshotIDSRelayReceiver *)v4 idsSession];
  [v7 endSession];

  id v8 = [(HMDCameraSnapshotIDSRelayReceiver *)v4 socketSource];

  if (v8)
  {
    id v9 = [(HMDCameraSnapshotIDSRelayReceiver *)v4 socketSource];
    dispatch_source_cancel(v9);
  }
  v10.receiver = v4;
  v10.super_class = (Class)HMDCameraSnapshotIDSRelayReceiver;
  [(HMDCameraSnapshotIDSRelay *)&v10 dealloc];
}

- (void)_handleDataFromSocket:(id)a3
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HMDCameraSnapshotIDSRelay *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDCameraSnapshotIDSRelayReceiver *)self socketSource];

  if (!v6)
  {
    uint64_t v13 = (void *)MEMORY[0x230FBD990]();
    id v14 = self;
    id v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = HMFGetLogIdentifier();
      int v40 = 138543362;
      v41 = v16;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Socket source is already nil, rejecting the data from socket", (uint8_t *)&v40, 0xCu);
LABEL_20:
    }
LABEL_21:

    goto LABEL_22;
  }
  if (![(HMDCameraSnapshotIDSRelayReceiver *)self expectedByteCount])
  {
    id v7 = [(HMDCameraSnapshotIDSRelayReceiver *)self expectedByteCountData];
    unint64_t v8 = 8 - [v7 length];

    unint64_t v9 = [v4 length];
    objc_super v10 = [(HMDCameraSnapshotIDSRelayReceiver *)self expectedByteCountData];
    int v11 = v10;
    if (v9 <= v8)
    {
      [v10 appendData:v4];
    }
    else
    {
      id v12 = objc_msgSend(v4, "subdataWithRange:", 0, v8);
      [v11 appendData:v12];
    }
    __int16 v17 = [(HMDCameraSnapshotIDSRelayReceiver *)self expectedByteCountData];
    unint64_t v18 = [v17 length];

    if (v18 > 7)
    {
      id v19 = [(HMDCameraSnapshotIDSRelayReceiver *)self expectedByteCountData];
      -[HMDCameraSnapshotIDSRelayReceiver setExpectedByteCount:](self, "setExpectedByteCount:", *(void *)[v19 bytes]);

      unsigned int v20 = (void *)MEMORY[0x230FBD990]();
      __int16 v21 = self;
      id v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        id v23 = HMFGetLogIdentifier();
        int v40 = 138543618;
        v41 = v23;
        __int16 v42 = 2048;
        uint64_t v43 = [(HMDCameraSnapshotIDSRelayReceiver *)v21 expectedByteCount];
        _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_INFO, "%{public}@Setting expected byte count to %llu", (uint8_t *)&v40, 0x16u);
      }
      int v24 = (void *)[v4 mutableCopy];
      objc_msgSend(v24, "replaceBytesInRange:withBytes:length:", 0, 8, 0, 0);

      id v4 = v24;
      goto LABEL_12;
    }
    uint64_t v13 = (void *)MEMORY[0x230FBD990]();
    id v14 = self;
    id v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = HMFGetLogIdentifier();
      v39 = [(HMDCameraSnapshotIDSRelayReceiver *)v14 expectedByteCountData];
      int v40 = 138543618;
      v41 = v16;
      __int16 v42 = 2048;
      uint64_t v43 = [v39 length];
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Only received %lu bytes that represent the expected byte count so far; will wait for more",
        (uint8_t *)&v40,
        0x16u);

      goto LABEL_20;
    }
    goto LABEL_21;
  }
LABEL_12:
  v25 = [(HMDCameraSnapshotIDSRelayReceiver *)self relayData];
  [v25 appendData:v4];

  id v26 = (void *)MEMORY[0x230FBD990]();
  uint64_t v27 = self;
  uint64_t v28 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    v29 = HMFGetLogIdentifier();
    char v30 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[HMDCameraSnapshotIDSRelayReceiver receivedByteCount](v27, "receivedByteCount"));
    v31 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v4, "length") + -[HMDCameraSnapshotIDSRelayReceiver receivedByteCount](v27, "receivedByteCount"));
    int v40 = 138543874;
    v41 = v29;
    __int16 v42 = 2112;
    uint64_t v43 = (uint64_t)v30;
    __int16 v44 = 2112;
    v45 = v31;
    _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_INFO, "%{public}@Updating received byte count from %@ to %@", (uint8_t *)&v40, 0x20u);
  }
  -[HMDCameraSnapshotIDSRelayReceiver setReceivedByteCount:](v27, "setReceivedByteCount:", -[HMDCameraSnapshotIDSRelayReceiver receivedByteCount](v27, "receivedByteCount") + [v4 length]);
  uint64_t v32 = [(HMDCameraSnapshotIDSRelayReceiver *)v27 receivedByteCount];
  if (v32 == [(HMDCameraSnapshotIDSRelayReceiver *)v27 expectedByteCount])
  {
    v33 = (void *)MEMORY[0x230FBD990]();
    v34 = v27;
    v35 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      v36 = HMFGetLogIdentifier();
      int v40 = 138543362;
      v41 = v36;
      _os_log_impl(&dword_22F52A000, v35, OS_LOG_TYPE_INFO, "%{public}@All the bytes have been received, file transfer is complete", (uint8_t *)&v40, 0xCu);
    }
    v37 = [(HMDCameraSnapshotIDSRelayReceiver *)v34 relayData];
    v38 = (void *)[v37 copy];
    [(HMDCameraSnapshotIDSRelayReceiver *)v34 _didReceiveData:v38 error:0];
  }
LABEL_22:
}

- (void)_startDataReceive
{
  v3 = [(HMDCameraSnapshotIDSRelay *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDCameraSnapshotIDSRelayReceiver *)self idsSession];
  uintptr_t v5 = (int)[v4 socket];
  id v6 = [(HMDCameraSnapshotIDSRelay *)self workQueue];
  dispatch_source_t v7 = dispatch_source_create(MEMORY[0x263EF83E8], v5, 0, v6);
  [(HMDCameraSnapshotIDSRelayReceiver *)self setSocketSource:v7];

  objc_initWeak(&location, self);
  unint64_t v8 = [(HMDCameraSnapshotIDSRelayReceiver *)self socketSource];
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  id v12 = __54__HMDCameraSnapshotIDSRelayReceiver__startDataReceive__block_invoke;
  uint64_t v13 = &unk_264A2C170;
  objc_copyWeak(&v14, &location);
  dispatch_source_set_event_handler(v8, &v10);

  unint64_t v9 = [(HMDCameraSnapshotIDSRelayReceiver *)self socketSource];
  dispatch_resume(v9);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __54__HMDCameraSnapshotIDSRelayReceiver__startDataReceive__block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained idsSession];
  ssize_t v3 = recvfrom([v2 socket], v13, 0x400uLL, 0, 0, 0);

  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = WeakRetained;
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    dispatch_source_t v7 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v15 = v7;
    __int16 v16 = 2048;
    ssize_t v17 = v3;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Received data of length %ld", buf, 0x16u);
  }
  if (v3)
  {
    if (v3 < 1)
    {
      unint64_t v9 = (void *)MEMORY[0x230FBD990]();
      id v10 = v5;
      uint64_t v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        id v12 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        id v15 = v12;
        _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@Recv from socket returned error, aborting the file receive", buf, 0xCu);
      }
      unint64_t v8 = [MEMORY[0x263F087E8] hmInternalErrorWithCode:1032];
      [v10 _didReceiveData:0 error:v8];
    }
    else
    {
      unint64_t v8 = [MEMORY[0x263EFF8F8] dataWithBytes:v13 length:v3];
      [v5 _handleDataFromSocket:v8];
    }
  }
}

- (id)logIdentifier
{
  v2 = [(HMDCameraSnapshotIDSRelay *)self sessionID];
  ssize_t v3 = [v2 description];

  return v3;
}

- (HMDCameraSnapshotIDSRelayReceiver)initWithSessionID:(id)a3 logIdentifier:(id)a4 machOUUID:(id)a5 workQueue:(id)a6 sessionInviterDeviceVerifier:(id)a7 delegate:(id)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a7;
  id v17 = a8;
  v34.receiver = self;
  v34.super_class = (Class)HMDCameraSnapshotIDSRelayReceiver;
  uint64_t v18 = [(HMDCameraSnapshotIDSRelay *)&v34 initWithSessionID:v14 logIdentifier:a4 workQueue:a6];
  if (v18)
  {
    id v19 = objc_alloc(MEMORY[0x263F424F0]);
    unsigned int v20 = NSString;
    __int16 v21 = (objc_class *)objc_opt_class();
    id v22 = NSStringFromClass(v21);
    [v14 UUIDString];
    id v33 = v16;
    v24 = id v23 = v15;
    v25 = [v20 stringWithFormat:@"%@ (%@)", v22, v24];
    uint64_t v26 = [v19 initWithName:v25 parent:0 options:16];
    activity = v18->_activity;
    v18->_activity = (HMFActivity *)v26;

    objc_storeStrong((id *)&v18->_machOUUID, a5);
    objc_storeWeak((id *)&v18->_delegate, v17);
    uint64_t v28 = [MEMORY[0x263EFF990] data];
    relayData = v18->_relayData;
    v18->_relayData = (NSMutableData *)v28;

    id v15 = v23;
    id v16 = v33;
    uint64_t v30 = [MEMORY[0x263EFF990] data];
    expectedByteCountData = v18->_expectedByteCountData;
    v18->_expectedByteCountData = (NSMutableData *)v30;

    objc_storeStrong((id *)&v18->_sessionInviterDeviceVerifier, a7);
  }

  return v18;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_246295 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_246295, &__block_literal_global_246296);
  }
  v2 = (void *)logCategory__hmf_once_v1_246297;
  return v2;
}

void __48__HMDCameraSnapshotIDSRelayReceiver_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v1_246297;
  logCategory__hmf_once_v1_246297 = v0;
}

@end