@interface HMMTRThreadSoftwareUpdateController
+ (id)logCategory;
- (BOOL)isFirmwareUpdateInProgressForFabricID:(id)a3;
- (HMFTimer)firmwareUpdateActiveTimer;
- (HMMTRAccessoryReachabilityObserver)reachabilityObserver;
- (HMMTRAccessoryServer)targetThreadAccessoryServerForFWUpdate;
- (HMMTRAccessoryServerBrowser)browser;
- (HMMTRThreadSoftwareUpdateController)initWithQueue:(id)a3 browser:(id)a4;
- (OS_dispatch_queue)clientQueue;
- (void)_attemptConnectionForFirmwareUpdateForAccessoryServer:(id)a3 completion:(id)a4;
- (void)_cleanupFirmwareUpdateStateWithError:(id)a3;
- (void)handleFirmwareUpdateStatusChangeForAccessoryServer:(id)a3 state:(int64_t)a4;
- (void)handleUpdateRequestedForAccessoryServer:(id)a3 completion:(id)a4;
- (void)setBrowser:(id)a3;
- (void)setTargetThreadAccessoryServerForFWUpdate:(id)a3;
- (void)suspendOperations;
- (void)suspendOperationsForFabricID:(id)a3;
- (void)timerDidFire:(id)a3;
@end

@implementation HMMTRThreadSoftwareUpdateController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firmwareUpdateActiveTimer, 0);
  objc_storeStrong((id *)&self->_reachabilityObserver, 0);
  objc_destroyWeak((id *)&self->_targetThreadAccessoryServerForFWUpdate);
  objc_destroyWeak((id *)&self->_browser);
  objc_storeStrong((id *)&self->_clientQueue, 0);
}

- (HMFTimer)firmwareUpdateActiveTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 40, 1);
}

- (HMMTRAccessoryReachabilityObserver)reachabilityObserver
{
  return (HMMTRAccessoryReachabilityObserver *)objc_getProperty(self, a2, 32, 1);
}

- (void)setTargetThreadAccessoryServerForFWUpdate:(id)a3
{
}

- (HMMTRAccessoryServer)targetThreadAccessoryServerForFWUpdate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_targetThreadAccessoryServerForFWUpdate);
  return (HMMTRAccessoryServer *)WeakRetained;
}

- (void)setBrowser:(id)a3
{
}

- (HMMTRAccessoryServerBrowser)browser
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browser);
  return (HMMTRAccessoryServerBrowser *)WeakRetained;
}

- (OS_dispatch_queue)clientQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (void)timerDidFire:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)MEMORY[0x2533B64D0]();
  v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v25 = v8;
    __int16 v26 = 2112;
    v27 = v6;
    _os_log_impl(&dword_252495000, v7, OS_LOG_TYPE_DEBUG, "%{public}@%@", buf, 0x16u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&v6->_browser);
  if (WeakRetained)
  {
    v10 = [(HMMTRThreadSoftwareUpdateController *)v6 targetThreadAccessoryServerForFWUpdate];
    v11 = [v10 nodeID];
    v12 = (void *)MEMORY[0x2533B64D0]();
    v13 = v6;
    v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v25 = v15;
      __int16 v26 = 2112;
      v27 = v11;
      _os_log_impl(&dword_252495000, v14, OS_LOG_TYPE_ERROR, "%{public}@Timed up doing firmware update for nodeID %@", buf, 0x16u);
    }
    v16 = [WeakRetained threadRadioManager];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __52__HMMTRThreadSoftwareUpdateController_timerDidFire___block_invoke;
    v22[3] = &unk_265378660;
    v22[4] = v13;
    v23 = v11;
    v17 = v11;
    [v16 stopAccessoryFirmwareUpdateWithCompletion:v22];
  }
  else
  {
    v18 = (void *)MEMORY[0x2533B64D0]();
    v19 = v6;
    v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v25 = v21;
      _os_log_impl(&dword_252495000, v20, OS_LOG_TYPE_ERROR, "%{public}@Unable to get browser ref in HMMTRSoftwareUpdateProvider timerDidFire", buf, 0xCu);
    }
  }
}

void __52__HMMTRThreadSoftwareUpdateController_timerDidFire___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x2533B64D0]();
  id v5 = *(id *)(a1 + 32);
  v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v7 = HMFGetLogIdentifier();
    uint64_t v8 = *(void *)(a1 + 40);
    int v9 = 138543874;
    v10 = v7;
    __int16 v11 = 2112;
    uint64_t v12 = v8;
    __int16 v13 = 2112;
    id v14 = v3;
    _os_log_impl(&dword_252495000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to inform thread SW of stop firmware update for nodeID %@, error %@", (uint8_t *)&v9, 0x20u);
  }
  [*(id *)(a1 + 32) _cleanupFirmwareUpdateStateWithError:0];
}

