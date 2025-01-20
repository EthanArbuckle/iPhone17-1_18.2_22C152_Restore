@interface HMMTRFirmwareUpdateStatus
+ (id)logCategory;
- (HAPMatterFirmwareUpdateStatus)localFirmwareUpdateStatus;
- (HMFTimer)idleResetTimer;
- (HMMTRAccessoryServer)accessoryServer;
- (HMMTRAccessoryServerBrowser)browser;
- (HMMTRFirmwareUpdateStatus)initWithFirmwareUpdateStatus:(id)a3 accessoryServer:(id)a4 browser:(id)a5;
- (NSNumber)downloadedFirmwareVersionNumber;
- (OS_dispatch_queue)idleResetTimerQueue;
- (id)_updateStateAsString:(unsigned __int8)a3;
- (id)readForHAPFirmwareUpdateReadinessCharacteristic:(id)a3;
- (id)readForHAPFirmwareUpdateStatusCharacteristic:(id)a3;
- (id)readForMatterFirmwareUpdateStatusCharacteristic:(id)a3;
- (int64_t)otaProviderState;
- (void)checkCurrentFirmwareVersionNumber:(id)a3;
- (void)handleOTARequestorAttributeReport:(id)a3;
- (void)setBrowser:(id)a3;
- (void)setDownloadedFirmwareVersionNumber:(id)a3;
- (void)setIdleResetTimer:(id)a3;
- (void)setLocalFirmwareUpdateStatus:(id)a3;
- (void)timerDidFire:(id)a3;
- (void)updateDownloadedFirmwareVersionNumber:(id)a3;
- (void)updateFirmwareUpdateStatus:(int64_t)a3;
@end

@implementation HMMTRFirmwareUpdateStatus

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idleResetTimer, 0);
  objc_destroyWeak((id *)&self->_browser);
  objc_storeStrong((id *)&self->_idleResetTimerQueue, 0);
  objc_storeStrong((id *)&self->_downloadedFirmwareVersionNumber, 0);
  objc_storeStrong((id *)&self->_localFirmwareUpdateStatus, 0);
  objc_destroyWeak((id *)&self->_accessoryServer);
}

- (void)setIdleResetTimer:(id)a3
{
}

- (HMFTimer)idleResetTimer
{
  return self->_idleResetTimer;
}

- (void)setBrowser:(id)a3
{
}

- (HMMTRAccessoryServerBrowser)browser
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browser);
  return (HMMTRAccessoryServerBrowser *)WeakRetained;
}

- (OS_dispatch_queue)idleResetTimerQueue
{
  return self->_idleResetTimerQueue;
}

- (void)setDownloadedFirmwareVersionNumber:(id)a3
{
}

- (NSNumber)downloadedFirmwareVersionNumber
{
  return self->_downloadedFirmwareVersionNumber;
}

- (HAPMatterFirmwareUpdateStatus)localFirmwareUpdateStatus
{
  return self->_localFirmwareUpdateStatus;
}

- (HMMTRAccessoryServer)accessoryServer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessoryServer);
  return (HMMTRAccessoryServer *)WeakRetained;
}

- (int64_t)otaProviderState
{
  return self->_otaProviderState;
}

