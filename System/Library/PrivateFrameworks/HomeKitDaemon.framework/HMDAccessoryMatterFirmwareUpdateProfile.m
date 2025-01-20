@interface HMDAccessoryMatterFirmwareUpdateProfile
+ (id)logCategory;
- (HMDAccessoryMatterFirmwareUpdateProfile)initWithAccessory:(id)a3 workQueue:(id)a4;
- (HMDHAPAccessory)accessory;
- (HMDMatterSoftwareUpdateProviderDelegate)matterSoftwareUpdateProviderDelegate;
- (NSNotificationCenter)notificationCenter;
- (NSNumber)matterFirmwareRevisionNumber;
- (NSString)description;
- (OS_dispatch_queue)workQueue;
- (id)characteristics;
- (id)logIdentifier;
- (id)privateDescription;
- (void)__handleAccessoryIsReachable;
- (void)__handleMatterFirmwareRevisionNumberUpdate:(id)a3;
- (void)__handleMatterFirmwareUpdateStatusUpdate:(id)a3;
- (void)_enableCharacteristicsNotifications:(BOOL)a3;
- (void)_handleCharacteristicChanges:(id)a3;
- (void)_processIdleStateWithCharacteristic:(id)a3;
- (void)_registerForNotifications;
- (void)configureWithMatterSoftwareUpdateProviderDelegate:(id)a3;
- (void)dealloc;
- (void)handleAccessoryIsReachable:(id)a3;
- (void)handleCharacteristicValuesChanged:(id)a3;
- (void)handleDisplayableFirmwareVersionUpdatedNotification:(id)a3;
- (void)handleVIDPIDUpdatedNotification:(id)a3;
- (void)readAndProcessCharacteristics:(id)a3 withCompletion:(id)a4;
- (void)readMatterFirmwareUpdateCharacteristics;
- (void)setMatterFirmwareRevisionNumber:(id)a3;
- (void)setMatterSoftwareUpdateProviderDelegate:(id)a3;
@end

@implementation HMDAccessoryMatterFirmwareUpdateProfile

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_matterSoftwareUpdateProviderDelegate);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_accessory);
  objc_storeStrong((id *)&self->_matterFirmwareRevisionNumber, 0);
}

- (void)setMatterSoftwareUpdateProviderDelegate:(id)a3
{
}

- (HMDMatterSoftwareUpdateProviderDelegate)matterSoftwareUpdateProviderDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_matterSoftwareUpdateProviderDelegate);
  return (HMDMatterSoftwareUpdateProviderDelegate *)WeakRetained;
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (HMDHAPAccessory)accessory
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessory);
  return (HMDHAPAccessory *)WeakRetained;
}

- (NSNumber)matterFirmwareRevisionNumber
{
  return self->_matterFirmwareRevisionNumber;
}