- (void)handleFirmwareUpdateStatusChangeForAccessoryServer:(id)a3 state:(int64_t)a4
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (void *)MEMORY[0x2533B64D0]();
  uint64_t v8 = self;
  int v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = HMFGetLogIdentifier();
    __int16 v11 = [v6 nodeID];
    *(_DWORD *)buf = 138543874;
    v42 = v10;
    __int16 v43 = 2112;
    int64_t v44 = (int64_t)v11;
    __int16 v45 = 2048;
    int64_t v46 = a4;
    _os_log_impl(&dword_252495000, v9, OS_LOG_TYPE_INFO, "%{public}@Received firmware update status change for accessory server with nodeID:%@, state: %lu", buf, 0x20u);
  }
  if (isFeatureMatteriPhoneOnlyPairingControlForThreadEnabled())
  {
    uint64_t v12 = [(HMMTRThreadSoftwareUpdateController *)v8 targetThreadAccessoryServerForFWUpdate];
    if (v12)
    {
      if (HMFEqualObjects())
      {
        if (a4 == 6)
        {
          uint64_t v29 = MEMORY[0x2533B64D0]();
          v30 = v8;
          v31 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            v32 = HMFGetLogIdentifier();
            v33 = [v6 nodeID];
            *(_DWORD *)buf = 138543874;
            v42 = v32;
            __int16 v43 = 2048;
            int64_t v44 = 6;
            __int16 v45 = 2112;
            int64_t v46 = (int64_t)v33;
            _os_log_impl(&dword_252495000, v31, OS_LOG_TYPE_INFO, "%{public}@Firmware update moved to installed state (%lu) for accessory with nodeID %@", buf, 0x20u);
          }
          v34 = (void *)v29;
          goto LABEL_28;
        }
        if (a4 == 3)
        {
          __int16 v13 = [(HMMTRThreadSoftwareUpdateController *)v8 browser];
          id v14 = [v13 threadRadioManager];
          uint64_t v15 = [v6 eMACAddress];
          v16 = [v15 dataUsingEncoding:4];
          uint64_t v17 = [v6 isWEDDevice];
          v39[0] = MEMORY[0x263EF8330];
          v39[1] = 3221225472;
          v39[2] = __96__HMMTRThreadSoftwareUpdateController_handleFirmwareUpdateStatusChangeForAccessoryServer_state___block_invoke;
          v39[3] = &unk_265378660;
          v39[4] = v8;
          id v40 = v6;
          [v14 startAccessoryFirmwareUpdateWithExtendedMACAddress:v16 isWedDevice:v17 completion:v39];

LABEL_19:
          goto LABEL_20;
        }
        if ((unint64_t)a4 <= 1)
        {
          uint64_t v35 = MEMORY[0x2533B64D0]();
          v30 = v8;
          v36 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
          {
            v37 = HMFGetLogIdentifier();
            v38 = [v6 nodeID];
            *(_DWORD *)buf = 138543874;
            v42 = v37;
            __int16 v43 = 2048;
            int64_t v44 = a4;
            __int16 v45 = 2112;
            int64_t v46 = (int64_t)v38;
            _os_log_impl(&dword_252495000, v36, OS_LOG_TYPE_INFO, "%{public}@Firmware update moved to idle or unknown state (%lu) for accessory with nodeID %@", buf, 0x20u);
          }
          v34 = (void *)v35;
LABEL_28:
          [(HMMTRThreadSoftwareUpdateController *)v30 _cleanupFirmwareUpdateStateWithError:0];
          goto LABEL_19;
        }
        switch(a4)
        {
          case 5:
            v22 = (void *)MEMORY[0x2533B64D0]();
            v23 = v8;
            v24 = HMFGetOSLogHandle();
            if (!os_log_type_enabled(v24, OS_LOG_TYPE_INFO)) {
              goto LABEL_18;
            }
            v25 = HMFGetLogIdentifier();
            __int16 v26 = [v6 nodeID];
            *(_DWORD *)buf = 138543618;
            v42 = v25;
            __int16 v43 = 2112;
            int64_t v44 = (int64_t)v26;
            v27 = "%{public}@Firmware update moved to installing state for accessory with nodeID %@";
            break;
          case 4:
            v22 = (void *)MEMORY[0x2533B64D0]();
            v23 = v8;
            v24 = HMFGetOSLogHandle();
            if (!os_log_type_enabled(v24, OS_LOG_TYPE_INFO)) {
              goto LABEL_18;
            }
            v25 = HMFGetLogIdentifier();
            __int16 v26 = [v6 nodeID];
            *(_DWORD *)buf = 138543618;
            v42 = v25;
            __int16 v43 = 2112;
            int64_t v44 = (int64_t)v26;
            v27 = "%{public}@Firmware update moved to downloading state for accessory with nodeID %@";
            break;
          case 2:
            v22 = (void *)MEMORY[0x2533B64D0]();
            v23 = v8;
            v24 = HMFGetOSLogHandle();
            if (!os_log_type_enabled(v24, OS_LOG_TYPE_INFO)) {
              goto LABEL_18;
            }
            v25 = HMFGetLogIdentifier();
            __int16 v26 = [v6 nodeID];
            *(_DWORD *)buf = 138543618;
            v42 = v25;
            __int16 v43 = 2112;
            int64_t v44 = (int64_t)v26;
            v27 = "%{public}@Firmware update moved to downloaded state for accessory with nodeID %@";
            break;
          default:
            goto LABEL_19;
        }
        goto LABEL_14;
      }
      v22 = (void *)MEMORY[0x2533B64D0]();
      v23 = v8;
      v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v25 = HMFGetLogIdentifier();
        __int16 v26 = [v12 nodeID];
        uint64_t v28 = [v6 nodeID];
        *(_DWORD *)buf = 138543874;
        v42 = v25;
        __int16 v43 = 2112;
        int64_t v44 = (int64_t)v26;
        __int16 v45 = 2112;
        int64_t v46 = (int64_t)v28;
        _os_log_impl(&dword_252495000, v24, OS_LOG_TYPE_ERROR, "%{public}@Expecting notification for accessory server with nodeID %@ but received notification for accessory server with nodeID %@ accessory server, ignoring", buf, 0x20u);

        goto LABEL_17;
      }
    }
    else
    {
      v22 = (void *)MEMORY[0x2533B64D0]();
      v23 = v8;
      v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        v25 = HMFGetLogIdentifier();
        __int16 v26 = [v6 nodeID];
        *(_DWORD *)buf = 138543618;
        v42 = v25;
        __int16 v43 = 2112;
        int64_t v44 = (int64_t)v26;
        v27 = "%{public}@Received notification for accessory server with nodeID %@ accessory server, but not currently tr"
              "acking any firmware updates, ignoring";
LABEL_14:
        _os_log_impl(&dword_252495000, v24, OS_LOG_TYPE_INFO, v27, buf, 0x16u);
LABEL_17:
      }
    }
