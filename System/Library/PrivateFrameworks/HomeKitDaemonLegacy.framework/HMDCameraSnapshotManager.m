@interface HMDCameraSnapshotManager
+ (id)logCategory;
+ (void)cleanStaleSnapshotDirectoriesUsingCurrentAccessories:(id)a3;
- (HMDCameraSnapshotManager)initWithAccessory:(id)a3 workQueue:(id)a4 streamSnapshotHandler:(id)a5 uniqueIdentifier:(id)a6 msgDispatcher:(id)a7 networkMonitor:(id)a8;
- (HMDCameraSnapshotManager)initWithAccessory:(id)a3 workQueue:(id)a4 streamSnapshotHandler:(id)a5 uniqueIdentifier:(id)a6 msgDispatcher:(id)a7 networkMonitor:(id)a8 logIdentifier:(id)a9 imageCacheDirectory:(id)a10 residentMessageHandler:(id)a11 snapshotSlotManager:(id)a12 dataSource:(id)a13;
- (NSDictionary)encodedMostRecentSnapshot;
- (NSString)logIdentifier;
- (NSUUID)uniqueIdentifier;
- (OS_dispatch_queue)workQueue;
- (id)_createSnapshotSessionIDWithMessage:(void *)a3 error:;
- (id)_sessionWithID:(id *)a1;
- (id)accessory;
- (void)_endSession:(void *)a3 error:;
- (void)_handleCreateSnapshotFromBulletinContextMessage:(id)a3;
- (void)_handleFillSnapshotSlotMessage:(id)a3;
- (void)_handleReleaseSnapshotMessage:(id)a3;
- (void)_handleRemoteSnapshotReceivedMessage:(id)a3;
- (void)_handleTakeRemoteSnapshotFailureMessage:(id)a3;
- (void)_handleTakeRemoteSnapshotMessage:(id)a3;
- (void)_handleTakeSnapshotMessage:(id)a3;
- (void)_issueGetSnapshot:(void *)a1;
- (void)_removeAllPendingRequests:(uint64_t)a1;
- (void)_sendRemoteResponse:(void *)a3 sessionID:;
- (void)_sendResponse:(void *)a3 error:(void *)a4 sessionID:;
- (void)_sendSnapshotRequestRelayReceiver:(void *)a3 snapshotSessionID:;
- (void)_sendSnapshotRequestStreamReceiver:(void *)a3 snapshotSessionID:;
- (void)dealloc;
- (void)handleAccessoryUnconfigured:(id)a3;
- (void)handleCameraSettingsDidChangeNotification:(id)a3;
- (void)registerForMessages;
- (void)releaseSnapshotWithSlotIdentifier:(id)a3;
- (void)snapshotLocal:(id)a3 didSaveSnapshotFile:(id)a4 error:(id)a5 sessionID:(id)a6;
- (void)snapshotRelayReceiver:(id)a3 didSaveSnapshotFile:(id)a4 error:(id)a5 sessionID:(id)a6;
- (void)snapshotRelayReceiver:(id)a3 didStartGettingImage:(id)a4 sessionID:(id)a5;
- (void)snapshotRelaySender:(id)a3 didCompleteSendImage:(id)a4 sessionID:(id)a5;
- (void)snapshotRelaySender:(id)a3 didSaveSnapshotFile:(id)a4 sessionID:(id)a5;
- (void)snapshotRelaySender:(id)a3 didStartCaptureImage:(id)a4 sessionID:(id)a5;
- (void)snapshotRelayStream:(id)a3 didCompleteSendImage:(id)a4 sessionID:(id)a5;
- (void)snapshotRelayStream:(id)a3 didStartCaptureImage:(id)a4 sessionID:(id)a5;
- (void)snapshotStreamReceiver:(id)a3 didSaveSnapshotFile:(id)a4 error:(id)a5 sessionID:(id)a6;
- (void)snapshotStreamReceiver:(id)a3 didStartGettingImage:(id)a4 sessionID:(id)a5;
- (void)snapshotStreamSender:(id)a3 didCompleteSendImage:(id)a4 sessionID:(id)a5;
- (void)snapshotStreamSender:(id)a3 didStartCaptureImage:(id)a4 sessionID:(id)a5;
- (void)streamSnapshotHandler:(id)a3 didChangeStreamSetupInProgress:(BOOL)a4;
- (void)streamSnapshotHandler:(id)a3 didGetLastSnapshot:(id)a4;
- (void)streamSnapshotHandler:(id)a3 didGetNewSnapshot:(id)a4;
- (void)takeSnapshot:(id)a3;
- (void)timerDidFire:(id)a3;
@end

@implementation HMDCameraSnapshotManager

- (NSString)logIdentifier
{
  return self->_logIdentifier;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t74 != -1) {
    dispatch_once(&logCategory__hmf_once_t74, &__block_literal_global_112_104537);
  }
  v2 = (void *)logCategory__hmf_once_v75;
  return v2;
}

- (id)_createSnapshotSessionIDWithMessage:(void *)a3 error:
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 6);
    v7 = [[HMDCameraSnapshotSessionID alloc] initWithAccessory:WeakRetained message:v5];
    if (!v7)
    {
      v16 = (void *)MEMORY[0x1D9452090]();
      v17 = a1;
      v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v19 = HMFGetLogIdentifier();
        int v25 = 138543618;
        v26 = v19;
        __int16 v27 = 2112;
        id v28 = v5;
        _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_ERROR, "%{public}@Unable to create snapshot session identifier for: %@", (uint8_t *)&v25, 0x16u);
      }
      if (a3)
      {
        [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
        a1 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        a1 = 0;
      }
      goto LABEL_18;
    }
    v8 = [WeakRetained cameraProfiles];
    v9 = [v8 anyObject];
    v10 = [v9 currentSettings];

    if (v10)
    {
      [v10 currentAccessMode];
      if ((HMAreSnapshotsAllowedForCameraAccessMode() & 1) == 0)
      {
        v11 = (void *)MEMORY[0x1D9452090]();
        v12 = a1;
        v13 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          v14 = HMFGetLogIdentifier();
          v15 = HMCameraAccessModeAsString();
          int v25 = 138543618;
          v26 = v14;
          __int16 v27 = 2112;
          id v28 = v15;
          _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Snapshots are not allowed for camera access mode: %@", (uint8_t *)&v25, 0x16u);
        }
        if (a3)
        {
          [MEMORY[0x1E4F28C58] hmErrorWithCode:10];
          a1 = 0;
          *a3 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          a1 = 0;
        }
        goto LABEL_17;
      }
    }
    else
    {
      v20 = (void *)MEMORY[0x1D9452090]();
      v21 = a1;
      v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        v23 = HMFGetLogIdentifier();
        int v25 = 138543362;
        v26 = v23;
        _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_INFO, "%{public}@Camera profile settings is not initialized, skipping controller side checks to disallow snapshot requests", (uint8_t *)&v25, 0xCu);
      }
    }
    a1 = v7;
LABEL_17:

LABEL_18:
  }

  return a1;
}

- (NSDictionary)encodedMostRecentSnapshot
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (self) {
    snapshotSlotManager = self->_snapshotSlotManager;
  }
  else {
    snapshotSlotManager = 0;
  }
  v4 = snapshotSlotManager;
  id v5 = [(HMDSnapshotSlotManager *)v4 encodedMostRecentSnapshot];

  v6 = (void *)MEMORY[0x1D9452090]();
  v7 = self;
  v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = HMFGetLogIdentifier();
    int v11 = 138543618;
    v12 = v9;
    __int16 v13 = 2112;
    v14 = v5;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Responding to most recent snapshot with payload: %@", (uint8_t *)&v11, 0x16u);
  }
  return (NSDictionary *)v5;
}

- (NSUUID)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)snapshotLocal:(id)a3 didSaveSnapshotFile:(id)a4 error:(id)a5 sessionID:(id)a6
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = (void *)MEMORY[0x1D9452090]();
  uint64_t v15 = self;
  v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v17 = HMFGetLogIdentifier();
    int v18 = 138543874;
    v19 = v17;
    __int16 v20 = 2112;
    id v21 = v13;
    __int16 v22 = 2112;
    id v23 = v12;
    _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_INFO, "%{public}@%@ Received HMDCameraSnapshotLocalDelegate call back that the image has been saved %@", (uint8_t *)&v18, 0x20u);
  }
  -[HMDCameraSnapshotManager _sendResponse:error:sessionID:]((uint64_t)v15, v11, v12, v13);
}

- (void)_endSession:(void *)a3 error:
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    id v7 = a1[4];
    v8 = [v7 sessionID];
    int v9 = [v8 isEqual:v5];

    id v10 = (void *)MEMORY[0x1D9452090]();
    id v11 = a1;
    id v12 = HMFGetOSLogHandle();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
    if (v9)
    {
      if (v13)
      {
        v14 = HMFGetLogIdentifier();
        int v17 = 138543618;
        int v18 = v14;
        __int16 v19 = 2112;
        id v20 = v5;
        _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@Resetting local session %@", (uint8_t *)&v17, 0x16u);
      }
      [v11[4] respond:v6 payload:0];
      id v15 = v11[4];
      v11[4] = 0;
    }
    else
    {
      if (v13)
      {
        v16 = HMFGetLogIdentifier();
        int v17 = 138543618;
        int v18 = v16;
        __int16 v19 = 2112;
        id v20 = v5;
        _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@Resetting remote session %@", (uint8_t *)&v17, 0x16u);
      }
      id v15 = [v11[5] objectForKeyedSubscript:v5];
      [v15 respond:v6 payload:0];
      [v11[5] removeObjectForKey:v5];
    }
  }
}

- (void)_sendResponse:(void *)a3 error:(void *)a4 sessionID:
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    id v10 = -[HMDCameraSnapshotManager _sessionWithID:]((id *)a1, v9);
    id v11 = v10;
    if (v10)
    {
      uint64_t v29 = v10;
      id v30 = v9;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v12 = [v10 sessionMessages];
      uint64_t v13 = [v12 countByEnumeratingWithState:&v31 objects:v35 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v32;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v32 != v15) {
              objc_enumerationMutation(v12);
            }
            int v17 = [*(id *)(*((void *)&v31 + 1) + 8 * i) stringForKey:@"kCameraProactiveSessionID"];
            if (v17)
            {
              int v18 = *(void **)(a1 + 80);
              if (v8) {
                [v18 removeSnapshotFileToCache:v17 error:v8];
              }
              else {
                [v18 setSnapshotFileToCache:v7 snapshotCharacteristicEventUUID:v17];
              }
            }
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v31 objects:v35 count:16];
        }
        while (v14);
      }

      if (v8)
      {
        id v11 = v29;
        [v29 respond:v8 payload:0];
        __int16 v19 = (id *)a1;
        id v9 = v30;
        id v20 = v30;
        uint64_t v21 = v8;
      }
      else
      {
        id v26 = *(id *)(a1 + 88);
        id v11 = v29;
        __int16 v27 = [v29 sessionMessages];
        id v28 = [v26 createSlotForSnapshotFile:v7 requestMessages:v27 shouldNotifyClients:1];

        [v29 respond:0 payload:v28];
        __int16 v19 = (id *)a1;
        id v9 = v30;
        id v20 = v30;
        uint64_t v21 = 0;
      }
      -[HMDCameraSnapshotManager _endSession:error:](v19, v20, v21);
    }
    else
    {
      __int16 v22 = (void *)MEMORY[0x1D9452090]();
      id v23 = (id)a1;
      uint64_t v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        int v25 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v37 = v25;
        __int16 v38 = 2112;
        id v39 = v9;
        _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_ERROR, "%{public}@Received a delegate call back for an unknown session ID: %@", buf, 0x16u);
      }
    }
  }
}

