@interface HMDMatterUARPControllerDelegate
+ (id)logCategory;
- (BOOL)sendMessageToAccessory:(id)a3 uarpMsg:(id)a4 error:(id *)a5;
- (HMDAccessoryFirmwareUpdateManager)accessoryFirmwareUpdateManager;
- (HMDMatterUARPControllerDelegate)initWithAccessoryFirmwareUpdateManager:(id)a3;
- (id)newUploader;
- (void)assetAvailablityUpdateForAccessory:(id)a3 assetID:(id)a4;
@end

@implementation HMDMatterUARPControllerDelegate

- (void).cxx_destruct
{
}

- (HMDAccessoryFirmwareUpdateManager)accessoryFirmwareUpdateManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessoryFirmwareUpdateManager);
  return (HMDAccessoryFirmwareUpdateManager *)WeakRetained;
}

- (id)newUploader
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if ((_os_feature_enabled_impl() & 1) != 0
    || CFPreferencesGetAppBooleanValue(@"MatterOTA", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0))
  {
    return objc_alloc_init(HMDMatterUARPUploader);
  }
  else
  {
    v4 = (void *)MEMORY[0x230FBD990]();
    v5 = self;
    v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = HMFGetLogIdentifier();
      int v8 = 138543618;
      v9 = v7;
      __int16 v10 = 2080;
      v11 = "-[HMDMatterUARPControllerDelegate newUploader]";
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_ERROR, "%{public}@%s: Matter Accessory Software Update not enabled.", (uint8_t *)&v8, 0x16u);
    }
    return 0;
  }
}

- (BOOL)sendMessageToAccessory:(id)a3 uarpMsg:(id)a4 error:(id *)a5
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v9 = (void *)MEMORY[0x230FBD990]();
  __int16 v10 = self;
  v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    uint64_t v12 = HMFGetLogIdentifier();
    int v14 = 138543362;
    v15 = v12;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@sendMessageToAccessory: failed. This function should not be called for Matter accessories", (uint8_t *)&v14, 0xCu);
  }

  return 0;
}

- (void)assetAvailablityUpdateForAccessory:(id)a3 assetID:(id)a4
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x230FBD990]();
  v9 = self;
  __int16 v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = HMFGetLogIdentifier();
    [v7 updateAvailabilityStatus];
    uint64_t updated = UARPFirmwareUpdateAvailabilityStatusToString();
    [v7 releaseNotesAvailabilityStatus];
    *(_DWORD *)buf = 138544130;
    *(void *)&buf[4] = v11;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v6;
    *(_WORD *)&buf[22] = 2080;
    *(void *)&buf[24] = updated;
    __int16 v39 = 2080;
    uint64_t v40 = UARPFirmwareUpdateAvailabilityStatusToString();
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Firmware Update Available for accessory:%@, status:%s, release notes status:%s", buf, 0x2Au);
  }
  v13 = [(HMDMatterUARPControllerDelegate *)v9 accessoryFirmwareUpdateManager];
  if ([v13 supportsFirmwareUpdate])
  {
    int v14 = [v13 sessionForUARPAccessory:v6];
    if (v14)
    {
LABEL_5:
      [v14 assetAvailablityUpdateForAccessory:v6 assetID:v7];
LABEL_25:

      goto LABEL_26;
    }
    v19 = [v13 findHMDHAPAccessoryWithUARPAccessory:v6];
    int v14 = v19;
    if (v19)
    {
      v20 = [v19 firmwareVersion];
      v21 = [v7 softwareVersion];
      int v22 = [v20 isAtLeastVersion:v21];

      if (v22)
      {
        v23 = (void *)MEMORY[0x230FBD990]();
        v24 = v9;
        v25 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          v26 = HMFGetLogIdentifier();
          v27 = [v7 softwareVersion];
          v28 = [v14 firmwareVersion];
          *(_DWORD *)buf = 138543874;
          *(void *)&buf[4] = v26;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v27;
          *(_WORD *)&buf[22] = 2112;
          *(void *)&buf[24] = v28;
          _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_INFO, "%{public}@Available version %@ is equal or older than current accessory version %@", buf, 0x20u);

LABEL_23:
        }
LABEL_24:

        goto LABEL_25;
      }
      if (![v13 hasReachedMaximumFirmwareUpdateRetriesForAccessory:v14 assetID:v7])
      {
        uint64_t v36 = [v13 addSessionForUARPAccessory:v6];

        int v14 = (void *)v36;
        goto LABEL_5;
      }
      v23 = (void *)MEMORY[0x230FBD990]();
      v33 = v9;
      v25 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        goto LABEL_24;
      }
      v26 = HMFGetLogIdentifier();
      *(void *)buf = 0;
      *(void *)&buf[8] = 0;
      v34 = [v14 uuid];

      if (v34)
      {
        v35 = [v14 uuid];
        [v35 getUUIDBytes:buf];
      }
      else
      {
        *(_OWORD *)buf = *MEMORY[0x263F42690];
      }
      long long v37 = *(_OWORD *)buf;
      *(_DWORD *)buf = 138543874;
      *(void *)&buf[4] = v26;
      *(_WORD *)&buf[12] = 1040;
      *(_DWORD *)&buf[14] = 16;
      *(_WORD *)&buf[18] = 2096;
      *(void *)&buf[20] = &v37;
      v30 = "%{public}@No more retries for HAPAccessory %{uuid_t}.16P";
      v31 = v25;
      uint32_t v32 = 28;
    }
    else
    {
      v23 = (void *)MEMORY[0x230FBD990]();
      v29 = v9;
      v25 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        goto LABEL_24;
      }
      v26 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v26;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v6;
      v30 = "%{public}@Couldn't find HAPAccessory from UARPAccessory %@";
      v31 = v25;
      uint32_t v32 = 22;
    }
    _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_ERROR, v30, buf, v32);
    goto LABEL_23;
  }
  v15 = (void *)MEMORY[0x230FBD990]();
  uint64_t v16 = v9;
  v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    *(void *)&buf[4] = v18;
    _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@Firmware Update not supported on this device; ignoring",
      buf,
      0xCu);
  }
LABEL_26:
}

- (HMDMatterUARPControllerDelegate)initWithAccessoryFirmwareUpdateManager:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HMDMatterUARPControllerDelegate;
  v5 = [(HMDMatterUARPControllerDelegate *)&v8 init];
  id v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_accessoryFirmwareUpdateManager, v4);
  }

  return v6;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_181247 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_181247, &__block_literal_global_181248);
  }
  v2 = (void *)logCategory__hmf_once_v1_181249;
  return v2;
}

void __46__HMDMatterUARPControllerDelegate_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v1_181249;
  logCategory__hmf_once_v1_181249 = v0;
}

@end