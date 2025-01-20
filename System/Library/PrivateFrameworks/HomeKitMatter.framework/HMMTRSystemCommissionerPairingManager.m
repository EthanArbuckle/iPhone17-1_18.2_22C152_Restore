@interface HMMTRSystemCommissionerPairingManager
+ (id)logCategory;
- (HMMTRAccessoryServerBrowser)browser;
- (HMMTRStorage)storage;
- (HMMTRSystemCommissionerPairingManager)initWithQueue:(id)a3 accessoryServerBrowser:(id)a4;
- (OS_dispatch_queue)workQueue;
- (void)_cleanUpStaleSystemCommissionerPairingsWithNewlyPairedUUID:(id)a3 vendorID:(id)a4 productID:(id)a5 serialNumber:(id)a6 setupPayload:(id)a7;
- (void)_fetchAllDevicePairingsForSystemCommissionerDevicePairingWithUUID:(id)a3 completionHandler:(id)a4;
- (void)_fetchSystemCommissionerPairingsWithCompletionHandler:(id)a3;
- (void)_openCommissioningWindowForSystemCommissionerPairingUUID:(id)a3 duration:(double)a4 completionHandler:(id)a5;
- (void)_readCommissioningWindowStatusForSystemCommissionerPairingUUID:(id)a3 completionHandler:(id)a4;
- (void)_removeAllDevicePairingsForSystemCommissionerPairingUUID:(id)a3 completionHandler:(id)a4;
- (void)_removeDevicePairingWithUUID:(id)a3 forSystemCommissionerPairingUUID:(id)a4 completionHandler:(id)a5;
- (void)_removeSystemCommissionerPairingWithUUID:(id)a3 completionHandler:(id)a4;
- (void)cleanUpStaleSystemCommissionerPairingsWithNewlyPairedUUID:(id)a3 vendorID:(id)a4 productID:(id)a5 serialNumber:(id)a6 setupPayload:(id)a7;
- (void)fetchDevicePairingsForSystemCommissionerPairingUUID:(id)a3 completionHandler:(id)a4;
- (void)fetchSystemCommissionerPairingsWithCompletionHandler:(id)a3;
- (void)openCommissioningWindowForSystemCommissionerPairingUUID:(id)a3 duration:(double)a4 completionHandler:(id)a5;
- (void)readCommissioningWindowStatusForSystemCommissionerPairingUUID:(id)a3 completionHandler:(id)a4;
- (void)removeAllDevicePairingsForSystemCommissionerPairingUUID:(id)a3 completionHandler:(id)a4;
- (void)removeDevicePairingWithUUID:(id)a3 completionHandler:(id)a4;
- (void)removeDevicePairingWithUUID:(id)a3 forSystemCommissionerPairingUUID:(id)a4 completionHandler:(id)a5;
- (void)removeSystemCommissionerPairingWithUUID:(id)a3 completionHandler:(id)a4;
@end

@implementation HMMTRSystemCommissionerPairingManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_storage);
  objc_destroyWeak((id *)&self->_browser);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (HMMTRStorage)storage
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_storage);
  return (HMMTRStorage *)WeakRetained;
}

- (HMMTRAccessoryServerBrowser)browser
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browser);
  return (HMMTRAccessoryServerBrowser *)WeakRetained;
}

- (void)_readCommissioningWindowStatusForSystemCommissionerPairingUUID:(id)a3 completionHandler:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (void (**)(id, void, void *))a4;
  v8 = [(HMMTRSystemCommissionerPairingManager *)self storage];
  v9 = [v8 systemCommissionerFabricNodeIDForUuid:v6];

  if (v9)
  {
    v10 = [(HMMTRSystemCommissionerPairingManager *)self browser];
    [v10 readCommissioningWindowStatusForSystemCommissionerDeviceWithNodeID:v9 completionHandler:v7];
  }
  else
  {
    v11 = (void *)MEMORY[0x2533B64D0]();
    v12 = self;
    v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = HMFGetLogIdentifier();
      int v15 = 138543618;
      v16 = v14;
      __int16 v17 = 2112;
      id v18 = v6;
      _os_log_impl(&dword_252495000, v13, OS_LOG_TYPE_ERROR, "%{public}@Couldn't find Node on System Commissioner Fabric with UUID = %@", (uint8_t *)&v15, 0x16u);
    }
    v10 = [MEMORY[0x263F087E8] hmfErrorWithCode:2];
    v7[2](v7, 0, v10);
  }
}