- (void)handleOTARequestorAttributeReport:(id)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F10B70]];
  v6 = v5;
  if (!v5) {
    goto LABEL_22;
  }
  v7 = [v5 cluster];
  int v8 = [v7 isEqualToNumber:&unk_2702B50E8];

  if (!v8) {
    goto LABEL_22;
  }
  v9 = [v6 attribute];
  int v10 = [v9 isEqualToNumber:&unk_2702B5100];

  if (!v10)
  {
    v16 = [v6 attribute];
    int v17 = [v16 isEqualToNumber:&unk_2702B5118];

    if (v17)
    {
      v18 = +[HMMTRUtilities mtrBaseClusterValueFromMTRClusterReportValue:v4];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v19 = v18;
      }
      else {
        v19 = 0;
      }
      id v20 = v19;

      v21 = (void *)MEMORY[0x2533B64D0]();
      v22 = self;
      v23 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_INFO)) {
        goto LABEL_21;
      }
      v24 = HMFGetLogIdentifier();
      v25 = [(HMMTRFirmwareUpdateStatus *)v22 accessoryServer];
      int v36 = 138543874;
      v37 = v24;
      __int16 v38 = 2112;
      id v39 = v20;
      __int16 v40 = 2112;
      v41 = v25;
      v26 = "%{public}@OTA Requestor cluster, UpdatePossible Attribute report value:%@ for accessory:%@";
    }
    else
    {
      v27 = [v6 attribute];
      int v28 = [v27 isEqualToNumber:&unk_2702B5130];

      if (v28)
      {
        v29 = +[HMMTRUtilities mtrBaseClusterValueFromMTRClusterReportValue:v4];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v30 = v29;
        }
        else {
          v30 = 0;
        }
        id v20 = v30;

        v21 = (void *)MEMORY[0x2533B64D0]();
        v22 = self;
        v23 = HMFGetOSLogHandle();
        if (!os_log_type_enabled(v23, OS_LOG_TYPE_INFO)) {
          goto LABEL_21;
        }
        v24 = HMFGetLogIdentifier();
        v25 = -[HMMTRFirmwareUpdateStatus _updateStateAsString:](v22, "_updateStateAsString:", [v20 unsignedIntValue]);
        v31 = [(HMMTRFirmwareUpdateStatus *)v22 accessoryServer];
        int v36 = 138543874;
        v37 = v24;
        __int16 v38 = 2112;
        id v39 = v25;
        __int16 v40 = 2112;
        v41 = v31;
        _os_log_impl(&dword_252495000, v23, OS_LOG_TYPE_INFO, "%{public}@OTA Requestor cluster, UpdateState Attribute report value:%@ for accessory:%@", (uint8_t *)&v36, 0x20u);

        goto LABEL_20;
      }
      v32 = [v6 attribute];
      int v33 = [v32 isEqualToNumber:&unk_2702B5148];

      if (!v33) {
        goto LABEL_22;
      }
      v34 = +[HMMTRUtilities mtrBaseClusterValueFromMTRClusterReportValue:v4];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v35 = v34;
      }
      else {
        v35 = 0;
      }
      id v20 = v35;

      v21 = (void *)MEMORY[0x2533B64D0]();
      v22 = self;
      v23 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_INFO)) {
        goto LABEL_21;
      }
      v24 = HMFGetLogIdentifier();
      v25 = [(HMMTRFirmwareUpdateStatus *)v22 accessoryServer];
      int v36 = 138543874;
      v37 = v24;
      __int16 v38 = 2112;
      id v39 = v20;
      __int16 v40 = 2112;
      v41 = v25;
      v26 = "%{public}@OTA Requestor cluster, UpdateStateProgress Attribute report value:%@ for accessory:%@";
    }
    _os_log_impl(&dword_252495000, v23, OS_LOG_TYPE_INFO, v26, (uint8_t *)&v36, 0x20u);
LABEL_20:

LABEL_21:

    goto LABEL_22;
  }
  v11 = (void *)MEMORY[0x2533B64D0]();
  v12 = self;
  v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = HMFGetLogIdentifier();
    v15 = [(HMMTRFirmwareUpdateStatus *)v12 accessoryServer];
    int v36 = 138543874;
    v37 = v14;
    __int16 v38 = 2112;
    id v39 = v4;
    __int16 v40 = 2112;
    v41 = v15;
    _os_log_impl(&dword_252495000, v13, OS_LOG_TYPE_INFO, "%{public}@OTA Requestor cluster, DefaultOTAProviders Attribute report:%@ for accessory:%@", (uint8_t *)&v36, 0x20u);
  }
LABEL_22:
}

- (id)_updateStateAsString:(unsigned __int8)a3
{
  if ((a3 - 1) > 7u) {
    return @"Unknown";
  }
  else {
    return off_265375770[(a3 - 1)];
  }
}

