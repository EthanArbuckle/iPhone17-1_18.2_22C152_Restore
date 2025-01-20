@interface HMDDefaultUARPControllerDelegate
+ (id)logCategory;
- (BOOL)sendMessageToAccessory:(id)a3 uarpMsg:(id)a4 error:(id *)a5;
- (HMDAccessoryFirmwareUpdateManager)accessoryFirmwareUpdateManager;
- (HMDDefaultUARPControllerDelegate)initWithAccessoryFirmwareUpdateManager:(id)a3;
- (void)assetAvailablityUpdateForAccessory:(id)a3 assetID:(id)a4;
- (void)firmwareStagingComplete:(id)a3 assetID:(id)a4 withStatus:(unint64_t)a5;
- (void)firmwareStagingProgress:(id)a3 assetID:(id)a4 bytesSent:(unint64_t)a5 bytesTotal:(unint64_t)a6;
- (void)firmwareUpdateResult:(id)a3 vendorSpecificStatus:(unsigned int)a4 error:(id)a5;
- (void)stagedFirmwareApplicationComplete:(id)a3 withStatus:(unint64_t)a4;
@end

@implementation HMDDefaultUARPControllerDelegate

- (void).cxx_destruct
{
}

- (HMDAccessoryFirmwareUpdateManager)accessoryFirmwareUpdateManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessoryFirmwareUpdateManager);
  return (HMDAccessoryFirmwareUpdateManager *)WeakRetained;
}

- (void)firmwareUpdateResult:(id)a3 vendorSpecificStatus:(unsigned int)a4 error:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  v10 = [(HMDDefaultUARPControllerDelegate *)self accessoryFirmwareUpdateManager];
  v11 = [v10 sessionForUARPAccessory:v8];

  if (v11)
  {
    [v11 firmwareUpdateResult:v8 vendorSpecificStatus:v6 error:v9];
  }
  else
  {
    v12 = (void *)MEMORY[0x230FBD990]();
    v13 = self;
    v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = HMFGetLogIdentifier();
      int v16 = 138543362;
      v17 = v15;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, "%{public}@firmwareUpdateResult: No session exists", (uint8_t *)&v16, 0xCu);
    }
  }
}

- (BOOL)sendMessageToAccessory:(id)a3 uarpMsg:(id)a4 error:(id *)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  if (a5) {
    *a5 = 0;
  }
  v10 = [(HMDDefaultUARPControllerDelegate *)self accessoryFirmwareUpdateManager];
  v11 = [v10 sessionForUARPAccessory:v8];
  v12 = v11;
  if (v11 && ([v11 sendMessageToAccessory:v8 uarpMsg:v9 error:a5] & 1) != 0)
  {
    BOOL v13 = 1;
  }
  else
  {
    if (a5 && !*a5)
    {
      *a5 = [MEMORY[0x263F087E8] hmErrorWithCode:2 description:0 reason:@"UARP session not found" suggestion:0];
    }
    v14 = (void *)MEMORY[0x230FBD990]();
    v15 = self;
    int v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = HMFGetLogIdentifier();
      uint64_t v18 = (void *)v17;
      if (a5) {
        id v19 = *a5;
      }
      else {
        id v19 = 0;
      }
      int v21 = 138543874;
      uint64_t v22 = v17;
      __int16 v23 = 2112;
      id v24 = v8;
      __int16 v25 = 2112;
      id v26 = v19;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@sendMessageToAccessory: failed for %@ with error %@", (uint8_t *)&v21, 0x20u);
    }
    BOOL v13 = 0;
  }

  return v13;
}

- (void)stagedFirmwareApplicationComplete:(id)a3 withStatus:(unint64_t)a4
{
  id v6 = a3;
  objc_initWeak(&location, self);
  v7 = [(HMDDefaultUARPControllerDelegate *)self accessoryFirmwareUpdateManager];
  id v8 = [v7 workQueue];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __81__HMDDefaultUARPControllerDelegate_stagedFirmwareApplicationComplete_withStatus___block_invoke;
  v10[3] = &unk_264A23DD0;
  objc_copyWeak(v12, &location);
  v12[1] = (id)a4;
  id v11 = v6;
  id v9 = v6;
  dispatch_async(v8, v10);

  objc_destroyWeak(v12);
  objc_destroyWeak(&location);
}

void __81__HMDDefaultUARPControllerDelegate_stagedFirmwareApplicationComplete_withStatus___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = (void *)MEMORY[0x230FBD990]();
  id v4 = WeakRetained;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = HMFGetLogIdentifier();
    v7 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 48)];
    uint64_t v8 = *(void *)(a1 + 32);
    int v9 = 138543874;
    v10 = v6;
    __int16 v11 = 2112;
    v12 = v7;
    __int16 v13 = 2112;
    uint64_t v14 = v8;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@firmware UARP apply request completed with status %@ for accessory %@", (uint8_t *)&v9, 0x20u);
  }
}

- (void)firmwareStagingComplete:(id)a3 assetID:(id)a4 withStatus:(unint64_t)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v10 = [(HMDDefaultUARPControllerDelegate *)self accessoryFirmwareUpdateManager];
  __int16 v11 = [v10 sessionForUARPAccessory:v8];
  v12 = v11;
  if (v11)
  {
    [v11 firmwareStagingComplete:v8 assetID:v9 withStatus:a5];
  }
  else
  {
    __int16 v13 = (void *)MEMORY[0x230FBD990]();
    uint64_t v14 = self;
    uint64_t v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v16 = HMFGetLogIdentifier();
      int v17 = 138543362;
      uint64_t v18 = v16;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@firmwareUpdateComplete: No session exists for accessory", (uint8_t *)&v17, 0xCu);
    }
  }
}