- (void)_openCommissioningWindowForSystemCommissionerPairingUUID:(id)a3 duration:(double)a4 completionHandler:(id)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  v10 = [(HMMTRSystemCommissionerPairingManager *)self storage];
  v11 = [v10 systemCommissionerFabricNodeIDForUuid:v8];

  if (v11)
  {
    v12 = [(HMMTRSystemCommissionerPairingManager *)self browser];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __125__HMMTRSystemCommissionerPairingManager__openCommissioningWindowForSystemCommissionerPairingUUID_duration_completionHandler___block_invoke;
    v18[3] = &unk_265375E68;
    id v19 = v9;
    [v12 openCommissioningWindowForSystemCommissionerDeviceWithNodeID:v11 duration:v18 completionHandler:a4];

    v13 = v19;
  }
  else
  {
    v14 = (void *)MEMORY[0x2533B64D0]();
    int v15 = self;
    v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      __int16 v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v21 = v17;
      __int16 v22 = 2112;
      id v23 = v8;
      _os_log_impl(&dword_252495000, v16, OS_LOG_TYPE_ERROR, "%{public}@Couldn't find Node on System Commissioner Fabric with UUID = %@", buf, 0x16u);
    }
    v13 = [MEMORY[0x263F087E8] hmfErrorWithCode:2];
    (*((void (**)(id, void, void, void *))v9 + 2))(v9, 0, 0, v13);
  }
}

void __125__HMMTRSystemCommissionerPairingManager__openCommissioningWindowForSystemCommissionerPairingUUID_duration_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id v8 = [v6 qrCodeString:0];
  v7 = [v6 manualEntryCode];

  (*(void (**)(uint64_t, id, void *, id))(v4 + 16))(v4, v8, v7, v5);
}

