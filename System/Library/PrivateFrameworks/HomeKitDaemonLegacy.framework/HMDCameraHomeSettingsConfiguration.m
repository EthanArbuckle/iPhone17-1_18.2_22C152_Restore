@interface HMDCameraHomeSettingsConfiguration
- (BOOL)isFaceClassificationEnabled;
- (BOOL)isOwner;
- (HMDCameraHomeSettingsConfiguration)initWithHome:(id)a3;
- (NSArray)cameraSettings;
- (NSArray)userSettings;
- (unint64_t)enabledResidentsDeviceCapabilities;
@end

@implementation HMDCameraHomeSettingsConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userSettings, 0);
  objc_storeStrong((id *)&self->_cameraSettings, 0);
}

- (BOOL)isOwner
{
  return self->_owner;
}

- (BOOL)isFaceClassificationEnabled
{
  return self->_faceClassificationEnabled;
}

- (unint64_t)enabledResidentsDeviceCapabilities
{
  return self->_enabledResidentsDeviceCapabilities;
}

- (NSArray)userSettings
{
  return self->_userSettings;
}

- (NSArray)cameraSettings
{
  return self->_cameraSettings;
}

- (HMDCameraHomeSettingsConfiguration)initWithHome:(id)a3
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v63.receiver = self;
  v63.super_class = (Class)HMDCameraHomeSettingsConfiguration;
  v5 = [(HMDCameraHomeSettingsConfiguration *)&v63 init];
  v6 = v5;
  if (v5)
  {
    v49 = v5;
    v7 = [MEMORY[0x1E4F1CA48] array];
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    v50 = v4;
    v8 = [v4 accessories];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v59 objects:v70 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v60;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v60 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(id *)(*((void *)&v59 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v14 = v13;
          }
          else {
            v14 = 0;
          }
          id v15 = v14;

          v16 = [v15 cameraProfiles];
          uint64_t v17 = [v16 count];

          if (v17)
          {
            v18 = [[HMDCameraAccessorySettingsConfiguration alloc] initWithCameraAccessory:v15];
            [v7 addObject:v18];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v59 objects:v70 count:16];
      }
      while (v10);
    }

    uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithArray:v7];
    cameraSettings = v49->_cameraSettings;
    v49->_cameraSettings = (NSArray *)v19;

    v21 = (void *)MEMORY[0x1D9452090]();
    v22 = v49;
    v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      v24 = HMFGetLogIdentifier();
      v25 = [(HMDCameraHomeSettingsConfiguration *)v22 cameraSettings];
      *(_DWORD *)buf = 138543618;
      v67 = v24;
      __int16 v68 = 2112;
      v69 = v25;
      _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_DEBUG, "%{public}@Camera accessory settings: %@", buf, 0x16u);
    }
    v26 = [MEMORY[0x1E4F1CA48] array];
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    v27 = [v50 users];
    uint64_t v28 = [v27 countByEnumeratingWithState:&v55 objects:v65 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v56;
      do
      {
        for (uint64_t j = 0; j != v29; ++j)
        {
          if (*(void *)v56 != v30) {
            objc_enumerationMutation(v27);
          }
          v32 = [[HMDCameraUserSettingsConfiguration alloc] initWithUser:*(void *)(*((void *)&v55 + 1) + 8 * j)];
          [v26 addObject:v32];
        }
        uint64_t v29 = [v27 countByEnumeratingWithState:&v55 objects:v65 count:16];
      }
      while (v29);
    }

    uint64_t v33 = [MEMORY[0x1E4F1C978] arrayWithArray:v26];
    userSettings = v22->_userSettings;
    v22->_userSettings = (NSArray *)v33;

    v35 = (void *)MEMORY[0x1D9452090]();
    v36 = v22;
    v37 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
    {
      v38 = HMFGetLogIdentifier();
      v39 = [(HMDCameraHomeSettingsConfiguration *)v36 userSettings];
      *(_DWORD *)buf = 138543618;
      v67 = v38;
      __int16 v68 = 2112;
      v69 = v39;
      _os_log_impl(&dword_1D49D5000, v37, OS_LOG_TYPE_DEBUG, "%{public}@Camera user settings: %@", buf, 0x16u);
    }
    id v4 = v50;
    v40 = [v50 personManagerSettings];
    v36->_faceClassificationEnabled = [v40 isFaceClassificationEnabled];

    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    v41 = [v50 residentDeviceManager];
    v42 = [v41 availableResidentDevices];

    uint64_t v43 = [v42 countByEnumeratingWithState:&v51 objects:v64 count:16];
    if (v43)
    {
      uint64_t v44 = v43;
      uint64_t v45 = *(void *)v52;
      do
      {
        for (uint64_t k = 0; k != v44; ++k)
        {
          if (*(void *)v52 != v45) {
            objc_enumerationMutation(v42);
          }
          v47 = *(void **)(*((void *)&v51 + 1) + 8 * k);
          if ([v47 isEnabled]) {
            v36->_enabledResidentsDeviceCapabilities |= [v47 legacyResidentCapabilities];
          }
        }
        uint64_t v44 = [v42 countByEnumeratingWithState:&v51 objects:v64 count:16];
      }
      while (v44);
    }

    v36->_owner = [v50 isOwnerUser];
    v6 = v49;
  }

  return v6;
}

@end