- (id)_sessionWithID:(id *)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = [a1[4] sessionID];
    int v5 = [v4 isEqual:v3];

    if (v5)
    {
      id v6 = (id *)a1[4];
    }
    else
    {
      id v6 = [a1[5] objectForKeyedSubscript:v3];
    }
    a1 = v6;
  }

  return a1;
}

- (void)_issueGetSnapshot:(void *)a1
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [v3 sessionID];
  [v4 markMilestoneFor:@"ReceivedSnapshotRequest"];

  int v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = a1;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    id v9 = [v3 sessionID];
    uint64_t v10 = [v9 snapshotReason];
    if (v10 == 1)
    {
      id v11 = @"HMDCameraSnapshotReasonEvent";
    }
    else if (v10)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Unknown snapshot reason: %lu", v10);
      id v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v11 = @"HMDCameraSnapshotReasonPeriodic";
    }
    *(_DWORD *)buf = 138543618;
    int v18 = v8;
    __int16 v19 = 2112;
    id v20 = v11;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Issuing get snapshot request for reason: %@", buf, 0x16u);
  }
  id v12 = [v3 snapshotGetter];
  objc_msgSend(v12, "getSnapshot:", objc_msgSend(v3, "streamingTierType"));

  uint64_t v13 = [v3 snapshotCompletionTimer];
  [v13 setDelegate:v6];

  uint64_t v14 = [v6 workQueue];
  uint64_t v15 = [v3 snapshotCompletionTimer];
  [v15 setDelegateQueue:v14];

  v16 = [v3 snapshotCompletionTimer];
  [v16 resume];
}

- (void)_handleTakeSnapshotMessage:(id)a3
{
  uint64_t v104 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [MEMORY[0x1E4F653F0] currentActivity];
  [v5 markWithReason:@"Snapshot Request"];

  id v99 = 0;
  id v6 = -[HMDCameraSnapshotManager _createSnapshotSessionIDWithMessage:error:]((id *)&self->super.super.isa, v4, &v99);
  id v7 = v99;
  if (v6)
  {
    uint64_t v8 = [v6 snapshotCharacteristicEventUUID];
    id v9 = (void *)v8;
    if (self)
    {
      if (self->_currentLocalSession)
      {
        uint64_t v10 = (void *)MEMORY[0x1D9452090]();
        id v11 = self;
        id v12 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          uint64_t v13 = HMFGetLogIdentifier();
          currentLocalSession = v11->_currentLocalSession;
          *(_DWORD *)buf = 138543618;
          v101 = v13;
          __int16 v102 = 2112;
          v103 = currentLocalSession;
          _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@There is already a local session %@ in progress, adding this request to that", buf, 0x16u);
        }
        [(HMDSnapshotLocalSession *)v11->_currentLocalSession addMessage:v4];
        if (v9) {
          [(HMDSnapshotCacheRequestHandler *)v11->_snapshotCacheRequestHandler addSnapshotFileToCache:v9];
        }
LABEL_67:

        goto LABEL_68;
      }
      if (v8) {
        goto LABEL_10;
      }
      snapshotSlotManager = self->_snapshotSlotManager;
    }
    else
    {
      if (v8) {
        goto LABEL_59;
      }
      snapshotSlotManager = 0;
    }
    v41 = snapshotSlotManager;
    v42 = [(HMDSnapshotSlotManager *)v41 encodedMostRecentSnapshotForMessage:v4];

    if (v42)
    {
      v43 = (void *)MEMORY[0x1D9452090]();
      v44 = self;
      v45 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
      {
        v46 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v101 = v46;
        __int16 v102 = 2112;
        v103 = v42;
        _os_log_impl(&dword_1D49D5000, v45, OS_LOG_TYPE_INFO, "%{public}@Most recent snapshot is still valid, sending it with payload %@", buf, 0x16u);
      }
      [v4 respondWithPayload:v42];

      goto LABEL_67;
    }
    if (self)
    {
LABEL_10:
      if ([(HMDCameraStreamSnapshotHandler *)self->_streamSnapshotHandler isStreamSetupInProgress])
      {
LABEL_11:
        uint64_t v15 = (void *)MEMORY[0x1D9452090]();
        v16 = self;
        int v17 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          int v18 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v101 = v18;
          _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_INFO, "%{public}@Stream setup is in progress, adding this to pending request queue", buf, 0xCu);
        }
        if (self) {
          pendingSnapshotRequestDuringStreamSetup = v16->_pendingSnapshotRequestDuringStreamSetup;
        }
        else {
          pendingSnapshotRequestDuringStreamSetup = 0;
        }
        [(NSMutableArray *)pendingSnapshotRequestDuringStreamSetup addObject:v4];
        goto LABEL_67;
      }
      streamSnapshotHandler = self->_streamSnapshotHandler;
LABEL_17:
      if ([(HMDCameraStreamSnapshotHandler *)streamSnapshotHandler isStreamAvailable])
      {
        uint64_t v21 = (void *)MEMORY[0x1D9452090]();
        __int16 v22 = self;
        id v23 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          uint64_t v24 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v101 = v24;
          _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_INFO, "%{public}@Taking snapshot through available camera stream", buf, 0xCu);
        }
        id v97 = v4;
        id v25 = v6;
        if (self)
        {
          id v26 = v25;
          v93 = [v25 snapshotCharacteristicEventUUID];
          char v95 = [v26 isSnapshotRequestForBulletin];
          __int16 v27 = v22->_dataSource;
          id WeakRetained = objc_loadWeakRetained((id *)&v22->_accessory);
          uint64_t v29 = v22->_streamSnapshotHandler;
          id v30 = v22->_networkMonitor;
          long long v31 = v29;
          LOBYTE(v90) = v95;
          uint64_t v32 = [(HMDCameraSnapshotManagerDataSource *)v27 createLocalSnapshotSessionWithID:v26 accessory:WeakRetained snapshotGetter:v31 message:v97 waitPeriod:[(HMFNetMonitor *)v30 reachabilityPath] reachabilityPath:1 cameraLocallyReachable:30.0 snapshotForNotification:v90];
          long long v33 = v22->_currentLocalSession;
          v22->_currentLocalSession = (HMDSnapshotLocalSession *)v32;

          if (v93) {
            uint64_t v34 = [(HMDSnapshotCacheRequestHandler *)v22->_snapshotCacheRequestHandler addSnapshotFileToCache:v93];
          }
          v35 = (void *)MEMORY[0x1D9452090](v34);
          v36 = v22;
          v37 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
          {
            __int16 v38 = HMFGetLogIdentifier();
            id v39 = (HMDSnapshotLocalSession *)v36[4];
            *(_DWORD *)buf = 138543618;
            v101 = v38;
            __int16 v102 = 2112;
            v103 = v39;
            _os_log_impl(&dword_1D49D5000, v37, OS_LOG_TYPE_INFO, "%{public}@Creating a snapshot session %@ with HMDCameraStreamSnapshot", buf, 0x16u);
          }
          -[HMDCameraSnapshotManager _issueGetSnapshot:](v36, v36[4]);

          id v25 = v26;
        }

        goto LABEL_67;
      }
      v47 = -[HMDCameraSnapshotManager accessory]((id *)&self->super.super.isa);
      int v48 = [v47 isReachable];

      if (v48)
      {
        v49 = (void *)MEMORY[0x1D9452090]();
        v50 = self;
        v51 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
        {
          v52 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v101 = v52;
          _os_log_impl(&dword_1D49D5000, v51, OS_LOG_TYPE_INFO, "%{public}@Taking local snapshot because accessory is reachable", buf, 0xCu);
        }
        id v53 = v4;
        id v54 = v6;
        if (self)
        {
          v55 = v54;
          id v98 = v54;
          char v92 = [v54 isSnapshotRequestForBulletin];
          v91 = [v55 snapshotCharacteristicEventUUID];
          id v94 = objc_loadWeakRetained((id *)&v50->_accessory);
          v56 = v50->_dataSource;
          v57 = [(HMDCameraSnapshotManager *)v50 workQueue];
          [(HMDCameraSnapshotManager *)v50 workQueue];
          v58 = id v96 = v53;
          v59 = [(HMDCameraSnapshotManagerDataSource *)v56 createSnapshotLocalWithSessionID:v98 workQueue:v57 accessory:v94 delegate:v50 delegateQueue:v58 snapshotRequestHandler:v50->_snapshotRequestHandler];

          dataSource = v50->_dataSource;
          v61 = v50->_networkMonitor;
          v62 = dataSource;
          LOBYTE(v90) = v92;
          uint64_t v63 = [(HMDCameraSnapshotManagerDataSource *)v62 createLocalSnapshotSessionWithID:v98 accessory:v94 snapshotGetter:v59 message:v96 waitPeriod:[(HMFNetMonitor *)v61 reachabilityPath] reachabilityPath:1 cameraLocallyReachable:30.0 snapshotForNotification:v90];
          v64 = v50->_currentLocalSession;
          v50->_currentLocalSession = (HMDSnapshotLocalSession *)v63;

          if (v91) {
            uint64_t v65 = [(HMDSnapshotCacheRequestHandler *)v50->_snapshotCacheRequestHandler addSnapshotFileToCache:v91];
          }
          v66 = (void *)MEMORY[0x1D9452090](v65);
          v67 = v50;
          v68 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
          {
            v69 = HMFGetLogIdentifier();
            v70 = (HMDSnapshotLocalSession *)v67[4];
            *(_DWORD *)buf = 138543618;
            v101 = v69;
            __int16 v102 = 2112;
            v103 = v70;
            _os_log_impl(&dword_1D49D5000, v68, OS_LOG_TYPE_INFO, "%{public}@Creating a snapshot session %@ with HMDCameraSnapshotLocal", buf, 0x16u);
          }
          -[HMDCameraSnapshotManager _issueGetSnapshot:](v67, v67[4]);

          id v53 = v96;
          id v54 = v98;
        }

        goto LABEL_67;
      }
      if (self)
      {
        if ([(HMDCameraSnapshotManagerDataSource *)self->_dataSource supportsCameraSnapshotRequestViaRelay])
        {
          v71 = self->_dataSource;
          goto LABEL_47;
        }
      }
      else
      {
        char v84 = [0 supportsCameraSnapshotRequestViaRelay];
        v71 = 0;
        if (v84)
        {
LABEL_47:
          v72 = v71;
          if ([(HMDCameraSnapshotManagerDataSource *)v72 isWatchDevice])
          {
            if (self) {
              residentMessageHandler = self->_residentMessageHandler;
            }
            else {
              residentMessageHandler = 0;
            }
            BOOL v74 = [(HMDCameraResidentMessageHandler *)residentMessageHandler isUsingCompanionForRemoteAccessDevice];

            if (v74)
            {
              v75 = (void *)MEMORY[0x1D9452090]();
              v76 = self;
              v77 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
              {
                v78 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543362;
                v101 = v78;
                _os_log_impl(&dword_1D49D5000, v77, OS_LOG_TYPE_INFO, "%{public}@Taking remote snapshot via stream because accessory is unreachable", buf, 0xCu);
              }
              -[HMDCameraSnapshotManager _sendSnapshotRequestStreamReceiver:snapshotSessionID:](v76, v4, v6);
              goto LABEL_67;
            }
          }
          else
          {
          }
          v79 = (void *)MEMORY[0x1D9452090]();
          v80 = self;
          v81 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v81, OS_LOG_TYPE_INFO))
          {
            v82 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            v101 = v82;
            _os_log_impl(&dword_1D49D5000, v81, OS_LOG_TYPE_INFO, "%{public}@Taking remote snapshot via relay because accessory is unreachable", buf, 0xCu);
          }
          -[HMDCameraSnapshotManager _sendSnapshotRequestRelayReceiver:snapshotSessionID:](v80, v4, v6);
          goto LABEL_67;
        }
      }
      v85 = (void *)MEMORY[0x1D9452090]();
      v86 = self;
      v87 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
      {
        v88 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v101 = v88;
        _os_log_impl(&dword_1D49D5000, v87, OS_LOG_TYPE_ERROR, "%{public}@Cannot take snapshot because accessory is unreachable remote and remote snapshots are unsupported", buf, 0xCu);
      }
      v89 = [MEMORY[0x1E4F28C58] hmErrorWithCode:4];
      [v4 respondWithError:v89];

      goto LABEL_67;
    }