- (void)_cleanUpStaleSystemCommissionerPairingsWithNewlyPairedUUID:(id)a3 vendorID:(id)a4 productID:(id)a5 serialNumber:(id)a6 setupPayload:(id)a7
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  __int16 v17 = [[HMMTRSystemCommissionerPairingManagerPairingIdentity alloc] initWithUUID:v12 vendorID:v13 productID:v14 serialNumber:v15 setupPayload:v16];
  v55 = v17;
  if ([(HMMTRSystemCommissionerPairingManagerPairingIdentity *)v17 isIdentifiable])
  {
    id v45 = v16;
    id v46 = v15;
    id v47 = v14;
    id v48 = v13;
    id v49 = v12;
    id v18 = [(HMMTRSystemCommissionerPairingManager *)self storage];
    id v19 = [v18 pairedNodeIDsOnSystemCommissionerFabric:1];

    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id obj = v19;
    uint64_t v54 = [obj countByEnumeratingWithState:&v58 objects:v68 count:16];
    if (!v54) {
      goto LABEL_16;
    }
    v20 = self;
    uint64_t v53 = *(void *)v59;
    v56 = self;
    while (1)
    {
      for (uint64_t i = 0; i != v54; ++i)
      {
        if (*(void *)v59 != v53) {
          objc_enumerationMutation(obj);
        }
        uint64_t v22 = *(void *)(*((void *)&v58 + 1) + 8 * i);
        id v23 = [(HMMTRSystemCommissionerPairingManager *)v20 storage];
        uint64_t v24 = [v23 uuidForSystemCommissionerFabricNode:v22];

        v25 = [(HMMTRSystemCommissionerPairingManager *)v20 storage];
        v26 = [v25 serialNumberForSystemCommissionerFabricNode:v22];

        v27 = [(HMMTRSystemCommissionerPairingManager *)v20 storage];
        v28 = [v27 vendorIDForSystemCommissionerFabricNode:v22];

        v29 = [(HMMTRSystemCommissionerPairingManager *)v20 storage];
        v30 = [v29 productIDForSystemCommissionerFabricNode:v22];

        v31 = [(HMMTRSystemCommissionerPairingManager *)v20 storage];
        v32 = [v31 setupPayloadForSystemCommissionerFabricNode:v22];

        v57 = (void *)v24;
        v33 = [[HMMTRSystemCommissionerPairingManagerPairingIdentity alloc] initWithUUID:v24 vendorID:v28 productID:v30 serialNumber:v26 setupPayload:v32];
        v34 = [(HMMTRSystemCommissionerPairingManagerPairingIdentity *)v33 uuid];
        v35 = [(HMMTRSystemCommissionerPairingManagerPairingIdentity *)v17 uuid];
        if ([v34 isEqual:v35])
        {
        }
        else
        {
          BOOL v36 = [(HMMTRSystemCommissionerPairingManagerPairingIdentity *)v33 isEquivalentTo:v17];

          if (!v36) {
            goto LABEL_14;
          }
          context = (void *)MEMORY[0x2533B64D0]();
          v37 = v56;
          v38 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
          {
            v50 = HMFGetLogIdentifier();
            uint64_t v39 = [(HMMTRSystemCommissionerPairingManagerPairingIdentity *)v55 uuid];
            *(_DWORD *)buf = 138543874;
            v63 = v50;
            __int16 v64 = 2112;
            id v65 = v57;
            __int16 v66 = 2112;
            uint64_t v67 = v39;
            v40 = (void *)v39;
            _os_log_impl(&dword_252495000, v38, OS_LOG_TYPE_INFO, "%{public}@Removed stale system commissioner pairing %@ replaced by %@", buf, 0x20u);
          }
          v34 = [(HMMTRSystemCommissionerPairingManager *)v37 storage];
          [v34 removeRecordsForSystemCommissionerFabricNode:v22];
        }

LABEL_14:
        __int16 v17 = v55;
        v20 = v56;
      }
      uint64_t v54 = [obj countByEnumeratingWithState:&v58 objects:v68 count:16];
      if (!v54)
      {
LABEL_16:

        id v13 = v48;
        id v12 = v49;
        id v15 = v46;
        id v14 = v47;
        id v16 = v45;
        goto LABEL_20;
      }
    }
  }
  v41 = (void *)MEMORY[0x2533B64D0]();
  v42 = self;
  v43 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
  {
    v44 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v63 = v44;
    __int16 v64 = 2112;
    id v65 = v12;
    _os_log_impl(&dword_252495000, v43, OS_LOG_TYPE_INFO, "%{public}@A new system commissioner pairing %@ doesn't have sufficient information to identify redundant stale pairings.", buf, 0x16u);
  }
  __int16 v17 = v55;
LABEL_20:
}

- (void)_removeAllDevicePairingsForSystemCommissionerPairingUUID:(id)a3 completionHandler:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (void (**)(id, void *))a4;
  id v8 = [(HMMTRSystemCommissionerPairingManager *)self storage];
  id v9 = [v8 systemCommissionerFabricNodeIDForUuid:v6];

  if (v9)
  {
    v10 = [(HMMTRSystemCommissionerPairingManager *)self browser];
    [v10 removeAllDevicePairingsForSystemCommissionerDeviceWithNodeID:v9 completionHandler:v7];
  }
  else
  {
    v11 = (void *)MEMORY[0x2533B64D0]();
    id v12 = self;
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = HMFGetLogIdentifier();
      int v15 = 138543618;
      id v16 = v14;
      __int16 v17 = 2112;
      id v18 = v6;
      _os_log_impl(&dword_252495000, v13, OS_LOG_TYPE_ERROR, "%{public}@Couldn't find Node on System Commissioner Fabric with UUID = %@", (uint8_t *)&v15, 0x16u);
    }
    v10 = [MEMORY[0x263F087E8] hmfErrorWithCode:2];
    v7[2](v7, v10);
  }
}

