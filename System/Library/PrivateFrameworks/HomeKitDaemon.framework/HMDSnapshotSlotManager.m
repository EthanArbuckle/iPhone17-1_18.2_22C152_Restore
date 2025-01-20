@interface HMDSnapshotSlotManager
+ (id)logCategory;
- (HMDSnapshotSlotManager)initWithAccessory:(id)a3 workQueue:(id)a4 imageCacheDirectory:(id)a5 logID:(id)a6 uniqueIdentifier:(id)a7 msgDispatcher:(id)a8;
- (NSDictionary)encodedMostRecentSnapshot;
- (NSString)logIdentifier;
- (NSUUID)uniqueIdentifier;
- (id)_snapshotFileWithSlotIdentifier:(id *)a1;
- (id)createSlotForSnapshotFile:(id)a3 requestMessages:(id)a4 shouldNotifyClients:(BOOL)a5;
- (id)encodedMostRecentSnapshotForMessage:(id)a3;
- (void)backboardServicesRelaunched:(id)a3;
- (void)handleFillSnapshotSlot:(id)a3;
- (void)handleProcessStateChange:(id)a3;
- (void)handleReleaseSnapshot:(id)a3;
- (void)registerForMessages;
@end

@implementation HMDSnapshotSlotManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_storeStrong((id *)&self->_mostRecentSnapshot, 0);
  objc_storeStrong((id *)&self->_notificationRegistration, 0);
  objc_storeStrong((id *)&self->_imageCacheDirectory, 0);
  objc_storeStrong((id *)&self->_msgDispatcher, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_accessory);
  objc_storeStrong((id *)&self->_snapshotFilesByAssociatedProcessInfo, 0);
  objc_storeStrong((id *)&self->_filledSnapshotSlotIdentifiersByProcess, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

- (NSString)logIdentifier
{
  return self->_logIdentifier;
}

- (NSUUID)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (NSDictionary)encodedMostRecentSnapshot
{
  if (self)
  {
    self = (HMDSnapshotSlotManager *)objc_getProperty(self, a2, 72, 1);
    uint64_t v2 = vars8;
  }
  return (NSDictionary *)encodedSnapshotFile(self);
}

- (id)encodedMostRecentSnapshotForMessage:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
    id Property = objc_getProperty(self, v5, 72, 1);
  }
  else
  {
    dispatch_assert_queue_V2(0);
    id Property = 0;
  }
  id v7 = Property;
  if (!isMostRecentSnapshotValid(v7))
  {
    v20 = (void *)MEMORY[0x230FBD990]();
    v21 = self;
    v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v23 = HMFGetLogIdentifier();
      v24 = [v4 shortDescription];
      int v27 = 138543874;
      v28 = v23;
      __int16 v29 = 2112;
      id v30 = v24;
      __int16 v31 = 2112;
      id v32 = v7;
      _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_INFO, "%{public}@Not encoding invalid most recent snapshot for message %@: %@", (uint8_t *)&v27, 0x20u);
    }
    goto LABEL_14;
  }
  v8 = [v7 snapshotTimestamp];
  [v8 timeIntervalSinceNow];
  double v10 = fabs(v9);

  if (v10 > 2.0)
  {
LABEL_14:
    v19 = 0;
    goto LABEL_19;
  }
  v11 = [v4 proxyConnection];
  v12 = [v11 processInfo];

  v13 = (void *)MEMORY[0x230FBD990]();
  v14 = self;
  v15 = HMFGetOSLogHandle();
  v16 = v15;
  if (v12)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v17 = HMFGetLogIdentifier();
      int v27 = 138543874;
      v28 = v17;
      __int16 v29 = 2112;
      id v30 = v12;
      __int16 v31 = 2112;
      id v32 = v7;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Associating process info %@ with most recent snapshot file: %@", (uint8_t *)&v27, 0x20u);
    }
    if (self) {
      snapshotFilesByAssociatedProcessInfo = v14->_snapshotFilesByAssociatedProcessInfo;
    }
    else {
      snapshotFilesByAssociatedProcessInfo = 0;
    }
    [(NSMapTable *)snapshotFilesByAssociatedProcessInfo setObject:v7 forKey:v12];
    v19 = encodedSnapshotFile(v7);
  }
  else
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v25 = HMFGetLogIdentifier();
      int v27 = 138543618;
      v28 = v25;
      __int16 v29 = 2112;
      id v30 = v4;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@Cannot encode most recent snapshot for message without process info: %@", (uint8_t *)&v27, 0x16u);
    }
    v19 = 0;
  }

