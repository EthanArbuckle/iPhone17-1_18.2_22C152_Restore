@interface HMDMatterSoftwareUpdateProviderDelegate
+ (id)logCategory;
- (BOOL)canEstablishConnectionForHMDHAPAccessory:(id)a3;
- (BOOL)updateUARPFirmwareVersionForAccessory:(id)a3 version:(id)a4;
- (HMDAccessoryFirmwareUpdateManager)accessoryFirmwareUpdateManager;
- (HMDHomeManager)homeManager;
- (HMDMatterSoftwareUpdateProviderDelegate)initWithHomeManager:(id)a3 accessoryFirmwareUpdateManager:(id)a4;
- (HMDMatterSoftwareUpdateProviderDelegate)initWithHomeManager:(id)a3 accessoryFirmwareUpdateManager:(id)a4 dataSource:(id)a5;
- (HMDMatterSoftwareUpdateProviderDelegateDataSource)dataSource;
- (HMMTRSoftwareUpdateProvider)softwareUpdateProvider;
- (id)_accessoryWithPairing:(id)a3;
- (id)_queryImageResponseWithStatus:(id)a3 delayedActionTime:(id)a4;
- (void)applyUpdateWithPairing:(id)a3 requestParams:(id)a4 queue:(id)a5 completionHandler:(id)a6;
- (void)configureWithSoftwareUpdateProvider:(id)a3;
- (void)notifyCheckFirmwareUpdateSessionWithPairing:(id)a3 queue:(id)a4 completionHandler:(id)a5;
- (void)notifyUpdateRequestedForHMDHAPAccessory:(id)a3 isUserTriggered:(BOOL)a4;
- (void)notifyUpdateWithPairing:(id)a3 params:(id)a4 queue:(id)a5 completionHandler:(id)a6;
- (void)queryImageWithPairing:(id)a3 requestParams:(id)a4 queue:(id)a5 completionHandler:(id)a6;
- (void)resetOTAProviderStateForHMDHAPAccessory:(id)a3;
- (void)setAccessoryFirmwareUpdateManager:(id)a3;
- (void)setHomeManager:(id)a3;
- (void)setSoftwareUpdateProvider:(id)a3;
@end

@implementation HMDMatterSoftwareUpdateProviderDelegate

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_softwareUpdateProvider);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_destroyWeak((id *)&self->_accessoryFirmwareUpdateManager);
  objc_destroyWeak((id *)&self->_homeManager);
}

- (void)setSoftwareUpdateProvider:(id)a3
{
}

- (HMMTRSoftwareUpdateProvider)softwareUpdateProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_softwareUpdateProvider);
  return (HMMTRSoftwareUpdateProvider *)WeakRetained;
}

- (HMDMatterSoftwareUpdateProviderDelegateDataSource)dataSource
{
  return (HMDMatterSoftwareUpdateProviderDelegateDataSource *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAccessoryFirmwareUpdateManager:(id)a3
{
}

- (HMDAccessoryFirmwareUpdateManager)accessoryFirmwareUpdateManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessoryFirmwareUpdateManager);
  return (HMDAccessoryFirmwareUpdateManager *)WeakRetained;
}

- (void)setHomeManager:(id)a3
{
}

- (HMDHomeManager)homeManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_homeManager);
  return (HMDHomeManager *)WeakRetained;
}