- (id)readForHAPFirmwareUpdateReadinessCharacteristic:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 type];
  int v6 = [v5 isEqual:@"00000234-0000-1000-8000-0026BB765291"];

  if (v6)
  {
    id v7 = objc_alloc_init(MEMORY[0x263F359A8]);
    id v16 = 0;
    int v8 = [v7 serializeWithError:&v16];
    id v9 = v16;
    int v10 = (void *)MEMORY[0x2533B64D0]([v4 setValue:v8]);
    v11 = self;
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v18 = v13;
      __int16 v19 = 2112;
      id v20 = v4;
      _os_log_impl(&dword_252495000, v12, OS_LOG_TYPE_INFO, "%{public}@Updated HAP firmware update readiness characteristic on local read to :%@", buf, 0x16u);
    }
    v14 = [v4 value];
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)readForHAPFirmwareUpdateStatusCharacteristic:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 type];
  int v6 = [v5 isEqual:@"00000235-0000-1000-8000-0026BB765291"];

  if (v6)
  {
    id v7 = objc_alloc_init(MEMORY[0x263F359B0]);
    id v16 = 0;
    int v8 = [v7 serializeWithError:&v16];
    id v9 = v16;
    int v10 = (void *)MEMORY[0x2533B64D0]([v4 setValue:v8]);
    v11 = self;
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v18 = v13;
      __int16 v19 = 2112;
      id v20 = v4;
      _os_log_impl(&dword_252495000, v12, OS_LOG_TYPE_INFO, "%{public}@Updated HAP firmware update status characteristic on local read to :%@", buf, 0x16u);
    }
    v14 = [v4 value];
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)readForMatterFirmwareUpdateStatusCharacteristic:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 type];
  int v6 = [v5 isEqual:@"0000026E-0000-1000-8000-0026BB765291"];

  if (v6)
  {
    id v7 = [(HMMTRFirmwareUpdateStatus *)self localFirmwareUpdateStatus];
    id v21 = 0;
    int v8 = [v7 serializeWithError:&v21];
    id v9 = v21;

    int v10 = (void *)MEMORY[0x2533B64D0]([v4 setValue:v8]);
    v11 = self;
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v23 = v13;
      __int16 v24 = 2112;
      id v25 = v4;
      _os_log_impl(&dword_252495000, v12, OS_LOG_TYPE_INFO, "%{public}@Updated matter firmware update status characteristic on local read to :%@", buf, 0x16u);
    }
    v14 = [(HMMTRFirmwareUpdateStatus *)v11 browser];
    v15 = [v14 softwareUpdateProvider];
    id v16 = [(HMMTRFirmwareUpdateStatus *)v11 accessoryServer];
    int v17 = [v16 currentPairing];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __77__HMMTRFirmwareUpdateStatus_readForMatterFirmwareUpdateStatusCharacteristic___block_invoke;
    v20[3] = &unk_265376E00;
    v20[4] = v11;
    [v15 notifyDelegateCheckFirmwareUpdateSessionWithPairing:v17 completionHandler:v20];

    v18 = [v4 value];
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