- (void)__handleMatterFirmwareUpdateStatusUpdate:(id)a3
{
  uint64_t v75 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)MEMORY[0x230FBD990]();
  v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v66 = v8;
    __int16 v67 = 2112;
    id v68 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling update for %@", buf, 0x16u);
  }
  v9 = [v4 value];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v10 = v9;
  }
  else {
    v10 = 0;
  }
  id v11 = v10;

  id v64 = 0;
  v12 = [MEMORY[0x263F359E0] parsedFromData:v11 error:&v64];
  id v13 = v64;
  if (!v13)
  {
    v19 = [v12 OTAProviderState];

    if (!v19)
    {
      v14 = (void *)MEMORY[0x230FBD990]();
      v15 = v6;
      v16 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        goto LABEL_10;
      }
      v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v66 = v17;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@Missing OTA Provider state in Matter Firmware Update Status TLV", buf, 0xCu);
      goto LABEL_9;
    }
    v20 = [v12 OTAProviderState];
    uint64_t v21 = [v20 value];

    v22 = (void *)MEMORY[0x230FBD990]();
    v23 = v6;
    v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      v25 = HMFGetLogIdentifier();
      v26 = HAPOTAProviderStateAsString();
      *(_DWORD *)buf = 138543618;
      v66 = v25;
      __int16 v67 = 2112;
      id v68 = v26;
      _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_INFO, "%{public}@Matter firmware update state : %@", buf, 0x16u);
    }
    v27 = [(HMDAccessoryMatterFirmwareUpdateProfile *)v23 accessory];
    if (!v27)
    {
      v32 = (void *)MEMORY[0x230FBD990]();
      v33 = v23;
      v34 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        v35 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v66 = v35;
        _os_log_impl(&dword_22F52A000, v34, OS_LOG_TYPE_ERROR, "%{public}@HAP accessory is nil. Cannot handle matter firmware update status characteristic value change", buf, 0xCu);
      }
      goto LABEL_52;
    }
    v28 = [(HMDAccessoryMatterFirmwareUpdateProfile *)v23 matterSoftwareUpdateProviderDelegate];
    v29 = [v27 softwareUpdate];
    if (!v29)
    {
      v36 = (void *)MEMORY[0x230FBD990]();
      v37 = v23;
      v38 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v39 = v56 = v28;
        *(_DWORD *)buf = 138543362;
        v66 = v39;
        _os_log_impl(&dword_22F52A000, v38, OS_LOG_TYPE_INFO, "%{public}@Software update object is nil. Cannot update HMDSoftwareUpdate", buf, 0xCu);

        v28 = v56;
      }

      v29 = 0;
      if (v21 == 6 && v28) {
        [v28 resetOTAProviderStateForHMDHAPAccessory:v27];
      }
      goto LABEL_51;
    }
    v30 = [v27 home];
    if ([v30 isCurrentDevicePrimaryResident])
    {
      if (v21 == 6)
      {
        uint64_t v31 = [v29 updateLocalState:4];
        if (v28)
        {
          [v28 resetOTAProviderStateForHMDHAPAccessory:v27];
          [v29 updateLocalState:4];
LABEL_43:
          [v28 resetOTAProviderStateForHMDHAPAccessory:v27];
        }
        else
        {
          v59 = v30;
          v62 = v29;
          v45 = (void *)MEMORY[0x230FBD990](v31);
          v46 = v23;
          v47 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
          {
            v48 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            v66 = v48;
            _os_log_impl(&dword_22F52A000, v47, OS_LOG_TYPE_INFO, "%{public}@Couldn't get a strong ref to the software update provider delegate", buf, 0xCu);

            v28 = 0;
          }

          v29 = v62;
          uint64_t v49 = [v62 updateLocalState:4];
          v30 = v59;
LABEL_44:
          v60 = v30;
          v63 = v29;
          v50 = (void *)MEMORY[0x230FBD990](v49);
          v51 = v23;
          v52 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v54 = v53 = v28;
            *(_DWORD *)buf = 138543362;
            v66 = v54;
            _os_log_impl(&dword_22F52A000, v52, OS_LOG_TYPE_INFO, "%{public}@Couldn't get a strong ref to the software update provider delegate", buf, 0xCu);

            v28 = v53;
          }

          v30 = v60;
          v29 = v63;
        }
LABEL_50:

LABEL_51:
LABEL_52:

        goto LABEL_53;
      }
      v58 = v30;
      v61 = v29;
      context = (void *)MEMORY[0x230FBD990]();
      v40 = v23;
      v41 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v42 = v57 = v28;
        *(_DWORD *)buf = 138543362;
        v66 = v42;
        _os_log_impl(&dword_22F52A000, v41, OS_LOG_TYPE_INFO, "%{public}@Not updating software update model states on primary resident", buf, 0xCu);

        v28 = v57;
      }

      v30 = v58;
      v29 = v61;
    }
    switch(v21)
    {
      case 0:
        if ([v30 isAutomaticThirdPartyAccessorySoftwareUpdateEnabled]) {
          goto LABEL_35;
        }
        if ([v30 hasAnyResident]) {
          goto LABEL_48;
        }
        v43 = v29;
        uint64_t v44 = 0;
        goto LABEL_49;
      case 1:
        [(HMDAccessoryMatterFirmwareUpdateProfile *)v23 _processIdleStateWithCharacteristic:v4];
        goto LABEL_50;
      case 2:
LABEL_35:
        v43 = v29;
        uint64_t v44 = 2;
        goto LABEL_49;
      case 3:
LABEL_48:
        v43 = v29;
        uint64_t v44 = 5;
        goto LABEL_49;
      case 4:
        v43 = v29;
        uint64_t v44 = 1;
        goto LABEL_49;
      case 5:
        v43 = v29;
        uint64_t v44 = 3;
LABEL_49:
        [v43 updateLocalState:v44];
        break;
      case 6:
        uint64_t v49 = [v29 updateLocalState:4];
        if (v28) {
          goto LABEL_43;
        }
        goto LABEL_44;
      default:
        goto LABEL_50;
    }
    goto LABEL_50;
  }
  v14 = (void *)MEMORY[0x230FBD990]();
  v15 = v6;
  v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    v17 = HMFGetLogIdentifier();
    v18 = [v4 value];
    *(_DWORD *)buf = 138544386;
    v66 = v17;
    __int16 v67 = 2112;
    id v68 = v4;
    __int16 v69 = 2112;
    v70 = v18;
    __int16 v71 = 2112;
    id v72 = v11;
    __int16 v73 = 2112;
    id v74 = v13;
    _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse matter firmware update status (%@) - characteristic %@ value %@ error %@", buf, 0x34u);

