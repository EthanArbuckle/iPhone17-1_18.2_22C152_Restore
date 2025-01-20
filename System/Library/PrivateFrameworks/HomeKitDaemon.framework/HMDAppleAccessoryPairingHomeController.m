@interface HMDAppleAccessoryPairingHomeController
+ (id)logCategory;
- (BOOL)handleMessage:(id)a3 from:(id)a4;
- (HMBLocalZone)localZone;
- (HMDAppleAccessoryPairingControllerDataSource)dataSource;
- (HMDAppleAccessoryPairingHomeController)initWithState:(id)a3 homeManager:(id)a4 dataSource:(id)a5;
- (HMDAppleAccessoryPairingHomeState)state;
- (HMDHomeManager)homeManager;
- (HMFFuture)queryFuture;
- (HMFTimer)upgradeCheckTimer;
- (id)localZone:(id)a3 didProcessModelCreation:(id)a4;
- (id)localZone:(id)a3 didProcessModelDeletion:(id)a4;
- (id)localZone:(id)a3 didProcessModelUpdate:(id)a4;
- (id)logIdentifier;
- (id)workContext;
- (unint64_t)suppressedQueries;
- (void)_handleDeviceNotification:(id)a3;
- (void)checkDeviceVersionAndSendUpgrade;
- (void)cleanupLegacyZone;
- (void)postNotificationOfDeviceUpdated;
- (void)postSoftwareUpdateEventForDescriptor:(id)a3;
- (void)postSoftwareUpdateEventForSoftwareUpdate:(id)a3;
- (void)processHMDAppleMediaAccessoryModel:(id)a3;
- (void)processHMDResidentDeviceModel:(id)a3;
- (void)setQueryFuture:(id)a3;
- (void)setSuppressedQueries:(unint64_t)a3;
- (void)startWithLocalZone:(id)a3;
- (void)timerDidFire:(id)a3;
@end

@implementation HMDAppleAccessoryPairingHomeController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryFuture, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_upgradeCheckTimer, 0);
  objc_storeStrong((id *)&self->_homeManager, 0);
  objc_storeStrong((id *)&self->_localZone, 0);
}

- (void)setSuppressedQueries:(unint64_t)a3
{
  self->_suppressedQueries = a3;
}

- (unint64_t)suppressedQueries
{
  return self->_suppressedQueries;
}

- (void)setQueryFuture:(id)a3
{
}

- (HMFFuture)queryFuture
{
  return self->_queryFuture;
}

- (HMDAppleAccessoryPairingControllerDataSource)dataSource
{
  return self->_dataSource;
}

- (HMDAppleAccessoryPairingHomeState)state
{
  return self->_state;
}

- (HMFTimer)upgradeCheckTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 24, 1);
}

- (HMDHomeManager)homeManager
{
  return (HMDHomeManager *)objc_getProperty(self, a2, 16, 1);
}

- (HMBLocalZone)localZone
{
  return (HMBLocalZone *)objc_getProperty(self, a2, 8, 1);
}

- (id)logIdentifier
{
  v2 = [(HMDAppleAccessoryPairingHomeController *)self state];
  v3 = [v2 accessory];
  v4 = [v3 uuid];
  v5 = [v4 UUIDString];

  return v5;
}