- (id)_accessoryWithPairing:(id)a3
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  id v54 = a3;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  v4 = [(HMDMatterSoftwareUpdateProviderDelegate *)self homeManager];
  v5 = [v4 homes];

  id obj = v5;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v63 objects:v69 count:16];
  if (!v6)
  {
    id v34 = 0;
    goto LABEL_34;
  }
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)v64;
  do
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v64 != v8) {
        objc_enumerationMutation(obj);
      }
      v10 = *(void **)(*((void *)&v63 + 1) + 8 * i);
      v11 = [v10 matterFabricID];
      v12 = [v54 fabricID];
      int v13 = [v11 isEqualToNumber:v12];

      if (v13)
      {
        long long v61 = 0u;
        long long v62 = 0u;
        long long v59 = 0u;
        long long v60 = 0u;
        v14 = [v10 hapAccessories];
        uint64_t v40 = [v14 countByEnumeratingWithState:&v59 objects:v68 count:16];
        if (!v40) {
          goto LABEL_29;
        }
        uint64_t v15 = *(void *)v60;
        uint64_t v38 = v7;
        uint64_t v39 = v8;
        uint64_t v36 = *(void *)v60;
        uint64_t v37 = i;
        v48 = v11;
        v43 = v14;
        while (1)
        {
          uint64_t v16 = 0;
          do
          {
            if (*(void *)v60 != v15) {
              objc_enumerationMutation(v14);
            }
            v17 = *(void **)(*((void *)&v59 + 1) + 8 * v16);
            long long v55 = 0u;
            long long v56 = 0u;
            long long v57 = 0u;
            long long v58 = 0u;
            uint64_t v41 = v16;
            v42 = v17;
            v18 = [v17 chipStorage];
            v19 = [v18 pairings];

            id v53 = v19;
            uint64_t v20 = [v19 countByEnumeratingWithState:&v55 objects:v67 count:16];
            if (v20)
            {
              uint64_t v21 = v20;
              uint64_t v22 = *(void *)v56;
              uint64_t v51 = *(void *)v56;
              do
              {
                uint64_t v23 = 0;
                uint64_t v52 = v21;
                do
                {
                  if (*(void *)v56 != v22) {
                    objc_enumerationMutation(v53);
                  }
                  v24 = *(void **)(*((void *)&v55 + 1) + 8 * v23);
                  v25 = [v54 nodeID];
                  v26 = [v24 chipPluginPairing];
                  v27 = [v26 nodeID];
                  if (![v25 isEqualToNumber:v27]) {
                    goto LABEL_24;
                  }
                  v28 = [v54 fabricID];
                  v29 = [v24 chipPluginPairing];
                  v30 = [v29 fabricID];
                  if (![v28 isEqualToNumber:v30]) {
                    goto LABEL_23;
                  }
                  v31 = [v54 rootPublicKey];
                  v49 = [v24 chipPluginPairing];
                  v32 = [v49 rootPublicKey];
                  v50 = v31;
                  if (![v31 isEqualToData:v32])
                  {

                    v11 = v48;
LABEL_23:

                    uint64_t v22 = v51;
                    uint64_t v21 = v52;
LABEL_24:

                    goto LABEL_25;
                  }
                  v45 = [v54 vendorID];
                  v46 = [v24 chipPluginPairing];
                  v33 = [v46 vendorID];
                  char v47 = [v45 isEqualToNumber:v33];

                  v11 = v48;
                  uint64_t v22 = v51;
                  uint64_t v21 = v52;
                  if (v47)
                  {
                    id v34 = v42;

                    goto LABEL_34;
                  }
LABEL_25:
                  ++v23;
                }
                while (v21 != v23);
                uint64_t v21 = [v53 countByEnumeratingWithState:&v55 objects:v67 count:16];
              }
              while (v21);
            }

            uint64_t v16 = v41 + 1;
            uint64_t v7 = v38;
            uint64_t v8 = v39;
            uint64_t v15 = v36;
            uint64_t i = v37;
            v14 = v43;
          }
          while (v41 + 1 != v40);
          uint64_t v40 = [v43 countByEnumeratingWithState:&v59 objects:v68 count:16];
          if (!v40)
          {
LABEL_29:

            break;
          }
        }
      }
    }
    uint64_t v7 = [obj countByEnumeratingWithState:&v63 objects:v69 count:16];
    id v34 = 0;
  }
  while (v7);
LABEL_34:

  return v34;
}

- (void)resetOTAProviderStateForHMDHAPAccessory:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)MEMORY[0x230FBD990]();
  uint64_t v6 = self;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    v9 = [v4 shortDescription];
    int v23 = 138543874;
    v24 = v8;
    __int16 v25 = 2112;
    v26 = v9;
    __int16 v27 = 2112;
    id v28 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@%@ Resetting OTA provider state for %@", (uint8_t *)&v23, 0x20u);
  }
  if ([v4 supportsCHIP])
  {
    v10 = [(HMDMatterSoftwareUpdateProviderDelegate *)v6 softwareUpdateProvider];
    if (v10)
    {
      v11 = [v4 chipStorage];
      v12 = [v11 nodeID];
      [v10 updateOTAProviderStateForNodeID:v12 otaProviderState:1];
    }
    else
    {
      v18 = (void *)MEMORY[0x230FBD990]();
      v19 = v6;
      uint64_t v20 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        uint64_t v21 = HMFGetLogIdentifier();
        uint64_t v22 = [v4 shortDescription];
        int v23 = 138543618;
        v24 = v21;
        __int16 v25 = 2112;
        v26 = v22;
        _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_ERROR, "%{public}@%@ Couldn't get a strong ref to the software update provider", (uint8_t *)&v23, 0x16u);
      }
    }
  }
  else
  {
    int v13 = (void *)MEMORY[0x230FBD990]();
    v14 = v6;
    uint64_t v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = HMFGetLogIdentifier();
      v17 = [v4 shortDescription];
      int v23 = 138543618;
      v24 = v16;
      __int16 v25 = 2112;
      v26 = v17;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@%@ Not a matter accessory", (uint8_t *)&v23, 0x16u);
    }
  }
}

- (BOOL)canEstablishConnectionForHMDHAPAccessory:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)MEMORY[0x230FBD990]();
  uint64_t v6 = self;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    v9 = [v4 shortDescription];
    int v25 = 138543618;
    v26 = v8;
    __int16 v27 = 2112;
    id v28 = v9;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@%@ canEstablishConnectionForHMDHAPAccessory", (uint8_t *)&v25, 0x16u);
  }
  if ([v4 supportsCHIP])
  {
    v10 = [(HMDMatterSoftwareUpdateProviderDelegate *)v6 softwareUpdateProvider];
    if (v10)
    {
      v11 = [v4 chipStorage];
      v12 = [v11 nodeID];
      char v13 = [v10 canEstablishConnectionForNodeID:v12];
    }
    else
    {
      v19 = (void *)MEMORY[0x230FBD990]();
      uint64_t v20 = v6;
      uint64_t v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        uint64_t v22 = HMFGetLogIdentifier();
        int v23 = [v4 shortDescription];
        int v25 = 138543618;
        v26 = v22;
        __int16 v27 = 2112;
        id v28 = v23;
        _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_ERROR, "%{public}@%@ Couldn't get a strong ref to the software update provider", (uint8_t *)&v25, 0x16u);
      }
      char v13 = 0;
    }
  }
  else
  {
    v14 = (void *)MEMORY[0x230FBD990]();
    uint64_t v15 = v6;
    uint64_t v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = HMFGetLogIdentifier();
      v18 = [v4 shortDescription];
      int v25 = 138543618;
      v26 = v17;
      __int16 v27 = 2112;
      id v28 = v18;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@%@ Not a matter accessory", (uint8_t *)&v25, 0x16u);
    }
    char v13 = 0;
  }

  return v13;
}