LABEL_9:
  }
LABEL_10:

LABEL_53:
}

- (void)__handleMatterFirmwareRevisionNumberUpdate:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)MEMORY[0x230FBD990]();
  v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    int v12 = 138543618;
    id v13 = v8;
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling update for %@", (uint8_t *)&v12, 0x16u);
  }
  v9 = [v4 value];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v10 = v9;
  }
  else {
    v10 = 0;
  }
  id v11 = v10;

  [(HMDAccessoryMatterFirmwareUpdateProfile *)v6 setMatterFirmwareRevisionNumber:v11];
}

- (void)_processIdleStateWithCharacteristic:(id)a3
{
  uint64_t v78 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 previousValue];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    id v67 = 0;
    v8 = [MEMORY[0x263F359E0] parsedFromData:v7 error:&v67];
    id v9 = v67;
    if (v9)
    {
      v10 = (void *)MEMORY[0x230FBD990]();
      id v11 = self;
      int v12 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
LABEL_9:

LABEL_10:

        goto LABEL_14;
      }
      id v13 = HMFGetLogIdentifier();
      __int16 v14 = [v4 previousValue];
      *(_DWORD *)buf = 138544386;
      __int16 v69 = v13;
      __int16 v70 = 2112;
      id v71 = v4;
      __int16 v72 = 2112;
      __int16 v73 = v14;
      __int16 v74 = 2112;
      id v75 = v7;
      __int16 v76 = 2112;
      id v77 = v9;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse matter firmware update status previous value (%@) - characteristic %@ value %@ error %@", buf, 0x34u);

LABEL_8:
      goto LABEL_9;
    }
    v19 = [v8 OTAProviderState];

    if (!v19)
    {
      v10 = (void *)MEMORY[0x230FBD990]();
      id v11 = self;
      int v12 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        goto LABEL_9;
      }
      id v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v69 = v13;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Missing OTA Provider state previous value in Matter Firmware Update Status TLV", buf, 0xCu);
      goto LABEL_8;
    }
    v20 = [v8 OTAProviderState];
    uint64_t v21 = [v20 value];

    v22 = (void *)MEMORY[0x230FBD990]();
    v23 = self;
    v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      v25 = HMFGetLogIdentifier();
      v26 = HAPOTAProviderStateAsString();
      *(_DWORD *)buf = 138543618;
      __int16 v69 = v25;
      __int16 v70 = 2112;
      id v71 = v26;
      _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_INFO, "%{public}@Matter firmware update state previous value : %@", buf, 0x16u);
    }
    if (v21 == 1 || v21 == 6) {
      goto LABEL_10;
    }
    v27 = [(HMDAccessoryMatterFirmwareUpdateProfile *)v23 accessory];
    v28 = v27;
    if (!v27)
    {
      v40 = (void *)MEMORY[0x230FBD990]();
      v41 = v23;
      v42 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        v43 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        __int16 v69 = v43;
        _os_log_impl(&dword_22F52A000, v42, OS_LOG_TYPE_ERROR, "%{public}@HAP accessory is nil. Cannot process initial state from accessory", buf, 0xCu);
      }
      goto LABEL_46;
    }
    v29 = [v27 home];
    v30 = [v29 homeManager];
    uint64_t v31 = [v30 accessoryFirmwareUpdateManager];

    if ([v29 isCurrentDevicePrimaryResident]
      && [v29 isAutomaticThirdPartyAccessorySoftwareUpdateEnabled])
    {
      v32 = [v31 sessionForAccessory:v28];
      v65 = v31;
      if (!v32)
      {
        v33 = (void *)MEMORY[0x230FBD990]();
        v34 = v23;
        v35 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v36 = contexta = v33;
          *(_DWORD *)buf = 138543362;
          __int16 v69 = v36;
          _os_log_impl(&dword_22F52A000, v35, OS_LOG_TYPE_INFO, "%{public}@No active firmware update session, attempting to create one", buf, 0xCu);

          v33 = contexta;
        }

        uint64_t v31 = v65;
        v32 = [v65 registerAndCreateSessionForAccessory:v28 updateUARPParameters:1];
        if (!v32)
        {
          v57 = (void *)MEMORY[0x230FBD990]();
          v58 = v34;
          v59 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
          {
            v60 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            __int16 v69 = v60;
            _os_log_impl(&dword_22F52A000, v59, OS_LOG_TYPE_ERROR, "%{public}@Failed to register and create a firmware update session", buf, 0xCu);

            uint64_t v31 = v65;
          }

          goto LABEL_45;
        }
      }
      if ([v32 isMatterFirmwareUpdateRetryAllowed])
      {
        uint64_t v37 = [(HMDAccessoryMatterFirmwareUpdateProfile *)v23 matterSoftwareUpdateProviderDelegate];
        if (!v37)
        {
          v53 = (void *)MEMORY[0x230FBD990]();
          v54 = v23;
          v55 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v56 = contextc = v53;
            *(_DWORD *)buf = 138543362;
            __int16 v69 = v56;
            _os_log_impl(&dword_22F52A000, v55, OS_LOG_TYPE_ERROR, "%{public}@Couldn't get a strong ref to the software update provider delegate", buf, 0xCu);

            v53 = contextc;
          }

          uint64_t v31 = v65;
          goto LABEL_45;
        }
        v38 = (void *)v37;
        [v32 incrementMatterFirmwareUpdateRetryCount];
        [v38 notifyUpdateRequestedForHMDHAPAccessory:v28 isUserTriggered:0];
      }
      else
      {
        uint64_t v49 = (void *)MEMORY[0x230FBD990]();
        v50 = v23;
        v51 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v52 = contextb = v49;
          *(_DWORD *)buf = 138543362;
          __int16 v69 = v52;
          _os_log_impl(&dword_22F52A000, v51, OS_LOG_TYPE_INFO, "%{public}@Maximum matter firmware update retries reached", buf, 0xCu);

          uint64_t v49 = contextb;
        }

        uint64_t v31 = v65;
      }