- (void)processHMDAppleMediaAccessoryModel:(id)a3
{
  uint64_t v77 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 deviceUUID];
  if (v5)
  {
  }
  else
  {
    v14 = [v4 device];

    if (v14)
    {
      v15 = (void *)MEMORY[0x230FBD990]();
      v16 = self;
      v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = HMFGetLogIdentifier();
        int v71 = 138543618;
        v72 = v18;
        __int16 v73 = 2112;
        id v74 = v4;
        _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@Accessory model does not yet have a device identifier: %@", (uint8_t *)&v71, 0x16u);
      }
      goto LABEL_46;
    }
  }
  v6 = [(HMDAppleAccessoryPairingHomeController *)self state];
  v7 = [v6 deviceIdentifier];

  if (v7)
  {
    v8 = (void *)MEMORY[0x230FBD990]();
    v9 = self;
    v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = HMFGetLogIdentifier();
      v12 = [(HMDAppleAccessoryPairingHomeController *)v9 state];
      v13 = [v12 deviceIdentifier];
      int v71 = 138543874;
      v72 = v11;
      __int16 v73 = 2112;
      id v74 = v13;
      __int16 v75 = 2112;
      id v76 = v4;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Already have a device identifier %@ for %@", (uint8_t *)&v71, 0x20u);
    }
  }
  else
  {
    v19 = [v4 device];
    v20 = [v19 identifier];
    v21 = [v20 UUIDString];
    v22 = v21;
    if (v21)
    {
      id v23 = v21;
    }
    else
    {
      id v23 = [v4 deviceUUID];
    }
    v24 = v23;

    v25 = (void *)MEMORY[0x230FBD990]();
    v26 = self;
    v27 = HMFGetOSLogHandle();
    BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
    if (v24)
    {
      if (v28)
      {
        v29 = HMFGetLogIdentifier();
        v30 = [(HMDAppleAccessoryPairingHomeController *)v26 state];
        v31 = [v30 accessory];
        v32 = [v31 uuid];
        int v71 = 138543874;
        v72 = v29;
        __int16 v73 = 2112;
        id v74 = v32;
        __int16 v75 = 2112;
        id v76 = v24;
        _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@Looks like deviceIdentifier for %@ is: %@", (uint8_t *)&v71, 0x20u);
      }
      v33 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v24];
      v34 = [(HMDAppleAccessoryPairingHomeController *)v26 state];
      [v34 setDeviceIdentifier:v33];

      v35 = [(HMDAppleAccessoryPairingHomeController *)v26 dataSource];
      v36 = [(HMDAppleAccessoryPairingHomeController *)v26 state];
      [v35 updatePairingAccessoryState:v36];
    }
    else
    {
      if (v28)
      {
        v37 = HMFGetLogIdentifier();
        int v71 = 138543618;
        v72 = v37;
        __int16 v73 = 2112;
        id v74 = v4;
        _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@Still don't have a device identifier for %@", (uint8_t *)&v71, 0x16u);
      }
    }
  }
  v38 = [(HMDAppleAccessoryPairingHomeController *)self state];
  v39 = [v38 device];

  if (v39)
  {
    v40 = (void *)MEMORY[0x230FBD990]();
    v41 = self;
    v42 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      v43 = HMFGetLogIdentifier();
      v44 = [(HMDAppleAccessoryPairingHomeController *)v41 state];
      v45 = [v44 device];
      int v71 = 138543874;
      v72 = v43;
      __int16 v73 = 2112;
      id v74 = v45;
      __int16 v75 = 2112;
      id v76 = v4;
      _os_log_impl(&dword_22F52A000, v42, OS_LOG_TYPE_DEFAULT, "%{public}@Already have a device %@ for %@", (uint8_t *)&v71, 0x20u);
    }
  }
  else
  {
    v46 = [v4 device];
    if (v46)
    {
      v47 = (void *)MEMORY[0x230FBD990]();
      v48 = self;
      v49 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        v50 = HMFGetLogIdentifier();
        int v71 = 138543618;
        v72 = v50;
        __int16 v73 = 2112;
        id v74 = v46;
        _os_log_impl(&dword_22F52A000, v49, OS_LOG_TYPE_DEFAULT, "%{public}@And we have a device representation: %@", (uint8_t *)&v71, 0x16u);
      }
      v51 = [(HMDAppleAccessoryPairingHomeController *)v48 state];
      [v51 setDevice:v46];

      v52 = [(HMDAppleAccessoryPairingHomeController *)v48 dataSource];
      v53 = [(HMDAppleAccessoryPairingHomeController *)v48 state];
      [v52 updatePairingAccessoryState:v53];
    }
  }
  v54 = [(HMDAppleAccessoryPairingHomeController *)self state];
  uint64_t v55 = [v54 device];
  if (v55)
  {
    v56 = (void *)v55;

LABEL_34:
    v57 = [(HMDAppleAccessoryPairingHomeController *)self dataSource];
    v58 = [v57 hh1ControllerIdentity];

    v59 = (void *)MEMORY[0x230FBD990]();
    v60 = self;
    v61 = HMFGetOSLogHandle();
    v62 = v61;
    if (v58)
    {
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
      {
        v63 = HMFGetLogIdentifier();
        int v71 = 138543874;
        v72 = v63;
        __int16 v73 = 2112;
        id v74 = v56;
        __int16 v75 = 2112;
        id v76 = v58;
        _os_log_impl(&dword_22F52A000, v62, OS_LOG_TYPE_DEFAULT, "%{public}@Updated pairing identity for device %@: %@", (uint8_t *)&v71, 0x20u);
      }
      v64 = +[HMDIdentityRegistry sharedRegistry];
      [v64 registerIdentity:v58 device:v56 object:v60];
    }
    else
    {
      if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
      {
        v65 = HMFGetLogIdentifier();
        int v71 = 138543362;
        v72 = v65;
        _os_log_impl(&dword_22F52A000, v62, OS_LOG_TYPE_ERROR, "%{public}@No Pairing Identity. This will cause issues.", (uint8_t *)&v71, 0xCu);
      }
    }

    goto LABEL_42;
  }
  v56 = [v4 device];

  if (v56) {
    goto LABEL_34;
  }
LABEL_42:
  v66 = [(HMDAppleAccessoryPairingHomeController *)self state];
  v67 = [v66 device];
  if (v67)
  {

LABEL_45:
    v70 = [(HMDAppleAccessoryPairingHomeController *)self upgradeCheckTimer];
    [v70 fire];

    goto LABEL_46;
  }
  v68 = [(HMDAppleAccessoryPairingHomeController *)self state];
  v69 = [v68 deviceIdentifier];

  if (v69) {
    goto LABEL_45;
  }
LABEL_46:
}

- (void)processHMDResidentDeviceModel:(id)a3
{
  id v4 = [a3 device];
  v5 = [(HMDAppleAccessoryPairingHomeController *)self state];
  [v5 setDevice:v4];

  v6 = [(HMDAppleAccessoryPairingHomeController *)self dataSource];
  v7 = [(HMDAppleAccessoryPairingHomeController *)self state];
  [v6 updatePairingAccessoryState:v7];

  v8 = [(HMDAppleAccessoryPairingHomeController *)self state];
  v9 = [v8 device];
  v10 = [v9 identifier];
  v11 = [(HMDAppleAccessoryPairingHomeController *)self state];
  v12 = [v11 deviceIdentifier];
  int v13 = [v10 isEqual:v12];

  if (v13)
  {
    id v14 = [(HMDAppleAccessoryPairingHomeController *)self upgradeCheckTimer];
    [v14 fire];
  }
}