LABEL_19:
  return v19;
}

- (id)createSlotForSnapshotFile:(id)a3 requestMessages:(id)a4 shouldNotifyClients:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  if (self) {
    workQueue = self->_workQueue;
  }
  else {
    workQueue = 0;
  }
  dispatch_assert_queue_V2(workQueue);
  v11 = (void *)MEMORY[0x263F424F0];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __88__HMDSnapshotSlotManager_createSlotForSnapshotFile_requestMessages_shouldNotifyClients___block_invoke;
  v16[3] = &unk_264A2B1D8;
  id v17 = v9;
  v18 = self;
  id v19 = v8;
  BOOL v20 = a5;
  id v12 = v8;
  id v13 = v9;
  [v11 activityWithName:@"Render Snapshot" block:v16];
  v14 = encodedSnapshotFile(v12);

  return v14;
}

void __88__HMDSnapshotSlotManager_createSlotForSnapshotFile_requestMessages_shouldNotifyClients___block_invoke(uint64_t a1)
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v2 = [obj countByEnumeratingWithState:&v48 objects:v52 count:16];
  id v4 = &OBJC_IVAR___HMDNetworkRouterFirewallRuleWAN__portEnd;
  if (v2)
  {
    uint64_t v5 = v2;
    uint64_t v6 = *(void *)v49;
    *(void *)&long long v3 = 138543618;
    long long v46 = v3;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v49 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v48 + 1) + 8 * v7);
        id v9 = objc_msgSend(v8, "proxyConnection", v46);
        double v10 = [v9 processInfo];

        v11 = (void *)MEMORY[0x230FBD990]();
        id v12 = *(id *)(a1 + 40);
        id v13 = HMFGetOSLogHandle();
        v14 = v13;
        if (v10)
        {
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            v15 = HMFGetLogIdentifier();
            v16 = *(void **)(a1 + 48);
            *(_DWORD *)buf = 138543874;
            *(void *)&buf[4] = v15;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v10;
            *(_WORD *)&buf[22] = 2112;
            v54 = v16;
            _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Associating process info %@ with snapshot file: %@", buf, 0x20u);
          }
          uint64_t v17 = *(void *)(a1 + 40);
          if (v17) {
            v18 = *(void **)(v17 + v4[893]);
          }
          else {
            v18 = 0;
          }
          [v18 setObject:*(void *)(a1 + 48) forKey:v10];
        }
        else
        {
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            id v19 = HMFGetLogIdentifier();
            *(_DWORD *)buf = v46;
            *(void *)&buf[4] = v19;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v8;
            _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Cannot associate snapshot file for message without process info: %@", buf, 0x16u);

            id v4 = &OBJC_IVAR___HMDNetworkRouterFirewallRuleWAN__portEnd;
          }
        }

        ++v7;
      }
      while (v5 != v7);
      uint64_t v20 = [obj countByEnumeratingWithState:&v48 objects:v52 count:16];
      uint64_t v5 = v20;
    }
    while (v20);
  }

  v21 = (void *)MEMORY[0x230FBD990]();
  id v22 = *(id *)(a1 + 40);
  v23 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v24 = HMFGetLogIdentifier();
    v25 = (void *)v24;
    uint64_t v26 = *(void *)(a1 + 40);
    if (v26) {
      uint64_t v26 = *(void *)(v26 + 24);
    }
    *(_DWORD *)buf = 138543618;
    *(void *)&buf[4] = v24;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v26;
    _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_DEBUG, "%{public}@Current snapshot-application map: %@", buf, 0x16u);
  }
  [*(id *)(a1 + 48) updateSlotIdentifier];
  int v27 = *(dispatch_queue_t **)(a1 + 40);
  int v28 = *(unsigned __int8 *)(a1 + 56);
  id v29 = *(id *)(a1 + 48);
  if (v27)
  {
    dispatch_assert_queue_V2(v27[5]);
    id v30 = v29;
    dispatch_assert_queue_V2(v27[5]);
    if (!isMostRecentSnapshotValid(v30))
    {
      v36 = (void *)MEMORY[0x230FBD990]();
      v37 = v27;
      v38 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        v39 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v39;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v30;
        _os_log_impl(&dword_22F52A000, v38, OS_LOG_TYPE_INFO, "%{public}@Not updating most recent snapshot with invalid snaphot: %@", buf, 0x16u);
      }
      goto LABEL_36;
    }
    if (objc_getProperty(v27, v31, 72, 1))
    {
      uint64_t v33 = objc_msgSend(objc_getProperty(v27, v32, 72, 1), "snapshotTimestamp");
      v34 = [v30 snapshotTimestamp];
      uint64_t v35 = [v33 compare:v34];

      if (v35 == 1) {
        goto LABEL_37;
      }
    }
    else
    {
    }
    v40 = (void *)MEMORY[0x230FBD990]();
    v41 = v27;
    v42 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      v43 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v43;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v30;
      _os_log_impl(&dword_22F52A000, v42, OS_LOG_TYPE_INFO, "%{public}@Updating most recent snapshot to %@", buf, 0x16u);
    }
    objc_setProperty_atomic(v41, v44, v30, 72);
    if (v28)
    {
      v45 = v41[5];
      *(void *)buf = MEMORY[0x263EF8330];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __72__HMDSnapshotSlotManager__updateMostRecentSnapshot_shouldNotifyClients___block_invoke;
      v54 = &unk_264A2F820;
      id v55 = v30;
      v56 = v41;
      dispatch_async(v45, buf);
      id v30 = v55;
LABEL_36:
    }
  }