LABEL_59:
    char v83 = [0 isStreamSetupInProgress];
    streamSnapshotHandler = 0;
    if (v83) {
      goto LABEL_11;
    }
    goto LABEL_17;
  }
  [v4 respondWithError:v7];
LABEL_68:
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (id)accessory
{
  if (WeakRetained)
  {
    id WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 6);
    uint64_t v1 = vars8;
  }
  return WeakRetained;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_residentMessageHandler, 0);
  objc_storeStrong((id *)&self->_networkMonitor, 0);
  objc_storeStrong((id *)&self->_pendingRemoteSnapshotRequestDuringStreamSetup, 0);
  objc_storeStrong((id *)&self->_pendingSnapshotRequestDuringStreamSetup, 0);
  objc_storeStrong((id *)&self->_streamSnapshotHandler, 0);
  objc_storeStrong((id *)&self->_snapshotSlotManager, 0);
  objc_storeStrong((id *)&self->_snapshotCacheRequestHandler, 0);
  objc_storeStrong((id *)&self->_snapshotRequestHandler, 0);
  objc_storeStrong((id *)&self->_monitorServicesManager, 0);
  objc_storeStrong((id *)&self->_imageCacheDirectory, 0);
  objc_destroyWeak((id *)&self->_accessory);
  objc_storeStrong((id *)&self->_currentRemoteSessions, 0);
  objc_storeStrong((id *)&self->_currentLocalSession, 0);
  objc_storeStrong((id *)&self->_msgDispatcher, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

- (void)handleCameraSettingsDidChangeNotification:(id)a3
{
  id v4 = [(HMDCameraSnapshotManager *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__HMDCameraSnapshotManager_handleCameraSettingsDidChangeNotification___block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(v4, block);
}

void __70__HMDCameraSnapshotManager_handleCameraSettingsDidChangeNotification___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = -[HMDCameraSnapshotManager accessory](*(id **)(a1 + 32));
  id v3 = [v2 cameraProfiles];
  id v4 = [v3 anyObject];
  int v5 = [v4 currentSettings];

  if (v5)
  {
    [v5 currentAccessMode];
    if ((HMAreSnapshotsAllowedForCameraAccessMode() & 1) == 0)
    {
      id v6 = [MEMORY[0x1E4F28C58] hmErrorWithCode:10];
      -[HMDCameraSnapshotManager _removeAllPendingRequests:](*(void *)(a1 + 32), v6);
    }
  }
  else
  {
    id v7 = (void *)MEMORY[0x1D9452090]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      int v11 = 138543362;
      id v12 = v10;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Camera profile settings are not initialized, skipping cancelling pending snapshot requests", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (void)_removeAllPendingRequests:(uint64_t)a1
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    if (*(void *)(a1 + 32))
    {
      id v4 = (void *)MEMORY[0x1D9452090]();
      int v5 = (id *)(id)a1;
      id v6 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        id v7 = HMFGetLogIdentifier();
        id v8 = v5[4];
        *(_DWORD *)buf = 138543874;
        v64 = v7;
        __int16 v65 = 2112;
        id v66 = v8;
        __int16 v67 = 2112;
        id v68 = v3;
        _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failing current local session %@:%@", buf, 0x20u);
      }
      [v5[4] respond:v3 payload:0];
      objc_storeStrong(v5 + 4, 0);
    }
    if ([*(id *)(a1 + 40) count])
    {
      id v9 = (void *)MEMORY[0x1D9452090]();
      uint64_t v10 = (id *)(id)a1;
      int v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        id v12 = HMFGetLogIdentifier();
        id v13 = v10[5];
        *(_DWORD *)buf = 138543874;
        v64 = v12;
        __int16 v65 = 2112;
        id v66 = v13;
        __int16 v67 = 2112;
        id v68 = v3;
        _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failing current remote sessions %@:%@", buf, 0x20u);
      }
      long long v58 = 0u;
      long long v59 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      id v14 = v10[5];
      uint64_t v15 = [v14 countByEnumeratingWithState:&v56 objects:v62 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v57;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v57 != v17) {
              objc_enumerationMutation(v14);
            }
            uint64_t v19 = *(void *)(*((void *)&v56 + 1) + 8 * i);
            id v20 = v10[5];
            uint64_t v21 = [v20 objectForKeyedSubscript:v19];
            [v21 respond:v3 payload:0];
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v56 objects:v62 count:16];
        }
        while (v16);
      }

      [v10[5] removeAllObjects];
    }
    if ([*(id *)(a1 + 104) count])
    {
      __int16 v22 = (void *)MEMORY[0x1D9452090]();
      id v23 = (id *)(id)a1;
      uint64_t v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        id v25 = HMFGetLogIdentifier();
        id v26 = v23[13];
        *(_DWORD *)buf = 138543874;
        v64 = v25;
        __int16 v65 = 2112;
        id v66 = v26;
        __int16 v67 = 2112;
        id v68 = v3;
        _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_ERROR, "%{public}@Failing pending snapshot request during stream set up %@:%@", buf, 0x20u);
      }
      long long v54 = 0u;
      long long v55 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      id v27 = v23[13];
      uint64_t v28 = [v27 countByEnumeratingWithState:&v52 objects:v61 count:16];
      if (v28)
      {
        uint64_t v29 = v28;
        uint64_t v30 = *(void *)v53;
        do
        {
          for (uint64_t j = 0; j != v29; ++j)
          {
            if (*(void *)v53 != v30) {
              objc_enumerationMutation(v27);
            }
            uint64_t v32 = *(void **)(*((void *)&v52 + 1) + 8 * j);
            long long v33 = [v32 responseHandler];

            if (v33)
            {
              uint64_t v34 = [v32 responseHandler];
              ((void (**)(void, id, void))v34)[2](v34, v3, 0);
            }
          }
          uint64_t v29 = [v27 countByEnumeratingWithState:&v52 objects:v61 count:16];
        }
        while (v29);
      }

      [v23[13] removeAllObjects];
    }
    if ([*(id *)(a1 + 112) count])
    {
      v35 = (void *)MEMORY[0x1D9452090]();
      v36 = (id *)(id)a1;
      v37 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        __int16 v38 = HMFGetLogIdentifier();
        id v39 = v36[14];
        *(_DWORD *)buf = 138543874;
        v64 = v38;
        __int16 v65 = 2112;
        id v66 = v39;
        __int16 v67 = 2112;
        id v68 = v3;
        _os_log_impl(&dword_1D49D5000, v37, OS_LOG_TYPE_ERROR, "%{public}@Failing pending remote snapshot request during stream set up %@:%@", buf, 0x20u);
      }
      long long v50 = 0u;
      long long v51 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      id v40 = v36[14];
      uint64_t v41 = [v40 countByEnumeratingWithState:&v48 objects:v60 count:16];
      if (v41)
      {
        uint64_t v42 = v41;
        uint64_t v43 = *(void *)v49;
        do
        {
          for (uint64_t k = 0; k != v42; ++k)
          {
            if (*(void *)v49 != v43) {
              objc_enumerationMutation(v40);
            }
            v45 = *(void **)(*((void *)&v48 + 1) + 8 * k);
            v46 = objc_msgSend(v45, "responseHandler", (void)v48);

            if (v46)
            {
              v47 = [v45 responseHandler];
              ((void (**)(void, id, void))v47)[2](v47, v3, 0);
            }
          }
          uint64_t v42 = [v40 countByEnumeratingWithState:&v48 objects:v60 count:16];
        }
        while (v42);
      }

      [v36[14] removeAllObjects];
    }
  }
}

- (void)streamSnapshotHandler:(id)a3 didChangeStreamSetupInProgress:(BOOL)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!a4)
  {
    id v7 = (void *)MEMORY[0x1D9452090]();
    id v8 = self;
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v36 = v10;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Received call back that stream setup is not in progress anymore", buf, 0xCu);
    }
    if (v8)
    {
      int v11 = (void *)[(NSMutableArray *)v8->_pendingSnapshotRequestDuringStreamSetup copy];
      pendingSnapshotRequestDuringStreamSetup = v8->_pendingSnapshotRequestDuringStreamSetup;
    }
    else
    {
      int v11 = (void *)[0 copy];
      pendingSnapshotRequestDuringStreamSetup = 0;
    }
    [(NSMutableArray *)pendingSnapshotRequestDuringStreamSetup removeAllObjects];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v13 = v11;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v30 != v16) {
            objc_enumerationMutation(v13);
          }
          [(HMDCameraSnapshotManager *)v8 _handleTakeSnapshotMessage:*(void *)(*((void *)&v29 + 1) + 8 * i)];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v29 objects:v34 count:16];
      }
      while (v15);
    }

    if (v8)
    {
      int v18 = (void *)[(NSMutableArray *)v8->_pendingRemoteSnapshotRequestDuringStreamSetup copy];
      pendingRemoteSnapshotRequestDuringStreamSetup = v8->_pendingRemoteSnapshotRequestDuringStreamSetup;
    }
    else
    {
      int v18 = (void *)[0 copy];
      pendingRemoteSnapshotRequestDuringStreamSetup = 0;
    }
    [(NSMutableArray *)pendingRemoteSnapshotRequestDuringStreamSetup removeAllObjects];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v20 = v18;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v25 objects:v33 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v26;
      do
      {
        for (uint64_t j = 0; j != v22; ++j)
        {
          if (*(void *)v26 != v23) {
            objc_enumerationMutation(v20);
          }
          -[HMDCameraSnapshotManager _handleTakeRemoteSnapshotMessage:](v8, "_handleTakeRemoteSnapshotMessage:", *(void *)(*((void *)&v25 + 1) + 8 * j), (void)v25);
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v25 objects:v33 count:16];
      }
      while (v22);
    }
  }
}

- (void)streamSnapshotHandler:(id)a3 didGetLastSnapshot:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [HMDSnapshotFile alloc];
  if (self) {
    imageCacheDirectory = self->_imageCacheDirectory;
  }
  else {
    imageCacheDirectory = 0;
  }
  uint64_t v10 = [(HMDSnapshotFile *)v8 initWithImageDirectory:imageCacheDirectory snapshotData:v7];
  if (v10)
  {
    int v11 = (void *)MEMORY[0x1D9452090]();
    id v12 = self;
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = HMFGetLogIdentifier();
      int v17 = 138543618;
      int v18 = v14;
      __int16 v19 = 2112;
      id v20 = v10;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Received the last snapshot from stream %@", (uint8_t *)&v17, 0x16u);
    }
    if (self) {
      snapshotSlotManager = v12->_snapshotSlotManager;
    }
    else {
      snapshotSlotManager = 0;
    }
    id v16 = [(HMDSnapshotSlotManager *)snapshotSlotManager createSlotForSnapshotFile:v10 requestMessages:MEMORY[0x1E4F1CBF0] shouldNotifyClients:1];
  }
}