- (void)notifyUpdateRequestedForHMDHAPAccessory:(id)a3 isUserTriggered:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = (void *)MEMORY[0x230FBD990]();
  uint64_t v8 = self;
  v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = HMFGetLogIdentifier();
    v11 = [v6 shortDescription];
    v12 = HMFBooleanToString();
    int v30 = 138543874;
    v31 = v10;
    __int16 v32 = 2112;
    v33 = v11;
    __int16 v34 = 2112;
    v35 = v12;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@%@ notifyUpdateRequestedForHMDHAPAccessory, isUserTriggered: %@", (uint8_t *)&v30, 0x20u);
  }
  if ([v6 supportsCHIP])
  {
    char v13 = [(HMDMatterSoftwareUpdateProviderDelegate *)v8 softwareUpdateProvider];
    if (v13)
    {
      v14 = [v6 firmwareUpdateProfile];
      uint64_t v15 = [v14 matterFirmwareUpdateProfile];

      if (v15)
      {
        uint64_t v16 = [v6 firmwareUpdateProfile];
        v17 = [v16 matterFirmwareUpdateProfile];
        [v17 configureWithMatterSoftwareUpdateProviderDelegate:v8];
      }
      v18 = [v6 chipStorage];
      v19 = [v18 nodeID];
      [v13 notifyUpdateRequestedForNodeID:v19 isUserTriggered:v4];
    }
    else
    {
      int v25 = (void *)MEMORY[0x230FBD990]();
      v26 = v8;
      __int16 v27 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        id v28 = HMFGetLogIdentifier();
        uint64_t v29 = [v6 shortDescription];
        int v30 = 138543618;
        v31 = v28;
        __int16 v32 = 2112;
        v33 = v29;
        _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_ERROR, "%{public}@%@ Couldn't get a strong ref to the software update provider", (uint8_t *)&v30, 0x16u);
      }
    }
  }
  else
  {
    uint64_t v20 = (void *)MEMORY[0x230FBD990]();
    uint64_t v21 = v8;
    uint64_t v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      int v23 = HMFGetLogIdentifier();
      v24 = [v6 shortDescription];
      int v30 = 138543618;
      v31 = v23;
      __int16 v32 = 2112;
      v33 = v24;
      _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, "%{public}@%@ Not a matter accessory", (uint8_t *)&v30, 0x16u);
    }
  }
}

- (void)queryImageWithPairing:(id)a3 requestParams:(id)a4 queue:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __103__HMDMatterSoftwareUpdateProviderDelegate_queryImageWithPairing_requestParams_queue_completionHandler___block_invoke;
  v16[3] = &unk_264A2EE30;
  v16[4] = self;
  id v17 = v10;
  id v18 = v11;
  id v19 = v12;
  id v13 = v11;
  id v14 = v12;
  id v15 = v10;
  dispatch_async((dispatch_queue_t)a5, v16);
}