LABEL_44:

LABEL_45:
LABEL_46:

      goto LABEL_10;
    }
    v39 = [v28 softwareUpdate];
    v32 = v39;
    if (v39)
    {
      if ([v39 state])
      {
        [v32 updateLocalState:0];
        goto LABEL_44;
      }
      v66 = v31;
      context = (void *)MEMORY[0x230FBD990]();
      v48 = v23;
      v45 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
      {
        v46 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        __int16 v69 = v46;
        v47 = "%{public}@Software update state is available, no action needed";
        goto LABEL_42;
      }
    }
    else
    {
      v66 = v31;
      context = (void *)MEMORY[0x230FBD990]();
      uint64_t v44 = v23;
      v45 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
      {
        v46 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        __int16 v69 = v46;
        v47 = "%{public}@Software update object is nil. Cannot process idle state from accessory";
LABEL_42:
        _os_log_impl(&dword_22F52A000, v45, OS_LOG_TYPE_INFO, v47, buf, 0xCu);
      }
    }
    uint64_t v31 = v66;

    goto LABEL_44;
  }
  id v15 = (void *)MEMORY[0x230FBD990]();
  uint64_t v16 = self;
  v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    v18 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    __int16 v69 = v18;
    _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@Not processing idle state as previous value is nil", buf, 0xCu);
  }
LABEL_14:
}

- (void)_handleCharacteristicChanges:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v10 = [v9 type];
        int v11 = [v10 isEqualToString:@"0000026D-0000-1000-8000-0026BB765291"];

        if (v11)
        {
          [(HMDAccessoryMatterFirmwareUpdateProfile *)self __handleMatterFirmwareRevisionNumberUpdate:v9];
        }
        else
        {
          int v12 = [v9 type];
          int v13 = [v12 isEqualToString:@"0000026E-0000-1000-8000-0026BB765291"];

          if (v13) {
            [(HMDAccessoryMatterFirmwareUpdateProfile *)self __handleMatterFirmwareUpdateStatusUpdate:v9];
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
}

- (void)handleCharacteristicValuesChanged:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HMDAccessoryMatterFirmwareUpdateProfile *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __77__HMDAccessoryMatterFirmwareUpdateProfile_handleCharacteristicValuesChanged___block_invoke;
  v7[3] = &unk_264A2F820;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __77__HMDAccessoryMatterFirmwareUpdateProfile_handleCharacteristicValuesChanged___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) userInfo];
  v3 = objc_msgSend(v2, "hmf_arrayForKey:", @"kModifiedCharacteristicsKey");

  if ([v3 count])
  {
    id v4 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v3, "count"));
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v14 = v3;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v16;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = *(void **)(*((void *)&v15 + 1) + 8 * v9);
          int v11 = [*(id *)(a1 + 40) accessory];
          int v12 = [v10 accessory];
          int v13 = HMFEqualObjects();

          if (v13) {
            [v4 addObject:v10];
          }
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v7);
    }

    [*(id *)(a1 + 40) _handleCharacteristicChanges:v4];
    v3 = v14;
  }
}