- (void)_removeDevicePairingWithUUID:(id)a3 forSystemCommissionerPairingUUID:(id)a4 completionHandler:(id)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, void *))a5;
  v11 = [(HMMTRSystemCommissionerPairingManager *)self storage];
  id v12 = [v11 systemCommissionerFabricNodeIDForUuid:v9];

  if (v12)
  {
    id v13 = [(HMMTRSystemCommissionerPairingManager *)self browser];
    [v13 removeDevicePairingFabricForSystemCommissionerDeviceWithNodeID:v12 fabric:v8 completionHandler:v10];
  }
  else
  {
    id v14 = (void *)MEMORY[0x2533B64D0]();
    int v15 = self;
    id v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      __int16 v17 = HMFGetLogIdentifier();
      int v18 = 138543618;
      uint64_t v19 = v17;
      __int16 v20 = 2112;
      id v21 = v8;
      _os_log_impl(&dword_252495000, v16, OS_LOG_TYPE_ERROR, "%{public}@Couldn't find Node on System Commissioner Fabric with UUID = %@", (uint8_t *)&v18, 0x16u);
    }
    id v13 = [MEMORY[0x263F087E8] hmfErrorWithCode:2];
    v10[2](v10, v13);
  }
}

- (void)_fetchAllDevicePairingsForSystemCommissionerDevicePairingWithUUID:(id)a3 completionHandler:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (void (**)(id, void, void *))a4;
  id v8 = [(HMMTRSystemCommissionerPairingManager *)self storage];
  [v8 endLocalStorageModeBySyncingToRemote:0];

  id v9 = [(HMMTRSystemCommissionerPairingManager *)self storage];
  v10 = [v9 systemCommissionerFabricNodeIDForUuid:v6];

  if (v10)
  {
    v11 = [(HMMTRSystemCommissionerPairingManager *)self browser];
    [v11 fetchAllDevicePairingsForSystemCommissionerDeviceWithNodeID:v10 completionHandler:v7];
  }
  else
  {
    id v12 = (void *)MEMORY[0x2533B64D0]();
    id v13 = self;
    id v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v15 = HMFGetLogIdentifier();
      int v16 = 138543618;
      __int16 v17 = v15;
      __int16 v18 = 2112;
      id v19 = v6;
      _os_log_impl(&dword_252495000, v14, OS_LOG_TYPE_ERROR, "%{public}@Couldn't find Node on System Commissioner Fabric with UUID = %@", (uint8_t *)&v16, 0x16u);
    }
    v11 = [MEMORY[0x263F087E8] hmfErrorWithCode:2];
    v7[2](v7, 0, v11);
  }
}

- (void)_removeSystemCommissionerPairingWithUUID:(id)a3 completionHandler:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (void (**)(id, void *))a4;
  id v8 = [(HMMTRSystemCommissionerPairingManager *)self storage];
  id v9 = [v8 systemCommissionerFabricNodeIDForUuid:v6];

  if (v9)
  {
    v10 = [(HMMTRSystemCommissionerPairingManager *)self browser];
    [v10 removeSystemCommissionerFabricAccessoryWithNodeID:v9 completionHandler:v7];
  }
  else
  {
    v11 = (void *)MEMORY[0x2533B64D0]();
    id v12 = self;
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = HMFGetLogIdentifier();
      int v15 = 138543618;
      int v16 = v14;
      __int16 v17 = 2112;
      id v18 = v6;
      _os_log_impl(&dword_252495000, v13, OS_LOG_TYPE_ERROR, "%{public}@Couldn't find Node on System Commissioner Fabric with UUID = %@", (uint8_t *)&v15, 0x16u);
    }
    v10 = [MEMORY[0x263F087E8] hmfErrorWithCode:2];
    v7[2](v7, v10);
  }
}