void __103__HMDMatterSoftwareUpdateProviderDelegate_queryImageWithPairing_requestParams_queue_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v122 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) _accessoryWithPairing:*(void *)(a1 + 40)];
  if (v2)
  {
    v3 = [*(id *)(a1 + 32) accessoryFirmwareUpdateManager];
    if (v3)
    {
      BOOL v4 = v3;
      id v5 = (id)[v3 registerAndCreateSessionForAccessory:v2 updateUARPParameters:1];
      id v6 = [*(id *)(a1 + 48) protocolsSupported];
      char v7 = [v6 containsObject:&unk_26E473678];

      if (v7)
      {
        uint64_t v8 = *(void **)(a1 + 32);
        v9 = [*(id *)(a1 + 48) softwareVersion];
        LODWORD(v8) = [v8 updateUARPFirmwareVersionForAccessory:v2 version:v9];

        if (v8)
        {
          id v10 = (void *)MEMORY[0x230FBD990]();
          id v11 = *(id *)(a1 + 32);
          id v12 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            id v13 = HMFGetLogIdentifier();
            id v14 = [v2 shortDescription];
            *(_DWORD *)buf = 138543874;
            v115 = v13;
            __int16 v116 = 2112;
            v117 = v14;
            __int16 v118 = 2048;
            uint64_t v119 = 0x405E000000000000;
            _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@%@ Version has changed, request accessory to check back in %f secs", buf, 0x20u);
          }
          uint64_t v15 = *(void *)(a1 + 56);
          id v16 = [*(id *)(a1 + 32) _queryImageResponseWithStatus:&unk_26E473690 delayedActionTime:&unk_26E474748];
          (*(void (**)(uint64_t, id, void))(v15 + 16))(v15, v16, 0);
          goto LABEL_46;
        }
        id v113 = 0;
        uint64_t v37 = [v4 availableSoftwareAssetForMatterAccessory:v2 error:&v113];
        id v16 = v113;
        switch([v16 code])
        {
          case 1:
          case 4:
            uint64_t v38 = *(void *)(a1 + 56);
            uint64_t v39 = *(void **)(a1 + 32);
            uint64_t v40 = &unk_26E473660;
            uint64_t v41 = 0;
            goto LABEL_23;
          case 2:
            v42 = (void *)MEMORY[0x230FBD990]();
            id v43 = *(id *)(a1 + 32);
            v44 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
            {
              v45 = HMFGetLogIdentifier();
              v46 = [v2 shortDescription];
              *(_DWORD *)buf = 138543874;
              v115 = v45;
              __int16 v116 = 2112;
              v117 = v46;
              __int16 v118 = 2048;
              uint64_t v119 = 0x405E000000000000;
              _os_log_impl(&dword_22F52A000, v44, OS_LOG_TYPE_INFO, "%{public}@%@ Software image is busy downloading. Request accessory to check back in %f secs", buf, 0x20u);
            }
            uint64_t v38 = *(void *)(a1 + 56);
            uint64_t v39 = *(void **)(a1 + 32);
            uint64_t v40 = &unk_26E473690;
            uint64_t v41 = &unk_26E474748;
LABEL_23:
            char v47 = [v39 _queryImageResponseWithStatus:v40 delayedActionTime:v41];
            (*(void (**)(uint64_t, void *, void))(v38 + 16))(v38, v47, 0);
            goto LABEL_45;
          case 3:
            v48 = (void *)MEMORY[0x230FBD990]();
            id v49 = *(id *)(a1 + 32);
            v50 = HMFGetOSLogHandle();
            uint64_t v51 = v50;
            if (!v37)
            {
              if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
              {
                v74 = HMFGetLogIdentifier();
                v75 = [v2 shortDescription];
                *(_DWORD *)buf = 138543874;
                v115 = v74;
                __int16 v116 = 2112;
                v117 = v75;
                __int16 v118 = 2112;
                uint64_t v119 = (uint64_t)v16;
                _os_log_impl(&dword_22F52A000, v51, OS_LOG_TYPE_ERROR, "%{public}@%@ Received nil asset ID even though status is OnLocalStorage, Error:%@", buf, 0x20u);
              }
              if (!v16)
              {
                id v16 = [MEMORY[0x263F087E8] hmfErrorWithCode:11];
              }
LABEL_44:
              uint64_t v76 = *(void *)(a1 + 56);
              char v47 = [*(id *)(a1 + 32) _queryImageResponseWithStatus:&unk_26E473660 delayedActionTime:0];
              (*(void (**)(uint64_t, void *, id))(v76 + 16))(v76, v47, v16);
              goto LABEL_45;
            }
            if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
            {
              uint64_t v52 = HMFGetLogIdentifier();
              id v53 = [v2 shortDescription];
              *(_DWORD *)buf = 138543874;
              v115 = v52;
              __int16 v116 = 2112;
              v117 = v53;
              __int16 v118 = 2112;
              uint64_t v119 = (uint64_t)v37;
              _os_log_impl(&dword_22F52A000, v51, OS_LOG_TYPE_INFO, "%{public}@%@ A software image is available for accessory with asset = %@", buf, 0x20u);
            }
LABEL_28:
            v112 = v37;
            id v54 = (void *)MEMORY[0x230FBD990]();
            id v55 = *(id *)(a1 + 32);
            long long v56 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
            {
              long long v57 = HMFGetLogIdentifier();
              long long v58 = [*(id *)(a1 + 48) softwareVersion];
              long long v59 = [v37 assetVersionNumber];
              *(_DWORD *)buf = 138543874;
              v115 = v57;
              __int16 v116 = 2112;
              v117 = v58;
              __int16 v118 = 2112;
              uint64_t v119 = (uint64_t)v59;
              _os_log_impl(&dword_22F52A000, v56, OS_LOG_TYPE_INFO, "%{public}@Accessory software version: %@. Software update version: %@", buf, 0x20u);
            }
            long long v60 = [v2 home];
            int v61 = [v60 isAutomaticThirdPartyAccessorySoftwareUpdateEnabled];

            if (v61)
            {
              long long v62 = (void *)MEMORY[0x230FBD990]();
              id v63 = *(id *)(a1 + 32);
              long long v64 = HMFGetOSLogHandle();
              int v65 = 1;
              if (!os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
              {
LABEL_48:

                v77 = [v112 assetVersionNumber];
                unint64_t v78 = [v77 unsignedLongValue];
                v79 = [*(id *)(a1 + 48) softwareVersion];
                unint64_t v80 = [v79 unsignedLongValue];

                if (v78 <= v80)
                {
                  v95 = (void *)MEMORY[0x230FBD990]();
                  id v96 = *(id *)(a1 + 32);
                  v97 = HMFGetOSLogHandle();
                  if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
                  {
                    v98 = HMFGetLogIdentifier();
                    [v2 shortDescription];
                    v99 = v111 = v95;
                    v100 = [*(id *)(a1 + 48) softwareVersion];
                    v101 = [v112 assetVersionNumber];
                    *(_DWORD *)buf = 138544130;
                    v115 = v98;
                    __int16 v116 = 2112;
                    v117 = v99;
                    __int16 v118 = 2112;
                    uint64_t v119 = (uint64_t)v100;
                    __int16 v120 = 2112;
                    v121 = v101;
                    _os_log_impl(&dword_22F52A000, v97, OS_LOG_TYPE_ERROR, "%{public}@%@ Accessory software version (%@) is already at latest available version (%@).", buf, 0x2Au);

                    v95 = v111;
                  }

                  uint64_t v102 = *(void *)(a1 + 56);
                  v103 = *(void **)(a1 + 32);
                  v104 = &unk_26E473660;
                  v105 = 0;
                }
                else
                {
                  if (v65)
                  {
LABEL_54:
                    uint64_t v89 = v65 ^ 1u;
                    uint64_t v110 = *(void *)(a1 + 56);
                    id v109 = objc_alloc(MEMORY[0x263F49830]);
                    char v47 = [v112 localURL];
                    v108 = [v47 path];
                    v90 = [v112 assetVersionNumber];
                    v91 = [v112 assetVersion];
                    [&unk_26E473648 unsignedIntValue];
                    v92 = HMFRandomDataWithLength();
                    v93 = [NSNumber numberWithBool:v89];
                    v94 = (void *)[v109 initWithStatus:&unk_26E473678 delayedActionTime:&unk_26E474738 imageURI:v108 softwareVersion:v90 softwareVersionString:v91 updateToken:v92 userConsentNeeded:v93 metadataForRequestor:0];
                    (*(void (**)(uint64_t, void *, void))(v110 + 16))(v110, v94, 0);

                    uint64_t v37 = v112;
                    goto LABEL_45;
                  }
                  v81 = [*(id *)(a1 + 48) requestorCanConsent];
                  char v82 = [v81 BOOLValue];

                  v83 = (void *)MEMORY[0x230FBD990]();
                  id v84 = *(id *)(a1 + 32);
                  v85 = HMFGetOSLogHandle();
                  BOOL v86 = os_log_type_enabled(v85, OS_LOG_TYPE_INFO);
                  if (v82)
                  {
                    if (v86)
                    {
                      v87 = HMFGetLogIdentifier();
                      v88 = [v2 shortDescription];
                      *(_DWORD *)buf = 138543618;
                      v115 = v87;
                      __int16 v116 = 2112;
                      v117 = v88;
                      _os_log_impl(&dword_22F52A000, v85, OS_LOG_TYPE_INFO, "%{public}@%@ User has not consented yet but requestor can consent. Delegating consent to requestor", buf, 0x16u);
                    }
                    goto LABEL_54;
                  }
                  if (v86)
                  {
                    v106 = HMFGetLogIdentifier();
                    v107 = [v2 shortDescription];
                    *(_DWORD *)buf = 138543874;
                    v115 = v106;
                    __int16 v116 = 2112;
                    v117 = v107;
                    __int16 v118 = 2048;
                    uint64_t v119 = 0x405E000000000000;
                    _os_log_impl(&dword_22F52A000, v85, OS_LOG_TYPE_INFO, "%{public}@%@ User has not consented to firmware update and requestor cannot consent. Request accessory to check back in %f secs", buf, 0x20u);
                  }
                  uint64_t v102 = *(void *)(a1 + 56);
                  v103 = *(void **)(a1 + 32);
                  v104 = &unk_26E473690;
                  v105 = &unk_26E474748;
                }
                char v47 = [v103 _queryImageResponseWithStatus:v104 delayedActionTime:v105];
                (*(void (**)(uint64_t, void *, void))(v102 + 16))(v102, v47, 0);
                uint64_t v37 = v112;
LABEL_45:

                goto LABEL_46;
              }
              long long v66 = HMFGetLogIdentifier();
              v67 = [v2 shortDescription];
              *(_DWORD *)buf = 138543618;
              v115 = v66;
              __int16 v116 = 2112;
              v117 = v67;
              v68 = "%{public}@%@ Automatic third party accessory software update is enabled, granting consent.";
            }
            else
            {
              v69 = [v2 softwareUpdate];
              uint64_t v70 = [v69 state];

              long long v62 = (void *)MEMORY[0x230FBD990]();
              id v63 = *(id *)(a1 + 32);
              long long v64 = HMFGetOSLogHandle();
              BOOL v71 = os_log_type_enabled(v64, OS_LOG_TYPE_INFO);
              if (v70 != 5)
              {
                if (v71)
                {
                  v72 = HMFGetLogIdentifier();
                  v73 = [v2 shortDescription];
                  *(_DWORD *)buf = 138543618;
                  v115 = v72;
                  __int16 v116 = 2112;
                  v117 = v73;
                  _os_log_impl(&dword_22F52A000, v64, OS_LOG_TYPE_INFO, "%{public}@%@ User consent pending.", buf, 0x16u);
                }
                int v65 = 0;
                goto LABEL_48;
              }
              if (!v71)
              {
                int v65 = 1;
                goto LABEL_48;
              }
              long long v66 = HMFGetLogIdentifier();
              v67 = [v2 shortDescription];
              *(_DWORD *)buf = 138543618;
              v115 = v66;
              __int16 v116 = 2112;
              v117 = v67;
              v68 = "%{public}@%@ User requested update for this accessory, granting consent.";
              int v65 = 1;
            }
            _os_log_impl(&dword_22F52A000, v64, OS_LOG_TYPE_INFO, v68, buf, 0x16u);

            goto LABEL_48;
          case 5:
            goto LABEL_44;
          default:
            goto LABEL_28;
        }
      }
      uint64_t v29 = (void *)MEMORY[0x230FBD990]();
      id v30 = *(id *)(a1 + 32);
      v31 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        __int16 v32 = HMFGetLogIdentifier();
        v33 = [v2 shortDescription];
        __int16 v34 = [*(id *)(a1 + 48) protocolsSupported];
        *(_DWORD *)buf = 138543874;
        v115 = v32;
        __int16 v116 = 2112;
        v117 = v33;
        __int16 v118 = 2112;
        uint64_t v119 = (uint64_t)v34;
        _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_ERROR, "%{public}@%@ Transfer protocols not supported in request: %@", buf, 0x20u);
      }
      uint64_t v35 = *(void *)(a1 + 56);
      id v16 = [*(id *)(a1 + 32) _queryImageResponseWithStatus:&unk_26E4736A8 delayedActionTime:0];
      uint64_t v36 = [MEMORY[0x263F087E8] hmfErrorWithCode:5];
      (*(void (**)(uint64_t, id, void *))(v35 + 16))(v35, v16, v36);
    }
    else
    {
      int v23 = (void *)MEMORY[0x230FBD990]();
      id v24 = *(id *)(a1 + 32);
      int v25 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v26 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v115 = v26;
        _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_ERROR, "%{public}@Unexpected, firmware update manager not found", buf, 0xCu);
      }
      uint64_t v27 = *(void *)(a1 + 56);
      id v16 = [*(id *)(a1 + 32) _queryImageResponseWithStatus:&unk_26E473660 delayedActionTime:0];
      id v28 = [MEMORY[0x263F087E8] hmfErrorWithCode:2];
      (*(void (**)(uint64_t, id, void *))(v27 + 16))(v27, v16, v28);

      BOOL v4 = 0;
    }
  }
  else
  {
    id v17 = (void *)MEMORY[0x230FBD990]();
    id v18 = *(id *)(a1 + 32);
    id v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = HMFGetLogIdentifier();
      uint64_t v21 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v115 = v20;
      __int16 v116 = 2112;
      v117 = v21;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@Cannot proceed with software update. Accessory not found for pairing : %@", buf, 0x16u);
    }
    uint64_t v22 = *(void *)(a1 + 56);
    BOOL v4 = [*(id *)(a1 + 32) _queryImageResponseWithStatus:&unk_26E473660 delayedActionTime:0];
    id v16 = [MEMORY[0x263F087E8] hmfErrorWithCode:2];
    (*(void (**)(uint64_t, void *, id))(v22 + 16))(v22, v4, v16);
  }