- (id)characteristics
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v3 = [(HMDAccessoryMatterFirmwareUpdateProfile *)self accessory];
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v5 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"0000026D-0000-1000-8000-0026BB765291", 0);
    uint64_t v6 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"0000026E-0000-1000-8000-0026BB765291", 0);
    uint64_t v7 = [v3 findCharacteristicsByTypes:v6 forServiceType:@"00000236-0000-1000-8000-0026BB765291"];
    [v4 addObjectsFromArray:v7];

    uint64_t v8 = [v3 findCharacteristicsByTypes:v5 forServiceType:@"0000003E-0000-1000-8000-0026BB765291"];
    [v4 addObjectsFromArray:v8];
  }
  else
  {
    uint64_t v9 = (void *)MEMORY[0x230FBD990]();
    v10 = self;
    int v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      long long v15 = v12;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@HAP accessory is nil", buf, 0xCu);
    }
    id v4 = 0;
  }

  return v4;
}

- (void)readMatterFirmwareUpdateCharacteristics
{
  id v3 = [(HMDAccessoryMatterFirmwareUpdateProfile *)self characteristics];
  [(HMDAccessoryMatterFirmwareUpdateProfile *)self readAndProcessCharacteristics:v3 withCompletion:&__block_literal_global_44_29627];
}

- (void)readAndProcessCharacteristics:(id)a3 withCompletion:(id)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = (void (**)(void))a4;
  uint64_t v8 = [(HMDAccessoryMatterFirmwareUpdateProfile *)self accessory];
  uint64_t v9 = v8;
  if (v8 && [v8 supportsCHIP])
  {
    BOOL v10 = [v6 count] == 0;
    int v11 = (void *)MEMORY[0x230FBD990]();
    val = self;
    int v12 = HMFGetOSLogHandle();
    int v13 = v12;
    if (v10)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        v24 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v36 = v24;
        _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_DEBUG, "%{public}@No characteristics to read and process", buf, 0xCu);
      }
      v7[2](v7);
    }
    else
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        long long v14 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v36 = v14;
        __int16 v37 = 2112;
        id v38 = v6;
        _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Reading characteristics: %@", buf, 0x16u);
      }
      long long v15 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v6, "count"));
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v16 = v6;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v17)
      {
        uint64_t v18 = *(void *)v31;
        do
        {
          uint64_t v19 = 0;
          do
          {
            if (*(void *)v31 != v18) {
              objc_enumerationMutation(v16);
            }
            uint64_t v20 = +[HMDCharacteristicRequest requestWithCharacteristic:](HMDCharacteristicRequest, "requestWithCharacteristic:", *(void *)(*((void *)&v30 + 1) + 8 * v19), val);
            [v15 addObject:v20];

            ++v19;
          }
          while (v17 != v19);
          uint64_t v17 = [v16 countByEnumeratingWithState:&v30 objects:v34 count:16];
        }
        while (v17);
      }

      objc_initWeak((id *)buf, val);
      uint64_t v21 = [v9 home];
      v22 = (void *)[v15 copy];
      v26[0] = MEMORY[0x263EF8330];
      v26[1] = 3221225472;
      v26[2] = __88__HMDAccessoryMatterFirmwareUpdateProfile_readAndProcessCharacteristics_withCompletion___block_invoke;
      v26[3] = &unk_264A2B560;
      objc_copyWeak(&v29, (id *)buf);
      v28 = v7;
      id v23 = v15;
      id v27 = v23;
      [v21 readCharacteristicValues:v22 source:7 qualityOfService:-1 withCompletionHandler:v26];

      objc_destroyWeak(&v29);
      objc_destroyWeak((id *)buf);
    }
  }
}