LABEL_37:
}

void __72__HMDSnapshotSlotManager__updateMostRecentSnapshot_shouldNotifyClients___block_invoke(uint64_t a1)
{
  encodedSnapshotFile(*(void **)(a1 + 32));
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = objc_alloc(MEMORY[0x263F42570]);
  long long v3 = [*(id *)(a1 + 40) uniqueIdentifier];
  id v4 = (void *)[v2 initWithTarget:v3];

  id v5 = objc_alloc(MEMORY[0x263F42590]);
  uint64_t v6 = (void *)[v5 initWithName:*MEMORY[0x263F0BD60] destination:v4 payload:v10];
  uint64_t v7 = [[HMDHomeManagerXPCMessageSendPolicy alloc] initWithEntitlements:1 options:513 active:1];
  [v6 setSendPolicy:v7];
  uint64_t v8 = *(void *)(a1 + 40);
  if (v8) {
    id v9 = *(void **)(v8 + 48);
  }
  else {
    id v9 = 0;
  }
  [v9 sendMessage:v6];
}

- (void)handleReleaseSnapshot:(id)a3
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self) {
    workQueue = self->_workQueue;
  }
  else {
    workQueue = 0;
  }
  dispatch_assert_queue_V2(workQueue);
  uint64_t v6 = [v4 numberForKey:*MEMORY[0x263F0D9C0]];
  uint64_t v7 = (void *)MEMORY[0x230FBD990]();
  uint64_t v8 = self;
  id v9 = HMFGetOSLogHandle();
  id v10 = v9;
  v40 = (void *)v6;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v47 = v11;
      __int16 v48 = 2112;
      uint64_t v49 = v6;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Releasing snapshot file with slot identifier: %@", buf, 0x16u);
    }
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v12 = &OBJC_IVAR___HMDNetworkRouterFirewallRuleWAN__portEnd;
    v38 = v4;
    if (self) {
      snapshotFilesByAssociatedProcessInfo = v8->_snapshotFilesByAssociatedProcessInfo;
    }
    else {
      snapshotFilesByAssociatedProcessInfo = 0;
    }
    v14 = (void *)[(NSMapTable *)snapshotFilesByAssociatedProcessInfo copy];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v41 objects:v45 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v42;
      id obj = v14;
      while (2)
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v42 != v17) {
            objc_enumerationMutation(obj);
          }
          uint64_t v19 = *(void *)(*((void *)&v41 + 1) + 8 * v18);
          uint64_t v20 = v12;
          if (self) {
            v21 = *(Class *)((char *)&v8->super.super.isa + v12[893]);
          }
          else {
            v21 = 0;
          }
          id v22 = v21;
          v23 = [v22 objectForKey:v19];

          uint64_t v24 = [v23 slotIdentifier];
          int v25 = [v24 isEqualToNumber:v40];

          if (v25)
          {
            id v32 = (void *)MEMORY[0x230FBD990]();
            uint64_t v33 = v8;
            v34 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
            {
              uint64_t v35 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              v47 = v35;
              __int16 v48 = 2112;
              uint64_t v49 = (uint64_t)v23;
              _os_log_impl(&dword_22F52A000, v34, OS_LOG_TYPE_INFO, "%{public}@Releasing snapshot file: %@", buf, 0x16u);
            }
            id v4 = v38;
            __int16 v31 = obj;
            if (self) {
              v36 = *(Class *)((char *)&v33->super.super.isa + v20[893]);
            }
            else {
              v36 = 0;
            }
            [v36 removeObjectForKey:v19];
            [v38 respondWithSuccess];

            goto LABEL_32;
          }

          ++v18;
          id v12 = v20;
        }
        while (v16 != v18);
        v14 = obj;
        uint64_t v26 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
        uint64_t v16 = v26;
        if (v26) {
          continue;
        }
        break;
      }
    }

    int v27 = (void *)MEMORY[0x230FBD990]();
    int v28 = v8;
    id v29 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      id v30 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v47 = v30;
      __int16 v48 = 2112;
      uint64_t v49 = (uint64_t)v40;
      _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@Could not find snapshot file to release with slot identifier: %@", buf, 0x16u);
    }
    __int16 v31 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
    id v4 = v38;
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v37 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v47 = v37;
      __int16 v48 = 2112;
      uint64_t v49 = (uint64_t)v4;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Cannot find slot identifier in release snapshot message payload: %@", buf, 0x16u);
    }
    __int16 v31 = [MEMORY[0x263F087E8] hmErrorWithCode:20];
  }
  [v4 respondWithError:v31];