void __77__HMMTRFirmwareUpdateStatus_readForMatterFirmwareUpdateStatusCharacteristic___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)MEMORY[0x2533B64D0]();
    id v5 = *(id *)(a1 + 32);
    int v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = HMFGetLogIdentifier();
      int v8 = 138543618;
      id v9 = v7;
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_impl(&dword_252495000, v6, OS_LOG_TYPE_ERROR, "%{public}@Delegate call to check firmware update session failed: %@", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (void)updateFirmwareUpdateStatus:(int64_t)a3
{
  uint64_t v77 = *MEMORY[0x263EF8340];
  id v5 = (void *)MEMORY[0x2533B64D0](self, a2);
  int v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = HMFGetLogIdentifier();
    [(HMMTRFirmwareUpdateStatus *)v6 otaProviderState];
    id v9 = HAPOTAProviderStateAsString();
    __int16 v10 = HAPOTAProviderStateAsString();
    id v11 = [(HMMTRFirmwareUpdateStatus *)v6 accessoryServer];
    *(_DWORD *)buf = 138544130;
    v70 = v8;
    __int16 v71 = 2112;
    v72 = v9;
    __int16 v73 = 2112;
    v74 = v10;
    __int16 v75 = 2112;
    v76 = v11;
    _os_log_impl(&dword_252495000, v7, OS_LOG_TYPE_INFO, "%{public}@Updating OTA Provider state from %@ to %@ for accessory server [%@]", buf, 0x2Au);
  }
  if ((unint64_t)a3 >= 7)
  {
    v27 = (void *)MEMORY[0x2533B64D0]();
    int v28 = v6;
    v29 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v30 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v70 = v30;
      __int16 v71 = 1024;
      LODWORD(v72) = a3;
      _os_log_impl(&dword_252495000, v29, OS_LOG_TYPE_ERROR, "%{public}@Invalid OTA provider state : %d", buf, 0x12u);
    }
  }
  else
  {
    if (((1 << a3) & 0x43) != 0)
    {
      uint64_t v12 = (void *)MEMORY[0x2533B64D0]();
      v13 = v6;
      v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v15 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v70 = v15;
        _os_log_impl(&dword_252495000, v14, OS_LOG_TYPE_INFO, "%{public}@Resetting downloadedFirmwareVersionNumber to nil", buf, 0xCu);
      }
      [(HMMTRFirmwareUpdateStatus *)v13 setDownloadedFirmwareVersionNumber:0];
    }
    int64_t v55 = a3;
    id v16 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    int v17 = [(HMMTRFirmwareUpdateStatus *)v6 accessoryServer];
    v18 = [v17 primaryAccessory];
    __int16 v19 = [v18 services];

    uint64_t v20 = [v19 countByEnumeratingWithState:&v63 objects:v68 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v64;
      while (2)
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v64 != v22) {
            objc_enumerationMutation(v19);
          }
          __int16 v24 = *(void **)(*((void *)&v63 + 1) + 8 * i);
          id v25 = [v24 type];
          int v26 = [v25 isEqualToString:@"00000236-0000-1000-8000-0026BB765291"];

          if (v26)
          {
            long long v61 = 0u;
            long long v62 = 0u;
            long long v59 = 0u;
            long long v60 = 0u;
            v31 = [v24 characteristics];
            uint64_t v32 = [v31 countByEnumeratingWithState:&v59 objects:v67 count:16];
            if (v32)
            {
              uint64_t v33 = v32;
              uint64_t v34 = *(void *)v60;
              v54 = v16;
LABEL_22:
              uint64_t v35 = 0;
              while (1)
              {
                if (*(void *)v60 != v34) {
                  objc_enumerationMutation(v31);
                }
                int v36 = *(void **)(*((void *)&v59 + 1) + 8 * v35);
                v37 = [v36 type];
                int v38 = [v37 isEqualToString:@"0000026E-0000-1000-8000-0026BB765291"];

                if (v38) {
                  break;
                }
                if (v33 == ++v35)
                {
                  uint64_t v33 = [v31 countByEnumeratingWithState:&v59 objects:v67 count:16];
                  id v16 = v54;
                  if (v33) {
                    goto LABEL_22;
                  }
                  goto LABEL_36;
                }
              }
              id v39 = (void *)[v36 copy];
              __int16 v40 = [v36 service];
              [v39 setService:v40];

              v41 = (void *)[objc_alloc(MEMORY[0x263F35A60]) initWithValue:v55];
              uint64_t v42 = (void *)[objc_alloc(MEMORY[0x263F359E0]) initWithOTAProviderState:v41 downloadedFirmwareVersionNumber:0 accessoryDownloadProgressPercent:0];
              id v58 = 0;
              v43 = [v42 serializeWithError:&v58];
              id v44 = v58;
              if (v44)
              {
                v45 = v44;
                v46 = (void *)MEMORY[0x2533B64D0]();
                v47 = v6;
                v48 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
                {
                  HMFGetLogIdentifier();
                  v49 = v56 = v43;
                  *(_DWORD *)buf = 138543618;
                  v70 = v49;
                  __int16 v71 = 2112;
                  v72 = v45;
                  _os_log_impl(&dword_252495000, v48, OS_LOG_TYPE_ERROR, "%{public}@Matter firmware update status serialized failed. Error: %@", buf, 0x16u);

                  v43 = v56;
                }

                id v16 = v54;
                goto LABEL_38;
              }
              [(HMMTRFirmwareUpdateStatus *)v6 setLocalFirmwareUpdateStatus:v42];
              v57 = v43;
              v50 = (void *)MEMORY[0x2533B64D0]([v39 setValue:v43]);
              v51 = v6;
              v52 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
              {
                v53 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543618;
                v70 = v53;
                __int16 v71 = 2112;
                v72 = v39;
                _os_log_impl(&dword_252495000, v52, OS_LOG_TYPE_INFO, "%{public}@Notification: Updated characteristic: %@", buf, 0x16u);
              }
              id v16 = v54;
              [v54 addObject:v39];
            }
LABEL_36:

            goto LABEL_37;
          }
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v63 objects:v68 count:16];
        if (v21) {
          continue;
        }
        break;
      }
    }