- (void)_fetchSystemCommissionerPairingsWithCompletionHandler:(id)a3
{
  uint64_t v87 = *MEMORY[0x263EF8340];
  v42 = (void (**)(id, void *, void))a3;
  uint64_t v4 = [(HMMTRSystemCommissionerPairingManager *)self storage];
  [v4 endLocalStorageModeBySyncingToRemote:0];

  v44 = [MEMORY[0x263EFF980] array];
  id v5 = [(HMMTRSystemCommissionerPairingManager *)self storage];
  id v6 = [v5 pairedNodeIDsOnSystemCommissionerFabric:1];

  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id obj = v6;
  uint64_t v54 = [obj countByEnumeratingWithState:&v64 objects:v86 count:16];
  if (v54)
  {
    uint64_t v53 = *(void *)v65;
    do
    {
      for (uint64_t i = 0; i != v54; ++i)
      {
        if (*(void *)v65 != v53) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v64 + 1) + 8 * i);
        id v9 = [(HMMTRSystemCommissionerPairingManager *)self storage];
        v10 = [v9 uuidForSystemCommissionerFabricNode:v8];

        v11 = [(HMMTRSystemCommissionerPairingManager *)self storage];
        long long v59 = [v11 serialNumberForSystemCommissionerFabricNode:v8];

        id v12 = [(HMMTRSystemCommissionerPairingManager *)self storage];
        id v13 = [v12 vendorIDForSystemCommissionerFabricNode:v8];

        id v14 = [(HMMTRSystemCommissionerPairingManager *)self storage];
        v62 = [v14 productIDForSystemCommissionerFabricNode:v8];

        int v15 = [(HMMTRSystemCommissionerPairingManager *)self storage];
        int v16 = [v15 categoryForSystemCommissionerFabricNode:v8];

        __int16 v17 = [(HMMTRSystemCommissionerPairingManager *)self storage];
        long long v58 = [v17 deviceNameForSystemCommissionerFabricNode:v8];

        id v18 = [(HMMTRSystemCommissionerPairingManager *)self storage];
        uint64_t v19 = [v18 setupPayloadForSystemCommissionerFabricNode:v8];

        long long v60 = v16;
        if (v19)
        {
          id v63 = 0;
          uint64_t v20 = [MEMORY[0x263F10FE0] setupPayloadWithOnboardingPayload:v19 error:&v63];
          id v61 = v63;
          if (v61)
          {
            v55 = v20;
            id v21 = v19;
            uint64_t v22 = (void *)MEMORY[0x2533B64D0]();
            id v23 = self;
            uint64_t v24 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v26 = v25 = v13;
              *(_DWORD *)buf = 138543874;
              uint64_t v69 = v26;
              __int16 v70 = 2112;
              v71 = v21;
              __int16 v72 = 2112;
              id v73 = v61;
              _os_log_impl(&dword_252495000, v24, OS_LOG_TYPE_ERROR, "%{public}@Onboarding payload %@ in System Commissioner Fabric storage could not be converted: %@", buf, 0x20u);

              id v13 = v25;
            }

            int v16 = v60;
            uint64_t v19 = v21;
            uint64_t v20 = v55;
            if (!v10)
            {
LABEL_20:
              v34 = v19;
              v35 = (void *)MEMORY[0x2533B64D0]();
              BOOL v36 = self;
              v37 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v57 = v20;
                uint64_t v39 = v38 = v13;
                *(_DWORD *)buf = 138543618;
                uint64_t v69 = v39;
                __int16 v70 = 2112;
                v71 = v8;
                v40 = v37;
                v41 = "%{public}@Missing UUID in System Commissioner Fabric storage for nodeID %@";
                goto LABEL_28;
              }
LABEL_29:

              int v16 = v60;
              uint64_t v19 = v34;
              goto LABEL_30;
            }
          }
          else
          {
            id v61 = 0;
            if (!v10) {
              goto LABEL_20;
            }
          }
        }
        else
        {
          id v61 = 0;
          uint64_t v20 = 0;
          if (!v10) {
            goto LABEL_20;
          }
        }
        if (!v13)
        {
          v34 = v19;
          v35 = (void *)MEMORY[0x2533B64D0]();
          BOOL v36 = self;
          v37 = HMFGetOSLogHandle();
          if (!os_log_type_enabled(v37, OS_LOG_TYPE_INFO)) {
            goto LABEL_29;
          }
          HMFGetLogIdentifier();
          v57 = v20;
          uint64_t v39 = v38 = 0;
          *(_DWORD *)buf = 138543618;
          uint64_t v69 = v39;
          __int16 v70 = 2112;
          v71 = v8;
          v40 = v37;
          v41 = "%{public}@Missing VendorID in System Commissioner Fabric storage for nodeID %@";
LABEL_28:
          _os_log_impl(&dword_252495000, v40, OS_LOG_TYPE_INFO, v41, buf, 0x16u);

          id v13 = v38;
          uint64_t v20 = v57;
          goto LABEL_29;
        }
        if (!v62)
        {
          v34 = v19;
          v35 = (void *)MEMORY[0x2533B64D0]();
          BOOL v36 = self;
          v37 = HMFGetOSLogHandle();
          if (!os_log_type_enabled(v37, OS_LOG_TYPE_INFO)) {
            goto LABEL_29;
          }
          HMFGetLogIdentifier();
          v57 = v20;
          uint64_t v39 = v38 = v13;
          *(_DWORD *)buf = 138543618;
          uint64_t v69 = v39;
          __int16 v70 = 2112;
          v71 = v8;
          v40 = v37;
          v41 = "%{public}@Missing ProductID in System Commissioner Fabric storage for nodeID %@";
          goto LABEL_28;
        }
        if (!v16)
        {
          v34 = v19;
          v35 = (void *)MEMORY[0x2533B64D0]();
          BOOL v36 = self;
          v37 = HMFGetOSLogHandle();
          if (!os_log_type_enabled(v37, OS_LOG_TYPE_INFO)) {
            goto LABEL_29;
          }
          HMFGetLogIdentifier();
          v57 = v20;
          uint64_t v39 = v38 = v13;
          *(_DWORD *)buf = 138543618;
          uint64_t v69 = v39;
          __int16 v70 = 2112;
          v71 = v8;
          v40 = v37;
          v41 = "%{public}@Missing DeviceType in System Commissioner Fabric storage for nodeID %@";
          goto LABEL_28;
        }
        v27 = (void *)[objc_alloc(MEMORY[0x263F11060]) initWithUUID:v10 nodeID:v8 vendorID:v13 productID:v62 deviceType:v16 serialNumber:v59 name:v58 setupPayload:v20];
        context = (void *)MEMORY[0x2533B64D0]();
        v51 = self;
        v28 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          id v49 = HMFGetLogIdentifier();
          id v48 = [v27 uuid];
          id v46 = [v27 nodeID];
          id v45 = [v27 serialNumber];
          [v27 vendorID];
          v29 = log = v28;
          v30 = [v27 productID];
          v31 = [v27 deviceType];
          [v27 name];
          v32 = v56 = v20;
          [v27 setupPayload];
          v33 = v43 = v19;
          *(_DWORD *)buf = 138545410;
          uint64_t v69 = v49;
          __int16 v70 = 2112;
          v71 = v48;
          __int16 v72 = 2112;
          id v73 = v46;
          __int16 v74 = 2112;
          v75 = v45;
          __int16 v76 = 2112;
          v77 = v29;
          __int16 v78 = 2112;
          v79 = v30;
          __int16 v80 = 2112;
          v81 = v31;
          __int16 v82 = 2112;
          v83 = v32;
          __int16 v84 = 2112;
          v85 = v33;
          _os_log_impl(&dword_252495000, log, OS_LOG_TYPE_INFO, "%{public}@UUID = %@, Node ID = %@, Serial Number = %@, VID = %@, PID = %@, DeviceType = %@, Name = %@, Payload = %@", buf, 0x5Cu);

          uint64_t v19 = v43;
          uint64_t v20 = v56;

          int v16 = v60;
          v28 = log;
        }
        [v44 addObject:v27];