- (void)firmwareStagingProgress:(id)a3 assetID:(id)a4 bytesSent:(unint64_t)a5 bytesTotal:(unint64_t)a6
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  v12 = [(HMDDefaultUARPControllerDelegate *)self accessoryFirmwareUpdateManager];
  __int16 v13 = [v12 sessionForUARPAccessory:v10];
  uint64_t v14 = v13;
  if (v13)
  {
    [v13 firmwareStagingProgress:v10 assetID:v11 bytesSent:a5 bytesTotal:a6];
  }
  else
  {
    uint64_t v15 = (void *)MEMORY[0x230FBD990]();
    int v16 = self;
    int v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = HMFGetLogIdentifier();
      int v19 = 138543618;
      v20 = v18;
      __int16 v21 = 2112;
      id v22 = v10;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_ERROR, "%{public}@firmwareStagingProgress: No session exists for accessory %@", (uint8_t *)&v19, 0x16u);
    }
  }
}

- (void)assetAvailablityUpdateForAccessory:(id)a3 assetID:(id)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x230FBD990]();
  id v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = HMFGetLogIdentifier();
    [v7 updateAvailabilityStatus];
    *(_DWORD *)buf = 138543874;
    *(void *)&buf[4] = v11;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v6;
    *(_WORD *)&buf[22] = 2080;
    *(void *)&buf[24] = UARPFirmwareUpdateAvailabilityStatusToString();
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Firmware Update Available for accessory:%@ status:%s", buf, 0x20u);
  }
  v12 = [(HMDDefaultUARPControllerDelegate *)v9 accessoryFirmwareUpdateManager];
  if ([v12 supportsFirmwareUpdate])
  {
    __int16 v13 = [v12 sessionForUARPAccessory:v6];
    if (v13)
    {
LABEL_5:
      [v13 assetAvailablityUpdateForAccessory:v6 assetID:v7];
LABEL_25:

      goto LABEL_26;
    }
    uint64_t v18 = [v12 findHMDHAPAccessoryWithUARPAccessory:v6];
    __int16 v13 = v18;
    if (v18)
    {
      int v19 = [v18 firmwareVersion];
      v20 = [v7 softwareVersion];
      int v21 = [v19 isAtLeastVersion:v20];

      if (v21)
      {
        id v22 = (void *)MEMORY[0x230FBD990]();
        uint64_t v23 = v9;
        id v24 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          __int16 v25 = HMFGetLogIdentifier();
          id v26 = [v7 softwareVersion];
          uint64_t v27 = [v13 firmwareVersion];
          *(_DWORD *)buf = 138543874;
          *(void *)&buf[4] = v25;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v26;
          *(_WORD *)&buf[22] = 2112;
          *(void *)&buf[24] = v27;
          _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_INFO, "%{public}@Available version %@ is equal or older than current accessory version %@", buf, 0x20u);

LABEL_23:
        }
LABEL_24:

        goto LABEL_25;
      }
      if (![v12 hasReachedMaximumFirmwareUpdateRetriesForAccessory:v13 assetID:v7])
      {
        uint64_t v35 = [v12 addSessionForUARPAccessory:v6];

        __int16 v13 = (void *)v35;
        goto LABEL_5;
      }
      id v22 = (void *)MEMORY[0x230FBD990]();
      v32 = v9;
      id v24 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        goto LABEL_24;
      }
      __int16 v25 = HMFGetLogIdentifier();
      *(void *)buf = 0;
      *(void *)&buf[8] = 0;
      v33 = [v13 uuid];

      if (v33)
      {
        v34 = [v13 uuid];
        [v34 getUUIDBytes:buf];
      }
      else
      {
        *(_OWORD *)buf = *MEMORY[0x263F42690];
      }
      long long v36 = *(_OWORD *)buf;
      *(_DWORD *)buf = 138543874;
      *(void *)&buf[4] = v25;
      *(_WORD *)&buf[12] = 1040;
      *(_DWORD *)&buf[14] = 16;
      *(_WORD *)&buf[18] = 2096;
      *(void *)&buf[20] = &v36;
      v29 = "%{public}@No more retries for HAPAccessory %{uuid_t}.16P";
      v30 = v24;
      uint32_t v31 = 28;
    }
    else
    {
      id v22 = (void *)MEMORY[0x230FBD990]();
      v28 = v9;
      id v24 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        goto LABEL_24;
      }
      __int16 v25 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v25;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v6;
      v29 = "%{public}@Couldn't find HAPAccessory from UARPAccessory %@";
      v30 = v24;
      uint32_t v31 = 22;
    }
    _os_log_impl(&dword_22F52A000, v30, OS_LOG_TYPE_ERROR, v29, buf, v31);
    goto LABEL_23;
  }
  uint64_t v14 = (void *)MEMORY[0x230FBD990]();
  uint64_t v15 = v9;
  int v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    *(void *)&buf[4] = v17;
    _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@Firmware Update not supported on this device; ignoring",
      buf,
      0xCu);
  }
LABEL_26:
}

- (HMDDefaultUARPControllerDelegate)initWithAccessoryFirmwareUpdateManager:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HMDDefaultUARPControllerDelegate;
  v5 = [(HMDDefaultUARPControllerDelegate *)&v8 init];
  id v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_accessoryFirmwareUpdateManager, v4);
  }

  return v6;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_54520 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_54520, &__block_literal_global_54521);
  }
  v2 = (void *)logCategory__hmf_once_v1_54522;
  return v2;
}

void __47__HMDDefaultUARPControllerDelegate_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v1_54522;
  logCategory__hmf_once_v1_54522 = v0;
}

@end