LABEL_37:

    __int16 v19 = [(HMMTRFirmwareUpdateStatus *)v6 accessoryServer];
    v31 = [v19 delegate];
    id v39 = [(HMMTRFirmwareUpdateStatus *)v6 accessoryServer];
    [v31 accessoryServer:v39 didUpdateValuesForCharacteristics:v16 stateNumber:0 broadcast:0];
LABEL_38:
  }
}

- (void)checkCurrentFirmwareVersionNumber:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x2533B64D0]();
  int v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = HMFGetLogIdentifier();
    id v9 = [(HMMTRFirmwareUpdateStatus *)v6 downloadedFirmwareVersionNumber];
    *(_DWORD *)buf = 138543874;
    int v28 = v8;
    __int16 v29 = 2112;
    id v30 = v4;
    __int16 v31 = 2112;
    uint64_t v32 = v9;
    _os_log_impl(&dword_252495000, v7, OS_LOG_TYPE_INFO, "%{public}@Checking currentFirmwareVersionNumber: %@ with downloadedFirmwareVersionNumber: %@ to determine if a software update was installed.", buf, 0x20u);
  }
  __int16 v10 = [(HMMTRFirmwareUpdateStatus *)v6 downloadedFirmwareVersionNumber];

  if (v10)
  {
    id v11 = [(HMMTRFirmwareUpdateStatus *)v6 downloadedFirmwareVersionNumber];
    int v12 = [v4 isEqualToNumber:v11];

    if (v12)
    {
      v13 = [(HMMTRFirmwareUpdateStatus *)v6 accessoryServer];
      v14 = [v13 otaUpdateTimer];

      if (v14)
      {
        v15 = (void *)MEMORY[0x2533B64D0]();
        id v16 = v6;
        int v17 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          v18 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          int v28 = v18;
          _os_log_impl(&dword_252495000, v17, OS_LOG_TYPE_INFO, "%{public}@Stopping OTA update timer", buf, 0xCu);
        }
        __int16 v19 = [(HMMTRFirmwareUpdateStatus *)v16 accessoryServer];
        uint64_t v20 = [v19 otaUpdateTimer];
        [v20 stop];
      }
      uint64_t v21 = (void *)MEMORY[0x2533B64D0]();
      uint64_t v22 = v6;
      v23 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        __int16 v24 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        int v28 = v24;
        _os_log_impl(&dword_252495000, v23, OS_LOG_TYPE_INFO, "%{public}@Updating OTA Provider state to Installed and re-setting downloadedFirmwareVersionNumber to nil", buf, 0xCu);
      }
      [(HMMTRFirmwareUpdateStatus *)v22 setDownloadedFirmwareVersionNumber:0];
      id v25 = [(HMMTRFirmwareUpdateStatus *)v22 accessoryServer];
      v26[0] = MEMORY[0x263EF8330];
      v26[1] = 3221225472;
      v26[2] = __63__HMMTRFirmwareUpdateStatus_checkCurrentFirmwareVersionNumber___block_invoke;
      v26[3] = &unk_265376E00;
      v26[4] = v22;
      [v25 refreshThreadCapabilitiesWithCompletion:v26];

      [(HMMTRFirmwareUpdateStatus *)v22 updateFirmwareUpdateStatus:6];
    }
  }
}