- (id)localZone:(id)a3 didProcessModelUpdate:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 model];
  v9 = [v8 convertToHMDModelObject];

  v10 = (void *)MEMORY[0x230FBD990]();
  v11 = self;
  v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = HMFGetLogIdentifier();
    id v14 = [v9 debugString:0];
    int v22 = 138543618;
    id v23 = v13;
    __int16 v24 = 2112;
    v25 = v14;
    _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Got Legacy Pairing update:\n%@", (uint8_t *)&v22, 0x16u);
  }
  id v15 = v9;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v16 = v15;
  }
  else {
    v16 = 0;
  }
  id v17 = v16;

  if (v17) {
    [(HMDAppleAccessoryPairingHomeController *)v11 processHMDAppleMediaAccessoryModel:v17];
  }
  id v18 = v15;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v19 = v18;
  }
  else {
    v19 = 0;
  }
  id v20 = v19;

  if (v20) {
    [(HMDAppleAccessoryPairingHomeController *)v11 processHMDResidentDeviceModel:v20];
  }

  return 0;
}

- (id)localZone:(id)a3 didProcessModelDeletion:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 model];
  v9 = [v8 convertToHMDModelObject];

  v10 = (void *)MEMORY[0x230FBD990]();
  v11 = self;
  v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = HMFGetLogIdentifier();
    id v14 = [v9 debugString:0];
    int v25 = 138543618;
    uint64_t v26 = v13;
    __int16 v27 = 2112;
    BOOL v28 = v14;
    _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Got Legacy Pairing deletion:\n%@", (uint8_t *)&v25, 0x16u);
  }
  id v15 = [v9 uuid];
  v16 = [(HMDAppleAccessoryPairingHomeController *)v11 state];
  id v17 = [v16 accessory];
  id v18 = [v17 uuid];
  int v19 = objc_msgSend(v15, "hmf_isEqualToUUID:", v18);

  if (v19)
  {
    id v20 = (void *)MEMORY[0x230FBD990]();
    v21 = v11;
    int v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      id v23 = HMFGetLogIdentifier();
      int v25 = 138543362;
      uint64_t v26 = v23;
      _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@Got Legacy Pairing deletion for accessory that is being setup removing HH1 zone", (uint8_t *)&v25, 0xCu);
    }
    [(HMDAppleAccessoryPairingHomeController *)v21 cleanupLegacyZone];
  }

  return 0;
}

- (id)localZone:(id)a3 didProcessModelCreation:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 model];
  v9 = [v8 convertToHMDModelObject];

  v10 = (void *)MEMORY[0x230FBD990]();
  v11 = self;
  v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = HMFGetLogIdentifier();
    id v14 = [v9 debugString:0];
    int v19 = 138543618;
    id v20 = v13;
    __int16 v21 = 2112;
    int v22 = v14;
    _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Got Legacy Pairing creation:\n%@", (uint8_t *)&v19, 0x16u);
  }
  id v15 = v9;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v16 = v15;
  }
  else {
    v16 = 0;
  }
  id v17 = v16;

  if (v17) {
    [(HMDAppleAccessoryPairingHomeController *)v11 processHMDResidentDeviceModel:v17];
  }

  return 0;
}

- (void)_handleDeviceNotification:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = HMFGetLogIdentifier();
    int v9 = 138543362;
    v10 = v8;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Got device notification.", (uint8_t *)&v9, 0xCu);
  }
  [(HMDAppleAccessoryPairingHomeController *)v6 checkDeviceVersionAndSendUpgrade];
}

- (void)postSoftwareUpdateEventForDescriptor:(id)a3
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HMDAppleAccessoryPairingHomeController *)self state];
  id v6 = [v5 accessory];
  id v7 = [v6 uuid];
  v8 = [v7 UUIDString];

  if (v8)
  {
    id v9 = objc_alloc(MEMORY[0x263F0E7E0]);
    [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
    v10 = objc_msgSend(v9, "initWithDescriptor:eventSource:eventTimestamp:", v4, v8);
    uint64_t v11 = [(HMDAppleAccessoryPairingHomeController *)self state];
    v12 = [v11 accessory];
    int v13 = [v12 uuid];

    id v14 = [(HMDAppleAccessoryPairingHomeController *)self homeManager];
    id v15 = [(HMDAppleAccessoryPairingHomeController *)self state];
    v16 = [v15 homeUUID];
    id v17 = [v14 _homeWithUUID:v16];

    uint64_t v18 = [v17 uuid];
    int v19 = (void *)v18;
    if (v13 && v18)
    {
      id v20 = [MEMORY[0x263F0DFA8] topicFromSuffixID:*MEMORY[0x263F0B318] homeUUID:v18 accessoryUUID:v13];
      if (v20)
      {
        __int16 v21 = [(HMDAppleAccessoryPairingHomeController *)self state];
        [v21 setLastPostedSoftwareUpdateDescriptor:v4];

        int v22 = [(HMDAppleAccessoryPairingHomeController *)self homeManager];
        uint64_t v23 = [v22 eventForwarder];
        [v23 forwardEvent:v10 topic:v20 completion:0];
      }
      else
      {
        v32 = (void *)MEMORY[0x230FBD990]();
        v33 = self;
        v34 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v35 = v36 = v32;
          *(_DWORD *)buf = 138543874;
          v38 = v35;
          __int16 v39 = 2112;
          v40 = v19;
          __int16 v41 = 2112;
          v42 = v13;
          _os_log_impl(&dword_22F52A000, v34, OS_LOG_TYPE_ERROR, "%{public}@Failed to get SU topic with homeUUID: %@, accessoryUUID: %@", buf, 0x20u);

          v32 = v36;
        }
      }
    }
    else
    {
      BOOL v28 = (void *)MEMORY[0x230FBD990]();
      uint64_t v29 = self;
      v30 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v31 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v38 = v31;
        __int16 v39 = 2112;
        v40 = v19;
        __int16 v41 = 2112;
        v42 = v13;
        _os_log_impl(&dword_22F52A000, v30, OS_LOG_TYPE_ERROR, "%{public}@Unexpected nil value in homeUUID: %@, accessoryUUID: %@", buf, 0x20u);
      }
    }
  }
  else
  {
    __int16 v24 = (void *)MEMORY[0x230FBD990]();
    int v25 = self;
    uint64_t v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      __int16 v27 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v38 = v27;
      _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_ERROR, "%{public}@Event source was nil", buf, 0xCu);
    }
  }
}