LABEL_18:

    goto LABEL_19;
  }
  v18 = (void *)MEMORY[0x2533B64D0]();
  v19 = v8;
  v20 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    v21 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v42 = v21;
    _os_log_impl(&dword_252495000, v20, OS_LOG_TYPE_INFO, "%{public}@Feature is not enabled, ignoring", buf, 0xCu);
  }
LABEL_20:
}

void __96__HMMTRThreadSoftwareUpdateController_handleFirmwareUpdateStatusChangeForAccessoryServer_state___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x2533B64D0]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = HMFGetLogIdentifier();
      int v9 = [*(id *)(a1 + 40) nodeID];
      int v12 = 138543874;
      __int16 v13 = v8;
      __int16 v14 = 2112;
      uint64_t v15 = v9;
      __int16 v16 = 2112;
      id v17 = v3;
      _os_log_impl(&dword_252495000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to inform thread SW of start firmware update for accessory with nodeID %@, error %@", (uint8_t *)&v12, 0x20u);
    }
    [*(id *)(a1 + 32) _cleanupFirmwareUpdateStateWithError:v3];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v10 = HMFGetLogIdentifier();
      __int16 v11 = [*(id *)(a1 + 40) nodeID];
      int v12 = 138543618;
      __int16 v13 = v10;
      __int16 v14 = 2112;
      uint64_t v15 = v11;
      _os_log_impl(&dword_252495000, v7, OS_LOG_TYPE_INFO, "%{public}@Successfully informed thread SW of start firmware update for accessory with nodeID %@", (uint8_t *)&v12, 0x16u);
    }
  }
}