void __63__HMMTRFirmwareUpdateStatus_checkCurrentFirmwareVersionNumber___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x2533B64D0]();
  id v5 = *(id *)(a1 + 32);
  int v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v8 = [*(id *)(a1 + 32) accessoryServer];
    id v9 = [v8 nodeID];
    int v10 = 138543618;
    id v11 = v7;
    __int16 v12 = 2112;
    v13 = v9;
    _os_log_impl(&dword_252495000, v6, OS_LOG_TYPE_INFO, "%{public}@Done refreshing thread capabilities for accessory server with nodeID: %@", (uint8_t *)&v10, 0x16u);
  }
}

- (void)updateDownloadedFirmwareVersionNumber:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x2533B64D0]([(HMMTRFirmwareUpdateStatus *)self setDownloadedFirmwareVersionNumber:v4]);
  int v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = HMFGetLogIdentifier();
    id v9 = [(HMMTRFirmwareUpdateStatus *)v6 downloadedFirmwareVersionNumber];
    int v10 = 138543618;
    id v11 = v8;
    __int16 v12 = 2112;
    v13 = v9;
    _os_log_impl(&dword_252495000, v7, OS_LOG_TYPE_INFO, "%{public}@Updated downloadedFirmwareVersionNumber: %@", (uint8_t *)&v10, 0x16u);
  }
}

- (void)setLocalFirmwareUpdateStatus:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v5 = a3;
  objc_storeStrong((id *)&self->_localFirmwareUpdateStatus, a3);
  int v6 = [v5 OTAProviderState];
  self->_otaProviderState = [v6 value];

  unint64_t v7 = [(HMMTRFirmwareUpdateStatus *)self otaProviderState];
  if (v7 <= 6)
  {
    if (((1 << v7) & 0x35) != 0)
    {
      int v8 = (void *)MEMORY[0x2533B64D0]();
      id v9 = self;
      int v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        id v11 = HMFGetLogIdentifier();
        __int16 v12 = [(HMMTRFirmwareUpdateStatus *)v9 idleResetTimer];
        [v12 timeInterval];
        uint64_t v14 = v13;
        v15 = [(HMMTRFirmwareUpdateStatus *)v9 accessoryServer];
        *(_DWORD *)id v30 = 138543874;
        *(void *)&v30[4] = v11;
        *(_WORD *)&v30[12] = 2048;
        *(void *)&v30[14] = v14;
        *(_WORD *)&v30[22] = 2112;
        __int16 v31 = v15;
        id v16 = "%{public}@Kicking idle reset timer with delay of %f seconds for accessory server [%@]";
LABEL_14:
        _os_log_impl(&dword_252495000, v10, OS_LOG_TYPE_INFO, v16, v30, 0x20u);
      }
    }
    else
    {
      if (((1 << v7) & 0x42) != 0)
      {
        int v17 = (void *)MEMORY[0x2533B64D0]();
        v18 = self;
        __int16 v19 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          uint64_t v20 = HMFGetLogIdentifier();
          uint64_t v21 = [(HMMTRFirmwareUpdateStatus *)v18 accessoryServer];
          *(_DWORD *)id v30 = 138543618;
          *(void *)&v30[4] = v20;
          *(_WORD *)&v30[12] = 2112;
          *(void *)&v30[14] = v21;
          _os_log_impl(&dword_252495000, v19, OS_LOG_TYPE_INFO, "%{public}@Stop idle reset timer for accessory server [%@]", v30, 0x16u);
        }
        uint64_t v22 = [(HMMTRFirmwareUpdateStatus *)v18 idleResetTimer];
        [v22 suspend];
        goto LABEL_16;
      }
      int v8 = (void *)MEMORY[0x2533B64D0]();
      id v9 = self;
      int v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        id v11 = HMFGetLogIdentifier();
        __int16 v12 = [(HMMTRFirmwareUpdateStatus *)v9 idleResetTimer];
        [v12 timeInterval];
        uint64_t v28 = v27;
        v15 = [(HMMTRFirmwareUpdateStatus *)v9 accessoryServer];
        *(_DWORD *)id v30 = 138543874;
        *(void *)&v30[4] = v11;
        *(_WORD *)&v30[12] = 2048;
        *(void *)&v30[14] = v28;
        *(_WORD *)&v30[22] = 2112;
        __int16 v31 = v15;
        id v16 = "%{public}@Starting idle reset timer with delay of %f seconds for accessory server [%@]";
        goto LABEL_14;
      }
    }

    uint64_t v22 = [(HMMTRFirmwareUpdateStatus *)v9 idleResetTimer];
    [v22 resume];