- (void)postSoftwareUpdateEventForSoftwareUpdate:(id)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v4 = a3;
  switch([v4 state])
  {
    case 0:
      int v22 = self;
      uint64_t v5 = 3;
      goto LABEL_8;
    case 1:
      int v22 = self;
      uint64_t v5 = 14;
      goto LABEL_8;
    case 2:
      int v22 = self;
      uint64_t v5 = 15;
      goto LABEL_8;
    case 3:
      int v22 = self;
      uint64_t v5 = 9;
      goto LABEL_8;
    case 4:
      int v22 = self;
      uint64_t v5 = 2;
LABEL_8:
      uint64_t v21 = v5;
      goto LABEL_9;
    case 5:
      v16 = (void *)MEMORY[0x230FBD990]();
      id v17 = self;
      uint64_t v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        int v19 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v38 = v19;
        _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@HMSoftwareUpdateRequested is not supported for HomePod in the HH1 shim", buf, 0xCu);
      }
      goto LABEL_15;
    default:
      uint64_t v21 = 0;
      int v22 = self;
LABEL_9:
      id v29 = objc_alloc(MEMORY[0x263F0E7D8]);
      uint64_t v35 = [v4 downloadSize];
      if (v35)
      {
        v36 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v4, "downloadSize"));
      }
      else
      {
        v36 = 0;
      }
      v34 = [v4 documentationMetadata];
      v33 = [v34 URL];
      uint64_t v26 = [v33 absoluteURL];
      v32 = [v4 documentationMetadata];
      v31 = [v32 digest];
      [v31 algorithm];
      uint64_t v23 = HMFDigestAlgorithmToString();
      BOOL v28 = [v4 documentationMetadata];
      __int16 v27 = [v28 digest];
      __int16 v24 = [v27 value];
      id v6 = NSNumber;
      int v25 = [v4 version];
      id v7 = objc_msgSend(v6, "numberWithUnsignedInteger:", objc_msgSend(v25, "majorVersion"));
      v8 = NSNumber;
      id v9 = [v4 version];
      v10 = objc_msgSend(v8, "numberWithUnsignedInteger:", objc_msgSend(v9, "minorVersion"));
      uint64_t v11 = NSNumber;
      v12 = [v4 version];
      int v13 = objc_msgSend(v11, "numberWithUnsignedInteger:", objc_msgSend(v12, "updateVersion"));
      id v14 = [v4 version];
      id v15 = [v14 buildVersion];
      LOBYTE(v20) = 1;
      v30 = (void *)[v29 initWithStatus:v21 downloadSize:v36 humanReadableUpdateName:0 rampEnabled:0 errorCode:0 serverAssetURL:v26 serverAssetAlgorithm:v23 serverAssetMeasurement:v24 majorVersion:v7 minorVersion:v10 updateVersion:v13 buildVersion:v15 softwareVersionRequiresMetadata:v20];

      if (v35) {
      [(HMDAppleAccessoryPairingHomeController *)v22 postSoftwareUpdateEventForDescriptor:v30];
      }

LABEL_15:
      return;
  }
}