- (void)streamSnapshotHandler:(id)a3 didGetNewSnapshot:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [HMDSnapshotFile alloc];
  if (self) {
    imageCacheDirectory = self->_imageCacheDirectory;
  }
  else {
    imageCacheDirectory = 0;
  }
  uint64_t v10 = [(HMDSnapshotFile *)v8 initWithImageDirectory:imageCacheDirectory snapshotData:v7];
  int v11 = (void *)MEMORY[0x1D9452090]();
  id v12 = self;
  id v13 = HMFGetOSLogHandle();
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
  if (v10)
  {
    if (v14)
    {
      uint64_t v15 = HMFGetLogIdentifier();
      int v25 = 138543618;
      long long v26 = v15;
      __int16 v27 = 2112;
      long long v28 = v10;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Received a new snapshot from stream %@", (uint8_t *)&v25, 0x16u);
    }
    if (self) {
      currentLocalSession = v12->_currentLocalSession;
    }
    else {
      currentLocalSession = 0;
    }
    int v17 = currentLocalSession;
    int v18 = [(HMDSnapshotSession *)v17 sessionID];
    uint64_t v19 = (uint64_t)v12;
    id v20 = v10;
    uint64_t v21 = 0;
    uint64_t v22 = v18;
  }
  else
  {
    if (v14)
    {
      uint64_t v23 = HMFGetLogIdentifier();
      int v25 = 138543362;
      long long v26 = v23;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@New snapshot capture has resulted in failure", (uint8_t *)&v25, 0xCu);
    }
    int v18 = [MEMORY[0x1E4F28C58] hmErrorWithCode:52];
    if (self) {
      uint64_t v24 = v12->_currentLocalSession;
    }
    else {
      uint64_t v24 = 0;
    }
    int v17 = [(HMDSnapshotSession *)v24 sessionID];
    uint64_t v19 = (uint64_t)v12;
    id v20 = 0;
    uint64_t v21 = v18;
    uint64_t v22 = v17;
  }
  -[HMDCameraSnapshotManager _sendResponse:error:sessionID:](v19, v20, v21, v22);
}

- (void)snapshotRelayStream:(id)a3 didCompleteSendImage:(id)a4 sessionID:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = (void *)MEMORY[0x1D9452090]();
  id v12 = self;
  id v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    BOOL v14 = HMFGetLogIdentifier();
    int v15 = 138543874;
    id v16 = v14;
    __int16 v17 = 2112;
    id v18 = v10;
    __int16 v19 = 2112;
    id v20 = v9;
    _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@%@ Received HMDCameraSnapshotRemoteRelayStreamDelegate call back that the image transfer has completed with error %@", (uint8_t *)&v15, 0x20u);
  }
  -[HMDCameraSnapshotManager _endSession:error:]((id *)&v12->super.super.isa, v10, v9);
}

- (void)snapshotRelayStream:(id)a3 didStartCaptureImage:(id)a4 sessionID:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = (void *)MEMORY[0x1D9452090]();
  id v12 = self;
  id v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    BOOL v14 = HMFGetLogIdentifier();
    int v15 = 138543874;
    id v16 = v14;
    __int16 v17 = 2112;
    id v18 = v10;
    __int16 v19 = 2112;
    id v20 = v9;
    _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@%@ Received HMDCameraSnapshotRemoteRelayStreamDelegate call back that the image transfer has started with error %@", (uint8_t *)&v15, 0x20u);
  }
  -[HMDCameraSnapshotManager _sendRemoteResponse:sessionID:]((id *)&v12->super.super.isa, v9, v10);
}

- (void)_sendRemoteResponse:(void *)a3 sessionID:
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    id v7 = -[HMDCameraSnapshotManager _sessionWithID:](a1, v6);
    if (v7)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v7 respond:0 payload:0];
        if (v5) {
          -[HMDCameraSnapshotManager _endSession:error:](a1, v6, v5);
        }
        goto LABEL_12;
      }
      id v8 = (void *)MEMORY[0x1D9452090]();
      id v9 = a1;
      id v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v11 = HMFGetLogIdentifier();
        int v15 = 138543874;
        id v16 = v11;
        __int16 v17 = 2112;
        id v18 = v6;
        __int16 v19 = 2112;
        uint64_t v20 = objc_opt_class();
        id v12 = "%{public}@Received a delegate call back for an unknown session snapshot session of unexpected type: %@ (class: %@)";
        id v13 = v10;
        uint32_t v14 = 32;
        goto LABEL_10;
      }
    }
    else
    {
      id v8 = (void *)MEMORY[0x1D9452090]();
      id v9 = a1;
      id v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v11 = HMFGetLogIdentifier();
        int v15 = 138543618;
        id v16 = v11;
        __int16 v17 = 2112;
        id v18 = v6;
        id v12 = "%{public}@Received a delegate call back for an unknown session ID: %@";
        id v13 = v10;
        uint32_t v14 = 22;
LABEL_10:
        _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_ERROR, v12, (uint8_t *)&v15, v14);
      }
    }

LABEL_12:
  }
}

- (void)snapshotStreamSender:(id)a3 didCompleteSendImage:(id)a4 sessionID:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = (void *)MEMORY[0x1D9452090]();
  id v12 = self;
  id v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint32_t v14 = HMFGetLogIdentifier();
    int v15 = 138543874;
    id v16 = v14;
    __int16 v17 = 2112;
    id v18 = v10;
    __int16 v19 = 2112;
    id v20 = v9;
    _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@%@ Received HMDCameraSnapshotRemoteStreamSenderDelegate call back that the image transfer has completed with error %@", (uint8_t *)&v15, 0x20u);
  }
  -[HMDCameraSnapshotManager _endSession:error:]((id *)&v12->super.super.isa, v10, v9);
}

- (void)snapshotStreamSender:(id)a3 didStartCaptureImage:(id)a4 sessionID:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = (void *)MEMORY[0x1D9452090]();
  id v12 = self;
  id v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint32_t v14 = HMFGetLogIdentifier();
    int v15 = 138543874;
    id v16 = v14;
    __int16 v17 = 2112;
    id v18 = v10;
    __int16 v19 = 2112;
    id v20 = v9;
    _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@%@ Received HMDCameraSnapshotRemoteStreamSenderDelegate call back that the image transfer has started with error %@", (uint8_t *)&v15, 0x20u);
  }
  -[HMDCameraSnapshotManager _sendRemoteResponse:sessionID:]((id *)&v12->super.super.isa, v9, v10);
}

- (void)snapshotStreamReceiver:(id)a3 didSaveSnapshotFile:(id)a4 error:(id)a5 sessionID:(id)a6
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint32_t v14 = (void *)MEMORY[0x1D9452090]();
  int v15 = self;
  id v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    __int16 v17 = HMFGetLogIdentifier();
    int v18 = 138543874;
    __int16 v19 = v17;
    __int16 v20 = 2112;
    id v21 = v13;
    __int16 v22 = 2112;
    id v23 = v12;
    _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_INFO, "%{public}@%@ Received HMDCameraSnapshotRemoteStreamReceiverDelegate call back that the image has been saved after relay with error %@", (uint8_t *)&v18, 0x20u);
  }
  -[HMDCameraSnapshotManager _sendResponse:error:sessionID:]((uint64_t)v15, v11, v12, v13);
}

- (void)snapshotStreamReceiver:(id)a3 didStartGettingImage:(id)a4 sessionID:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)MEMORY[0x1D9452090]();
  id v12 = self;
  id v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint32_t v14 = HMFGetLogIdentifier();
    int v15 = 138543874;
    id v16 = v14;
    __int16 v17 = 2112;
    id v18 = v10;
    __int16 v19 = 2112;
    id v20 = v9;
    _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@%@ Received HMDCameraSnapshotRemoteStreamReceiverDelegate call back that the image get has started after relay with error %@", (uint8_t *)&v15, 0x20u);
  }
}

- (void)snapshotRelaySender:(id)a3 didSaveSnapshotFile:(id)a4 sessionID:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)MEMORY[0x1D9452090]();
  id v12 = self;
  id v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint32_t v14 = HMFGetLogIdentifier();
    int v15 = [v10 snapshotCharacteristicEventUUID];
    int v20 = 138544130;
    uint64_t v21 = v14;
    __int16 v22 = 2112;
    id v23 = v10;
    __int16 v24 = 2112;
    id v25 = v9;
    __int16 v26 = 2112;
    __int16 v27 = v15;
    _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@%@ Received HMDCameraSnapshotRemoteRelaySenderDelegate call back that snapshotFile:%@ has been saved for snapshotCharacteristicEventUUID:%@", (uint8_t *)&v20, 0x2Au);
  }
  id v16 = [v10 snapshotCharacteristicEventUUID];

  if (v16)
  {
    if (v12) {
      snapshotCacheRequestHandler = v12->_snapshotCacheRequestHandler;
    }
    else {
      snapshotCacheRequestHandler = 0;
    }
    id v18 = snapshotCacheRequestHandler;
    __int16 v19 = [v10 snapshotCharacteristicEventUUID];
    [(HMDSnapshotCacheRequestHandler *)v18 setSnapshotFileToCache:v9 snapshotCharacteristicEventUUID:v19];
  }
}

- (void)snapshotRelaySender:(id)a3 didCompleteSendImage:(id)a4 sessionID:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)MEMORY[0x1D9452090]();
  id v12 = self;
  id v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint32_t v14 = HMFGetLogIdentifier();
    int v15 = 138543874;
    id v16 = v14;
    __int16 v17 = 2112;
    id v18 = v10;
    __int16 v19 = 2112;
    id v20 = v9;
    _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@%@ Received HMDCameraSnapshotRemoteRelaySenderDelegate call back that the image transfer has completed with error %@", (uint8_t *)&v15, 0x20u);
  }
  -[HMDCameraSnapshotManager _endSession:error:]((id *)&v12->super.super.isa, v10, v9);
}

- (void)snapshotRelaySender:(id)a3 didStartCaptureImage:(id)a4 sessionID:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)MEMORY[0x1D9452090]();
  id v12 = self;
  id v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint32_t v14 = HMFGetLogIdentifier();
    int v15 = 138543874;
    id v16 = v14;
    __int16 v17 = 2112;
    id v18 = v10;
    __int16 v19 = 2112;
    id v20 = v9;
    _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@%@ Received HMDCameraSnapshotRemoteRelaySenderDelegate call back that the image transfer has started with error %@", (uint8_t *)&v15, 0x20u);
  }
  -[HMDCameraSnapshotManager _sendRemoteResponse:sessionID:]((id *)&v12->super.super.isa, v9, v10);
}