LABEL_46:
}

- (BOOL)updateUARPFirmwareVersionForAccessory:(id)a3 version:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMDMatterSoftwareUpdateProviderDelegate *)self accessoryFirmwareUpdateManager];
  v9 = [v8 UARPAccessoryForHMDAccessory:v6];
  id v10 = [v7 stringValue];
  uint64_t v11 = [v9 firmwareVersion];
  if (v11
    && (id v12 = (void *)v11,
        [v9 firmwareVersion],
        id v13 = objc_claimAutoreleasedReturnValue(),
        char v14 = [v13 isEqualToString:v10],
        v13,
        v12,
        (v14 & 1) != 0))
  {
    BOOL v15 = 0;
  }
  else
  {
    id v16 = (void *)MEMORY[0x230FBD990]();
    id v17 = self;
    id v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      id v19 = HMFGetLogIdentifier();
      uint64_t v20 = [v6 shortDescription];
      [v9 firmwareVersion];
      uint64_t v21 = v23 = v16;
      *(_DWORD *)buf = 138544130;
      int v25 = v19;
      __int16 v26 = 2112;
      uint64_t v27 = v20;
      __int16 v28 = 2112;
      uint64_t v29 = v21;
      __int16 v30 = 2112;
      v31 = v10;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@%@ Firmware version from uarpAccessory (%@) doesn't match accessory version (%@)", buf, 0x2Au);

      id v16 = v23;
    }

    BOOL v15 = 1;
  }

  return v15;
}