- (void)_attemptConnectionForFirmwareUpdateForAccessoryServer:(id)a3 completion:(id)a4
{
  uint64_t v122 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (void (**)(id, void *))a4;
  uint64_t v8 = (void *)MEMORY[0x2533B64D0]();
  int v9 = self;
  v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    __int16 v11 = HMFGetLogIdentifier();
    int v12 = [v6 nodeID];
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v11;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v12;
    _os_log_impl(&dword_252495000, v10, OS_LOG_TYPE_INFO, "%{public}@Attempting connection to accessory server with nodeID %@ for firmware update", buf, 0x16u);
  }
  if (isFeatureMatteriPhoneOnlyPairingControlForThreadEnabled())
  {
    id WeakRetained = objc_loadWeakRetained((id *)&v9->_browser);
    __int16 v14 = WeakRetained;
    if (!WeakRetained)
    {
      v27 = (void *)MEMORY[0x2533B64D0]();
      uint64_t v28 = v9;
      uint64_t v29 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        v30 = HMFGetLogIdentifier();
        v31 = [v6 nodeID];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v30;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v31;
        _os_log_impl(&dword_252495000, v29, OS_LOG_TYPE_ERROR, "%{public}@Unable to get browser ref for attemptConnectionForFirmwareUpdateForAccessoryServer with nodeID:%@", buf, 0x16u);
      }
      v22 = [MEMORY[0x263F087E8] hmfErrorWithCode:11];
      v7[2](v7, v22);
      goto LABEL_40;
    }
    uint64_t v15 = [WeakRetained threadRadioManager];
    int v16 = [v15 isPairingActive];

    if (v16)
    {
      id v17 = (void *)MEMORY[0x2533B64D0]();
      uint64_t v18 = v9;
      v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v20 = HMFGetLogIdentifier();
        v21 = [v6 nodeID];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v20;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v21;
        _os_log_impl(&dword_252495000, v19, OS_LOG_TYPE_ERROR, "%{public}@Cannot start firmware update for nodeID %@ while pairing is active", buf, 0x16u);
      }
      v22 = [MEMORY[0x263F087E8] hmfErrorWithCode:9];
      v7[2](v7, v22);
      goto LABEL_40;
    }
    v22 = [(HMMTRThreadSoftwareUpdateController *)v9 targetThreadAccessoryServerForFWUpdate];
    if (v22)
    {
      int v32 = HMFEqualObjects();
      v33 = (void *)MEMORY[0x2533B64D0]();
      v34 = v9;
      uint64_t v35 = HMFGetOSLogHandle();
      v36 = v35;
      if (v32)
      {
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          v37 = HMFGetLogIdentifier();
          v38 = [v6 nodeID];
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = v37;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v38;
          _os_log_impl(&dword_252495000, v36, OS_LOG_TYPE_INFO, "%{public}@Start firmware update attempted for the accessory with nodeID %@, but it's already targeted for fw update, just send out announcement immediately", buf, 0x16u);
        }
        v7[2](v7, 0);
      }
      else
      {
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          uint64_t v47 = HMFGetLogIdentifier();
          v48 = [v6 nodeID];
          v49 = [v22 nodeID];
          *(_DWORD *)buf = 138543874;
          *(void *)&uint8_t buf[4] = v47;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v48;
          *(_WORD *)&buf[22] = 2112;
          v121 = v49;
          _os_log_impl(&dword_252495000, v36, OS_LOG_TYPE_ERROR, "%{public}@Start firmware update attempted for the accessory with nodeID %@, but we're already targeting accessory with nodeID %@", buf, 0x20u);
        }
        v50 = [MEMORY[0x263F087E8] hmfErrorWithCode:6];
        v7[2](v7, v50);
      }
      goto LABEL_40;
    }
    v39 = [v14 threadRadioManager];
    int v40 = [v39 isFirmwareUpdateActive];

    if (v40)
    {
      v41 = (void *)MEMORY[0x2533B64D0]();
      v42 = v9;
      __int16 v43 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        int64_t v44 = HMFGetLogIdentifier();
        __int16 v45 = [v6 nodeID];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v44;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v45;
        _os_log_impl(&dword_252495000, v43, OS_LOG_TYPE_ERROR, "%{public}@Cannot start firmware update for nodeID %@ while another firmware update is active", buf, 0x16u);
      }
      int64_t v46 = [MEMORY[0x263F087E8] hmfErrorWithCode:9];
      v7[2](v7, v46);

      goto LABEL_39;
    }
    v51 = [v6 matterDevice];
    BOOL v52 = [v51 state] == 1;

    if (v52)
    {
      v53 = (void *)MEMORY[0x2533B64D0]();
      v54 = v9;
      v55 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
      {
        v56 = HMFGetLogIdentifier();
        v57 = [v6 nodeID];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v56;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v57;
        _os_log_impl(&dword_252495000, v55, OS_LOG_TYPE_INFO, "%{public}@Accessory server with nodeID %@ was reachable", buf, 0x16u);
      }
      [(HMMTRThreadSoftwareUpdateController *)v54 setTargetThreadAccessoryServerForFWUpdate:v6];
      v58 = [(HMMTRThreadSoftwareUpdateController *)v54 firmwareUpdateActiveTimer];
      [v58 resume];

      v7[2](v7, 0);
      goto LABEL_39;
    }
    v59 = [(HMMTRThreadSoftwareUpdateController *)v9 browser];
    int v60 = [v59 isOperationAllowedForAccessoryServer:v6];

    if (v60)
    {
      if ([v6 isWEDDevice])
      {
        v61 = (void *)MEMORY[0x2533B64D0]();
        v62 = v9;
        v63 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
        {
          v64 = HMFGetLogIdentifier();
          v65 = [v6 nodeID];
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = v64;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v65;
          _os_log_impl(&dword_252495000, v63, OS_LOG_TYPE_INFO, "%{public}@Accessory server with nodeID %@ is WED device", buf, 0x16u);
        }
        [(HMMTRThreadSoftwareUpdateController *)v62 setTargetThreadAccessoryServerForFWUpdate:v6];
        v7[2](v7, 0);
        goto LABEL_39;
      }
      v72 = [(HMMTRThreadSoftwareUpdateController *)v9 browser];
      v73 = [v6 nodeID];
      char v74 = [v72 canEstablishConnectionForNodeID:v73];

      if (v74)
      {
        v75 = [v14 threadRadioManager];
        if ([v75 isThreadNetworkConnected])
        {
          v76 = [v14 threadRadioManager];
          if (![v76 isFirmwareUpdateActive])
          {
            v98 = [v6 matterDevice];
            BOOL v99 = [v98 state] == 1;

            if (!v99)
            {
              v100 = (void *)MEMORY[0x2533B64D0]();
              v101 = v9;
              v102 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
              {
                v103 = HMFGetLogIdentifier();
                v104 = [v6 nodeID];
                *(_DWORD *)buf = 138543618;
                *(void *)&uint8_t buf[4] = v103;
                *(_WORD *)&buf[12] = 2112;
                *(void *)&buf[14] = v104;
                _os_log_impl(&dword_252495000, v102, OS_LOG_TYPE_ERROR, "%{public}@Device is already connected to thread network, no need to transition to full router for firmware update for accessory with nodeID %@", buf, 0x16u);
              }
              v105 = [MEMORY[0x263F087E8] hmfErrorWithCode:2];
              v7[2](v7, v105);

              goto LABEL_39;
            }
            goto LABEL_47;
          }
        }
LABEL_47:
        v77 = [v14 threadRadioManager];
        char v78 = [v77 isReadyToTransitionToFullRouterModeForFirmwareUpdate];

        if (v78)
        {
          [(HMMTRThreadSoftwareUpdateController *)v9 setTargetThreadAccessoryServerForFWUpdate:v6];
          *(void *)buf = 0;
          *(void *)&buf[8] = buf;
          *(void *)&buf[16] = 0x2020000000;
          LOBYTE(v121) = 0;
          objc_initWeak(&location, v9);
          v111[0] = MEMORY[0x263EF8330];
          v111[1] = 3221225472;
          v111[2] = __104__HMMTRThreadSoftwareUpdateController__attemptConnectionForFirmwareUpdateForAccessoryServer_completion___block_invoke;
          v111[3] = &unk_265375E90;
          objc_copyWeak(&v114, &location);
          v113 = buf;
          v112 = v7;
          v79 = (void *)MEMORY[0x2533B66E0](v111);
          dispatch_time_t v80 = dispatch_time(0, 1200000000000);
          v81 = [(HMMTRThreadSoftwareUpdateController *)v9 clientQueue];
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __104__HMMTRThreadSoftwareUpdateController__attemptConnectionForFirmwareUpdateForAccessoryServer_completion___block_invoke_2;
          block[3] = &unk_265377430;
          id v82 = v79;
          id v110 = v82;
          dispatch_after(v80, v81, block);

          v83 = [(HMMTRThreadSoftwareUpdateController *)v9 firmwareUpdateActiveTimer];
          [v83 resume];

          v84 = (void *)MEMORY[0x2533B64D0]();
          v85 = v9;
          HMFGetOSLogHandle();
          v86 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v86, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            id v87 = (id)objc_claimAutoreleasedReturnValue();
            v88 = [v6 nodeID];
            *(_DWORD *)v116 = 138543618;
            id v117 = v87;
            __int16 v118 = 2112;
            v119 = v88;
            _os_log_impl(&dword_252495000, v86, OS_LOG_TYPE_INFO, "%{public}@Entering full-router mode to attempt to reach accessory with nodeID %@", v116, 0x16u);
          }
          v89 = [v14 threadRadioManager];
          v90 = [v6 eMACAddress];
          v91 = [v90 dataUsingEncoding:4];
          uint64_t v92 = [v6 isWEDDevice];
          v106[0] = MEMORY[0x263EF8330];
          v106[1] = 3221225472;
          v106[2] = __104__HMMTRThreadSoftwareUpdateController__attemptConnectionForFirmwareUpdateForAccessoryServer_completion___block_invoke_116;
          v106[3] = &unk_265377368;
          v106[4] = v85;
          id v107 = v6;
          id v93 = v82;
          id v108 = v93;
          [v89 startAccessoryFirmwareUpdateWithExtendedMACAddress:v91 isWedDevice:v92 completion:v106];

          objc_destroyWeak(&v114);
          objc_destroyWeak(&location);
          _Block_object_dispose(buf, 8);
          goto LABEL_39;
        }
        v66 = (void *)MEMORY[0x2533B64D0]();
        v67 = v9;
        v68 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
        {
          v96 = HMFGetLogIdentifier();
          v97 = [v6 nodeID];
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = v96;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v97;
          _os_log_impl(&dword_252495000, v68, OS_LOG_TYPE_ERROR, "%{public}@Cannot start firmware update for nodeID %@ due to invalid thread state", buf, 0x16u);
        }
        goto LABEL_38;
      }
      v66 = (void *)MEMORY[0x2533B64D0]();
      v67 = v9;
      v68 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
      {
        v94 = HMFGetLogIdentifier();
        v95 = [v6 nodeID];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v94;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v95;
        _os_log_impl(&dword_252495000, v68, OS_LOG_TYPE_ERROR, "%{public}@Cannot start firmware update for nodeID %@ accessory cannot be made reachable", buf, 0x16u);
      }
    }
    else
    {
      v66 = (void *)MEMORY[0x2533B64D0]();
      v67 = v9;
      v68 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
      {
        v69 = HMFGetLogIdentifier();
        v70 = [v6 nodeID];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v69;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v70;
        _os_log_impl(&dword_252495000, v68, OS_LOG_TYPE_ERROR, "%{public}@Cannot start firmware update for nodeID %@ accessory at this point in time", buf, 0x16u);
      }
    }