LABEL_32:
}

- (void)handleFillSnapshotSlot:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self) {
    workQueue = self->_workQueue;
  }
  else {
    workQueue = 0;
  }
  dispatch_assert_queue_V2(workQueue);
  uint64_t v6 = [v4 numberForKey:*MEMORY[0x263F0D9C0]];
  uint64_t v7 = (void *)MEMORY[0x230FBD990]();
  uint64_t v8 = self;
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    int v27 = 138543618;
    int v28 = v10;
    __int16 v29 = 2112;
    id v30 = v6;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Filling snapshot with slot identifier %@", (uint8_t *)&v27, 0x16u);
  }
  v11 = [v4 proxyConnection];
  id v12 = [v11 processInfo];

  if (v12)
  {
    if (self) {
      filledSnapshotSlotIdentifiersByProcess = v8->_filledSnapshotSlotIdentifiersByProcess;
    }
    else {
      filledSnapshotSlotIdentifiersByProcess = 0;
    }
    v14 = [(NSMapTable *)filledSnapshotSlotIdentifiersByProcess objectForKey:v12];
    if (!v14)
    {
      v14 = [MEMORY[0x263EFF9C0] set];
      if (self) {
        uint64_t v15 = v8->_filledSnapshotSlotIdentifiersByProcess;
      }
      else {
        uint64_t v15 = 0;
      }
      [(NSMapTable *)v15 setObject:v14 forKey:v12];
    }
    [v14 addObject:v6];
    uint64_t v16 = -[HMDSnapshotSlotManager _snapshotFileWithSlotIdentifier:]((id *)&v8->super.super.isa, v6);
    uint64_t v17 = v16;
    if (v16)
    {
      [v16 fillSlot];
      [v4 respondWithSuccess];
    }
    else
    {
      id v22 = (void *)MEMORY[0x230FBD990]();
      v23 = v8;
      uint64_t v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        int v25 = HMFGetLogIdentifier();
        int v27 = 138543618;
        int v28 = v25;
        __int16 v29 = 2112;
        id v30 = v6;
        _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_ERROR, "%{public}@Cannot fill snapshot with slot identifier %@ because it no longer exist", (uint8_t *)&v27, 0x16u);
      }
      uint64_t v26 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
      [v4 respondWithError:v26];
    }
  }
  else
  {
    uint64_t v18 = (void *)MEMORY[0x230FBD990]();
    uint64_t v19 = v8;
    uint64_t v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = HMFGetLogIdentifier();
      int v27 = 138543618;
      int v28 = v21;
      __int16 v29 = 2112;
      id v30 = v4;
      _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@Cannot fill snapshot for message without process info: %@", (uint8_t *)&v27, 0x16u);
    }
    v14 = [MEMORY[0x263F087E8] hmErrorWithCode:20];
    [v4 respondWithError:v14];
  }
}