LABEL_16:

    goto LABEL_17;
  }
  v23 = (void *)MEMORY[0x2533B64D0]();
  __int16 v24 = self;
  id v25 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    int v26 = HMFGetLogIdentifier();
    *(_DWORD *)id v30 = 138543618;
    *(void *)&v30[4] = v26;
    *(_WORD *)&v30[12] = 1024;
    *(_DWORD *)&v30[14] = [(HMMTRFirmwareUpdateStatus *)v24 otaProviderState];
    _os_log_impl(&dword_252495000, v25, OS_LOG_TYPE_ERROR, "%{public}@Invalid OTA provider state : %d", v30, 0x12u);
  }
LABEL_17:
  __int16 v29 = [(HMMTRFirmwareUpdateStatus *)self accessoryServer];
  objc_msgSend(v29, "handleFirmwareUpdateStatusChange:", -[HMMTRFirmwareUpdateStatus otaProviderState](self, "otaProviderState"));
}

- (void)timerDidFire:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x2533B64D0]();
  int v6 = self;
  unint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = HMFGetLogIdentifier();
    id v9 = [(HMMTRFirmwareUpdateStatus *)v6 accessoryServer];
    int v10 = 138543618;
    id v11 = v8;
    __int16 v12 = 2112;
    uint64_t v13 = v9;
    _os_log_impl(&dword_252495000, v7, OS_LOG_TYPE_INFO, "%{public}@Idle reset timed out for accessory server [%@]", (uint8_t *)&v10, 0x16u);
  }
  if ([(HMMTRFirmwareUpdateStatus *)v6 otaProviderState] != 1) {
    [(HMMTRFirmwareUpdateStatus *)v6 updateFirmwareUpdateStatus:1];
  }
}

- (HMMTRFirmwareUpdateStatus)initWithFirmwareUpdateStatus:(id)a3 accessoryServer:(id)a4 browser:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v24.receiver = self;
  v24.super_class = (Class)HMMTRFirmwareUpdateStatus;
  __int16 v12 = [(HMMTRFirmwareUpdateStatus *)&v24 init];
  uint64_t v13 = v12;
  if (v12)
  {
    objc_storeWeak((id *)&v12->_accessoryServer, v10);
    objc_storeWeak((id *)&v13->_browser, v11);
    objc_storeStrong((id *)&v13->_localFirmwareUpdateStatus, a3);
    downloadedFirmwareVersionNumber = v13->_downloadedFirmwareVersionNumber;
    v13->_downloadedFirmwareVersionNumber = 0;

    v15 = [(HAPMatterFirmwareUpdateStatus *)v13->_localFirmwareUpdateStatus OTAProviderState];
    v13->_otaProviderState = [v15 value];

    id v16 = (const char *)HMFDispatchQueueName();
    int v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v18 = dispatch_get_global_queue(17, 0);
    dispatch_queue_t v19 = dispatch_queue_create_with_target_V2(v16, v17, v18);
    idleResetTimerQueue = v13->_idleResetTimerQueue;
    v13->_idleResetTimerQueue = (OS_dispatch_queue *)v19;

    uint64_t v21 = [objc_alloc(MEMORY[0x263F42658]) initWithTimeInterval:0 options:86400.0];
    idleResetTimer = v13->_idleResetTimer;
    v13->_idleResetTimer = (HMFTimer *)v21;

    [(HMFTimer *)v13->_idleResetTimer setDelegateQueue:v13->_idleResetTimerQueue];
    [(HMFTimer *)v13->_idleResetTimer setDelegate:v13];
  }

  return v13;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t26 != -1) {
    dispatch_once(&logCategory__hmf_once_t26, &__block_literal_global_1343);
  }
  v2 = (void *)logCategory__hmf_once_v27;
  return v2;
}

uint64_t __40__HMMTRFirmwareUpdateStatus_logCategory__block_invoke()
{
  logCategory__hmf_once_uint64_t v27 = HMFCreateOSLogHandle();
  return MEMORY[0x270F9A758]();
}

@end