- (void)snapshotRelayReceiver:(id)a3 didSaveSnapshotFile:(id)a4 error:(id)a5 sessionID:(id)a6
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint32_t v14 = (void *)MEMORY[0x1D9452090]();
  int v15 = self;
  id v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    __int16 v17 = HMFGetLogIdentifier();
    int v18 = 138543874;
    __int16 v19 = v17;
    __int16 v20 = 2112;
    id v21 = v13;
    __int16 v22 = 2112;
    id v23 = v12;
    _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_INFO, "%{public}@%@ Received HMDCameraSnapshotRemoteRelayReceiverDelegate call back that the image has been saved after relay with error %@", (uint8_t *)&v18, 0x20u);
  }
  -[HMDCameraSnapshotManager _sendResponse:error:sessionID:]((uint64_t)v15, v11, v12, v13);
}

- (void)snapshotRelayReceiver:(id)a3 didStartGettingImage:(id)a4 sessionID:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)MEMORY[0x1D9452090]();
  id v12 = self;
  id v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint32_t v14 = HMFGetLogIdentifier();
    int v15 = 138543874;
    id v16 = v14;
    __int16 v17 = 2112;
    id v18 = v10;
    __int16 v19 = 2112;
    id v20 = v9;
    _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@%@ Received HMDCameraSnapshotRemoteRelayReceiverDelegate call back that the image get has started after relay with error %@", (uint8_t *)&v15, 0x20u);
  }
}

- (void)_handleTakeRemoteSnapshotFailureMessage:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = (HMDCameraSnapshotSessionID *)a3;
  id v5 = [HMDCameraSnapshotSessionID alloc];
  id v6 = -[HMDCameraSnapshotManager accessory]((id *)&self->super.super.isa);
  id v7 = [(HMDCameraSnapshotSessionID *)v5 initWithAccessory:v6 message:v4];

  id v8 = (void *)MEMORY[0x1D9452090]();
  id v9 = self;
  id v10 = HMFGetOSLogHandle();
  id v11 = v10;
  if (v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v12 = HMFGetLogIdentifier();
      int v33 = 138543618;
      uint64_t v34 = v12;
      __int16 v35 = 2112;
      v36 = v7;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Received message that remote snapshot failed for session ID: %@", (uint8_t *)&v33, 0x16u);
    }
    id v13 = -[HMDCameraSnapshotManager _sessionWithID:]((id *)&v9->super.super.isa, v7);
    uint32_t v14 = v13;
    if (v13)
    {
      int v15 = [v13 snapshotGetter];
      if ([v15 conformsToProtocol:&unk_1F2E47E38]) {
        id v16 = v15;
      }
      else {
        id v16 = 0;
      }
      id v17 = v16;

      if (v17)
      {
        id v18 = [(HMDCameraSnapshotSessionID *)v4 messagePayload];
        __int16 v19 = [v18 errorFromDataForKey:@"kCameraSessionError"];

        id v20 = (void *)MEMORY[0x1D9452090]();
        uint64_t v21 = v9;
        __int16 v22 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          id v23 = HMFGetLogIdentifier();
          int v33 = 138543618;
          uint64_t v34 = v23;
          __int16 v35 = 2112;
          v36 = v19;
          _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_ERROR, "%{public}@Handling remote snapshot failure: %@", (uint8_t *)&v33, 0x16u);
        }
        [v17 snapShotSendFailed:v19];
        [(HMDCameraSnapshotSessionID *)v4 respondWithSuccess];
      }
      else
      {
        uint64_t v29 = (void *)MEMORY[0x1D9452090]();
        long long v30 = v9;
        long long v31 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          long long v32 = HMFGetLogIdentifier();
          int v33 = 138543362;
          uint64_t v34 = v32;
          _os_log_impl(&dword_1D49D5000, v31, OS_LOG_TYPE_ERROR, "%{public}@Cannot handle remote snapshot failure for session without a receiver", (uint8_t *)&v33, 0xCu);
        }
        __int16 v19 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
        [(HMDCameraSnapshotSessionID *)v4 respondWithError:v19];
      }
    }
    else
    {
      id v25 = (void *)MEMORY[0x1D9452090]();
      __int16 v26 = v9;
      __int16 v27 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        uint64_t v28 = HMFGetLogIdentifier();
        int v33 = 138543618;
        uint64_t v34 = v28;
        __int16 v35 = 2112;
        v36 = v7;
        _os_log_impl(&dword_1D49D5000, v27, OS_LOG_TYPE_ERROR, "%{public}@Cannot handle remote snapshot failure for unknown session ID: %@", (uint8_t *)&v33, 0x16u);
      }
      id v17 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
      [(HMDCameraSnapshotSessionID *)v4 respondWithError:v17];
    }
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v24 = HMFGetLogIdentifier();
      int v33 = 138543618;
      uint64_t v34 = v24;
      __int16 v35 = 2112;
      v36 = v4;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to create snapshot session ID from remote snapshot failure message: %@", (uint8_t *)&v33, 0x16u);
    }
    uint32_t v14 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
    [(HMDCameraSnapshotSessionID *)v4 respondWithError:v14];
  }
}

- (void)_handleRemoteSnapshotReceivedMessage:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = (HMDCameraSnapshotSessionID *)a3;
  id v5 = [HMDCameraSnapshotSessionID alloc];
  id v6 = -[HMDCameraSnapshotManager accessory]((id *)&self->super.super.isa);
  id v7 = [(HMDCameraSnapshotSessionID *)v5 initWithAccessory:v6 message:v4];

  if (v7)
  {
    id v8 = -[HMDCameraSnapshotManager _sessionWithID:]((id *)&self->super.super.isa, v7);
    if (v8)
    {
      id v9 = v8;
      id v10 = [v8 snapshotGetter];
      int v11 = [v10 conformsToProtocol:&unk_1F2DF6990];

      if (v11)
      {
        id v12 = [v9 snapshotGetter];
        id v13 = (void *)MEMORY[0x1D9452090]();
        uint32_t v14 = self;
        int v15 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          id v16 = HMFGetLogIdentifier();
          int v27 = 138543362;
          uint64_t v28 = v16;
          _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@Sending snapshot received confirmation to the sender", (uint8_t *)&v27, 0xCu);
        }
        [v12 snapShotTransferComplete];
      }
      id v17 = [MEMORY[0x1E4F653F0] currentActivity];
      [v17 markWithReason:@"Snapshot Received"];

      [(HMDCameraSnapshotSessionID *)v4 respondWithSuccess];
    }
    else
    {
      __int16 v22 = (void *)MEMORY[0x1D9452090]();
      id v23 = self;
      uint64_t v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        id v25 = HMFGetLogIdentifier();
        int v27 = 138543618;
        uint64_t v28 = v25;
        __int16 v29 = 2112;
        long long v30 = v7;
        _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_ERROR, "%{public}@Cannot handle remote snapshot received for unknown session ID: %@", (uint8_t *)&v27, 0x16u);
      }
      __int16 v26 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
      [(HMDCameraSnapshotSessionID *)v4 respondWithError:v26];

      id v9 = 0;
    }
  }
  else
  {
    id v18 = (void *)MEMORY[0x1D9452090]();
    __int16 v19 = self;
    id v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = HMFGetLogIdentifier();
      int v27 = 138543618;
      uint64_t v28 = v21;
      __int16 v29 = 2112;
      long long v30 = v4;
      _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to create snapshot session ID from remote snapshot received message: %@", (uint8_t *)&v27, 0x16u);
    }
    id v9 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
    [(HMDCameraSnapshotSessionID *)v4 respondWithError:v9];
  }
}

- (void)timerDidFire:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDCameraSnapshotManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = v4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  if (v8)
  {
    id v9 = [v8 snapshotSession];
    if (v9)
    {
      id v10 = (void *)MEMORY[0x1D9452090]();
      int v11 = self;
      id v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        id v13 = HMFGetLogIdentifier();
        int v16 = 138543618;
        id v17 = v13;
        __int16 v18 = 2112;
        __int16 v19 = v9;
        _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@%@ has timed out", (uint8_t *)&v16, 0x16u);
      }
      uint32_t v14 = [MEMORY[0x1E4F28C58] hmErrorWithCode:8];
      int v15 = [v9 sessionID];
      -[HMDCameraSnapshotManager _sendResponse:error:sessionID:]((uint64_t)v11, 0, v14, v15);
    }
  }
}