LABEL_30:
      }
      uint64_t v54 = [obj countByEnumeratingWithState:&v64 objects:v86 count:16];
    }
    while (v54);
  }

  v42[2](v42, v44, 0);
}

- (void)readCommissioningWindowStatusForSystemCommissionerPairingUUID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMMTRSystemCommissionerPairingManager *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __121__HMMTRSystemCommissionerPairingManager_readCommissioningWindowStatusForSystemCommissionerPairingUUID_completionHandler___block_invoke;
  block[3] = &unk_265378900;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __121__HMMTRSystemCommissionerPairingManager_readCommissioningWindowStatusForSystemCommissionerPairingUUID_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _readCommissioningWindowStatusForSystemCommissionerPairingUUID:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (void)openCommissioningWindowForSystemCommissionerPairingUUID:(id)a3 duration:(double)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(HMMTRSystemCommissionerPairingManager *)self workQueue];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __124__HMMTRSystemCommissionerPairingManager_openCommissioningWindowForSystemCommissionerPairingUUID_duration_completionHandler___block_invoke;
  v13[3] = &unk_265377408;
  v13[4] = self;
  id v14 = v8;
  double v16 = a4;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

uint64_t __124__HMMTRSystemCommissionerPairingManager_openCommissioningWindowForSystemCommissionerPairingUUID_duration_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _openCommissioningWindowForSystemCommissionerPairingUUID:*(void *)(a1 + 40) duration:*(void *)(a1 + 48) completionHandler:*(double *)(a1 + 56)];
}