- (id)_snapshotFileWithSlotIdentifier:(id *)a1
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a2;
  if (a1)
  {
    id v5 = objc_msgSend(objc_getProperty(a1, v3, 72, 1), "slotIdentifier");
    int v6 = [v5 isEqualToNumber:v4];

    if (v6)
    {
      id v8 = objc_getProperty(a1, v7, 72, 1);
      goto LABEL_15;
    }
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v9 = objc_msgSend(a1[3], "objectEnumerator", 0);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v19;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          uint64_t v15 = [v14 slotIdentifier];
          char v16 = [v15 isEqualToNumber:v4];

          if (v16)
          {
            id v8 = v14;

            goto LABEL_15;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
  }
  id v8 = 0;
LABEL_15:

  return v8;
}

- (void)backboardServicesRelaunched:(id)a3
{
  if (self) {
    workQueue = self->_workQueue;
  }
  else {
    workQueue = 0;
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__HMDSnapshotSlotManager_backboardServicesRelaunched___block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(workQueue, block);
}

void __54__HMDSnapshotSlotManager_backboardServicesRelaunched___block_invoke(uint64_t a1)
{
  id v2 = [HMDSnapshotFile alloc];
  long long v3 = *(void **)(a1 + 32);
  if (v3) {
    long long v3 = (void *)v3[7];
  }
  id v5 = v3;
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, v4, 72, 1);
  }
  id v8 = [Property filePath];
  id v9 = *(id *)(a1 + 32);
  if (v9) {
    id v9 = objc_getProperty(v9, v7, 72, 1);
  }
  uint64_t v10 = [v9 snapshotTimestamp];
  uint64_t v12 = [(HMDSnapshotFile *)v2 initWithImageDirectory:v5 filePath:v8 snapshotTimestamp:v10];

  id v11 = (id)[*(id *)(a1 + 32) createSlotForSnapshotFile:v12 requestMessages:MEMORY[0x263EFFA68] shouldNotifyClients:1];
}