- (void)_handleTakeRemoteSnapshotMessage:(id)a3
{
  uint64_t v116 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v111 = 0;
  id v5 = -[HMDCameraSnapshotManager _createSnapshotSessionIDWithMessage:error:]((id *)&self->super.super.isa, v4, &v111);
  id v6 = v111;
  if (!v5)
  {
    [v4 respondWithError:v6];
    goto LABEL_38;
  }
  if (self) {
    streamSnapshotHandler = self->_streamSnapshotHandler;
  }
  else {
    streamSnapshotHandler = 0;
  }
  if (![(HMDCameraStreamSnapshotHandler *)streamSnapshotHandler isStreamSetupInProgress])
  {
    id v13 = [MEMORY[0x1E4F653F0] currentActivity];
    [v13 markWithReason:@"Snapshot Remote Request"];

    uint32_t v14 = -[HMDCameraSnapshotManager accessory]((id *)&self->super.super.isa);
    int v15 = +[HMDDeviceCapabilities deviceCapabilities];
    int v16 = [v15 isResidentCapable];

    if (v16)
    {
      int v17 = [v14 isReachable];
      __int16 v18 = (void *)MEMORY[0x1D9452090]();
      __int16 v19 = self;
      uint64_t v20 = HMFGetOSLogHandle();
      uint64_t v21 = v20;
      if (v17)
      {
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          __int16 v22 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v113 = v22;
          _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_INFO, "%{public}@Accessory is reachable and this is remote gateway capable device", buf, 0xCu);
        }
        id v23 = v4;
        id v24 = v5;
        id v25 = v24;
        if (self)
        {
          id v90 = v6;
          id v99 = v24;
          v105 = v14;
          uint64_t v26 = [v23 stringForKey:@"kCameraProactiveSessionID"];
          __int16 v102 = [v23 numberForKey:@"kCameraStreamingTierType"];
          id v108 = v23;
          uint64_t v27 = [v23 remoteSourceDevice];
          if (!v26
            || (uint64_t v28 = &OBJC_IVAR___HMDCameraSnapshotManager__snapshotCacheRequestHandler,
                ![(HMDSnapshotCacheRequestHandler *)v19->_snapshotCacheRequestHandler isSnapshotPresentForCharacteristicEventUUID:v26]))
          {
            uint64_t v28 = &OBJC_IVAR___HMDCameraSnapshotManager__snapshotRequestHandler;
          }
          id v96 = (void *)v26;
          id v29 = *(id *)((char *)&v19->super.super.isa + *v28);
          id WeakRetained = objc_loadWeakRetained((id *)&v19->_accessory);
          uint64_t v31 = [HMDCameraSnapshotRemoteRelaySender alloc];
          long long v32 = [(HMDCameraSnapshotManager *)v19 workQueue];
          int v33 = [(HMDCameraSnapshotManager *)v19 workQueue];
          uint64_t v34 = [(HMDCameraSnapshotManager *)v19 uniqueIdentifier];
          v93 = (void *)v27;
          __int16 v35 = [(HMDCameraSnapshotRemoteRelaySender *)v31 initWithSessionID:v99 workQueue:v32 device:v27 accessory:WeakRetained delegate:v19 delegateQueue:v33 uniqueIdentifier:v34 snapshotRequestHandler:v29];

          id v25 = v99;
          v36 = -[HMDSnapshotRemoteSession initWithSessionID:accessory:snapshotGetter:message:waitPeriod:streamingTierType:cameraLocallyReachable:]([HMDSnapshotRemoteSession alloc], "initWithSessionID:accessory:snapshotGetter:message:waitPeriod:streamingTierType:cameraLocallyReachable:", v99, WeakRetained, v35, v108, [v102 unsignedIntegerValue], 1, 40.0);
          uint64_t v37 = (void *)MEMORY[0x1D9452090]();
          __int16 v38 = v19;
          id v39 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
          {
            id v40 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v113 = v40;
            __int16 v114 = 2112;
            v115 = v36;
            _os_log_impl(&dword_1D49D5000, v39, OS_LOG_TYPE_INFO, "%{public}@Creating a snapshot session %@ with HMDCameraSnapshotRemoteRelaySender", buf, 0x16u);

            id v25 = v99;
          }

          [v38[5] setObject:v36 forKeyedSubscript:v25];
          -[HMDCameraSnapshotManager _issueGetSnapshot:](v38, v36);

          uint32_t v14 = v105;
          id v23 = v108;
          id v6 = v90;
        }

        goto LABEL_37;
      }
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v60 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v113 = v60;
        _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_ERROR, "%{public}@Accessory is not reachable and this is a remote gateway capable device", buf, 0xCu);
      }
      v61 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v62 = 4;
    }
    else
    {
      if (isiOSDevice())
      {
        int v41 = [v14 isReachable];
        uint64_t v42 = (void *)MEMORY[0x1D9452090]();
        uint64_t v43 = self;
        v44 = HMFGetOSLogHandle();
        BOOL v45 = os_log_type_enabled(v44, OS_LOG_TYPE_INFO);
        if (v41)
        {
          if (v45)
          {
            v46 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            v113 = v46;
            _os_log_impl(&dword_1D49D5000, v44, OS_LOG_TYPE_INFO, "%{public}@Accessory is reachable and this is iOS device", buf, 0xCu);
          }
          v106 = v14;

          id v23 = v4;
          id v47 = v5;
          long long v48 = v47;
          if (self)
          {
            [v47 streamingTier];
            v103 = v100 = v48;
            uint64_t v49 = [v23 remoteSourceDevice];
            id v50 = objc_loadWeakRetained((id *)&v43->_accessory);
            long long v51 = [HMDCameraSnapshotRemoteStreamSender alloc];
            long long v52 = [(HMDCameraSnapshotManager *)v43 workQueue];
            [(HMDCameraSnapshotManager *)v43 workQueue];
            long long v53 = v109 = v23;
            long long v54 = [(HMDCameraSnapshotManager *)v43 uniqueIdentifier];
            id v97 = (void *)v49;
            v91 = [(HMDCameraSnapshotRemoteStreamSender *)v51 initWithSessionID:v100 workQueue:v52 device:v49 accessory:v50 delegate:v43 delegateQueue:v53 uniqueIdentifier:v54 snapshotRequestHandler:v43->_snapshotRequestHandler];

            long long v48 = v100;
            long long v55 = -[HMDSnapshotRemoteSession initWithSessionID:accessory:snapshotGetter:message:waitPeriod:streamingTierType:cameraLocallyReachable:]([HMDSnapshotRemoteSession alloc], "initWithSessionID:accessory:snapshotGetter:message:waitPeriod:streamingTierType:cameraLocallyReachable:", v100, v50, v91, v109, [v103 unsignedIntegerValue], 1, 40.0);
            long long v56 = (void *)MEMORY[0x1D9452090]();
            long long v57 = v43;
            long long v58 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
            {
              long long v59 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              v113 = v59;
              __int16 v114 = 2112;
              v115 = v55;
              _os_log_impl(&dword_1D49D5000, v58, OS_LOG_TYPE_INFO, "%{public}@Creating a snapshot session %@ with HMDCameraSnapshotRemoteStreamSender", buf, 0x16u);
            }
            [v57[5] setObject:v55 forKeyedSubscript:v100];
            -[HMDCameraSnapshotManager _issueGetSnapshot:](v57, v55);

            id v23 = v109;
          }

          uint32_t v14 = v106;
        }
        else
        {
          if (v45)
          {
            uint64_t v63 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            v113 = v63;
            _os_log_impl(&dword_1D49D5000, v44, OS_LOG_TYPE_INFO, "%{public}@Accessory is not reachable and this is iOS device, ", buf, 0xCu);
          }
          id v23 = v4;
          id v64 = v5;
          if (self)
          {
            __int16 v65 = (void *)MEMORY[0x1D9452090]();
            id v66 = v43;
            __int16 v67 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
            {
              id v68 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543362;
              v113 = v68;
              _os_log_impl(&dword_1D49D5000, v67, OS_LOG_TYPE_INFO, "%{public}@Creating a snapshot session with HMDCameraSnapshotRemoteRelayStream", buf, 0xCu);
            }
            uint64_t v104 = [v64 streamingTier];
            v101 = [v23 remoteSourceDevice];
            id v107 = objc_loadWeakRetained(v66 + 6);
            if (v107)
            {
              v110 = v23;
              uint64_t v69 = [v66[16] remoteAccessDevice];
              if (v69)
              {
                id v94 = [HMDCameraSnapshotRemoteRelayStream alloc];
                char v92 = [v66 workQueue];
                v70 = [v66 workQueue];
                [v66 uniqueIdentifier];
                v71 = id v98 = v64;
                v72 = v14;
                id v73 = v66[16];
                id v74 = v66[9];
                id v89 = v73;
                uint32_t v14 = v72;
                v75 = v94;
                char v95 = v69;
                uint64_t v76 = [(HMDCameraSnapshotRemoteRelayStream *)v75 initWithSessionID:v98 workQueue:v92 sourceDevice:v101 remoteDevice:v69 accessory:v107 delegate:v66 delegateQueue:v70 uniqueIdentifier:v71 snapshotRequestHandler:v74 residentMessageHandler:v89];

                id v64 = v98;
                v77 = (void *)v76;
                id v23 = v110;
                uint64_t v69 = v95;
                v78 = -[HMDSnapshotRemoteSession initWithSessionID:accessory:snapshotGetter:message:waitPeriod:streamingTierType:cameraLocallyReachable:]([HMDSnapshotRemoteSession alloc], "initWithSessionID:accessory:snapshotGetter:message:waitPeriod:streamingTierType:cameraLocallyReachable:", v98, v107, v77, v110, [v104 unsignedIntegerValue], 0, 60.0);
                [v66[5] setObject:v78 forKeyedSubscript:v98];
                -[HMDCameraSnapshotManager _issueGetSnapshot:](v66, v78);
              }
              else
              {
                v85 = (void *)MEMORY[0x1D9452090]();
                v86 = v66;
                v87 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
                {
                  v88 = HMFGetLogIdentifier();
                  *(_DWORD *)buf = 138543362;
                  v113 = v88;
                  _os_log_impl(&dword_1D49D5000, v87, OS_LOG_TYPE_ERROR, "%{public}@Failed to create snapshot session with HMDCameraSnapshotRemoteRelayStream: no remote access device", buf, 0xCu);
                }
                v77 = [MEMORY[0x1E4F28C58] hmErrorWithCode:91];
                id v23 = v110;
                [v110 respondWithError:v77];
              }
            }
            else
            {
              v79 = (void *)MEMORY[0x1D9452090]();
              v80 = v66;
              v81 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                id v82 = v64;
                v84 = char v83 = v14;
                *(_DWORD *)buf = 138543362;
                v113 = v84;
                _os_log_impl(&dword_1D49D5000, v81, OS_LOG_TYPE_ERROR, "%{public}@Failed to create snapshot session with HMDCameraSnapshotRemoteRelayStream: accessory reference is nil", buf, 0xCu);

                uint32_t v14 = v83;
                id v64 = v82;
              }

              uint64_t v69 = [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
              [v23 respondWithError:v69];
            }
          }
        }
        goto LABEL_37;
      }
      v61 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v62 = 3;
    }
    id v23 = [v61 hmErrorWithCode:v62];
    [v4 respondWithError:v23];
LABEL_37:

    goto LABEL_38;
  }
  id v8 = (void *)MEMORY[0x1D9452090]();
  id v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v113 = v11;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Stream setup is in progress, adding this to remote pending request queue", buf, 0xCu);
  }
  if (self) {
    pendingRemoteSnapshotRequestDuringStreamSetup = v9->_pendingRemoteSnapshotRequestDuringStreamSetup;
  }
  else {
    pendingRemoteSnapshotRequestDuringStreamSetup = 0;
  }
  [(NSMutableArray *)pendingRemoteSnapshotRequestDuringStreamSetup addObject:v4];
LABEL_38:
}

- (void)_sendSnapshotRequestStreamReceiver:(void *)a3 snapshotSessionID:
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    id v7 = (void *)MEMORY[0x1D9452090]();
    id v8 = a1;
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v36 = v10;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Creating a snapshot session with HMDCameraSnapshotRemoteStreamReceiver", buf, 0xCu);
    }
    id WeakRetained = objc_loadWeakRetained(v8 + 6);
    if (WeakRetained)
    {
      id v34 = v5;
      id v12 = [v8[16] remoteAccessDevice];
      if (v12)
      {
        id v13 = [HMDCameraSnapshotRemoteStreamReceiver alloc];
        uint32_t v14 = [v8 workQueue];
        int v15 = [v8 workQueue];
        int v16 = [v8 uniqueIdentifier];
        id v17 = v8[16];
        id v18 = v8[9];
        __int16 v19 = [(HMDCameraSnapshotRemoteStreamReceiver *)v13 initWithSessionID:v6 workQueue:v14 accessory:WeakRetained delegate:v8 delegateQueue:v15 uniqueIdentifier:v16 snapshotRequestHandler:v18 residentMessageHandler:v17 remoteDevice:v12];

        id v20 = v8[17];
        id v21 = v8[15];
        id v22 = v20;
        uint64_t v23 = [v21 reachabilityPath];
        LOBYTE(v33) = [v6 isSnapshotRequestForBulletin];
        id v5 = v34;
        id v24 = [v22 createLocalSnapshotSessionWithID:v6 accessory:WeakRetained snapshotGetter:v19 message:v34 waitPeriod:v23 reachabilityPath:0 cameraLocallyReachable:60.0 snapshotForNotification:v33];

        objc_storeStrong(v8 + 4, v24);
        -[HMDCameraSnapshotManager _issueGetSnapshot:](v8, v8[4]);
      }
      else
      {
        id v29 = (void *)MEMORY[0x1D9452090]();
        long long v30 = v8;
        uint64_t v31 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          long long v32 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v36 = v32;
          _os_log_impl(&dword_1D49D5000, v31, OS_LOG_TYPE_ERROR, "%{public}@Failed to create snapshot session with HMDCameraSnapshotRemoteStreamReceiver: no remote access device", buf, 0xCu);
        }
        __int16 v19 = [MEMORY[0x1E4F28C58] hmErrorWithCode:91];
        [v5 respondWithError:v19];
      }
    }
    else
    {
      id v25 = (void *)MEMORY[0x1D9452090]();
      uint64_t v26 = v8;
      uint64_t v27 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        uint64_t v28 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v36 = v28;
        _os_log_impl(&dword_1D49D5000, v27, OS_LOG_TYPE_ERROR, "%{public}@Failed to create snapshot session with HMDCameraSnapshotRemoteStreamReceiver: accessory reference is nil", buf, 0xCu);
      }
      id v12 = [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
      [v5 respondWithError:v12];
    }
  }
}