LABEL_38:

    v71 = [MEMORY[0x263F087E8] hmfErrorWithCode:6];
    v7[2](v7, v71);

LABEL_39:
    v22 = 0;
LABEL_40:

    goto LABEL_41;
  }
  v23 = (void *)MEMORY[0x2533B64D0]();
  v24 = v9;
  v25 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    __int16 v26 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = v26;
    _os_log_impl(&dword_252495000, v25, OS_LOG_TYPE_ERROR, "%{public}@Feature is not enabled, falling back to sending notification immediately", buf, 0xCu);
  }
  v7[2](v7, 0);
LABEL_41:
}

void __104__HMMTRThreadSoftwareUpdateController__attemptConnectionForFirmwareUpdateForAccessoryServer_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (v3 && !*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    id v5 = (void *)MEMORY[0x2533B64D0]();
    id v6 = WeakRetained;
    v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = HMFGetLogIdentifier();
      int v9 = [v6 targetThreadAccessoryServerForFWUpdate];
      v10 = [v9 nodeID];
      *(_DWORD *)buf = 138543874;
      v21 = v8;
      __int16 v22 = 2112;
      id v23 = v10;
      __int16 v24 = 2112;
      id v25 = v3;
      _os_log_impl(&dword_252495000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to connect to accessory in time for nodeID %@, error %@", buf, 0x20u);
    }
  }
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    __int16 v11 = (void *)MEMORY[0x2533B64D0]();
    id v12 = WeakRetained;
    __int16 v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      __int16 v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v21 = v14;
      __int16 v22 = 2112;
      id v23 = v12;
      __int16 v24 = 2112;
      id v25 = v3;
      _os_log_impl(&dword_252495000, v13, OS_LOG_TYPE_INFO, "%{public}@Firmware update connection attempt for a accessory with nodeID %@, error = %@", buf, 0x20u);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    uint64_t v15 = [v12 clientQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __104__HMMTRThreadSoftwareUpdateController__attemptConnectionForFirmwareUpdateForAccessoryServer_completion___block_invoke_115;
    block[3] = &unk_265378900;
    id v17 = v3;
    id v18 = v12;
    id v19 = *(id *)(a1 + 32);
    dispatch_async(v15, block);
  }
}