void __88__HMDAccessoryMatterFirmwareUpdateProfile_readAndProcessCharacteristics_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  long long v33 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v7 = WeakRetained;
  if (WeakRetained)
  {
    v34 = WeakRetained;
    uint64_t v8 = v5;
    if (v5)
    {
      *(void *)uint64_t v49 = 0;
      *(void *)&v49[8] = v49;
      *(void *)&v49[16] = 0x3032000000;
      v50 = __Block_byref_object_copy__29633;
      v51 = __Block_byref_object_dispose__29634;
      uint64_t v32 = a1;
      objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
      id v52 = (id)objc_claimAutoreleasedReturnValue();
      long long v40 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      id obj = *(id *)(a1 + 32);
      uint64_t v9 = [obj countByEnumeratingWithState:&v40 objects:v48 count:16];
      if (v9)
      {
        uint64_t v10 = *(void *)v41;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v41 != v10) {
              objc_enumerationMutation(obj);
            }
            int v12 = *(void **)(*((void *)&v40 + 1) + 8 * i);
            int v13 = [v12 characteristic];
            id v39 = 0;
            long long v14 = objc_msgSend(v8, "hmd_valueOfCharacteristic:error:", v13, &v39);
            id v15 = v39;

            if (v14)
            {
              id v16 = *(void **)(*(void *)&v49[8] + 40);
              uint64_t v17 = [v12 characteristic];
              [v16 addObject:v17];
            }
            else
            {
              uint64_t v18 = (void *)MEMORY[0x230FBD990]();
              id v19 = v34;
              HMFGetOSLogHandle();
              uint64_t v20 = (id)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                id v21 = (id)objc_claimAutoreleasedReturnValue();
                v22 = [v12 characteristic];
                *(_DWORD *)buf = 138543618;
                id v45 = v21;
                __int16 v46 = 2112;
                v47 = v22;
                _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_INFO, "%{public}@Read failed for %@", buf, 0x16u);
              }
            }
          }
          uint64_t v9 = [obj countByEnumeratingWithState:&v40 objects:v48 count:16];
        }
        while (v9);
      }

      id v23 = [v34 workQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __88__HMDAccessoryMatterFirmwareUpdateProfile_readAndProcessCharacteristics_withCompletion___block_invoke_41;
      block[3] = &unk_264A287B0;
      block[4] = v34;
      id v38 = v49;
      id v37 = *(id *)(v32 + 40);
      dispatch_async(v23, block);

      _Block_object_dispose(v49, 8);
    }
    else
    {
      uint64_t v26 = a1;
      id v27 = (void *)MEMORY[0x230FBD990]();
      id v28 = v7;
      id v29 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        long long v30 = HMFGetLogIdentifier();
        uint64_t v31 = *(void *)(v26 + 32);
        *(_DWORD *)uint64_t v49 = 138543874;
        *(void *)&v49[4] = v30;
        *(_WORD *)&v49[12] = 2112;
        *(void *)&v49[14] = v31;
        *(_WORD *)&v49[22] = 2112;
        v50 = v33;
        _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_ERROR, "%{public}@Read of characteristics %@ failed with error %@", v49, 0x20u);
      }
      (*(void (**)(void))(*(void *)(v26 + 40) + 16))();
    }
    uint64_t v7 = v34;
  }
  else
  {
    uint64_t v8 = v5;
    v24 = _Block_copy(*(const void **)(a1 + 40));
    v25 = v24;
    if (v24) {
      (*((void (**)(void *))v24 + 2))(v24);
    }
  }
}

uint64_t __88__HMDAccessoryMatterFirmwareUpdateProfile_readAndProcessCharacteristics_withCompletion___block_invoke_41(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    int v10 = 138543618;
    int v11 = v5;
    __int16 v12 = 2112;
    uint64_t v13 = v6;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Read succeeded for %@", (uint8_t *)&v10, 0x16u);
  }
  uint64_t v7 = *(void **)(a1 + 32);
  uint64_t v8 = (void *)[*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) copy];
  [v7 _handleCharacteristicChanges:v8];

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)__handleAccessoryIsReachable
{
}