- (void)checkDeviceVersionAndSendUpgrade
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  v3 = [(HMDAppleAccessoryPairingHomeController *)self state];
  id v4 = [v3 deviceIdentifier];
  if (v4)
  {

    goto LABEL_4;
  }
  uint64_t v5 = [(HMDAppleAccessoryPairingHomeController *)self state];
  id v6 = [v5 device];

  if (v6)
  {
LABEL_4:
    id v7 = [(HMDAppleAccessoryPairingHomeController *)self dataSource];
    v8 = [(HMDAppleAccessoryPairingHomeController *)self state];
    id v9 = [v8 device];
    v10 = [v9 identifier];
    uint64_t v11 = [v7 deviceForIdentifier:v10];

    if (!v11) {
      goto LABEL_10;
    }
    uint64_t v12 = [v11 version];
    if (!v12) {
      goto LABEL_10;
    }
    int v13 = (void *)v12;
    id v14 = [v11 version];
    id v15 = [[HMDHomeKitVersion alloc] initWithVersionString:@"10.0"];
    int v16 = [v14 isAtLeastVersion:v15];

    if (v16)
    {
      id v17 = (void *)MEMORY[0x230FBD990]();
      uint64_t v18 = self;
      int v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v20 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v32 = v20;
        _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@Previously legacy HomePod has been updated to a HH2.0 viable HomeKit", buf, 0xCu);
      }
      [(HMDAppleAccessoryPairingHomeController *)v18 postNotificationOfDeviceUpdated];
      [(HMDAppleAccessoryPairingHomeController *)v18 cleanupLegacyZone];
    }
    else
    {
LABEL_10:
      uint64_t v21 = (void *)MEMORY[0x230FBD990]();
      int v22 = self;
      uint64_t v23 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v24 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v32 = v24;
        _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@Querying HomePod to determine if it has upgradable software.", buf, 0xCu);
      }
      int v25 = [(HMDAppleAccessoryPairingHomeController *)v22 workContext];
      v30[0] = MEMORY[0x263EF8330];
      v30[1] = 3221225472;
      v30[2] = __74__HMDAppleAccessoryPairingHomeController_checkDeviceVersionAndSendUpgrade__block_invoke;
      v30[3] = &unk_264A2F7F8;
      v30[4] = v22;
      [v25 performBlock:v30];
    }
    return;
  }
  uint64_t v26 = (void *)MEMORY[0x230FBD990]();
  __int16 v27 = self;
  BOOL v28 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    id v29 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v32 = v29;
    _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@Unable to query HomePod for update status (no device).", buf, 0xCu);
  }
}

void __74__HMDAppleAccessoryPairingHomeController_checkDeviceVersionAndSendUpgrade__block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) queryFuture];

  if (v2)
  {
    v3 = (void *)MEMORY[0x230FBD990]();
    id v4 = *(id *)(a1 + 32);
    uint64_t v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = HMFGetLogIdentifier();
      id v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "suppressedQueries"));
      *(_DWORD *)buf = 138543618;
      int v22 = v6;
      __int16 v23 = 2112;
      __int16 v24 = v7;
      _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Outstanding query request to HomePod, suppressing query (suppressed %@ so far)", buf, 0x16u);
    }
    objc_msgSend(*(id *)(a1 + 32), "setSuppressedQueries:", objc_msgSend(*(id *)(a1 + 32), "suppressedQueries") + 1);
  }
  else
  {
    [*(id *)(a1 + 32) setSuppressedQueries:0];
    v8 = *(void **)(a1 + 32);
    id v9 = [v8 state];
    v10 = [v9 accessory];
    uint64_t v11 = [v10 uuid];
    uint64_t v12 = __sendMessageWithFutureResult(v8, v11, (void *)*MEMORY[0x263F0D9D0], MEMORY[0x263EFFA78]);

    int v13 = [*(id *)(a1 + 32) workContext];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __74__HMDAppleAccessoryPairingHomeController_checkDeviceVersionAndSendUpgrade__block_invoke_100;
    v20[3] = &unk_264A25860;
    v20[4] = *(void *)(a1 + 32);
    id v14 = [v12 inContext:v13 then:v20];
    id v15 = [*(id *)(a1 + 32) workContext];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __74__HMDAppleAccessoryPairingHomeController_checkDeviceVersionAndSendUpgrade__block_invoke_106;
    v18[3] = &unk_264A25860;
    uint64_t v19 = *(void *)(a1 + 32);
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __74__HMDAppleAccessoryPairingHomeController_checkDeviceVersionAndSendUpgrade__block_invoke_107;
    v17[3] = &unk_264A2C4C8;
    v17[4] = v19;
    int v16 = [v14 inContext:v15 then:v18 orRecover:v17];
    [*(id *)(a1 + 32) setQueryFuture:v16];
  }
}

uint64_t __74__HMDAppleAccessoryPairingHomeController_checkDeviceVersionAndSendUpgrade__block_invoke_100(uint64_t a1, void *a2)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v3 = a2;
  [*(id *)(a1 + 32) setSuppressedQueries:0];
  uint64_t v4 = *MEMORY[0x263F0D9F0];
  uint64_t v5 = objc_msgSend(v3, "hmf_dataForKey:", *MEMORY[0x263F0D9F0]);
  if (v5)
  {
    id v30 = 0;
    id v6 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v5 error:&v30];
    id v7 = v30;
    v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = *(id *)(a1 + 32);
    v10 = HMFGetOSLogHandle();
    uint64_t v11 = v10;
    if (v6)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v34 = v12;
        __int16 v35 = 2112;
        id v36 = v6;
        _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Requesting device update to: %@", buf, 0x16u);
      }
      [*(id *)(a1 + 32) postSoftwareUpdateEventForSoftwareUpdate:v6];
      uint64_t v31 = v4;
      v32 = v5;
      id v13 = [NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
      id v14 = *(void **)(a1 + 32);
      id v15 = [v14 state];
      int v16 = [v15 accessory];
      id v17 = [v16 uuid];
      __sendMessageWithFutureResult(v14, v17, (void *)*MEMORY[0x263F0D9E0], v13);
      id v18 = (id)objc_claimAutoreleasedReturnValue();
      if (!v18) {
        _HMFPreconditionFailure();
      }
      uint64_t v19 = v18;

      uint64_t v20 = 3;
    }
    else
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        __int16 v27 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v34 = v27;
        __int16 v35 = 2112;
        id v36 = v7;
        _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive software update from software update data: %@", buf, 0x16u);
      }
      id v28 = v7;
      if (v28)
      {
        id v13 = v28;
      }
      else
      {
        [MEMORY[0x263F087E8] hmfUnspecifiedError];
        objc_claimAutoreleasedReturnValue();
        id v13 = 0;
      }
      uint64_t v20 = 2;
    }
  }
  else
  {
    uint64_t v21 = [MEMORY[0x263F087E8] hmfErrorWithCode:8];
    int v22 = (void *)MEMORY[0x230FBD990]();
    id v23 = *(id *)(a1 + 32);
    __int16 v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      uint64_t v25 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v34 = v25;
      __int16 v35 = 2112;
      id v36 = v21;
      _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_ERROR, "%{public}@Payload did not have software update status: %@", buf, 0x16u);
    }
    id v26 = v21;
    if (v26)
    {
      id v6 = v26;
      uint64_t v20 = 2;
      id v7 = v6;
    }
    else
    {
      [MEMORY[0x263F087E8] hmfUnspecifiedError];
      objc_claimAutoreleasedReturnValue();
      id v6 = 0;
      id v7 = 0;
      uint64_t v20 = 2;
    }
  }

  return v20;
}