- (void)handleProcessStateChange:(id)a3
{
  id v4 = a3;
  if (self) {
    workQueue = self->_workQueue;
  }
  else {
    workQueue = 0;
  }
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __51__HMDSnapshotSlotManager_handleProcessStateChange___block_invoke;
  v7[3] = &unk_264A2F820;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

void __51__HMDSnapshotSlotManager_handleProcessStateChange___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  v1 = *(dispatch_queue_t **)(a1 + 32);
  id v2 = *(id *)(a1 + 40);
  if (v1)
  {
    dispatch_assert_queue_V2(v1[5]);
    long long v3 = [v2 userInfo];
    id v4 = [v3 objectForKeyedSubscript:@"processInfo"];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
    id v6 = v5;

    if (v6)
    {
      unint64_t v7 = [v6 state];
      id v8 = (void *)MEMORY[0x230FBD990]();
      id v9 = v1;
      uint64_t v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        id v11 = HMFGetLogIdentifier();
        uint64_t v12 = [v6 shortDescription];
        if (v7 > 4) {
          id v13 = @"unknown";
        }
        else {
          id v13 = off_264A26338[v7];
        }
        v14 = v13;
        *(_DWORD *)uint64_t v26 = 138543874;
        *(void *)&v26[4] = v11;
        *(_WORD *)&v26[12] = 2112;
        *(void *)&v26[14] = v12;
        *(_WORD *)&v26[22] = 2112;
        int v27 = v14;
        _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Received notification that process info state changed for process %@: %@", v26, 0x20u);
      }
      if (v7)
      {
        id v15 = v9[3];
        char v16 = [v15 objectForKey:v6];

        if (v16)
        {
          uint64_t v17 = (void *)MEMORY[0x230FBD990]();
          long long v18 = v9;
          long long v19 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            long long v20 = HMFGetLogIdentifier();
            *(_DWORD *)uint64_t v26 = 138543874;
            *(void *)&v26[4] = v20;
            *(_WORD *)&v26[12] = 2112;
            *(void *)&v26[14] = v6;
            *(_WORD *)&v26[22] = 2112;
            int v27 = v16;
            _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, "%{public}@Removing snapshot file associated with non-foreground app %@: %@", v26, 0x20u);
          }
          [v18[3] removeObjectForKey:v6];
        }

        if (v7 == 4)
        {
          long long v21 = (void *)MEMORY[0x230FBD990]();
          id v22 = v9;
          uint64_t v23 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            uint64_t v24 = HMFGetLogIdentifier();
            *(_DWORD *)uint64_t v26 = 138543618;
            *(void *)&v26[4] = v24;
            *(_WORD *)&v26[12] = 2112;
            *(void *)&v26[14] = v6;
            _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_INFO, "%{public}@Clearing any of the filled snapshot slots for terminated process: %@", v26, 0x16u);
          }
          int v25 = [v22[2] objectForKey:v6];
          [v22[2] removeObjectForKey:v6];
          *(void *)uint64_t v26 = MEMORY[0x263EF8330];
          *(void *)&v26[8] = 3221225472;
          *(void *)&v26[16] = __52__HMDSnapshotSlotManager__handleProcessStateChange___block_invoke;
          int v27 = (__CFString *)&unk_264A29CF8;
          int v28 = v22;
          objc_msgSend(v25, "na_each:", v26);
        }
      }
    }
  }
}

void __52__HMDSnapshotSlotManager__handleProcessStateChange___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = -[HMDSnapshotSlotManager _snapshotFileWithSlotIdentifier:](*(id **)(a1 + 32), v3);
  if (v4)
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v5 = *(void **)(a1 + 32);
    if (v5) {
      id v5 = (void *)v5[2];
    }
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v24 objects:v34 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v25;
      while (2)
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v25 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v24 + 1) + 8 * v10);
          uint64_t v12 = *(void *)(a1 + 32);
          if (v12) {
            id v13 = *(void **)(v12 + 16);
          }
          else {
            id v13 = 0;
          }
          v14 = objc_msgSend(v13, "objectForKey:", *(void *)(*((void *)&v24 + 1) + 8 * v10), (void)v24);
          if ([v14 containsObject:v3])
          {
            long long v20 = (void *)MEMORY[0x230FBD990]();
            id v21 = *(id *)(a1 + 32);
            id v22 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
            {
              uint64_t v23 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543874;
              uint64_t v29 = v23;
              __int16 v30 = 2112;
              id v31 = v3;
              __int16 v32 = 2112;
              uint64_t v33 = v11;
              _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_INFO, "%{public}@Cannot clear snapshot slot identifier %@ because is still in use by %@", buf, 0x20u);
            }

            goto LABEL_22;
          }

          ++v10;
        }
        while (v8 != v10);
        uint64_t v15 = [v6 countByEnumeratingWithState:&v24 objects:v34 count:16];
        uint64_t v8 = v15;
        if (v15) {
          continue;
        }
        break;
      }
    }

    char v16 = (void *)MEMORY[0x230FBD990]();
    id v17 = *(id *)(a1 + 32);
    long long v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      long long v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v29 = v19;
      __int16 v30 = 2112;
      id v31 = v4;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@Clearing snapshot slot for snapshot %@", buf, 0x16u);
    }
    [v4 clearSlot];
  }
LABEL_22:
}