- (void)_sendSnapshotRequestRelayReceiver:(void *)a3 snapshotSessionID:
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    id v7 = (void *)MEMORY[0x1D9452090]();
    id v8 = a1;
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v44 = v10;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Creating a snapshot session with HMDCameraSnapshotRemoteRelayReceiver", buf, 0xCu);
    }
    id WeakRetained = objc_loadWeakRetained(v8 + 6);
    if (WeakRetained)
    {
      id v12 = [v8[16] remoteAccessDevice];
      if (v12)
      {
        id v13 = v8[17];
        uint32_t v14 = [v8 workQueue];
        int v15 = [v8 workQueue];
        [v8 uniqueIdentifier];
        id v42 = WeakRetained;
        id v16 = v6;
        id v18 = v17 = v5;
        id v19 = v8[16];
        id v20 = v8[9];
        id v21 = [v13 createSnapshotRemoteRelayReceiverWithSessionID:v16 workQueue:v14 accessory:v42 delegate:v8 delegateQueue:v15 uniqueIdentifier:v18 snapshotRequestHandler:v20 residentMessageHandler:v19 remoteDevice:v12];

        id v5 = v17;
        id v22 = v8[17];
        id v23 = v8[15];
        id v24 = v22;
        id v6 = v16;
        id WeakRetained = v42;
        id v25 = v24;
        uint64_t v26 = [v23 reachabilityPath];
        LOBYTE(v41) = [v6 isSnapshotRequestForBulletin];
        uint64_t v27 = [v25 createLocalSnapshotSessionWithID:v6 accessory:v42 snapshotGetter:v21 message:v5 waitPeriod:v26 reachabilityPath:0 cameraLocallyReachable:60.0 snapshotForNotification:v41];
        objc_storeStrong(v8 + 4, v27);

        uint64_t v28 = (void *)MEMORY[0x1D9452090]();
        id v29 = v8;
        long long v30 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          uint64_t v31 = HMFGetLogIdentifier();
          long long v32 = v29[4];
          *(_DWORD *)buf = 138543618;
          v44 = v31;
          __int16 v45 = 2112;
          v46 = v32;
          _os_log_impl(&dword_1D49D5000, v30, OS_LOG_TYPE_INFO, "%{public}@Creating a snapshot session %@ with HMDCameraSnapshotRemoteRelayReceiver", buf, 0x16u);
        }
        -[HMDCameraSnapshotManager _issueGetSnapshot:](v29, v29[4]);
      }
      else
      {
        uint64_t v37 = (void *)MEMORY[0x1D9452090]();
        __int16 v38 = v8;
        id v39 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          id v40 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v44 = v40;
          _os_log_impl(&dword_1D49D5000, v39, OS_LOG_TYPE_ERROR, "%{public}@Failed to create snapshot session with HMDCameraSnapshotRemoteRelayReceiver: no remote access device", buf, 0xCu);
        }
        id v21 = [MEMORY[0x1E4F28C58] hmErrorWithCode:91];
        [v5 respondWithError:v21];
      }
    }
    else
    {
      uint64_t v33 = (void *)MEMORY[0x1D9452090]();
      id v34 = v8;
      __int16 v35 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        v36 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v44 = v36;
        _os_log_impl(&dword_1D49D5000, v35, OS_LOG_TYPE_ERROR, "%{public}@Failed to create snapshot session with HMDCameraSnapshotRemoteRelayReceiver: accessory reference is nil", buf, 0xCu);
      }
      id v12 = [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
      [v5 respondWithError:v12];
    }
  }
}

- (void)_handleCreateSnapshotFromBulletinContextMessage:(id)a3
{
  v39[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDCameraSnapshotManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [v4 stringForKey:@"kCameraSessionID"];
  id v7 = [v4 stringForKey:*MEMORY[0x1E4F2EE88]];
  uint64_t v8 = [v4 dateForKey:*MEMORY[0x1E4F2EE80]];
  id v9 = (void *)v8;
  if (!v6 || (v7 ? (BOOL v10 = v8 == 0) : (BOOL v10 = 1), v10))
  {
    id v23 = (void *)MEMORY[0x1D9452090]();
    id v24 = self;
    id v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      uint64_t v26 = HMFGetLogIdentifier();
      uint64_t v27 = [v4 messagePayload];
      int v33 = 138543618;
      id v34 = v26;
      __int16 v35 = 2112;
      v36 = v27;
      _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_ERROR, "%{public}@Snapshot session ID or path or capture date is not present in request: %@", (uint8_t *)&v33, 0x16u);
    }
    id v13 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
    [v4 respondWithError:v13];
  }
  else
  {
    int v11 = [HMDSnapshotFile alloc];
    if (self) {
      imageCacheDirectory = self->_imageCacheDirectory;
    }
    else {
      imageCacheDirectory = 0;
    }
    id v13 = [(HMDSnapshotFile *)v11 initWithImageDirectory:imageCacheDirectory externalFilePath:v7 snapshotTimestamp:v9];
    if (v13)
    {
      if (self) {
        snapshotSlotManager = self->_snapshotSlotManager;
      }
      else {
        snapshotSlotManager = 0;
      }
      v39[0] = v4;
      int v15 = (void *)MEMORY[0x1E4F1C978];
      id v16 = snapshotSlotManager;
      id v17 = [v15 arrayWithObjects:v39 count:1];
      id v18 = [(HMDSnapshotSlotManager *)v16 createSlotForSnapshotFile:v13 requestMessages:v17 shouldNotifyClients:0];

      id v19 = (void *)MEMORY[0x1D9452090]();
      id v20 = self;
      id v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        id v22 = HMFGetLogIdentifier();
        int v33 = 138543874;
        id v34 = v22;
        __int16 v35 = 2112;
        v36 = v18;
        __int16 v37 = 2112;
        __int16 v38 = v7;
        _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_INFO, "%{public}@Created a slot %@ for the snapshot file %@", (uint8_t *)&v33, 0x20u);
      }
      [v4 respondWithPayload:v18];
    }
    else
    {
      uint64_t v28 = (void *)MEMORY[0x1D9452090]();
      id v29 = self;
      long long v30 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        uint64_t v31 = HMFGetLogIdentifier();
        long long v32 = [v4 messagePayload];
        int v33 = 138543618;
        id v34 = v31;
        __int16 v35 = 2112;
        v36 = v32;
        _os_log_impl(&dword_1D49D5000, v30, OS_LOG_TYPE_ERROR, "%{public}@Failed to create snapshot file for request %@", (uint8_t *)&v33, 0x16u);
      }
      id v18 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
      [v4 respondWithError:v18];
    }
  }
}

- (void)_handleReleaseSnapshotMessage:(id)a3
{
  if (self) {
    self = (HMDCameraSnapshotManager *)self->_snapshotSlotManager;
  }
  [(HMDCameraSnapshotManager *)self handleReleaseSnapshot:a3];
}

- (void)_handleFillSnapshotSlotMessage:(id)a3
{
  if (self) {
    self = (HMDCameraSnapshotManager *)self->_snapshotSlotManager;
  }
  [(HMDCameraSnapshotManager *)self handleFillSnapshotSlot:a3];
}

- (void)handleAccessoryUnconfigured:(id)a3
{
  id v4 = [(HMDCameraSnapshotManager *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__HMDCameraSnapshotManager_handleAccessoryUnconfigured___block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(v4, block);
}

void __56__HMDCameraSnapshotManager_handleAccessoryUnconfigured___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] hmErrorWithCode:4];
  -[HMDCameraSnapshotManager _removeAllPendingRequests:](v1, v2);
}

- (void)releaseSnapshotWithSlotIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDCameraSnapshotManager *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__HMDCameraSnapshotManager_releaseSnapshotWithSlotIdentifier___block_invoke;
  v7[3] = &unk_1E6A197C8;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __62__HMDCameraSnapshotManager_releaseSnapshotWithSlotIdentifier___block_invoke(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v5 = *MEMORY[0x1E4F2E028];
  v6[0] = v2;
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  id v4 = [MEMORY[0x1E4F65480] messageWithName:*MEMORY[0x1E4F2CD20] messagePayload:v3 responseHandler:&__block_literal_global_45_104501];
  [*(id *)(a1 + 40) _handleReleaseSnapshotMessage:v4];
}

- (void)takeSnapshot:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HMDCameraSnapshotManager *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__HMDCameraSnapshotManager_takeSnapshot___block_invoke;
  v7[3] = &unk_1E6A197C8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __41__HMDCameraSnapshotManager_takeSnapshot___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleTakeSnapshotMessage:*(void *)(a1 + 40)];
}