- (id)_queryImageResponseWithStatus:(id)a3 delayedActionTime:(id)a4
{
  id v5 = (objc_class *)MEMORY[0x263F49830];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = (void *)[[v5 alloc] initWithStatus:v7 delayedActionTime:v6 imageURI:0 softwareVersion:0 softwareVersionString:0 updateToken:0 userConsentNeeded:0 metadataForRequestor:0];

  return v8;
}

- (void)notifyCheckFirmwareUpdateSessionWithPairing:(id)a3 queue:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __111__HMDMatterSoftwareUpdateProviderDelegate_notifyCheckFirmwareUpdateSessionWithPairing_queue_completionHandler___block_invoke;
  block[3] = &unk_264A2EE80;
  block[4] = self;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  dispatch_async((dispatch_queue_t)a4, block);
}

void __111__HMDMatterSoftwareUpdateProviderDelegate_notifyCheckFirmwareUpdateSessionWithPairing_queue_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) _accessoryWithPairing:*(void *)(a1 + 40)];
  if (!v2)
  {
    id v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      uint64_t v11 = *(void *)(a1 + 40);
      int v19 = 138543618;
      uint64_t v20 = v10;
      __int16 v21 = 2112;
      uint64_t v22 = v11;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@Accessory not found for pairing : %@", (uint8_t *)&v19, 0x16u);
    }
    uint64_t v12 = *(void *)(a1 + 48);
    BOOL v4 = [MEMORY[0x263F087E8] hmfErrorWithCode:2];
    id v6 = *(void (**)(void))(v12 + 16);
    goto LABEL_7;
  }
  v3 = [*(id *)(a1 + 32) accessoryFirmwareUpdateManager];
  if (v3)
  {
    BOOL v4 = v3;
    id v5 = (id)[v3 registerAndCreateSessionForAccessory:v2 updateUARPParameters:1];
    id v6 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
LABEL_7:
    v6();
    goto LABEL_11;
  }
  id v13 = (void *)MEMORY[0x230FBD990]();
  id v14 = *(id *)(a1 + 32);
  BOOL v15 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    id v16 = HMFGetLogIdentifier();
    int v19 = 138543362;
    uint64_t v20 = v16;
    _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@Unexpected, firmware update manager not found", (uint8_t *)&v19, 0xCu);
  }
  uint64_t v17 = *(void *)(a1 + 48);
  id v18 = [MEMORY[0x263F087E8] hmfErrorWithCode:2];
  (*(void (**)(uint64_t, void *))(v17 + 16))(v17, v18);

  BOOL v4 = 0;