void __104__HMMTRThreadSoftwareUpdateController__attemptConnectionForFirmwareUpdateForAccessoryServer_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x263F087E8] hmfErrorWithCode:13];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __104__HMMTRThreadSoftwareUpdateController__attemptConnectionForFirmwareUpdateForAccessoryServer_completion___block_invoke_116(id *a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x2533B64D0]();
  id v5 = a1[4];
  id v6 = HMFGetOSLogHandle();
  v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = HMFGetLogIdentifier();
      int v9 = [a1[5] nodeID];
      *(_DWORD *)buf = 138543874;
      id v23 = v8;
      __int16 v24 = 2112;
      id v25 = v9;
      __int16 v26 = 2112;
      id v27 = v3;
      _os_log_impl(&dword_252495000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to inform thread SW of start firmware update for accessory with nodeID %@, error %@", buf, 0x20u);
    }
    v10 = [a1[4] firmwareUpdateActiveTimer];
    [v10 suspend];

    [a1[4] setTargetThreadAccessoryServerForFWUpdate:0];
    __int16 v11 = [a1[4] clientQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __104__HMMTRThreadSoftwareUpdateController__attemptConnectionForFirmwareUpdateForAccessoryServer_completion___block_invoke_117;
    block[3] = &unk_2653770F0;
    id v21 = a1[6];
    id v20 = v3;
    dispatch_async(v11, block);

    id v12 = v21;
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      __int16 v13 = HMFGetLogIdentifier();
      __int16 v14 = [a1[5] nodeID];
      *(_DWORD *)buf = 138543618;
      id v23 = v13;
      __int16 v24 = 2112;
      id v25 = v14;
      _os_log_impl(&dword_252495000, v7, OS_LOG_TYPE_INFO, "%{public}@Successfully informed thread SW of start firmware update for accessory with nodeID %@, waiting for reachability to update", buf, 0x16u);
    }
    uint64_t v15 = [a1[4] reachabilityObserver];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __104__HMMTRThreadSoftwareUpdateController__attemptConnectionForFirmwareUpdateForAccessoryServer_completion___block_invoke_118;
    v17[3] = &unk_265378578;
    id v16 = a1[5];
    v17[4] = a1[4];
    id v18 = a1[6];
    [v15 startObservingReachabilityForAccessoryServer:v16 completion:v17];

    id v12 = v18;
  }
}

uint64_t __104__HMMTRThreadSoftwareUpdateController__attemptConnectionForFirmwareUpdateForAccessoryServer_completion___block_invoke_117(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __104__HMMTRThreadSoftwareUpdateController__attemptConnectionForFirmwareUpdateForAccessoryServer_completion___block_invoke_118(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) clientQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __104__HMMTRThreadSoftwareUpdateController__attemptConnectionForFirmwareUpdateForAccessoryServer_completion___block_invoke_2_119;
  v7[3] = &unk_2653770F0;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __104__HMMTRThreadSoftwareUpdateController__attemptConnectionForFirmwareUpdateForAccessoryServer_completion___block_invoke_2_119(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __104__HMMTRThreadSoftwareUpdateController__attemptConnectionForFirmwareUpdateForAccessoryServer_completion___block_invoke_115(void *a1)
{
  uint64_t v3 = a1[4];
  id v2 = (void *)a1[5];
  if (v3)
  {
    objc_msgSend(v2, "_cleanupFirmwareUpdateStateWithError:");
  }
  else
  {
    id v4 = [v2 reachabilityObserver];
    [v4 stopObservingReachabilityWithError:a1[4]];
  }
  id v5 = *(uint64_t (**)(void))(a1[6] + 16);
  return v5();
}

- (void)handleUpdateRequestedForAccessoryServer:(id)a3 completion:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browser);
  if (WeakRetained)
  {
    if (isFeatureMatteriPhoneOnlyPairingControlForThreadEnabled())
    {
      if (![v6 accessoryLinkLayerTypeIsWifiOrEthernet])
      {
        v17[0] = MEMORY[0x263EF8330];
        v17[1] = 3221225472;
        v17[2] = __90__HMMTRThreadSoftwareUpdateController_handleUpdateRequestedForAccessoryServer_completion___block_invoke;
        v17[3] = &unk_265377368;
        v17[4] = self;
        id v18 = v6;
        id v19 = v7;
        [(HMMTRThreadSoftwareUpdateController *)self _attemptConnectionForFirmwareUpdateForAccessoryServer:v18 completion:v17];

        goto LABEL_13;
      }
      id v9 = (void *)MEMORY[0x2533B64D0]();
      v10 = self;
      __int16 v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        id v12 = HMFGetLogIdentifier();
        __int16 v13 = [v6 nodeID];
        *(_DWORD *)buf = 138543618;
        id v21 = v12;
        __int16 v22 = 2112;
        id v23 = v13;
        __int16 v14 = "%{public}@Accessory server with nodeID %@ is an IP accessory, no tracking needed.";
        uint64_t v15 = v11;
        os_log_type_t v16 = OS_LOG_TYPE_INFO;
LABEL_8:
        _os_log_impl(&dword_252495000, v15, v16, v14, buf, 0x16u);

LABEL_11:
      }
    }
    else
    {
      id v9 = (void *)MEMORY[0x2533B64D0]();
      v10 = self;
      __int16 v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        id v12 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        id v21 = v12;
        _os_log_impl(&dword_252495000, v11, OS_LOG_TYPE_ERROR, "%{public}@Feature is not enabled, falling back to sending notification immediately", buf, 0xCu);
        goto LABEL_11;
      }
    }
  }
  else
  {
    id v9 = (void *)MEMORY[0x2533B64D0]();
    v10 = self;
    __int16 v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = HMFGetLogIdentifier();
      __int16 v13 = [v6 nodeID];
      *(_DWORD *)buf = 138543618;
      id v21 = v12;
      __int16 v22 = 2112;
      id v23 = v13;
      __int16 v14 = "%{public}@Unable to get browser ref for notifyUpdateRequestedForNodeID:%@";
      uint64_t v15 = v11;
      os_log_type_t v16 = OS_LOG_TYPE_ERROR;
      goto LABEL_8;
    }
  }

  (*((void (**)(id, void))v7 + 2))(v7, 0);