- (void)registerForMessages
{
  id v2 = self;
  uint64_t v87 = *MEMORY[0x263EF8340];
  if (self)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
    notificationRegistration = v2->_notificationRegistration;
  }
  else
  {
    dispatch_assert_queue_V2(0);
    notificationRegistration = 0;
  }
  [(HMDNotificationRegistration *)notificationRegistration addObserver:sel_handleProcessStateChange_ name:HMDProcessMonitorProcessStateDidChangeNotification object:0];
  if (v2)
  {
    [(HMDNotificationRegistration *)v2->_notificationRegistration addObserver:sel_backboardServicesRelaunched_ name:@"HMDBackboardServicesRelaunchNotification" object:0];
    dispatch_assert_queue_V2((dispatch_queue_t)v2->_workQueue);
    dispatch_assert_queue_V2((dispatch_queue_t)v2->_workQueue);
    id v4 = [MEMORY[0x263F08850] defaultManager];
    id v5 = [v4 contentsOfDirectoryAtPath:v2->_imageCacheDirectory error:0];

    v64 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
    long long v71 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v71 objects:v83 count:16];
    v63 = v6;
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v72;
      unint64_t v10 = 0x263EFF000uLL;
      do
      {
        uint64_t v11 = 0;
        uint64_t v65 = v8;
        do
        {
          if (*(void *)v72 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v12 = *(void **)(*((void *)&v71 + 1) + 8 * v11);
          id v13 = objc_msgSend(*(id *)(v10 + 2320), "hmd_dateFromSnapshotFileName:", v12);
          uint64_t v14 = [v13 timeIntervalSinceNow];
          if (v15 <= 86400.0)
          {
            [v64 setObject:v13 forKeyedSubscript:v12];
          }
          else
          {
            uint64_t v16 = v9;
            unint64_t v17 = v10;
            long long v18 = (void *)MEMORY[0x230FBD990](v14);
            long long v19 = v2;
            long long v20 = v2;
            id v21 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              id v22 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              v80 = v22;
              __int16 v81 = 2112;
              v82 = v12;
              _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@Ignoring snapshot file with date in the future: %@", buf, 0x16u);

              id v6 = v63;
            }

            id v2 = v19;
            unint64_t v10 = v17;
            uint64_t v9 = v16;
            uint64_t v8 = v65;
          }

          ++v11;
        }
        while (v8 != v11);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v71 objects:v83 count:16];
      }
      while (v8);
    }

    uint64_t v23 = (void *)MEMORY[0x230FBD990]();
    long long v24 = v2;
    long long v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      long long v26 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v80 = v26;
      __int16 v81 = 2112;
      v82 = v64;
      _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_INFO, "%{public}@Built the snapshot file dictionary: %@", buf, 0x16u);
    }
    long long v27 = [v64 allValues];
    int v28 = [v27 sortedArrayUsingSelector:sel_compare_];

    uint64_t v29 = [v28 lastObject];
    __int16 v30 = objc_msgSend(v29, "hmd_snapshotFileName");

    v66 = v24;
    if (v30)
    {
      v62 = v28;
      long long v69 = 0u;
      long long v70 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      id v31 = v63;
      uint64_t v32 = [v31 countByEnumeratingWithState:&v67 objects:buf count:16];
      if (v32)
      {
        uint64_t v33 = v32;
        uint64_t v34 = *(void *)v68;
        do
        {
          for (uint64_t i = 0; i != v33; ++i)
          {
            if (*(void *)v68 != v34) {
              objc_enumerationMutation(v31);
            }
            v36 = *(void **)(*((void *)&v67 + 1) + 8 * i);
            if (([v36 isEqualToString:v30] & 1) == 0)
            {
              v37 = NSString;
              id v38 = v24[7];
              v39 = [v37 stringWithFormat:@"%@/%@", v38, v36];

              v40 = (void *)MEMORY[0x230FBD990]();
              long long v41 = v24;
              long long v42 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
              {
                long long v43 = HMFGetLogIdentifier();
                *(_DWORD *)v75 = 138543618;
                v76 = v43;
                __int16 v77 = 2112;
                v78 = v39;
                _os_log_impl(&dword_22F52A000, v42, OS_LOG_TYPE_INFO, "%{public}@Removing obsolete snapshot at path: %@", v75, 0x16u);

                long long v24 = v66;
              }

              long long v44 = [MEMORY[0x263F08850] defaultManager];
              [v44 removeItemAtPath:v39 error:0];
            }
          }
          uint64_t v33 = [v31 countByEnumeratingWithState:&v67 objects:buf count:16];
        }
        while (v33);
      }

      v45 = [NSString stringWithFormat:@"%@/%@", v24[7], v30];
      long long v46 = [HMDSnapshotFile alloc];
      id v47 = v24[7];
      int v28 = v62;
      __int16 v48 = [v62 lastObject];
      uint64_t v49 = [(HMDSnapshotFile *)v46 initWithImageDirectory:v47 externalFilePath:v45 snapshotTimestamp:v48];

      long long v24 = v66;
      uint64_t v50 = (void *)MEMORY[0x230FBD990]();
      long long v51 = v66;
      v52 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
      {
        v53 = HMFGetLogIdentifier();
        *(_DWORD *)v75 = 138543618;
        v76 = v53;
        __int16 v77 = 2112;
        v78 = v49;
        _os_log_impl(&dword_22F52A000, v52, OS_LOG_TYPE_INFO, "%{public}@Found the most recent snapshot %@", v75, 0x16u);
      }
    }
    else
    {
      uint64_t v49 = 0;
    }

    if (v49)
    {
      v54 = (void *)MEMORY[0x230FBD990]((id)[v24 createSlotForSnapshotFile:v49 requestMessages:MEMORY[0x263EFFA68] shouldNotifyClients:0]);
      id v55 = v24;
      v56 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
      {
        uint64_t v57 = HMFGetLogIdentifier();
        id Property = objc_getProperty(v55, v58, 72, 1);
        *(_DWORD *)v83 = 138543618;
        v84 = v57;
        __int16 v85 = 2112;
        id v86 = Property;
        _os_log_impl(&dword_22F52A000, v56, OS_LOG_TYPE_INFO, "%{public}@Created the most recent snapshot %@", v83, 0x16u);
      }
    }
    else
    {
      v54 = (void *)MEMORY[0x230FBD990]();
      v60 = v24;
      v56 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
      {
        v61 = HMFGetLogIdentifier();
        *(_DWORD *)v83 = 138543362;
        v84 = v61;
        _os_log_impl(&dword_22F52A000, v56, OS_LOG_TYPE_INFO, "%{public}@No recent snapshot found", v83, 0xCu);
      }
    }
  }
  else
  {
    [0 addObserver:sel_backboardServicesRelaunched_ name:@"HMDBackboardServicesRelaunchNotification" object:0];
  }
}