uint64_t __74__HMDAppleAccessoryPairingHomeController_checkDeviceVersionAndSendUpgrade__block_invoke_106(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  [*(id *)(a1 + 32) setSuppressedQueries:0];
  uint64_t v4 = (void *)MEMORY[0x230FBD990]([*(id *)(a1 + 32) setQueryFuture:0]);
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = HMFGetLogIdentifier();
    int v9 = 138543618;
    v10 = v7;
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Message update response: %@", (uint8_t *)&v9, 0x16u);
  }

  return 1;
}

uint64_t __74__HMDAppleAccessoryPairingHomeController_checkDeviceVersionAndSendUpgrade__block_invoke_107(uint64_t a1)
{
  if ([*(id *)(a1 + 32) suppressedQueries])
  {
    [*(id *)(a1 + 32) setSuppressedQueries:0];
    [*(id *)(a1 + 32) checkDeviceVersionAndSendUpgrade];
  }
  return 1;
}

- (void)postNotificationOfDeviceUpdated
{
  id v3 = [(HMDAppleAccessoryPairingHomeController *)self state];
  id v14 = [v3 lastPostedSoftwareUpdateDescriptor];

  if (v14)
  {
    [v14 setStatus:2];
    [(HMDAppleAccessoryPairingHomeController *)self postSoftwareUpdateEventForDescriptor:v14];
  }
  uint64_t v4 = [(HMDAppleAccessoryPairingHomeController *)self homeManager];
  id v5 = [(HMDAppleAccessoryPairingHomeController *)self state];
  id v6 = [v5 homeUUID];
  id v7 = [v4 _homeWithUUID:v6];

  v8 = [(HMDAppleAccessoryPairingHomeController *)self state];
  int v9 = [v8 accessory];
  v10 = [v9 uuid];
  __int16 v11 = [v7 accessoryWithUUID:v10];

  if (v11)
  {
    id v12 = [(HMDAppleAccessoryPairingHomeController *)self dataSource];
    uint64_t v13 = [v12 bulletinBoard];
    [v13 insertHH2SoftwareUpdateCompleteEventBulletinForAccessory:v11];
  }
}

- (void)cleanupLegacyZone
{
  id v3 = [(HMDAppleAccessoryPairingHomeController *)self upgradeCheckTimer];
  [v3 suspend];

  uint64_t v4 = [(HMDAppleAccessoryPairingHomeController *)self homeManager];
  id v5 = [v4 workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__HMDAppleAccessoryPairingHomeController_cleanupLegacyZone__block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(v5, block);
}

void __59__HMDAppleAccessoryPairingHomeController_cleanupLegacyZone__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) localZone];
  id v3 = [v2 localDatabase];
  uint64_t v4 = [*(id *)(a1 + 32) localZone];
  id v5 = [v3 removeZone:v4];

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __59__HMDAppleAccessoryPairingHomeController_cleanupLegacyZone__block_invoke_2;
  v9[3] = &unk_264A2F398;
  v9[4] = *(void *)(a1 + 32);
  id v6 = (id)[v5 addSuccessBlock:v9];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __59__HMDAppleAccessoryPairingHomeController_cleanupLegacyZone__block_invoke_96;
  v8[3] = &unk_264A2F3E8;
  v8[4] = *(void *)(a1 + 32);
  id v7 = (id)[v5 addFailureBlock:v8];
}

void __59__HMDAppleAccessoryPairingHomeController_cleanupLegacyZone__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    id v7 = HMFGetLogIdentifier();
    int v12 = 138543362;
    uint64_t v13 = v7;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_ERROR, "%{public}@Successfully removed legacy pairing zone.", (uint8_t *)&v12, 0xCu);
  }
  v8 = [*(id *)(a1 + 32) homeManager];
  int v9 = [v8 legacyAccessoryPairingController];
  v10 = [*(id *)(a1 + 32) state];
  __int16 v11 = [v10 cloudZoneID];
  [v9 removeControllerForZone:v11];
}

void __59__HMDAppleAccessoryPairingHomeController_cleanupLegacyZone__block_invoke_96(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    id v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    int v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_ERROR, "%{public}@Unable to remove temporary pairing zone: %@", (uint8_t *)&v8, 0x16u);
  }
}