- (void)registerForMessages
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v3 = -[HMDCameraSnapshotManager accessory]((id *)&self->super.super.isa);
  id v4 = [v3 home];
  uint64_t v5 = +[HMDUserMessagePolicy userMessagePolicyWithHome:v4 userPrivilege:0 remoteAccessRequired:1 requiresCameraStreamingAccess:1];

  id v6 = +[HMDRemoteMessagePolicy defaultSecurePolicy];
  objc_msgSend(v6, "setRoles:", objc_msgSend(v6, "roles") | 6);
  uint64_t v7 = [v6 copy];
  id v8 = (void *)v7;
  if (self)
  {
    msgDispatcher = self->_msgDispatcher;
    uint64_t v55 = v7;
    long long v56 = v5;
    BOOL v10 = (void *)MEMORY[0x1E4F1C978];
    int v11 = msgDispatcher;
    id v12 = [v10 arrayWithObjects:&v55 count:2];
    [(HMFMessageDispatcher *)v11 registerForMessage:@"kTakeSnapshotRemoteRequestKey" receiver:self policies:v12 selector:sel__handleTakeRemoteSnapshotMessage_];

    id v13 = self->_msgDispatcher;
  }
  else
  {
    uint64_t v55 = v7;
    long long v56 = v5;
    long long v48 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v55 count:2];
    [0 registerForMessage:@"kTakeSnapshotRemoteRequestKey" receiver:0 policies:v48 selector:sel__handleTakeRemoteSnapshotMessage_];

    id v13 = 0;
  }
  v54[0] = v8;
  v54[1] = v5;
  uint32_t v14 = (void *)MEMORY[0x1E4F1C978];
  int v15 = v13;
  id v16 = [v14 arrayWithObjects:v54 count:2];
  [(HMFMessageDispatcher *)v15 registerForMessage:@"kTakeSnapshotRemoteReceivedKey" receiver:self policies:v16 selector:sel__handleRemoteSnapshotReceivedMessage_];

  uint64_t v17 = +[HMDRemoteMessagePolicy defaultSecurePolicy];
  id v18 = (void *)v17;
  if (self) {
    id v19 = self->_msgDispatcher;
  }
  else {
    id v19 = 0;
  }
  v53[0] = v17;
  v53[1] = v5;
  id v20 = (void *)MEMORY[0x1E4F1C978];
  id v21 = v19;
  id v22 = [v20 arrayWithObjects:v53 count:2];
  [(HMFMessageDispatcher *)v21 registerForMessage:@"kTakeSnapshotSendFailedNotificationKey" receiver:self policies:v22 selector:sel__handleTakeRemoteSnapshotFailureMessage_];

  uint64_t v23 = +[HMDXPCMessagePolicy policyWithEntitlements:1];
  id v24 = (void *)v23;
  if (self) {
    id v25 = self->_msgDispatcher;
  }
  else {
    id v25 = 0;
  }
  uint64_t v26 = *MEMORY[0x1E4F2CD28];
  v52[0] = v23;
  v52[1] = v5;
  uint64_t v27 = (void *)MEMORY[0x1E4F1C978];
  uint64_t v28 = v25;
  id v29 = [v27 arrayWithObjects:v52 count:2];
  [(HMFMessageDispatcher *)v28 registerForMessage:v26 receiver:self policies:v29 selector:sel__handleTakeSnapshotMessage_];

  if (self) {
    long long v30 = self->_msgDispatcher;
  }
  else {
    long long v30 = 0;
  }
  uint64_t v31 = *MEMORY[0x1E4F2CD20];
  v51[0] = v24;
  v51[1] = v5;
  long long v32 = (void *)MEMORY[0x1E4F1C978];
  int v33 = v30;
  id v34 = [v32 arrayWithObjects:v51 count:2];
  [(HMFMessageDispatcher *)v33 registerForMessage:v31 receiver:self policies:v34 selector:sel__handleReleaseSnapshotMessage_];

  if (self) {
    __int16 v35 = self->_msgDispatcher;
  }
  else {
    __int16 v35 = 0;
  }
  uint64_t v36 = *MEMORY[0x1E4F2CD08];
  v50[0] = v24;
  v50[1] = v5;
  __int16 v37 = (void *)MEMORY[0x1E4F1C978];
  __int16 v38 = v35;
  id v39 = [v37 arrayWithObjects:v50 count:2];
  [(HMFMessageDispatcher *)v38 registerForMessage:v36 receiver:self policies:v39 selector:sel__handleFillSnapshotSlotMessage_];

  if (self) {
    id v40 = self->_msgDispatcher;
  }
  else {
    id v40 = 0;
  }
  uint64_t v41 = *MEMORY[0x1E4F2CD00];
  v49[0] = v24;
  v49[1] = v5;
  id v42 = (void *)MEMORY[0x1E4F1C978];
  uint64_t v43 = v40;
  v44 = [v42 arrayWithObjects:v49 count:2];
  [(HMFMessageDispatcher *)v43 registerForMessage:v41 receiver:self policies:v44 selector:sel__handleCreateSnapshotFromBulletinContextMessage_];

  __int16 v45 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v45 addObserver:self selector:sel_handleAccessoryUnconfigured_ name:@"HMDAccessoryDisconnectedNotification" object:v3];

  v46 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v46 addObserver:self selector:sel_handleCameraSettingsDidChangeNotification_ name:@"HMDCameraProfileSettingsDidChangeNotification" object:v3];

  if (self)
  {
    [(HMDCameraSnapshotMonitorEvents *)self->_monitorServicesManager registerForMessages];
    snapshotSlotManager = self->_snapshotSlotManager;
  }
  else
  {
    [0 registerForMessages];
    snapshotSlotManager = 0;
  }
  [(HMDSnapshotSlotManager *)snapshotSlotManager registerForMessages];
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28C58] hmInternalErrorWithCode:1039];
  -[HMDCameraSnapshotManager _removeAllPendingRequests:]((uint64_t)self, v3);

  if (self) {
    msgDispatcher = self->_msgDispatcher;
  }
  else {
    msgDispatcher = 0;
  }
  [(HMFMessageDispatcher *)msgDispatcher deregisterReceiver:self];
  v5.receiver = self;
  v5.super_class = (Class)HMDCameraSnapshotManager;
  [(HMDCameraSnapshotManager *)&v5 dealloc];
}

- (HMDCameraSnapshotManager)initWithAccessory:(id)a3 workQueue:(id)a4 streamSnapshotHandler:(id)a5 uniqueIdentifier:(id)a6 msgDispatcher:(id)a7 networkMonitor:(id)a8 logIdentifier:(id)a9 imageCacheDirectory:(id)a10 residentMessageHandler:(id)a11 snapshotSlotManager:(id)a12 dataSource:(id)a13
{
  obuint64_t j = a3;
  id v53 = a4;
  id v52 = a5;
  id v18 = a6;
  id v51 = a7;
  id v46 = a8;
  id v50 = a8;
  id v19 = a9;
  id v20 = a10;
  id v49 = a11;
  id v21 = a12;
  id v48 = a13;
  v55.receiver = self;
  v55.super_class = (Class)HMDCameraSnapshotManager;
  id v22 = [(HMDCameraSnapshotManager *)&v55 init];
  uint64_t v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_workQueue, a4);
    objc_storeStrong((id *)&v23->_msgDispatcher, a7);
    objc_storeWeak((id *)&v23->_accessory, obj);
    uint64_t v24 = [v18 copy];
    uniqueIdentifier = v23->_uniqueIdentifier;
    v23->_uniqueIdentifier = (NSUUID *)v24;

    uint64_t v26 = [MEMORY[0x1E4F1CA60] dictionary];
    currentRemoteSessions = v23->_currentRemoteSessions;
    v23->_currentRemoteSessions = (NSMutableDictionary *)v26;

    objc_storeStrong((id *)&v23->_networkMonitor, v46);
    objc_storeStrong((id *)&v23->_residentMessageHandler, a11);
    objc_storeStrong((id *)&v23->_dataSource, a13);
    id v28 = v19;
    uint64_t v29 = [v19 copy];
    logIdentifier = v23->_logIdentifier;
    v23->_logIdentifier = (NSString *)v29;

    uint64_t v31 = [v20 copy];
    imageCacheDirectory = v23->_imageCacheDirectory;
    v23->_imageCacheDirectory = (NSString *)v31;

    createDirectory(v23->_imageCacheDirectory);
    if (!isWatch())
    {
      int v33 = [[HMDCameraSnapshotMonitorEvents alloc] initWithSnapshotManager:v23 accessory:obj workQueue:v23->_workQueue msgDispatcher:v51];
      monitorServicesManager = v23->_monitorServicesManager;
      v23->_monitorServicesManager = v33;
    }
    __int16 v35 = [[HMDSnapshotRequestHandler alloc] initWithAccessory:obj workQueue:v53 streamSnapshotHandler:v52 imageCacheDirectory:v23->_imageCacheDirectory logID:v23->_logIdentifier];
    snapshotRequestHandler = v23->_snapshotRequestHandler;
    v23->_snapshotRequestHandler = v35;

    __int16 v37 = +[HMDDeviceCapabilities deviceCapabilities];
    int v38 = [v37 isResidentCapable];

    if (v38)
    {
      id v39 = [[HMDSnapshotCacheRequestHandler alloc] initWithWorkQueue:v53 logID:v23->_logIdentifier];
      snapshotCacheRequestHandler = v23->_snapshotCacheRequestHandler;
      v23->_snapshotCacheRequestHandler = v39;
    }
    objc_storeStrong((id *)&v23->_snapshotSlotManager, a12);
    objc_storeStrong((id *)&v23->_streamSnapshotHandler, a5);
    uint64_t v41 = [MEMORY[0x1E4F1CA48] array];
    pendingSnapshotRequestDuringStreamSetup = v23->_pendingSnapshotRequestDuringStreamSetup;
    v23->_pendingSnapshotRequestDuringStreamSetup = (NSMutableArray *)v41;

    uint64_t v43 = [MEMORY[0x1E4F1CA48] array];
    pendingRemoteSnapshotRequestDuringStreamSetup = v23->_pendingRemoteSnapshotRequestDuringStreamSetup;
    v23->_pendingRemoteSnapshotRequestDuringStreamSetup = (NSMutableArray *)v43;

    [(HMDCameraStreamSnapshotHandler *)v23->_streamSnapshotHandler addDelegate:v23];
    id v19 = v28;
  }

  return v23;
}

- (HMDCameraSnapshotManager)initWithAccessory:(id)a3 workQueue:(id)a4 streamSnapshotHandler:(id)a5 uniqueIdentifier:(id)a6 msgDispatcher:(id)a7 networkMonitor:(id)a8
{
  id v13 = NSString;
  id v31 = a8;
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  id v19 = [v18 home];
  id v20 = [v19 name];
  id v21 = [v18 name];
  id v22 = [v13 stringWithFormat:@"%@/%@/%@", v20, v21, v15];

  uint64_t v23 = getImagesPath();
  uint64_t v24 = [v18 uuid];
  id v25 = [v24 UUIDString];
  uint64_t v26 = [v23 stringByAppendingPathComponent:v25];

  long long v30 = [[HMDCameraResidentMessageHandler alloc] initWithAccessory:v18 logIdentifier:v22];
  uint64_t v27 = [[HMDSnapshotSlotManager alloc] initWithAccessory:v18 workQueue:v17 imageCacheDirectory:v26 logID:v22 uniqueIdentifier:v15 msgDispatcher:v14];
  id v28 = objc_alloc_init(HMDCameraSnapshotManagerDataSource);
  int v33 = [(HMDCameraSnapshotManager *)self initWithAccessory:v18 workQueue:v17 streamSnapshotHandler:v16 uniqueIdentifier:v15 msgDispatcher:v14 networkMonitor:v31 logIdentifier:v22 imageCacheDirectory:v26 residentMessageHandler:v30 snapshotSlotManager:v27 dataSource:v28];

  return v33;
}

uint64_t __39__HMDCameraSnapshotManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v75;
  logCategory__hmf_once_v75 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (void)cleanStaleSnapshotDirectoriesUsingCurrentAccessories:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v29 = v3;
  objc_super v5 = objc_msgSend(v3, "na_map:", &__block_literal_global_104543);
  id v6 = [v4 setWithArray:v5];

  uint64_t v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v8 = getImagesPath();
  id v9 = [v7 contentsOfDirectoryAtPath:v8 error:0];

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  obuint64_t j = v9;
  uint64_t v10 = [obj countByEnumeratingWithState:&v33 objects:v43 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v34 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v33 + 1) + 8 * i);
        if (([v6 containsObject:v14] & 1) == 0)
        {
          id v15 = getImagesPath();
          id v16 = [v15 stringByAppendingPathComponent:v14];

          id v17 = [MEMORY[0x1E4F28CB8] defaultManager];
          id v32 = 0;
          int v18 = [v17 removeItemAtPath:v16 error:&v32];
          id v19 = v32;

          id v20 = (void *)MEMORY[0x1D9452090]();
          id v21 = a1;
          id v22 = HMFGetOSLogHandle();
          uint64_t v23 = v22;
          if (v18)
          {
            if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
            {
              uint64_t v24 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              int v38 = v24;
              __int16 v39 = 2112;
              id v40 = v16;
              id v25 = v23;
              os_log_type_t v26 = OS_LOG_TYPE_INFO;
              uint64_t v27 = "%{public}@Removed snapshot directory at path: %@";
              uint32_t v28 = 22;
              goto LABEL_12;
            }
          }
          else if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            uint64_t v24 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543874;
            int v38 = v24;
            __int16 v39 = 2112;
            id v40 = v16;
            __int16 v41 = 2112;
            id v42 = v19;
            id v25 = v23;
            os_log_type_t v26 = OS_LOG_TYPE_ERROR;
            uint64_t v27 = "%{public}@Failed to remove snapshot directory at path %@: %@";
            uint32_t v28 = 32;
LABEL_12:
            _os_log_impl(&dword_1D49D5000, v25, v26, v27, buf, v28);
          }

          continue;
        }
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v33 objects:v43 count:16];
    }
    while (v11);
  }
}

id __81__HMDCameraSnapshotManager_cleanStaleSnapshotDirectoriesUsingCurrentAccessories___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 uuid];
  id v3 = [v2 UUIDString];

  return v3;
}

@end