- (void)cleanUpStaleSystemCommissionerPairingsWithNewlyPairedUUID:(id)a3 vendorID:(id)a4 productID:(id)a5 serialNumber:(id)a6 setupPayload:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  __int16 v17 = [(HMMTRSystemCommissionerPairingManager *)self workQueue];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __144__HMMTRSystemCommissionerPairingManager_cleanUpStaleSystemCommissionerPairingsWithNewlyPairedUUID_vendorID_productID_serialNumber_setupPayload___block_invoke;
  v23[3] = &unk_265376580;
  v23[4] = self;
  id v24 = v12;
  id v25 = v13;
  id v26 = v14;
  id v27 = v15;
  id v28 = v16;
  id v18 = v16;
  id v19 = v15;
  id v20 = v14;
  id v21 = v13;
  id v22 = v12;
  dispatch_async(v17, v23);
}

uint64_t __144__HMMTRSystemCommissionerPairingManager_cleanUpStaleSystemCommissionerPairingsWithNewlyPairedUUID_vendorID_productID_serialNumber_setupPayload___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cleanUpStaleSystemCommissionerPairingsWithNewlyPairedUUID:*(void *)(a1 + 40) vendorID:*(void *)(a1 + 48) productID:*(void *)(a1 + 56) serialNumber:*(void *)(a1 + 64) setupPayload:*(void *)(a1 + 72)];
}