- (void)handleDisplayableFirmwareVersionUpdatedNotification:(id)a3
{
  id v4 = [(HMDAccessoryMatterFirmwareUpdateProfile *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __95__HMDAccessoryMatterFirmwareUpdateProfile_handleDisplayableFirmwareVersionUpdatedNotification___block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __95__HMDAccessoryMatterFirmwareUpdateProfile_handleDisplayableFirmwareVersionUpdatedNotification___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    int v7 = 138543362;
    uint64_t v8 = v5;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Matter firmware version string updated", (uint8_t *)&v7, 0xCu);
  }
  return objc_msgSend(*(id *)(a1 + 32), "__handleAccessoryIsReachable");
}

- (void)handleVIDPIDUpdatedNotification:(id)a3
{
  id v4 = [(HMDAccessoryMatterFirmwareUpdateProfile *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __75__HMDAccessoryMatterFirmwareUpdateProfile_handleVIDPIDUpdatedNotification___block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __75__HMDAccessoryMatterFirmwareUpdateProfile_handleVIDPIDUpdatedNotification___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    int v7 = 138543362;
    uint64_t v8 = v5;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@VID/PID updated", (uint8_t *)&v7, 0xCu);
  }
  return objc_msgSend(*(id *)(a1 + 32), "__handleAccessoryIsReachable");
}

- (void)handleAccessoryIsReachable:(id)a3
{
  id v4 = [(HMDAccessoryMatterFirmwareUpdateProfile *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __70__HMDAccessoryMatterFirmwareUpdateProfile_handleAccessoryIsReachable___block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(v4, block);
}

void __70__HMDAccessoryMatterFirmwareUpdateProfile_handleAccessoryIsReachable___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    int v16 = 138543362;
    uint64_t v17 = v5;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Accessory is now reachable", (uint8_t *)&v16, 0xCu);
  }
  uint64_t v6 = [*(id *)(a1 + 32) accessory];
  int v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 home];
    uint64_t v9 = [v8 homeManager];
    int v10 = [v9 accessoryFirmwareUpdateManager];
    id v11 = (id)[v10 registerAndCreateSessionForAccessory:v7 updateUARPParameters:1];

    objc_msgSend(*(id *)(a1 + 32), "__handleAccessoryIsReachable");
  }
  else
  {
    __int16 v12 = (void *)MEMORY[0x230FBD990]();
    id v13 = *(id *)(a1 + 32);
    uint64_t v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v15 = HMFGetLogIdentifier();
      int v16 = 138543362;
      uint64_t v17 = v15;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, "%{public}@HAP accessory is nil", (uint8_t *)&v16, 0xCu);
    }
  }
}

- (void)_enableCharacteristicsNotifications:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(HMDAccessoryMatterFirmwareUpdateProfile *)self accessory];
  uint64_t v6 = [(HMDAccessoryMatterFirmwareUpdateProfile *)self characteristics];
  [v5 setNotificationsEnabled:1 forCharacteristics:v6 clientIdentifier:@"com.apple.HomeKitDaemon.accessoryMatterFirmwareUpdate"];

  if (v3)
  {
    id v7 = [(HMDAccessoryMatterFirmwareUpdateProfile *)self characteristics];
    [(HMDAccessoryMatterFirmwareUpdateProfile *)self readAndProcessCharacteristics:v7 withCompletion:&__block_literal_global_38];
  }
}

- (void)_registerForNotifications
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  BOOL v3 = [(HMDAccessoryMatterFirmwareUpdateProfile *)self accessory];
  if (v3)
  {
    id v4 = [(HMDAccessoryMatterFirmwareUpdateProfile *)self notificationCenter];
    [v4 addObserver:self selector:sel_handleCharacteristicValuesChanged_ name:@"HMDAccessoryCharacteristicsChangedNotification" object:v3];

    id v5 = [(HMDAccessoryMatterFirmwareUpdateProfile *)self notificationCenter];
    [v5 addObserver:self selector:sel_handleAccessoryIsReachable_ name:@"HMDAccessoryIsReachableNotification" object:v3];

    uint64_t v6 = [(HMDAccessoryMatterFirmwareUpdateProfile *)self notificationCenter];
    [v6 addObserver:self selector:sel_handleVIDPIDUpdatedNotification_ name:@"HMDAccessoryVendorIDProductIDUpdatedNotification" object:v3];

    id v7 = [(HMDAccessoryMatterFirmwareUpdateProfile *)self notificationCenter];
    [v7 addObserver:self selector:sel_handleDisplayableFirmwareVersionUpdatedNotification_ name:@"HMDAccessoryFirmwareDisplayableVersionUpdatedNotification" object:v3];

    uint64_t v8 = (void *)MEMORY[0x230FBD990]([(HMDAccessoryMatterFirmwareUpdateProfile *)self _enableCharacteristicsNotifications:1]);
    uint64_t v9 = self;
    int v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      int v16 = 138543362;
      uint64_t v17 = v11;
      __int16 v12 = "%{public}@Registered for Matter firmware update notifications";
      id v13 = v10;
      os_log_type_t v14 = OS_LOG_TYPE_INFO;
LABEL_6:
      _os_log_impl(&dword_22F52A000, v13, v14, v12, (uint8_t *)&v16, 0xCu);
    }
  }
  else
  {
    uint64_t v8 = (void *)MEMORY[0x230FBD990]();
    id v15 = self;
    int v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      int v16 = 138543362;
      uint64_t v17 = v11;
      __int16 v12 = "%{public}@Not registering for notifications as accessory is nil";
      id v13 = v10;
      os_log_type_t v14 = OS_LOG_TYPE_ERROR;
      goto LABEL_6;
    }
  }
}