LABEL_11:
}

- (void)notifyUpdateWithPairing:(id)a3 params:(id)a4 queue:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __98__HMDMatterSoftwareUpdateProviderDelegate_notifyUpdateWithPairing_params_queue_completionHandler___block_invoke;
  v16[3] = &unk_264A2EE30;
  v16[4] = self;
  id v17 = v10;
  id v18 = v11;
  id v19 = v12;
  id v13 = v11;
  id v14 = v12;
  id v15 = v10;
  dispatch_async((dispatch_queue_t)a5, v16);
}

void __98__HMDMatterSoftwareUpdateProviderDelegate_notifyUpdateWithPairing_params_queue_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) _accessoryWithPairing:*(void *)(a1 + 40)];
  v3 = v2;
  if (!v2)
  {
    id v13 = (void *)MEMORY[0x230FBD990]();
    id v14 = *(id *)(a1 + 32);
    id v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v16 = HMFGetLogIdentifier();
      id v17 = *(void **)(a1 + 40);
      int v36 = 138543618;
      uint64_t v37 = v16;
      __int16 v38 = 2112;
      uint64_t v39 = v17;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@Accessory not found for pairing : %@", (uint8_t *)&v36, 0x16u);
    }
    uint64_t v18 = *(void *)(a1 + 56);
    id v19 = (void *)MEMORY[0x263F087E8];
    uint64_t v20 = 2;
    goto LABEL_13;
  }
  if (([v2 supportsCHIP] & 1) == 0)
  {
    __int16 v21 = (void *)MEMORY[0x230FBD990]();
    id v22 = *(id *)(a1 + 32);
    uint64_t v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      id v24 = HMFGetLogIdentifier();
      int v25 = [v3 shortDescription];
      int v36 = 138543618;
      uint64_t v37 = v24;
      __int16 v38 = 2112;
      uint64_t v39 = v25;
      _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_ERROR, "%{public}@%@ Accessory has updated software image, but Accessory does not support Matter", (uint8_t *)&v36, 0x16u);
    }
    uint64_t v18 = *(void *)(a1 + 56);
    id v19 = (void *)MEMORY[0x263F087E8];
    uint64_t v20 = 5;
LABEL_13:
    id v12 = [v19 hmfErrorWithCode:v20];
    (*(void (**)(uint64_t, void *))(v18 + 16))(v18, v12);
    goto LABEL_18;
  }
  BOOL v4 = [*(id *)(a1 + 48) didTimeout];
  int v5 = [v4 isEqualToNumber:&unk_26E473690];

  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = *(id *)(a1 + 32);
  id v8 = HMFGetOSLogHandle();
  id v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      id v11 = [v3 shortDescription];
      int v36 = 138543618;
      uint64_t v37 = v10;
      __int16 v38 = 2112;
      uint64_t v39 = v11;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@%@ Accessory update timed out", (uint8_t *)&v36, 0x16u);
    }
    id v12 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F41FD8] code:13 userInfo:0];
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      __int16 v26 = HMFGetLogIdentifier();
      uint64_t v27 = [v3 shortDescription];
      __int16 v28 = [*(id *)(a1 + 48) softwareVersion];
      int v36 = 138543874;
      uint64_t v37 = v26;
      __int16 v38 = 2112;
      uint64_t v39 = v27;
      __int16 v40 = 2112;
      uint64_t v41 = v28;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@%@ Accessory has updated software image. New version: %@", (uint8_t *)&v36, 0x20u);
    }
    id v12 = 0;
  }
  uint64_t v29 = [HMDMatterSoftwareUpdateEndEvent alloc];
  __int16 v30 = [*(id *)(a1 + 48) linkTypeForMetrics];
  v31 = [*(id *)(a1 + 48) previousSoftwareVersionNumberForMetrics];
  uint64_t v32 = [*(id *)(a1 + 48) softwareVersion];
  v33 = [(HMDMatterSoftwareUpdateEndEvent *)v29 initWithAccessory:v3 linkType:v30 accessorySoftwareVersionNumber:v31 updateSoftwareVersionNumber:v32 error:v12];

  __int16 v34 = [v3 home];
  uint64_t v35 = [v34 logEventSubmitter];
  [v35 submitLogEvent:v33];

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
LABEL_18:
}