LABEL_13:
}

void __90__HMMTRThreadSoftwareUpdateController_handleUpdateRequestedForAccessoryServer_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)MEMORY[0x2533B64D0]();
    id v5 = *(id *)(a1 + 32);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = HMFGetLogIdentifier();
      id v8 = [*(id *)(a1 + 40) nodeID];
      int v16 = 138543874;
      id v17 = v7;
      __int16 v18 = 2112;
      id v19 = v8;
      __int16 v20 = 2112;
      id v21 = v3;
      _os_log_impl(&dword_252495000, v6, OS_LOG_TYPE_ERROR, "%{public}@Unable to connect to accessory with nodeID:%@ error:%@", (uint8_t *)&v16, 0x20u);
    }
    id v9 = [*(id *)(a1 + 40) matterFirmwareUpdateStatus];
    [v9 updateFirmwareUpdateStatus:0];

    v10 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  else
  {
    if ([*(id *)(a1 + 40) accessoryLinkLayerTypeIsWifiOrEthernet])
    {
      __int16 v11 = (void *)MEMORY[0x2533B64D0]();
      id v12 = *(id *)(a1 + 32);
      __int16 v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        __int16 v14 = HMFGetLogIdentifier();
        uint64_t v15 = [*(id *)(a1 + 40) nodeID];
        int v16 = 138543618;
        id v17 = v14;
        __int16 v18 = 2112;
        id v19 = v15;
        _os_log_impl(&dword_252495000, v13, OS_LOG_TYPE_INFO, "%{public}@Accessory server with nodeID %@ became reachable, but is an IP accessory, no tracking needed.", (uint8_t *)&v16, 0x16u);
      }
      [*(id *)(a1 + 32) _cleanupFirmwareUpdateStateWithError:0];
    }
    v10 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  v10();
}

- (void)suspendOperations
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = [(HMMTRThreadSoftwareUpdateController *)self targetThreadAccessoryServerForFWUpdate];

  id v4 = (void *)MEMORY[0x2533B64D0]();
  id v5 = self;
  id v6 = HMFGetOSLogHandle();
  id v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v8 = HMFGetLogIdentifier();
      int v11 = 138543362;
      id v12 = v8;
      _os_log_impl(&dword_252495000, v7, OS_LOG_TYPE_INFO, "%{public}@Suspending firmware update operations", (uint8_t *)&v11, 0xCu);
    }
    id v9 = [MEMORY[0x263F087E8] hmfErrorWithCode:12];
    [(HMMTRThreadSoftwareUpdateController *)v5 _cleanupFirmwareUpdateStateWithError:v9];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v10 = HMFGetLogIdentifier();
      int v11 = 138543362;
      id v12 = v10;
      _os_log_impl(&dword_252495000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Received suspendOperations, but not currently tracking any firmware updates, ignoring", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (void)suspendOperationsForFabricID:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [(HMMTRThreadSoftwareUpdateController *)self isFirmwareUpdateInProgressForFabricID:v4];
  id v6 = (void *)MEMORY[0x2533B64D0]();
  id v7 = self;
  id v8 = HMFGetOSLogHandle();
  id v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v10 = HMFGetLogIdentifier();
      int v13 = 138543362;
      __int16 v14 = v10;
      _os_log_impl(&dword_252495000, v9, OS_LOG_TYPE_INFO, "%{public}@Suspending firmware update operations", (uint8_t *)&v13, 0xCu);
    }
    int v11 = [MEMORY[0x263F087E8] hmfErrorWithCode:12];
    [(HMMTRThreadSoftwareUpdateController *)v7 _cleanupFirmwareUpdateStateWithError:v11];
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      id v12 = HMFGetLogIdentifier();
      int v13 = 138543618;
      __int16 v14 = v12;
      __int16 v15 = 2112;
      id v16 = v4;
      _os_log_impl(&dword_252495000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Received suspendOperations, but no active fw updates in progress for fabricID %@", (uint8_t *)&v13, 0x16u);
    }
  }
}