- (void)configureWithMatterSoftwareUpdateProviderDelegate:(id)a3
{
}

- (void)setMatterFirmwareRevisionNumber:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = v5;
  if (v5)
  {
    p_matterFirmwareRevisionNumber = (id *)&self->_matterFirmwareRevisionNumber;
    if (!self->_matterFirmwareRevisionNumber || (objc_msgSend(v5, "isEqualToNumber:") & 1) == 0)
    {
      uint64_t v8 = (void *)MEMORY[0x230FBD990]();
      uint64_t v9 = self;
      int v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        id v11 = HMFGetLogIdentifier();
        id v12 = *p_matterFirmwareRevisionNumber;
        int v19 = 138543874;
        uint64_t v20 = v11;
        __int16 v21 = 2112;
        id v22 = v12;
        __int16 v23 = 2112;
        v24 = v6;
        _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Updating Matter firmware revision number from %@ to %@", (uint8_t *)&v19, 0x20u);
      }
      objc_storeStrong(p_matterFirmwareRevisionNumber, a3);
      id v13 = [(HMDAccessoryMatterFirmwareUpdateProfile *)v9 notificationCenter];
      os_log_type_t v14 = [(HMDAccessoryMatterFirmwareUpdateProfile *)v9 accessory];
      [v13 postNotificationName:@"HMDAccessoryFirmwareUpdateMatterFirmwareRevisionNumberChangedNotification" object:v14 userInfo:0];
    }
  }
  else
  {
    id v15 = (void *)MEMORY[0x230FBD990]();
    int v16 = self;
    uint64_t v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = HMFGetLogIdentifier();
      int v19 = 138543362;
      uint64_t v20 = v18;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_ERROR, "%{public}@Not setting matter firmware revision number to nil", (uint8_t *)&v19, 0xCu);
    }
  }
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)[MEMORY[0x263F08A00] defaultCenter];
}

- (HMDAccessoryMatterFirmwareUpdateProfile)initWithAccessory:(id)a3 workQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDAccessoryMatterFirmwareUpdateProfile;
  uint64_t v8 = [(HMDAccessoryMatterFirmwareUpdateProfile *)&v12 init];
  uint64_t v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_accessory, v6);
    objc_storeStrong((id *)&v9->_workQueue, a4);
    matterFirmwareRevisionNumber = v9->_matterFirmwareRevisionNumber;
    v9->_matterFirmwareRevisionNumber = 0;
  }
  return v9;
}

- (void)dealloc
{
  BOOL v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)HMDAccessoryMatterFirmwareUpdateProfile;
  [(HMDAccessoryMatterFirmwareUpdateProfile *)&v4 dealloc];
}

- (id)logIdentifier
{
  v2 = [(HMDAccessoryMatterFirmwareUpdateProfile *)self accessory];
  BOOL v3 = [v2 logIdentifier];

  return v3;
}

- (id)privateDescription
{
  BOOL v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(HMDAccessoryMatterFirmwareUpdateProfile *)self accessory];
  id v6 = [v5 uuid];
  id v7 = [v6 UUIDString];
  uint64_t v8 = [v3 stringWithFormat:@"<%@ %@>", v4, v7];

  return v8;
}

- (NSString)description
{
  v2 = [(HMDAccessoryMatterFirmwareUpdateProfile *)self accessory];
  BOOL v3 = NSString;
  uint64_t v4 = [v2 name];
  id v5 = [v2 uniqueIdentifier];
  id v6 = [v3 stringWithFormat:@"Matter Firmware Update Profile %@, %@", v4, v5];

  return (NSString *)v6;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_29668 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_29668, &__block_literal_global_29669);
  }
  v2 = (void *)logCategory__hmf_once_v1_29670;
  return v2;
}

void __54__HMDAccessoryMatterFirmwareUpdateProfile_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v1_29670;
  logCategory__hmf_once_v1_29670 = v0;
}

@end