- (void)applyUpdateWithPairing:(id)a3 requestParams:(id)a4 queue:(id)a5 completionHandler:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __104__HMDMatterSoftwareUpdateProviderDelegate_applyUpdateWithPairing_requestParams_queue_completionHandler___block_invoke;
  block[3] = &unk_264A2EE80;
  block[4] = self;
  id v14 = v9;
  id v15 = v10;
  id v11 = v10;
  id v12 = v9;
  dispatch_async((dispatch_queue_t)a5, block);
}

void __104__HMDMatterSoftwareUpdateProviderDelegate_applyUpdateWithPairing_requestParams_queue_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) _accessoryWithPairing:*(void *)(a1 + 40)];
  v3 = (void *)MEMORY[0x230FBD990]();
  id v4 = *(id *)(a1 + 32);
  int v5 = HMFGetOSLogHandle();
  id v6 = v5;
  if (v2)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v7 = HMFGetLogIdentifier();
      id v8 = [v2 shortDescription];
      int v15 = 138543618;
      id v16 = v7;
      __int16 v17 = 2112;
      uint64_t v18 = v8;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@%@ Inform accessory to proceed with applying the software image", (uint8_t *)&v15, 0x16u);
    }
    uint64_t v9 = *(void *)(a1 + 48);
    id v10 = (void *)[objc_alloc(MEMORY[0x263F49828]) initWithAction:&unk_26E473678 delayedActionTime:&unk_26E474738];
    (*(void (**)(uint64_t, void *, void))(v9 + 16))(v9, v10, 0);
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      id v12 = *(void **)(a1 + 40);
      int v15 = 138543618;
      id v16 = v11;
      __int16 v17 = 2112;
      uint64_t v18 = v12;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_ERROR, "%{public}@Accessory should not proceed with applying the software image. Accessory not found for pairing : %@", (uint8_t *)&v15, 0x16u);
    }
    uint64_t v13 = *(void *)(a1 + 48);
    id v10 = (void *)[objc_alloc(MEMORY[0x263F49828]) initWithAction:&unk_26E473660 delayedActionTime:&unk_26E474738];
    id v14 = [MEMORY[0x263F087E8] hmfErrorWithCode:2];
    (*(void (**)(uint64_t, void *, void *))(v13 + 16))(v13, v10, v14);
  }
}

- (void)configureWithSoftwareUpdateProvider:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = [(HMDMatterSoftwareUpdateProviderDelegate *)self dataSource];
  char v6 = [v5 isMatterAccessorySoftwareUpdateEnabled];

  id v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = self;
  uint64_t v9 = HMFGetOSLogHandle();
  id v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      int v13 = 138543362;
      id v14 = v11;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Configuring with matter software update provider", (uint8_t *)&v13, 0xCu);
    }
    [v4 setDelegate:v8];
    [(HMDMatterSoftwareUpdateProviderDelegate *)v8 setSoftwareUpdateProvider:v4];
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v12 = HMFGetLogIdentifier();
      int v13 = 138543618;
      id v14 = v12;
      __int16 v15 = 2080;
      id v16 = "-[HMDMatterSoftwareUpdateProviderDelegate configureWithSoftwareUpdateProvider:]";
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@%s: Matter Accessory Software Update not enabled.", (uint8_t *)&v13, 0x16u);
    }
  }
}

- (HMDMatterSoftwareUpdateProviderDelegate)initWithHomeManager:(id)a3 accessoryFirmwareUpdateManager:(id)a4 dataSource:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HMDMatterSoftwareUpdateProviderDelegate;
  id v11 = [(HMDMatterSoftwareUpdateProviderDelegate *)&v14 init];
  id v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_homeManager, v8);
    objc_storeWeak((id *)&v12->_accessoryFirmwareUpdateManager, v9);
    objc_storeStrong((id *)&v12->_dataSource, a5);
  }

  return v12;
}

- (HMDMatterSoftwareUpdateProviderDelegate)initWithHomeManager:(id)a3 accessoryFirmwareUpdateManager:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(HMDMatterSoftwareUpdateProviderDelegateDataSource);
  id v9 = [(HMDMatterSoftwareUpdateProviderDelegate *)self initWithHomeManager:v7 accessoryFirmwareUpdateManager:v6 dataSource:v8];

  return v9;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t34_233534 != -1) {
    dispatch_once(&logCategory__hmf_once_t34_233534, &__block_literal_global_233535);
  }
  v2 = (void *)logCategory__hmf_once_v35_233536;
  return v2;
}

void __54__HMDMatterSoftwareUpdateProviderDelegate_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v35_233536;
  logCategory__hmf_once_v35_233536 = v0;
}

@end