- (BOOL)isFirmwareUpdateInProgressForFabricID:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(HMMTRThreadSoftwareUpdateController *)self targetThreadAccessoryServerForFWUpdate];
  id v6 = v5;
  if (!v5) {
    goto LABEL_5;
  }
  uint64_t v7 = [v5 fabricID];
  if (!v7) {
    goto LABEL_5;
  }
  id v8 = (void *)v7;
  id v9 = [v6 fabricID];
  char v10 = HMFEqualObjects();

  if (v10) {
    BOOL v11 = 1;
  }
  else {
LABEL_5:
  }
    BOOL v11 = 0;

  return v11;
}

- (void)_cleanupFirmwareUpdateStateWithError:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [(HMMTRThreadSoftwareUpdateController *)self targetThreadAccessoryServerForFWUpdate];
  id v6 = (void *)MEMORY[0x2533B64D0]();
  uint64_t v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    char v10 = [v5 nodeID];
    *(_DWORD *)buf = 138543874;
    id v23 = v9;
    __int16 v24 = 2112;
    id v25 = v10;
    __int16 v26 = 2112;
    id v27 = v4;
    _os_log_impl(&dword_252495000, v8, OS_LOG_TYPE_INFO, "%{public}@Cleaning up firmware update state - current target accessory nodeID = %@, error = %@", buf, 0x20u);
  }
  BOOL v11 = [(HMMTRThreadSoftwareUpdateController *)v7 firmwareUpdateActiveTimer];
  [v11 suspend];

  [(HMMTRThreadSoftwareUpdateController *)v7 setTargetThreadAccessoryServerForFWUpdate:0];
  id v12 = [(HMMTRThreadSoftwareUpdateController *)v7 reachabilityObserver];
  [v12 stopObservingReachabilityWithError:v4];

  int v13 = [(HMMTRThreadSoftwareUpdateController *)v7 browser];
  __int16 v14 = [v13 threadRadioManager];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __76__HMMTRThreadSoftwareUpdateController__cleanupFirmwareUpdateStateWithError___block_invoke;
  v21[3] = &unk_265376E00;
  v21[4] = v7;
  [v14 stopAccessoryFirmwareUpdateWithCompletion:v21];

  if (v4 && v5)
  {
    __int16 v15 = (void *)MEMORY[0x2533B64D0]();
    id v16 = v7;
    uint64_t v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      __int16 v18 = HMFGetLogIdentifier();
      id v19 = [v5 nodeID];
      *(_DWORD *)buf = 138543874;
      id v23 = v18;
      __int16 v24 = 2112;
      id v25 = v19;
      __int16 v26 = 2112;
      id v27 = v4;
      _os_log_impl(&dword_252495000, v17, OS_LOG_TYPE_INFO, "%{public}@Resetting firmware update to unknown for current target accessory nodeID = %@, error = %@", buf, 0x20u);
    }
    __int16 v20 = [v5 matterFirmwareUpdateStatus];
    [v20 updateFirmwareUpdateStatus:0];
  }
}

void __76__HMMTRThreadSoftwareUpdateController__cleanupFirmwareUpdateStateWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)MEMORY[0x2533B64D0]();
    id v5 = *(id *)(a1 + 32);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = HMFGetLogIdentifier();
      int v8 = 138543618;
      id v9 = v7;
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_impl(&dword_252495000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to inform thread SW of stop firmware update after successful fw installed, error %@", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (HMMTRThreadSoftwareUpdateController)initWithQueue:(id)a3 browser:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HMMTRThreadSoftwareUpdateController;
  id v9 = [(HMMTRThreadSoftwareUpdateController *)&v16 init];
  __int16 v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_clientQueue, a3);
    objc_storeWeak((id *)&v10->_browser, v8);
    uint64_t v11 = [objc_alloc(MEMORY[0x263F42658]) initWithTimeInterval:0 options:1800.0];
    firmwareUpdateActiveTimer = v10->_firmwareUpdateActiveTimer;
    v10->_firmwareUpdateActiveTimer = (HMFTimer *)v11;

    [(HMFTimer *)v10->_firmwareUpdateActiveTimer setDelegateQueue:v7];
    [(HMFTimer *)v10->_firmwareUpdateActiveTimer setDelegate:v10];
    int v13 = [[HMMTRAccessoryReachabilityObserver alloc] initWithQueue:v7];
    reachabilityObserver = v10->_reachabilityObserver;
    v10->_reachabilityObserver = v13;
  }
  return v10;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t56 != -1) {
    dispatch_once(&logCategory__hmf_once_t56, &__block_literal_global_121);
  }
  id v2 = (void *)logCategory__hmf_once_v57;
  return v2;
}

uint64_t __50__HMMTRThreadSoftwareUpdateController_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v57;
  logCategory__hmf_once_v57 = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

@end