- (id)workContext
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__HMDAppleAccessoryPairingHomeController_workContext__block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  if (workContext__hmf_once_t20 != -1) {
    dispatch_once(&workContext__hmf_once_t20, block);
  }
  return (id)workContext__hmf_once_v21;
}

void __53__HMDAppleAccessoryPairingHomeController_workContext__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x263F42520]);
  id v6 = [*(id *)(a1 + 32) homeManager];
  id v3 = [v6 workQueue];
  uint64_t v4 = [v2 initWithQueue:v3];
  id v5 = (void *)workContext__hmf_once_v21;
  workContext__hmf_once_uint64_t v21 = v4;
}

- (void)startWithLocalZone:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!self->_localZone)
  {
    objc_storeStrong((id *)&self->_localZone, a3);
    id v6 = [(HMDAppleAccessoryPairingHomeController *)self localZone];
    [v6 addObserverForAllModels:self];

    id v7 = [(HMDAppleAccessoryPairingHomeController *)self localZone];
    [v7 startUp];

    int v8 = (void *)MEMORY[0x230FBD990]();
    int v9 = self;
    __int16 v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = HMFGetLogIdentifier();
      uint64_t v12 = [(HMDAppleAccessoryPairingHomeController *)v9 state];
      uint64_t v13 = [v12 cloudZoneID];
      uint64_t v14 = [v13 name];
      *(_DWORD *)buf = 138543618;
      id v28 = v11;
      __int16 v29 = 2112;
      id v30 = v14;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Starting state machine for zone: %@", buf, 0x16u);
    }
    id v15 = [(HMDAppleAccessoryPairingHomeController *)v9 localZone];
    int v16 = [v15 mirror];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v17 = v16;
    }
    else {
      id v17 = 0;
    }
    id v18 = v17;

    id v19 = (id)[v18 registerSubscriptionForExternalRecordType:0];
    uint64_t v20 = [MEMORY[0x263F49318] optionsWithLabel:@"Startup zone fetch"];
    uint64_t v21 = [v18 performCloudPullWithOptions:v20];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __61__HMDAppleAccessoryPairingHomeController_startWithLocalZone___block_invoke;
    v26[3] = &unk_264A2F398;
    v26[4] = v9;
    id v22 = (id)[v21 addSuccessBlock:v26];

    id v23 = [v18 startUp];

    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __61__HMDAppleAccessoryPairingHomeController_startWithLocalZone___block_invoke_92;
    v25[3] = &unk_264A2F398;
    v25[4] = v9;
    id v24 = (id)[v23 addSuccessBlock:v25];
  }
}

void __61__HMDAppleAccessoryPairingHomeController_startWithLocalZone___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = HMFGetLogIdentifier();
    int v9 = 138543362;
    __int16 v10 = v7;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Initial zone fetch completed, checking for update.", (uint8_t *)&v9, 0xCu);
  }
  int v8 = [*(id *)(a1 + 32) upgradeCheckTimer];
  [v8 resume];
}

void __61__HMDAppleAccessoryPairingHomeController_startWithLocalZone___block_invoke_92(uint64_t a1, void *a2)
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = HMFGetLogIdentifier();
    int v8 = [*(id *)(a1 + 32) state];
    int v9 = [v8 cloudZoneID];
    __int16 v10 = [v9 name];
    *(_DWORD *)buf = 138543618;
    uint64_t v43 = v7;
    __int16 v44 = 2112;
    id v45 = v10;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@State machine completely started for zone: %@", buf, 0x16u);
  }
  uint64_t v11 = [*(id *)(a1 + 32) localZone];
  uint64_t v12 = [*(id *)(a1 + 32) state];
  uint64_t v13 = [v12 accessory];
  uint64_t v14 = [v13 uuid];
  id v41 = 0;
  id v15 = [v11 fetchModelWithModelID:v14 error:&v41];
  id v16 = v41;

  if (v15)
  {
    id v17 = v15;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v18 = v17;
    }
    else {
      id v18 = 0;
    }
    id v19 = v18;

    uint64_t v20 = [v19 convertToHMDModelObject];
    uint64_t v21 = v20;
    if (v20)
    {
      id v22 = v20;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v23 = v22;
      }
      else {
        id v23 = 0;
      }
      id v24 = v23;

      if (v24)
      {
        [*(id *)(a1 + 32) processHMDAppleMediaAccessoryModel:v24];
      }
      else
      {
        id v36 = (void *)MEMORY[0x230FBD990]();
        id v37 = *(id *)(a1 + 32);
        v38 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          uint64_t v39 = v40 = v36;
          *(_DWORD *)buf = 138543618;
          uint64_t v43 = v39;
          __int16 v44 = 2112;
          id v45 = v22;
          _os_log_impl(&dword_22F52A000, v38, OS_LOG_TYPE_ERROR, "%{public}@Expected a HMDAppleMediaAccessory but %@ does not look like one.", buf, 0x16u);

          id v36 = v40;
        }
      }
    }
    else
    {
      v32 = (void *)MEMORY[0x230FBD990]();
      id v33 = *(id *)(a1 + 32);
      v34 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        __int16 v35 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        uint64_t v43 = v35;
        __int16 v44 = 2112;
        id v45 = v17;
        _os_log_impl(&dword_22F52A000, v34, OS_LOG_TYPE_ERROR, "%{public}@Unable to extract a HMDBSO from %@", buf, 0x16u);
      }
    }
  }
  else
  {
    uint64_t v25 = (void *)MEMORY[0x230FBD990]();
    id v26 = *(id *)(a1 + 32);
    __int16 v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      id v28 = HMFGetLogIdentifier();
      __int16 v29 = [*(id *)(a1 + 32) state];
      id v30 = [v29 accessory];
      uint64_t v31 = [v30 uuid];
      *(_DWORD *)buf = 138543874;
      uint64_t v43 = v28;
      __int16 v44 = 2112;
      id v45 = v31;
      __int16 v46 = 2112;
      id v47 = v16;
      _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_ERROR, "%{public}@Unable to fetch extant HMDMediaAccessoryModel for %@: %@", buf, 0x20u);
    }
  }
}