- (HMDSnapshotSlotManager)initWithAccessory:(id)a3 workQueue:(id)a4 imageCacheDirectory:(id)a5 logID:(id)a6 uniqueIdentifier:(id)a7 msgDispatcher:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v27 = a7;
  id v26 = a8;
  v28.receiver = self;
  v28.super_class = (Class)HMDSnapshotSlotManager;
  long long v18 = [(HMDSnapshotSlotManager *)&v28 init];
  if (v18)
  {
    uint64_t v19 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
    snapshotFilesByAssociatedProcessInfo = v18->_snapshotFilesByAssociatedProcessInfo;
    v18->_snapshotFilesByAssociatedProcessInfo = (NSMapTable *)v19;

    uint64_t v21 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
    filledSnapshotSlotIdentifiersByProcess = v18->_filledSnapshotSlotIdentifiersByProcess;
    v18->_filledSnapshotSlotIdentifiersByProcess = (NSMapTable *)v21;

    objc_storeWeak((id *)&v18->_accessory, v14);
    objc_storeStrong((id *)&v18->_workQueue, a4);
    objc_storeStrong((id *)&v18->_logIdentifier, a6);
    objc_storeStrong((id *)&v18->_imageCacheDirectory, a5);
    objc_storeStrong((id *)&v18->_uniqueIdentifier, a7);
    objc_storeStrong((id *)&v18->_msgDispatcher, a8);
    uint64_t v23 = [[HMDNotificationRegistration alloc] initWithRegisterer:v18];
    notificationRegistration = v18->_notificationRegistration;
    v18->_notificationRegistration = v23;
  }
  return v18;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_235304 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_235304, &__block_literal_global_235305);
  }
  id v2 = (void *)logCategory__hmf_once_v1_235306;
  return v2;
}

void __37__HMDSnapshotSlotManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v1_235306;
  logCategory__hmf_once_v1_235306 = v0;
}

@end