- (void)removeAllDevicePairingsForSystemCommissionerPairingUUID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMMTRSystemCommissionerPairingManager *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __115__HMMTRSystemCommissionerPairingManager_removeAllDevicePairingsForSystemCommissionerPairingUUID_completionHandler___block_invoke;
  block[3] = &unk_265378900;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __115__HMMTRSystemCommissionerPairingManager_removeAllDevicePairingsForSystemCommissionerPairingUUID_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeAllDevicePairingsForSystemCommissionerPairingUUID:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (void)removeDevicePairingWithUUID:(id)a3 completionHandler:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id v8 = (void *)MEMORY[0x2533B64D0]();
  id v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    id v11 = HMFGetLogIdentifier();
    int v13 = 138543618;
    id v14 = v11;
    __int16 v15 = 2080;
    id v16 = "-[HMMTRSystemCommissionerPairingManager removeDevicePairingWithUUID:completionHandler:]";
    _os_log_impl(&dword_252495000, v10, OS_LOG_TYPE_ERROR, "%{public}@%s is deprecated", (uint8_t *)&v13, 0x16u);
  }
  id v12 = [MEMORY[0x263F087E8] hmfErrorWithCode:5];
  v7[2](v7, v12);
}

- (void)removeDevicePairingWithUUID:(id)a3 forSystemCommissionerPairingUUID:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(HMMTRSystemCommissionerPairingManager *)self workQueue];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __120__HMMTRSystemCommissionerPairingManager_removeDevicePairingWithUUID_forSystemCommissionerPairingUUID_completionHandler___block_invoke;
  v15[3] = &unk_2653775F0;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

uint64_t __120__HMMTRSystemCommissionerPairingManager_removeDevicePairingWithUUID_forSystemCommissionerPairingUUID_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeDevicePairingWithUUID:*(void *)(a1 + 40) forSystemCommissionerPairingUUID:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 56)];
}

- (void)removeSystemCommissionerPairingWithUUID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMMTRSystemCommissionerPairingManager *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __99__HMMTRSystemCommissionerPairingManager_removeSystemCommissionerPairingWithUUID_completionHandler___block_invoke;
  block[3] = &unk_265378900;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __99__HMMTRSystemCommissionerPairingManager_removeSystemCommissionerPairingWithUUID_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeSystemCommissionerPairingWithUUID:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (void)fetchDevicePairingsForSystemCommissionerPairingUUID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMMTRSystemCommissionerPairingManager *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __111__HMMTRSystemCommissionerPairingManager_fetchDevicePairingsForSystemCommissionerPairingUUID_completionHandler___block_invoke;
  block[3] = &unk_265378900;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __111__HMMTRSystemCommissionerPairingManager_fetchDevicePairingsForSystemCommissionerPairingUUID_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchAllDevicePairingsForSystemCommissionerDevicePairingWithUUID:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (void)fetchSystemCommissionerPairingsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(HMMTRSystemCommissionerPairingManager *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __94__HMMTRSystemCommissionerPairingManager_fetchSystemCommissionerPairingsWithCompletionHandler___block_invoke;
  v7[3] = &unk_2653770F0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __94__HMMTRSystemCommissionerPairingManager_fetchSystemCommissionerPairingsWithCompletionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchSystemCommissionerPairingsWithCompletionHandler:*(void *)(a1 + 40)];
}

- (HMMTRSystemCommissionerPairingManager)initWithQueue:(id)a3 accessoryServerBrowser:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HMMTRSystemCommissionerPairingManager;
  id v9 = [(HMMTRSystemCommissionerPairingManager *)&v13 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_workQueue, a3);
    objc_storeWeak((id *)&v10->_browser, v8);
    id v11 = [v8 storage];
    objc_storeWeak((id *)&v10->_storage, v11);
  }
  return v10;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t15 != -1) {
    dispatch_once(&logCategory__hmf_once_t15, &__block_literal_global_5207);
  }
  v2 = (void *)logCategory__hmf_once_v16;
  return v2;
}

uint64_t __52__HMMTRSystemCommissionerPairingManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v16;
  logCategory__hmf_once_id v16 = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

@end