- (BOOL)handleMessage:(id)a3 from:(id)a4
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int v8 = [v6 uuidForKey:@"kAccessoryUUID"];
  int v9 = [v6 name];
  int v10 = [v9 isEqual:@"kAddAccessoryRequestKey"];

  if (v10)
  {
    uint64_t v11 = [(HMDAppleAccessoryPairingHomeController *)self state];
    uint64_t v12 = [v11 accessory];
    uint64_t v13 = [v12 uuid];
    int v14 = [v8 isEqual:v13];

    if (v14)
    {
      id v15 = [v7 uuid];
      id v16 = [(HMDAppleAccessoryPairingHomeController *)self state];
      [v16 setHomeUUID:v15];

      id v17 = (void *)MEMORY[0x230FBD990]();
      id v18 = self;
      id v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v20 = HMFGetLogIdentifier();
        uint64_t v21 = [(HMDAppleAccessoryPairingHomeController *)v18 state];
        id v22 = [v21 accessory];
        id v23 = [v22 uuid];
        [v7 uuid];
        id v24 = v37 = v17;
        *(_DWORD *)buf = 138543874;
        id v41 = v20;
        __int16 v42 = 2112;
        uint64_t v43 = v23;
        __int16 v44 = 2112;
        id v45 = v24;
        _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@Adding Legacy HomePod %@ To Home: %@", buf, 0x20u);

        id v17 = v37;
      }

      uint64_t v25 = [(HMDAppleAccessoryPairingHomeController *)v18 state];
      [v25 setState:1];

      id v26 = [(HMDAppleAccessoryPairingHomeController *)v18 dataSource];
      __int16 v27 = [(HMDAppleAccessoryPairingHomeController *)v18 state];
      [v26 updatePairingAccessoryState:v27];
    }
  }
  else
  {
    id v28 = [v6 name];
    int v29 = [v28 isEqual:@"kRemoveAccessoryRequestKey"];

    if (v29)
    {
      id v30 = [(HMDAppleAccessoryPairingHomeController *)self state];
      uint64_t v31 = [v30 accessory];
      v32 = [v31 uuid];
      int v33 = [v8 isEqual:v32];

      if (v33)
      {
        v34 = [(HMDAppleAccessoryPairingHomeController *)self homeManager];
        __int16 v35 = [v34 workQueue];
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __61__HMDAppleAccessoryPairingHomeController_handleMessage_from___block_invoke;
        block[3] = &unk_264A2F820;
        block[4] = self;
        id v39 = v8;
        dispatch_async(v35, block);
      }
    }
  }

  return 0;
}

void __61__HMDAppleAccessoryPairingHomeController_handleMessage_from___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) localZone];
  id v2 = [MEMORY[0x263EFFA08] setWithObject:*(void *)(a1 + 40)];
  id v3 = [MEMORY[0x263F49318] optionsWithLabel:@"Accessory Remove"];
  id v4 = (id)[v5 removeModelIDs:v2 options:v3];
}

- (void)timerDidFire:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDAppleAccessoryPairingHomeController *)self upgradeCheckTimer];

  if (v5 == v4)
  {
    [(HMDAppleAccessoryPairingHomeController *)self checkDeviceVersionAndSendUpgrade];
  }
}

- (HMDAppleAccessoryPairingHomeController)initWithState:(id)a3 homeManager:(id)a4 dataSource:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)HMDAppleAccessoryPairingHomeController;
  uint64_t v12 = [(HMDAppleAccessoryPairingHomeController *)&v18 init];
  uint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_state, a3);
    objc_storeStrong((id *)&v13->_homeManager, a4);
    objc_storeStrong((id *)&v13->_dataSource, a5);
    uint64_t v14 = [v11 timerWithInterval:12 options:120.0];
    upgradeCheckTimer = v13->_upgradeCheckTimer;
    v13->_upgradeCheckTimer = (HMFTimer *)v14;

    [(HMFTimer *)v13->_upgradeCheckTimer setDelegate:v13];
    v13->_suppressedQueries = 0;
    id v16 = [v11 notificationCenter];
    [v16 addObserver:v13 selector:sel__handleDeviceNotification_ name:@"HMDAppleAccountManagerResolved" object:0];
  }
  return v13;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t54_193974 != -1) {
    dispatch_once(&logCategory__hmf_once_t54_193974, &__block_literal_global_193975);
  }
  id v2 = (void *)logCategory__hmf_once_v55_193976;
  return v2;
}

void __53__HMDAppleAccessoryPairingHomeController_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v55_193976;
  logCategory__hmf_once_v55_193976 = v0;
}

@end