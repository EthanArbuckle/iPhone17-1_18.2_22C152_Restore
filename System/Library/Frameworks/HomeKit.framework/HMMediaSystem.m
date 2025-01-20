@interface HMMediaSystem
+ (BOOL)supportsSecureCoding;
+ (id)logCategory;
+ (id)mediaSystemWithDictionary:(id)a3 home:(id)a4;
- (BOOL)_mergeApplicationDataWithNewMediaSystem:(id)a3;
- (BOOL)_mergeComponentsWithNewMediaSystem:(id)a3;
- (BOOL)_mergeLegacySettingsWithNewMediaSystem:(id)a3;
- (BOOL)_mergeNameWithNewMediaSystem:(id)a3;
- (BOOL)_mergeSettingsWithNewMediaSystem:(id)a3;
- (BOOL)_mergeWithNewMediaSystem:(id)a3 isFromSerializedData:(BOOL)a4;
- (BOOL)configureSettingsAdaptorIfNeeded;
- (BOOL)isCompatible;
- (BOOL)isControllable;
- (BOOL)isEqual:(id)a3;
- (BOOL)mergeAudioDestinationWithNewMediaSystem:(id)a3;
- (BOOL)mergeFromNewObject:(id)a3;
- (BOOL)mergeFromNewObject:(id)a3 isFromSerializedData:(BOOL)a4;
- (BOOL)mergeSupportsMessagedHomepodSettingsWithNewMediaSystem:(id)a3;
- (BOOL)supportsAudioDestination;
- (BOOL)supportsAudioGroup;
- (BOOL)supportsMessagedHomepodSettings;
- (HMAccessoryCategory)category;
- (HMAccessorySettings)settings;
- (HMAccessorySettingsAdapter)mediaSystemSettingsAdapter;
- (HMAccessorySettingsController)accessorySettingsController;
- (HMAccessorySettingsDataSource)accessorySettingsDataSource;
- (HMApplicationData)applicationData;
- (HMHome)home;
- (HMMediaDestination)audioDestination;
- (HMMediaSession)mediaSession;
- (HMMediaSystem)initWithCoder:(id)a3;
- (HMMediaSystem)initWithHome:(id)a3 uuid:(id)a4 name:(id)a5 configuredName:(id)a6 compatible:(BOOL)a7 components:(id)a8 settings:(id)a9;
- (HMMediaSystemDelegate)delegate;
- (HMMutableArray)componentsArray;
- (HMSymptomsHandler)symptomsHandler;
- (NSArray)audioDestinationMediaProfiles;
- (NSArray)components;
- (NSString)audioDestinationIdentifier;
- (NSString)audioDestinationParentIdentifier;
- (NSString)configuredName;
- (NSString)description;
- (NSString)name;
- (NSUUID)audioDestinationGroupIdentifier;
- (NSUUID)uniqueIdentifier;
- (NSUUID)uuid;
- (_HMContext)context;
- (id)logIdentifier;
- (id)targetAccessoryIdentifierBySerial;
- (int64_t)audioDestinationType;
- (unint64_t)hash;
- (void)__configureWithContext:(id)a3 home:(id)a4;
- (void)_handleRootSettingsUpdated:(id)a3;
- (void)_handleSystemUpdatedNotification:(id)a3;
- (void)_registerNotificationHandlers;
- (void)_unconfigure;
- (void)_updateAccessoryReference;
- (void)_updateApplicationData:(id)a3 completionHandler:(id)a4;
- (void)adapter:(id)a3 didUpdatePreferredMediaUserUUIDString:(id)a4 selectionType:(unint64_t)a5;
- (void)adapter:(id)a3 didUpdateSettingKeyPaths:(id)a4;
- (void)adapter:(id)a3 didUpdateSettings:(id)a4;
- (void)callCompletionHandler:(id)a3;
- (void)callCompletionHandler:(id)a3 error:(id)a4;
- (void)notifyDelegateOfUpdatedApplicationData:(id)a3;
- (void)notifyDelegateOfUpdatedAudioDestination;
- (void)notifyDelegateOfUpdatedComponents:(id)a3;
- (void)notifyDelegateOfUpdatedConfiguredName:(id)a3;
- (void)notifyDelegateOfUpdatedMediaSession:(id)a3;
- (void)notifyDelegateOfUpdatedName:(id)a3;
- (void)notifyDelegateOfUpdatedSettings:(id)a3;
- (void)postConfigure;
- (void)setAccessorySettingsController:(id)a3;
- (void)setAccessorySettingsDataSource:(id)a3;
- (void)setApplicationData:(id)a3;
- (void)setAudioDestination:(id)a3;
- (void)setComponentsArray:(id)a3;
- (void)setConfiguredName:(id)a3;
- (void)setContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHome:(id)a3;
- (void)setMediaSystemSettingsAdapter:(id)a3;
- (void)setName:(id)a3;
- (void)setSettings:(id)a3;
- (void)updateApplicationData:(id)a3 completionHandler:(id)a4;
- (void)updateAudioDestinationSupportedOptions:(unint64_t)a3 completion:(id)a4;
- (void)updateComponentsSettingsAdapterToSettingReflected;
- (void)updateMediaSession:(id)a3 forMediaProfile:(id)a4;
- (void)updateSettingWithKeyPath:(id)a3 value:(id)a4 completionHandler:(id)a5;
@end

@implementation HMMediaSystem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioDestination, 0);
  objc_storeStrong((id *)&self->_componentsArray, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_mediaSystemSettingsAdapter, 0);
  objc_storeStrong((id *)&self->_accessorySettingsController, 0);
  objc_storeStrong((id *)&self->_accessorySettingsDataSource, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_applicationData, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_configuredName, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (void)setAudioDestination:(id)a3
{
}

- (HMMediaDestination)audioDestination
{
  return (HMMediaDestination *)objc_getProperty(self, a2, 120, 1);
}

- (void)setComponentsArray:(id)a3
{
}

- (HMMutableArray)componentsArray
{
  return self->_componentsArray;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setMediaSystemSettingsAdapter:(id)a3
{
}

- (HMAccessorySettingsAdapter)mediaSystemSettingsAdapter
{
  return self->_mediaSystemSettingsAdapter;
}

- (void)setAccessorySettingsController:(id)a3
{
}

- (HMAccessorySettingsController)accessorySettingsController
{
  return self->_accessorySettingsController;
}

- (void)setAccessorySettingsDataSource:(id)a3
{
}

- (HMAccessorySettingsDataSource)accessorySettingsDataSource
{
  return self->_accessorySettingsDataSource;
}

- (void)setContext:(id)a3
{
}

- (_HMContext)context
{
  return self->_context;
}

- (void)setHome:(id)a3
{
}

- (HMHome)home
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);

  return (HMHome *)WeakRetained;
}

- (id)targetAccessoryIdentifierBySerial
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v3 = [(HMMediaSystem *)self components];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    v6 = 0;
    uint64_t v7 = *(void *)v29;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v29 != v7) {
        objc_enumerationMutation(v3);
      }
      v9 = [*(id *)(*((void *)&v28 + 1) + 8 * v8) accessory];
      if (!v9) {
        break;
      }
      v10 = v9;
      v11 = [v9 serialNumber];

      if (!v11)
      {
        v21 = (void *)MEMORY[0x19F3A64A0]();
        v25 = self;
        v23 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          v26 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v33 = v26;
          _os_log_impl(&dword_19D1A8000, v23, OS_LOG_TYPE_ERROR, "%{public}@Missing serial number cannot determine target", buf, 0xCu);
        }
LABEL_22:

        goto LABEL_23;
      }
      if (!v6
        || ([v6 serialNumber],
            v12 = objc_claimAutoreleasedReturnValue(),
            [v10 serialNumber],
            v13 = objc_claimAutoreleasedReturnValue(),
            uint64_t v14 = [v12 compare:v13],
            v13,
            v12,
            v14 == 1))
      {
        id v15 = v10;

        v6 = v15;
      }

      if (v5 == ++v8)
      {
        uint64_t v5 = [v3 countByEnumeratingWithState:&v28 objects:v34 count:16];
        if (v5) {
          goto LABEL_3;
        }

        v16 = [v6 uniqueIdentifier];

        goto LABEL_24;
      }
    }
    v21 = (void *)MEMORY[0x19F3A64A0]();
    v22 = self;
    v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v33 = v24;
      _os_log_impl(&dword_19D1A8000, v23, OS_LOG_TYPE_ERROR, "%{public}@Missing accessory cannot determine target", buf, 0xCu);
    }
    v10 = 0;
    goto LABEL_22;
  }

  v17 = (void *)MEMORY[0x19F3A64A0]();
  v18 = self;
  v19 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    v20 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v33 = v20;
    _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to find target accessory by serial", buf, 0xCu);
  }
LABEL_23:
  v16 = 0;
LABEL_24:

  return v16;
}

- (void)updateSettingWithKeyPath:(id)a3 value:(id)a4 completionHandler:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, void *))a5;
  v11 = [(HMMediaSystem *)self mediaSystemSettingsAdapter];

  v12 = (void *)MEMORY[0x19F3A64A0]();
  v13 = self;
  uint64_t v14 = HMFGetOSLogHandle();
  id v15 = v14;
  if (v11)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v16 = HMFGetLogIdentifier();
      int v19 = 138544130;
      v20 = v16;
      __int16 v21 = 2112;
      v22 = v13;
      __int16 v23 = 2112;
      id v24 = v8;
      __int16 v25 = 2112;
      id v26 = v9;
      _os_log_impl(&dword_19D1A8000, v15, OS_LOG_TYPE_INFO, "%{public}@Media system %@ update setting %@ with value %@", (uint8_t *)&v19, 0x2Au);
    }
    v17 = [(HMMediaSystem *)v13 mediaSystemSettingsAdapter];
    [v17 updateWithKeyPath:v8 value:v9 completionHandler:v10];
  }
  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v18 = HMFGetLogIdentifier();
      int v19 = 138543362;
      v20 = v18;
      _os_log_impl(&dword_19D1A8000, v15, OS_LOG_TYPE_ERROR, "%{public}@Calling update setting with settings adapter object being nil", (uint8_t *)&v19, 0xCu);
    }
    v17 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:8 reason:@"Adapter is nil" suggestion:@"Configure adapter before use it"];
    v10[2](v10, v17);
  }
}

- (void)adapter:(id)a3 didUpdatePreferredMediaUserUUIDString:(id)a4 selectionType:(unint64_t)a5
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = (void *)MEMORY[0x19F3A64A0]();
  v10 = self;
  v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v12 = HMFGetLogIdentifier();
    int v13 = 138543362;
    uint64_t v14 = v12;
    _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_ERROR, "%{public}@Preferred media user not supported.", (uint8_t *)&v13, 0xCu);
  }
}

- (void)adapter:(id)a3 didUpdateSettingKeyPaths:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x19F3A64A0]();
  id v9 = self;
  v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    v18 = v11;
    __int16 v19 = 2112;
    v20 = v9;
    __int16 v21 = 2112;
    id v22 = v7;
    _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Media system %@ did update settings %@", buf, 0x20u);
  }
  v12 = [(HMMediaSystem *)v9 context];
  int v13 = [v12 delegateCaller];

  if (v13)
  {
    objc_initWeak((id *)buf, v9);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __50__HMMediaSystem_adapter_didUpdateSettingKeyPaths___block_invoke;
    v14[3] = &unk_1E59449A0;
    objc_copyWeak(&v16, (id *)buf);
    id v15 = v7;
    [v13 invokeBlock:v14];

    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)buf);
  }
}

void __50__HMMediaSystem_adapter_didUpdateSettingKeyPaths___block_invoke(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [WeakRetained settings];
  v3 = [v2 delegate];

  if (objc_opt_respondsToSelector())
  {
    uint64_t v4 = (void *)MEMORY[0x19F3A64A0]();
    id v5 = WeakRetained;
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v33 = v7;
      _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_INFO, "%{public}@Notifying clients settings will update", buf, 0xCu);
    }
    id v8 = [v5 settings];
    [v3 settingsWillUpdate:v8];
  }
  if (objc_opt_respondsToSelector())
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id obj = *(id *)(a1 + 32);
    uint64_t v9 = [obj countByEnumeratingWithState:&v28 objects:v38 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v29 != v11) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void *)(*((void *)&v28 + 1) + 8 * i);
          uint64_t v14 = (void *)MEMORY[0x19F3A64A0]();
          id v15 = WeakRetained;
          id v16 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            v17 = HMFGetLogIdentifier();
            v18 = [v15 uniqueIdentifier];
            *(_DWORD *)buf = 138543874;
            v33 = v17;
            __int16 v34 = 2112;
            id v35 = v18;
            __int16 v36 = 2112;
            uint64_t v37 = v13;
            _os_log_impl(&dword_19D1A8000, v16, OS_LOG_TYPE_INFO, "%{public}@Notifying clients did update for identifier %@ setting %@", buf, 0x20u);
          }
          __int16 v19 = [v15 settings];
          v20 = [v15 uniqueIdentifier];
          [v3 settings:v19 didUpdateForIdentifier:v20 keyPath:v13];
        }
        uint64_t v10 = [obj countByEnumeratingWithState:&v28 objects:v38 count:16];
      }
      while (v10);
    }
  }
  if (objc_opt_respondsToSelector())
  {
    __int16 v21 = (void *)MEMORY[0x19F3A64A0]();
    id v22 = WeakRetained;
    uint64_t v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      id v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v33 = v24;
      __int16 v34 = 2112;
      id v35 = v22;
      _os_log_impl(&dword_19D1A8000, v23, OS_LOG_TYPE_INFO, "%{public}@Notifying clients settings did update: %@", buf, 0x16u);
    }
    __int16 v25 = [v22 settings];
    [v3 settingsDidUpdate:v25];
  }
}

- (void)adapter:(id)a3 didUpdateSettings:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMMediaSystem *)self settings];

  if (v8)
  {
    uint64_t v9 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v10 = self;
    uint64_t v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = HMFGetLogIdentifier();
      int v14 = 138543362;
      id v15 = v12;
      _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_ERROR, "%{public}@Attempt to set root group to non-nil settings.", (uint8_t *)&v14, 0xCu);
    }
  }
  else
  {
    [(HMMediaSystem *)self setSettings:v7];
    uint64_t v13 = [(HMMediaSystem *)self settings];
    [(HMMediaSystem *)self notifyDelegateOfUpdatedSettings:v13];
  }
}

- (void)updateAudioDestinationSupportedOptions:(unint64_t)a3 completion:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = (void *)MEMORY[0x19F3A64A0]();
  id v8 = self;
  uint64_t v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = HMFGetLogIdentifier();
    uint64_t v11 = [NSNumber numberWithUnsignedInteger:a3];
    *(_DWORD *)buf = 138543618;
    id v35 = v10;
    __int16 v36 = 2112;
    uint64_t v37 = v11;
    _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_INFO, "%{public}@Sending update audio destination support options message with options: %@", buf, 0x16u);
  }
  v12 = [(HMMediaSystem *)v8 context];
  uint64_t v13 = [v12 messageDispatcher];
  if (v13)
  {
    v32 = @"HMMediaDestinationSupportedOptionsPayloadKey";
    int v14 = [NSNumber numberWithUnsignedInteger:a3];
    v33 = v14;
    id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];

    id v16 = objc_alloc(MEMORY[0x1E4F65488]);
    v17 = [(HMMediaSystem *)v8 audioDestination];
    v18 = [v17 uniqueIdentifier];
    __int16 v19 = (void *)[v16 initWithTarget:v18];

    v20 = (void *)[objc_alloc(MEMORY[0x1E4F654B0]) initWithName:@"HMMediaDestinationUpdateSupportedOptionsRequestMessage" destination:v19 payload:v15];
    uint64_t v26 = MEMORY[0x1E4F143A8];
    uint64_t v27 = 3221225472;
    long long v28 = __67__HMMediaSystem_updateAudioDestinationSupportedOptions_completion___block_invoke;
    long long v29 = &unk_1E5944EF0;
    long long v30 = v8;
    id v31 = v6;
    [v20 setResponseHandler:&v26];
    __int16 v21 = objc_msgSend(v20, "copy", v26, v27, v28, v29, v30);
    [v13 sendMessage:v21];
  }
  else
  {
    id v22 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v23 = v8;
    id v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      __int16 v25 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v35 = v25;
      __int16 v36 = 2112;
      uint64_t v37 = v12;
      _os_log_impl(&dword_19D1A8000, v24, OS_LOG_TYPE_ERROR, "%{public}@Failed to update destination support options due to no message dispatcher given by context: %@", buf, 0x16u);
    }
    id v15 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:15];
    [(HMMediaSystem *)v23 callCompletionHandler:v6 error:v15];
  }
}

void __67__HMMediaSystem_updateAudioDestinationSupportedOptions_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x19F3A64A0]();
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = HMFGetOSLogHandle();
  uint64_t v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      int v13 = 138543618;
      int v14 = v11;
      __int16 v15 = 2112;
      id v16 = v5;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Update destination supported options request message responded with error: %@", (uint8_t *)&v13, 0x16u);
    }
    [*(id *)(a1 + 32) callCompletionHandler:*(void *)(a1 + 40) error:v5];
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v12 = HMFGetLogIdentifier();
      int v13 = 138543362;
      int v14 = v12;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Update destination supported options request message succeeded", (uint8_t *)&v13, 0xCu);
    }
    [*(id *)(a1 + 32) callCompletionHandler:*(void *)(a1 + 40)];
  }
}

- (NSUUID)audioDestinationGroupIdentifier
{
  v2 = [(HMMediaSystem *)self audioDestination];
  v3 = [v2 audioGroupIdentifier];

  return (NSUUID *)v3;
}

- (NSArray)audioDestinationMediaProfiles
{
  v2 = [(HMMediaSystem *)self components];
  v3 = (void *)[v2 copy];

  uint64_t v4 = objc_msgSend(v3, "na_map:", &__block_literal_global_85);

  return (NSArray *)v4;
}

uint64_t __46__HMMediaSystem_audioDestinationMediaProfiles__block_invoke(uint64_t a1, void *a2)
{
  return [a2 mediaProfile];
}

- (NSString)audioDestinationParentIdentifier
{
  v2 = [(HMMediaSystem *)self uuid];
  v3 = [v2 UUIDString];

  return (NSString *)v3;
}

- (BOOL)supportsMessagedHomepodSettings
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(HMMediaSystem *)self components];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = [*(id *)(*((void *)&v9 + 1) + 8 * i) accessory];
        char v7 = [v6 supportsMessagedHomePodSettings];

        if (v7)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)supportsAudioGroup
{
  v2 = [(HMMediaSystem *)self audioDestination];
  char v3 = [v2 containsSupportedOptions:8];

  return v3;
}

- (BOOL)supportsAudioDestination
{
  v2 = [(HMMediaSystem *)self audioDestination];
  char v3 = [v2 containsHomeTheaterSupportedOptions];

  return v3;
}

- (int64_t)audioDestinationType
{
  v2 = [(HMMediaSystem *)self audioDestination];
  BOOL v3 = v2 != 0;

  return 2 * v3;
}

- (NSString)audioDestinationIdentifier
{
  v2 = [(HMMediaSystem *)self audioDestination];
  BOOL v3 = [v2 identifier];

  return (NSString *)v3;
}

- (void)callCompletionHandler:(id)a3 error:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = [(HMMediaSystem *)self context];
    long long v9 = [v8 delegateCaller];
    long long v10 = v9;
    if (v9)
    {
      [v9 callCompletion:v6 error:v7];
    }
    else
    {
      __int16 v15 = (void *)MEMORY[0x19F3A64A0]();
      id v16 = self;
      uint64_t v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = HMFGetLogIdentifier();
        int v19 = 138543618;
        v20 = v18;
        __int16 v21 = 2112;
        id v22 = v8;
        _os_log_impl(&dword_19D1A8000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to call client completion handler due to no delegate caller given by context: %@", (uint8_t *)&v19, 0x16u);
      }
    }
  }
  else
  {
    long long v11 = (void *)MEMORY[0x19F3A64A0]();
    long long v12 = self;
    int v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = HMFGetLogIdentifier();
      int v19 = 138543362;
      v20 = v14;
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to call client completion handler due to no handler provided", (uint8_t *)&v19, 0xCu);
    }
  }
}

- (void)callCompletionHandler:(id)a3
{
}

- (HMMediaSystem)initWithCoder:(id)a3
{
  v24[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 decodeBoolForKey:kMediaSystemInvalidObjectFlagCodingKey])
  {
    id v5 = 0;
  }
  else
  {
    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"home"];
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:kMediaSystemUUIDCodingKey];
    id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:kMediaSystemNameCodingKey];
    id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:kMediaSystemConfiguredNameCodingKey];
    uint64_t v9 = [v4 decodeBoolForKey:kMediaSystemCompatibleCodingKey];
    long long v10 = (void *)MEMORY[0x1E4F1CAD0];
    v24[0] = objc_opt_class();
    v24[1] = objc_opt_class();
    long long v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
    long long v12 = [v10 setWithArray:v11];
    int v13 = [v4 decodeObjectOfClasses:v12 forKey:kMediaSystemComponentsCodingKey];

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:kMediaSystemRootSettingsCodingKey];
    if (v14 && (_os_feature_enabled_impl() & 1) == 0)
    {
      id v16 = [[HMAccessorySettingGroup alloc] initWithInternal:v14];
      __int16 v15 = [[HMAccessorySettings alloc] initWithSettingsContainer:self settingsControl:self rootGroup:v16];
    }
    else
    {
      __int16 v15 = 0;
    }
    uint64_t v17 = [(HMMediaSystem *)self initWithHome:v23 uuid:v6 name:v7 configuredName:v8 compatible:v9 components:v13 settings:v15];
    if (v17)
    {
      v18 = [[HMApplicationData alloc] initWithDictionaryFromCoder:v4 key:@"HM.appData"];
      applicationData = v17->_applicationData;
      v17->_applicationData = v18;

      uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:HMMediaSystemAudioDestinationCodingKey];
      audioDestination = v17->_audioDestination;
      v17->_audioDestination = (HMMediaDestination *)v20;
    }
    self = v17;

    id v5 = self;
  }

  return v5;
}

- (id)logIdentifier
{
  v2 = [(HMMediaSystem *)self uuid];
  BOOL v3 = [v2 UUIDString];

  return v3;
}

- (void)notifyDelegateOfUpdatedAudioDestination
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(HMMediaSystem *)self context];
  id v4 = [v3 delegateCaller];
  if (v4)
  {
    id v5 = [(HMMediaSystem *)self delegate];
    id v6 = (void *)MEMORY[0x19F3A64A0]();
    id v7 = self;
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = HMFGetLogIdentifier();
      long long v10 = [(HMMediaSystem *)v7 audioDestination];
      *(_DWORD *)buf = 138543874;
      int v19 = v9;
      __int16 v20 = 2112;
      __int16 v21 = v10;
      __int16 v22 = 2112;
      uint64_t v23 = v5;
      _os_log_impl(&dword_19D1A8000, v8, OS_LOG_TYPE_INFO, "%{public}@Notifying client of updated audio destination: %@ with delegate: %@", buf, 0x20u);
    }
    if (objc_opt_respondsToSelector())
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __56__HMMediaSystem_notifyDelegateOfUpdatedAudioDestination__block_invoke;
      v15[3] = &unk_1E5945628;
      id v16 = v5;
      uint64_t v17 = v7;
      [v4 invokeBlock:v15];
    }
  }
  else
  {
    long long v11 = (void *)MEMORY[0x19F3A64A0]();
    long long v12 = self;
    int v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      int v19 = v14;
      __int16 v20 = 2112;
      __int16 v21 = v3;
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to notify client of updated audio destination due to no delegate caller for context: %@", buf, 0x16u);
    }
  }
}

uint64_t __56__HMMediaSystem_notifyDelegateOfUpdatedAudioDestination__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) mediaSystemDidUpdateAudioDestination:*(void *)(a1 + 40)];
}

- (void)notifyDelegateOfUpdatedMediaSession:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMMediaSystem *)self context];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 queue];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __53__HMMediaSystem_notifyDelegateOfUpdatedMediaSession___block_invoke;
    v12[3] = &unk_1E5945628;
    v12[4] = self;
    id v13 = v4;
    dispatch_async(v7, v12);
  }
  else
  {
    id v8 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v9 = self;
    long long v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      long long v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v15 = v11;
      __int16 v16 = 2080;
      uint64_t v17 = "-[HMMediaSystem notifyDelegateOfUpdatedMediaSession:]";
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
    }
  }
}

void __53__HMMediaSystem_notifyDelegateOfUpdatedMediaSession___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    id v7 = [*(id *)(a1 + 32) components];
    *(_DWORD *)buf = 138543874;
    int v19 = v5;
    __int16 v20 = 2112;
    uint64_t v21 = v6;
    __int16 v22 = 2112;
    uint64_t v23 = v7;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@Notifying client of updated media system session: %@ for components: [%@]", buf, 0x20u);
  }
  id v8 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v9 = [*(id *)(a1 + 32) context];
    long long v10 = [v9 delegateCaller];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __53__HMMediaSystem_notifyDelegateOfUpdatedMediaSession___block_invoke_69;
    v14[3] = &unk_1E5945650;
    id v11 = v8;
    uint64_t v12 = *(void *)(a1 + 32);
    id v13 = *(void **)(a1 + 40);
    id v15 = v11;
    uint64_t v16 = v12;
    id v17 = v13;
    [v10 invokeBlock:v14];
  }
}

uint64_t __53__HMMediaSystem_notifyDelegateOfUpdatedMediaSession___block_invoke_69(uint64_t a1)
{
  return [*(id *)(a1 + 32) mediaObject:*(void *)(a1 + 40) didUpdateMediaSession:*(void *)(a1 + 48)];
}

- (void)notifyDelegateOfUpdatedSettings:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMMediaSystem *)self context];
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = [v5 queue];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __49__HMMediaSystem_notifyDelegateOfUpdatedSettings___block_invoke;
    v12[3] = &unk_1E5945628;
    v12[4] = self;
    id v13 = v4;
    dispatch_async(v7, v12);
  }
  else
  {
    id v8 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v9 = self;
    long long v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v15 = v11;
      __int16 v16 = 2080;
      id v17 = "-[HMMediaSystem notifyDelegateOfUpdatedSettings:]";
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
    }
  }
}

void __49__HMMediaSystem_notifyDelegateOfUpdatedSettings___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    uint64_t v18 = v5;
    __int16 v19 = 2112;
    uint64_t v20 = v6;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@Notifying client of updated media system settings: {%@}", buf, 0x16u);
  }
  id v7 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector())
  {
    id v8 = [*(id *)(a1 + 32) context];
    uint64_t v9 = [v8 delegateCaller];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __49__HMMediaSystem_notifyDelegateOfUpdatedSettings___block_invoke_66;
    v13[3] = &unk_1E5945650;
    id v10 = v7;
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v12 = *(void **)(a1 + 40);
    id v14 = v10;
    uint64_t v15 = v11;
    id v16 = v12;
    [v9 invokeBlock:v13];
  }
}

uint64_t __49__HMMediaSystem_notifyDelegateOfUpdatedSettings___block_invoke_66(uint64_t a1)
{
  return [*(id *)(a1 + 32) mediaObject:*(void *)(a1 + 40) didUpdateSettings:*(void *)(a1 + 48)];
}

- (void)notifyDelegateOfUpdatedApplicationData:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMMediaSystem *)self context];
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = [v5 queue];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __56__HMMediaSystem_notifyDelegateOfUpdatedApplicationData___block_invoke;
    v12[3] = &unk_1E5945628;
    v12[4] = self;
    id v13 = v4;
    dispatch_async(v7, v12);
  }
  else
  {
    id v8 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v9 = self;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v15 = v11;
      __int16 v16 = 2080;
      id v17 = "-[HMMediaSystem notifyDelegateOfUpdatedApplicationData:]";
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
    }
  }
}

void __56__HMMediaSystem_notifyDelegateOfUpdatedApplicationData___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    uint64_t v18 = v5;
    __int16 v19 = 2112;
    uint64_t v20 = v6;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@Notifying client of updated media system app data: {%@}", buf, 0x16u);
  }
  id v7 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector())
  {
    id v8 = [*(id *)(a1 + 32) context];
    uint64_t v9 = [v8 delegateCaller];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __56__HMMediaSystem_notifyDelegateOfUpdatedApplicationData___block_invoke_63;
    v13[3] = &unk_1E5945650;
    id v10 = v7;
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v12 = *(void **)(a1 + 40);
    id v14 = v10;
    uint64_t v15 = v11;
    id v16 = v12;
    [v9 invokeBlock:v13];
  }
}

uint64_t __56__HMMediaSystem_notifyDelegateOfUpdatedApplicationData___block_invoke_63(uint64_t a1)
{
  return [*(id *)(a1 + 32) mediaSystem:*(void *)(a1 + 40) didUpdateApplicationData:*(void *)(a1 + 48)];
}

- (void)notifyDelegateOfUpdatedComponents:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMMediaSystem *)self context];
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = [v5 delegateCaller];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __51__HMMediaSystem_notifyDelegateOfUpdatedComponents___block_invoke;
    v12[3] = &unk_1E5945628;
    v12[4] = self;
    id v13 = v4;
    [v7 invokeBlock:v12];
  }
  else
  {
    id v8 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v9 = self;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v15 = v11;
      __int16 v16 = 2080;
      id v17 = "-[HMMediaSystem notifyDelegateOfUpdatedComponents:]";
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
    }
  }
}

void __51__HMMediaSystem_notifyDelegateOfUpdatedComponents___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) delegate];
  id v3 = (void *)MEMORY[0x19F3A64A0]();
  id v4 = *(id *)(a1 + 32);
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = HMFGetLogIdentifier();
    id v7 = [*(id *)(a1 + 32) components];
    int v8 = 138543874;
    uint64_t v9 = v6;
    __int16 v10 = 2112;
    uint64_t v11 = v7;
    __int16 v12 = 2112;
    id v13 = v2;
    _os_log_impl(&dword_19D1A8000, v5, OS_LOG_TYPE_INFO, "%{public}@Notifying client of updated media system components: %@ delegate: %@", (uint8_t *)&v8, 0x20u);
  }
  if (objc_opt_respondsToSelector()) {
    [v2 mediaSystem:*(void *)(a1 + 32) didUpdateComponents:*(void *)(a1 + 40)];
  }
}

- (void)notifyDelegateOfUpdatedConfiguredName:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMMediaSystem *)self context];
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = [v5 queue];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __55__HMMediaSystem_notifyDelegateOfUpdatedConfiguredName___block_invoke;
    v12[3] = &unk_1E5945628;
    v12[4] = self;
    id v13 = v4;
    dispatch_async(v7, v12);
  }
  else
  {
    int v8 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v9 = self;
    __int16 v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v15 = v11;
      __int16 v16 = 2080;
      id v17 = "-[HMMediaSystem notifyDelegateOfUpdatedConfiguredName:]";
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
    }
  }
}

void __55__HMMediaSystem_notifyDelegateOfUpdatedConfiguredName___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    uint64_t v18 = v5;
    __int16 v19 = 2112;
    uint64_t v20 = v6;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@Notifying client of updated media system configured name: %@", buf, 0x16u);
  }
  id v7 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector())
  {
    int v8 = [*(id *)(a1 + 32) context];
    uint64_t v9 = [v8 delegateCaller];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __55__HMMediaSystem_notifyDelegateOfUpdatedConfiguredName___block_invoke_58;
    v13[3] = &unk_1E5945650;
    id v10 = v7;
    uint64_t v11 = *(void *)(a1 + 32);
    __int16 v12 = *(void **)(a1 + 40);
    id v14 = v10;
    uint64_t v15 = v11;
    id v16 = v12;
    [v9 invokeBlock:v13];
  }
}

uint64_t __55__HMMediaSystem_notifyDelegateOfUpdatedConfiguredName___block_invoke_58(uint64_t a1)
{
  return [*(id *)(a1 + 32) mediaSystem:*(void *)(a1 + 40) didUpdateConfiguredName:*(void *)(a1 + 48)];
}

- (void)notifyDelegateOfUpdatedName:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMMediaSystem *)self context];
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = [v5 queue];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __45__HMMediaSystem_notifyDelegateOfUpdatedName___block_invoke;
    v12[3] = &unk_1E5945628;
    v12[4] = self;
    id v13 = v4;
    dispatch_async(v7, v12);
  }
  else
  {
    int v8 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v9 = self;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v15 = v11;
      __int16 v16 = 2080;
      id v17 = "-[HMMediaSystem notifyDelegateOfUpdatedName:]";
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
    }
  }
}

void __45__HMMediaSystem_notifyDelegateOfUpdatedName___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) context];
  id v3 = [v2 delegateCaller];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    id v5 = (void *)MEMORY[0x19F3A64A0]();
    id v6 = *(id *)(a1 + 32);
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v8 = HMFGetLogIdentifier();
      uint64_t v9 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      uint64_t v23 = v8;
      __int16 v24 = 2112;
      uint64_t v25 = v9;
      __int16 v26 = 2112;
      uint64_t v27 = v4;
      _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_INFO, "%{public}@Notifying client of did update name: %@ delegate: %@", buf, 0x20u);
    }
    if (objc_opt_respondsToSelector())
    {
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __45__HMMediaSystem_notifyDelegateOfUpdatedName___block_invoke_55;
      v18[3] = &unk_1E5945650;
      id v10 = v4;
      uint64_t v11 = *(void *)(a1 + 32);
      __int16 v12 = *(void **)(a1 + 40);
      id v19 = v10;
      uint64_t v20 = v11;
      id v21 = v12;
      [v3 invokeBlock:v18];
    }
  }
  else
  {
    id v13 = (void *)MEMORY[0x19F3A64A0]();
    id v14 = *(id *)(a1 + 32);
    uint64_t v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      __int16 v16 = HMFGetLogIdentifier();
      uint64_t v17 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v23 = v16;
      __int16 v24 = 2112;
      uint64_t v25 = v17;
      _os_log_impl(&dword_19D1A8000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to get delegate caller to notify client of did update name: %@", buf, 0x16u);
    }
  }
}

uint64_t __45__HMMediaSystem_notifyDelegateOfUpdatedName___block_invoke_55(uint64_t a1)
{
  return [*(id *)(a1 + 32) mediaSystem:*(void *)(a1 + 40) didUpdateName:*(void *)(a1 + 48)];
}

- (void)updateMediaSession:(id)a3 forMediaProfile:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = [(HMMediaSystem *)self context];
  uint64_t v9 = v8;
  if (v8)
  {
    id v10 = [v8 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __52__HMMediaSystem_updateMediaSession_forMediaProfile___block_invoke;
    block[3] = &unk_1E5945650;
    block[4] = self;
    id v16 = v6;
    id v17 = v7;
    dispatch_async(v10, block);
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x19F3A64A0]();
    __int16 v12 = self;
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v19 = v14;
      __int16 v20 = 2080;
      id v21 = "-[HMMediaSystem updateMediaSession:forMediaProfile:]";
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
    }
  }
}

void __52__HMMediaSystem_updateMediaSession_forMediaProfile___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    id v7 = [*(id *)(a1 + 32) components];
    *(_DWORD *)buf = 138543874;
    id v21 = v5;
    __int16 v22 = 2112;
    uint64_t v23 = v6;
    __int16 v24 = 2112;
    uint64_t v25 = v7;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@Updated media system session: %@ for components: [%@]", buf, 0x20u);
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  int v8 = objc_msgSend(*(id *)(a1 + 32), "components", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = [*(id *)(*((void *)&v15 + 1) + 8 * i) mediaProfile];
        id v14 = *(void **)(a1 + 48);

        if (v13 == v14)
        {
          [*(id *)(a1 + 32) notifyDelegateOfUpdatedMediaSession:*(void *)(a1 + 40)];
          goto LABEL_13;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_13:
}

- (BOOL)mergeAudioDestinationWithNewMediaSystem:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMMediaSystem *)self audioDestination];
  uint64_t v6 = [v4 audioDestination];
  char v7 = HMFEqualObjects();
  if ((v7 & 1) == 0)
  {
    int v8 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v9 = self;
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      long long v16 = v11;
      __int16 v17 = 2112;
      long long v18 = v5;
      __int16 v19 = 2112;
      __int16 v20 = v6;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Updating audio destination: %@ new audio destination: %@", buf, 0x20u);
    }
    [(HMMediaSystem *)v9 setAudioDestination:v6];
    __int16 v12 = [(HMMediaSystem *)v9 context];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __57__HMMediaSystem_mergeAudioDestinationWithNewMediaSystem___block_invoke;
    v14[3] = &unk_1E59452E8;
    void v14[4] = v9;
    HMDispatchToContextQueueIfNotNil(v9, v12, v14);
  }
  return v7 ^ 1;
}

uint64_t __57__HMMediaSystem_mergeAudioDestinationWithNewMediaSystem___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) notifyDelegateOfUpdatedAudioDestination];
}

- (BOOL)mergeSupportsMessagedHomepodSettingsWithNewMediaSystem:(id)a3
{
  int v4 = [a3 supportsMessagedHomepodSettings];
  if (v4)
  {
    LOBYTE(v4) = [(HMMediaSystem *)self configureSettingsAdaptorIfNeeded];
  }
  return v4;
}

- (BOOL)_mergeLegacySettingsWithNewMediaSystem:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (([v4 supportsMessagedHomepodSettings] & 1) == 0)
  {
    uint64_t v6 = [v4 settings];
    char v7 = [(HMMediaSystem *)self settings];
    BOOL v8 = v7 == 0;

    if ((v6 == 0) == v8)
    {
      id v14 = [(HMMediaSystem *)self settings];
      long long v15 = [v14 rootGroup];
      long long v16 = [v6 rootGroup];
      char v17 = [v15 isEqual:v16];

      if (v17)
      {
        BOOL v5 = 0;
LABEL_11:

        goto LABEL_12;
      }
      long long v18 = [(HMMediaSystem *)self settings];
      uint64_t v31 = MEMORY[0x1E4F143A8];
      uint64_t v32 = 3221225472;
      v33 = __56__HMMediaSystem__mergeLegacySettingsWithNewMediaSystem___block_invoke_52;
      __int16 v34 = &unk_1E5945628;
      id v35 = self;
      id v13 = &v36;
      id v19 = v6;
      id v36 = v19;
      [v18 _updateSettingsWithBlock:&v31];

      uint64_t v25 = (void *)MEMORY[0x19F3A64A0](v20, v21, v22, v23, v24);
      uint64_t v26 = self;
      uint64_t v27 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        uint64_t v28 = HMFGetLogIdentifier();
        long long v29 = objc_msgSend(v19, "longDescription", v31, v32, v33, v34, v35);
        *(_DWORD *)buf = 138543618;
        v40 = v28;
        __int16 v41 = 2112;
        v42 = v29;
        _os_log_impl(&dword_19D1A8000, v27, OS_LOG_TYPE_INFO, "%{public}@Merged new settings: %@", buf, 0x16u);
      }
    }
    else
    {
      uint64_t v9 = [v6 rootGroup];
      uint64_t v10 = [v9 internal];
      uint64_t v11 = [(HMMediaSystem *)self context];
      [v10 configureWithAccessorySettings:v6 context:v11];

      [(HMMediaSystem *)self setSettings:v6];
      [v6 setSettingsControl:self];
      [v6 setSettingsContainerInternal:self];
      __int16 v12 = [(HMMediaSystem *)self context];
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __56__HMMediaSystem__mergeLegacySettingsWithNewMediaSystem___block_invoke;
      v37[3] = &unk_1E5945628;
      v37[4] = self;
      id v13 = &v38;
      id v38 = v6;
      HMDispatchToContextQueueIfNotNil(self, v12, v37);
    }
    BOOL v5 = 1;
    goto LABEL_11;
  }
  BOOL v5 = 0;
LABEL_12:

  return v5;
}

uint64_t __56__HMMediaSystem__mergeLegacySettingsWithNewMediaSystem___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    BOOL v5 = HMFGetLogIdentifier();
    uint64_t v6 = [*(id *)(a1 + 40) longDescription];
    int v8 = 138543618;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@Updated new settings: %@", (uint8_t *)&v8, 0x16u);
  }
  return [*(id *)(a1 + 32) notifyDelegateOfUpdatedSettings:*(void *)(a1 + 40)];
}

void __56__HMMediaSystem__mergeLegacySettingsWithNewMediaSystem___block_invoke_52(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) settings];
  id v3 = [v2 rootGroup];
  id v4 = [v3 internal];
  BOOL v5 = [*(id *)(a1 + 40) rootGroup];
  uint64_t v6 = [v5 internal];
  char v7 = [v4 mergeObject:v6];

  if ((v7 & 1) == 0)
  {
    int v8 = (void *)MEMORY[0x19F3A64A0]();
    id v9 = *(id *)(a1 + 32);
    __int16 v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      int v12 = 138543362;
      id v13 = v11;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@The merge unexpectedly did not result in a change.", (uint8_t *)&v12, 0xCu);
    }
  }
}

- (BOOL)_mergeSettingsWithNewMediaSystem:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(HMMediaSystem *)self _mergeLegacySettingsWithNewMediaSystem:v4];
  LOBYTE(self) = [(HMMediaSystem *)self mergeSupportsMessagedHomepodSettingsWithNewMediaSystem:v4];

  return v5 | self;
}

- (BOOL)_mergeApplicationDataWithNewMediaSystem:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(HMMediaSystem *)self applicationData];
  uint64_t v6 = [v4 applicationData];
  char v7 = HMFEqualObjects();

  if ((v7 & 1) == 0)
  {
    int v8 = [v4 applicationData];
    [(HMMediaSystem *)self setApplicationData:v8];

    id v9 = [(HMMediaSystem *)self context];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __57__HMMediaSystem__mergeApplicationDataWithNewMediaSystem___block_invoke;
    v11[3] = &unk_1E59452E8;
    v11[4] = self;
    HMDispatchToContextQueueIfNotNil(self, v9, v11);
  }
  return v7 ^ 1;
}

void __57__HMMediaSystem__mergeApplicationDataWithNewMediaSystem___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [v1 applicationData];
  [v1 notifyDelegateOfUpdatedApplicationData:v2];
}

- (BOOL)_mergeNameWithNewMediaSystem:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(HMMediaSystem *)self name];
  uint64_t v6 = [v4 name];
  char v7 = HMFEqualObjects();

  if ((v7 & 1) == 0)
  {
    int v8 = (void *)MEMORY[0x19F3A64A0]();
    id v9 = self;
    __int16 v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      int v12 = [v4 name];
      *(_DWORD *)buf = 138543618;
      long long v30 = v11;
      __int16 v31 = 2112;
      uint64_t v32 = v12;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Updating media system name: %@", buf, 0x16u);
    }
    id v13 = [v4 name];
    [(HMMediaSystem *)v9 setName:v13];

    uint64_t v14 = [(HMMediaSystem *)v9 context];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __46__HMMediaSystem__mergeNameWithNewMediaSystem___block_invoke;
    v28[3] = &unk_1E59452E8;
    v28[4] = v9;
    HMDispatchToContextQueueIfNotNil(v9, v14, v28);
  }
  long long v15 = [(HMMediaSystem *)self configuredName];
  long long v16 = [v4 configuredName];
  char v17 = HMFEqualObjects();

  if (v17)
  {
    char v18 = v7 ^ 1;
  }
  else
  {
    id v19 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v20 = self;
    uint64_t v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      uint64_t v22 = HMFGetLogIdentifier();
      uint64_t v23 = [v4 configuredName];
      *(_DWORD *)buf = 138543618;
      long long v30 = v22;
      __int16 v31 = 2112;
      uint64_t v32 = v23;
      _os_log_impl(&dword_19D1A8000, v21, OS_LOG_TYPE_INFO, "%{public}@Updating media system configured name: %@", buf, 0x16u);
    }
    uint64_t v24 = [v4 configuredName];
    [(HMMediaSystem *)v20 setConfiguredName:v24];

    uint64_t v25 = [(HMMediaSystem *)v20 context];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __46__HMMediaSystem__mergeNameWithNewMediaSystem___block_invoke_51;
    v27[3] = &unk_1E59452E8;
    v27[4] = v20;
    HMDispatchToContextQueueIfNotNil(v20, v25, v27);

    char v18 = 1;
  }

  return v18;
}

void __46__HMMediaSystem__mergeNameWithNewMediaSystem___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [v1 name];
  [v1 notifyDelegateOfUpdatedName:v2];
}

void __46__HMMediaSystem__mergeNameWithNewMediaSystem___block_invoke_51(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [v1 configuredName];
  [v1 notifyDelegateOfUpdatedConfiguredName:v2];
}

- (BOOL)_mergeComponentsWithNewMediaSystem:(id)a3
{
  id v4 = a3;
  BOOL v5 = [HMObjectMergeCollection alloc];
  uint64_t v6 = [(HMMediaSystem *)self componentsArray];
  char v7 = [v6 array];
  int v8 = [v4 componentsArray];

  id v9 = [v8 array];
  __int16 v10 = [(HMObjectMergeCollection *)v5 initWithCurrentObjects:v7 newObjects:v9];

  uint64_t v11 = [(HMObjectMergeCollection *)v10 removedObjects];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __52__HMMediaSystem__mergeComponentsWithNewMediaSystem___block_invoke;
  v19[3] = &unk_1E593FFD0;
  v19[4] = self;
  [v11 enumerateObjectsUsingBlock:v19];

  int v12 = [(HMObjectMergeCollection *)v10 addedObjects];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __52__HMMediaSystem__mergeComponentsWithNewMediaSystem___block_invoke_50;
  v18[3] = &unk_1E593FFD0;
  void v18[4] = self;
  [v12 enumerateObjectsUsingBlock:v18];

  [(HMObjectMergeCollection *)v10 mergeCommonObjects];
  BOOL v13 = [(HMObjectMergeCollection *)v10 isModified];
  if (v13)
  {
    uint64_t v14 = [(HMObjectMergeCollection *)v10 finalObjects];
    long long v15 = [(HMMediaSystem *)self componentsArray];
    [v15 setArray:v14];

    long long v16 = [(HMMediaSystem *)self components];
    [(HMMediaSystem *)self notifyDelegateOfUpdatedComponents:v16];
  }
  return v13;
}

void __52__HMMediaSystem__mergeComponentsWithNewMediaSystem___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x19F3A64A0]();
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    char v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    id v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_INFO, "%{public}@Removed media system component via merge: %@", (uint8_t *)&v8, 0x16u);
  }
  [v3 _unconfigure];
}

void __52__HMMediaSystem__mergeComponentsWithNewMediaSystem___block_invoke_50(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x19F3A64A0]();
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    char v7 = HMFGetLogIdentifier();
    int v9 = 138543618;
    __int16 v10 = v7;
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_INFO, "%{public}@Added media system component via merge: %@", (uint8_t *)&v9, 0x16u);
  }
  int v8 = [*(id *)(a1 + 32) home];
  [v3 _updateAccessoryReference:v8];
}

- (BOOL)_mergeWithNewMediaSystem:(id)a3 isFromSerializedData:(BOOL)a4
{
  id v6 = a3;
  BOOL v7 = [(HMMediaSystem *)self _mergeComponentsWithNewMediaSystem:v6];
  BOOL v8 = [(HMMediaSystem *)self _mergeNameWithNewMediaSystem:v6];
  if (a4)
  {
    BOOL v9 = 0;
    BOOL v10 = 0;
  }
  else
  {
    BOOL v11 = [(HMMediaSystem *)self _mergeApplicationDataWithNewMediaSystem:v6];
    BOOL v12 = [(HMMediaSystem *)self _mergeSettingsWithNewMediaSystem:v6];
    BOOL v10 = [(HMMediaSystem *)self mergeAudioDestinationWithNewMediaSystem:v6];
    BOOL v9 = v11 || v12;
  }
  BOOL v13 = v7 || v8 || v10 || v9;

  return v13;
}

- (BOOL)mergeFromNewObject:(id)a3 isFromSerializedData:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v7 = v6;
  }
  else {
    BOOL v7 = 0;
  }
  id v8 = v7;

  if (v8)
  {
    BOOL v9 = [(HMMediaSystem *)self _mergeWithNewMediaSystem:v8 isFromSerializedData:v4];
  }
  else
  {
    BOOL v10 = (void *)MEMORY[0x19F3A64A0]();
    BOOL v11 = self;
    BOOL v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      BOOL v13 = HMFGetLogIdentifier();
      int v15 = 138543618;
      long long v16 = v13;
      __int16 v17 = 2112;
      id v18 = v6;
      _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_ERROR, "%{public}@Unable to merge new media system with object: %@", (uint8_t *)&v15, 0x16u);
    }
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)mergeFromNewObject:(id)a3
{
  return [(HMMediaSystem *)self mergeFromNewObject:a3 isFromSerializedData:0];
}

- (BOOL)isControllable
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = [(HMMediaSystem *)self components];
  if ([v2 count])
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v3 = v2;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v12;
      char v7 = 1;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v12 != v6) {
            objc_enumerationMutation(v3);
          }
          if (v7)
          {
            BOOL v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "accessory", (void)v11);
            char v7 = [v9 isControllable];
          }
          else
          {
            char v7 = 0;
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v5);
    }
    else
    {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (void)_handleSystemUpdatedNotification:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 messagePayload];
  uint64_t v6 = [(HMMediaSystem *)self home];
  char v7 = +[HMMediaSystem mediaSystemWithDictionary:v5 home:v6];

  if (v7)
  {
    [(HMMediaSystem *)self mergeFromNewObject:v7 isFromSerializedData:1];
  }
  else
  {
    id v8 = (void *)MEMORY[0x19F3A64A0]();
    BOOL v9 = self;
    BOOL v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      long long v11 = HMFGetLogIdentifier();
      long long v12 = [v4 messagePayload];
      int v13 = 138543618;
      long long v14 = v11;
      __int16 v15 = 2112;
      uint64_t v16 = v12;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Could not create media system from system payload: %@", (uint8_t *)&v13, 0x16u);
    }
  }
}

- (void)_handleRootSettingsUpdated:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(HMMediaSystem *)self supportsMessagedHomepodSettings])
  {
    uint64_t v5 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v6 = self;
    char v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v32 = v8;
      _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_INFO, "%{public}@Received Root Settings Updated notification", buf, 0xCu);
    }
    BOOL v9 = [v4 dataForKey:kMediaSystemRootSettingsCodingKey];
    if (v9)
    {
      id v30 = 0;
      BOOL v10 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v9 error:&v30];
      id v11 = v30;
      if (v10)
      {
        long long v29 = [[HMAccessorySettingGroup alloc] initWithInternal:v10];
        long long v12 = [[HMAccessorySettings alloc] initWithSettingsContainer:v6 settingsControl:v6 rootGroup:v29];
        [(HMMediaSystem *)v6 setSettings:v12];

        int v13 = [(HMMediaSystem *)v6 settings];
        long long v14 = [v13 rootGroup];
        __int16 v15 = [v14 internal];
        uint64_t v16 = [(HMMediaSystem *)v6 settings];
        [(HMMediaSystem *)v6 context];
        v18 = id v17 = v11;
        [v15 configureWithAccessorySettings:v16 context:v18];

        uint64_t v19 = [(HMMediaSystem *)v6 settings];
        [(HMMediaSystem *)v6 notifyDelegateOfUpdatedSettings:v19];

        id v11 = v17;
      }
      else
      {
        uint64_t v25 = (void *)MEMORY[0x19F3A64A0]();
        uint64_t v26 = v6;
        uint64_t v27 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          uint64_t v28 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          uint64_t v32 = v28;
          __int16 v33 = 2112;
          id v34 = v11;
          _os_log_impl(&dword_19D1A8000, v27, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive accessory setting group from root group data: %@", buf, 0x16u);
        }
      }
    }
    else
    {
      uint64_t v20 = (void *)MEMORY[0x19F3A64A0]();
      uint64_t v21 = v6;
      uint64_t v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        uint64_t v23 = HMFGetLogIdentifier();
        uint64_t v24 = [v4 messagePayload];
        *(_DWORD *)buf = 138543618;
        uint64_t v32 = v23;
        __int16 v33 = 2112;
        id v34 = v24;
        _os_log_impl(&dword_19D1A8000, v22, OS_LOG_TYPE_ERROR, "%{public}@Missing serialized root settings from message payload: %@", buf, 0x16u);
      }
    }
  }
}

- (void)_updateApplicationData:(id)a3 completionHandler:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v30 = a4;
  char v7 = [(HMMediaSystem *)self context];
  if (v7)
  {
    id v8 = [MEMORY[0x1E4F1CA60] dictionary];
    if (v6)
    {
      BOOL v9 = [v6 dictionaryRepresentation];
      [v8 setObject:v9 forKeyedSubscript:@"kAppDataInformationKey"];
    }
    id v10 = objc_alloc(MEMORY[0x1E4F65488]);
    id v11 = [(HMMediaSystem *)self messageTargetUUID];
    long long v12 = (void *)[v10 initWithTarget:v11];

    int v13 = (void *)MEMORY[0x1E4F654B0];
    uint64_t v14 = kMediaSystemSetAppDataRequestKey;
    __int16 v15 = (void *)[v8 copy];
    uint64_t v16 = [v13 messageWithName:v14 destination:v12 payload:v15];

    objc_initWeak((id *)location, self);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __58__HMMediaSystem__updateApplicationData_completionHandler___block_invoke;
    aBlock[3] = &unk_1E5944AE0;
    objc_copyWeak(&v38, (id *)location);
    id v36 = v6;
    id v37 = v30;
    id v17 = _Block_copy(aBlock);
    id v18 = [(HMMediaSystem *)self context];
    uint64_t v19 = [v18 pendingRequests];

    uint64_t v20 = [v16 identifier];
    uint64_t v21 = _Block_copy(v17);
    [v19 addCompletionBlock:v21 forIdentifier:v20];

    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __58__HMMediaSystem__updateApplicationData_completionHandler___block_invoke_2;
    v31[3] = &unk_1E5945510;
    id v22 = v19;
    id v32 = v22;
    id v23 = v20;
    id v33 = v23;
    id v24 = v17;
    id v34 = v24;
    [v16 setResponseHandler:v31];
    uint64_t v25 = [v7 messageDispatcher];
    [v25 sendMessage:v16 completionHandler:0];

    objc_destroyWeak(&v38);
    objc_destroyWeak((id *)location);
  }
  else
  {
    uint64_t v26 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v27 = self;
    uint64_t v28 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      long long v29 = HMFGetLogIdentifier();
      *(_DWORD *)location = 138543618;
      *(void *)&location[4] = v29;
      __int16 v40 = 2080;
      __int16 v41 = "-[HMMediaSystem _updateApplicationData:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v28, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", location, 0x16u);
    }
  }
}

void __58__HMMediaSystem__updateApplicationData_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 48);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v8 = WeakRetained;
  if (!v4)
  {
    [WeakRetained setApplicationData:*(void *)(a1 + 32)];
    id WeakRetained = v8;
  }
  id v6 = [WeakRetained context];
  char v7 = [v6 delegateCaller];
  [v7 callCompletion:*(void *)(a1 + 40) error:v4];
}

void __58__HMMediaSystem__updateApplicationData_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = [*(id *)(a1 + 32) removeCompletionBlockForIdentifier:*(void *)(a1 + 40)];
  if (v3) {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)updateApplicationData:(id)a3 completionHandler:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMMediaSystem *)self context];
  if (!v7)
  {
    uint64_t v16 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMMediaSystem updateApplicationData:completionHandler:]", @"completion"];
    id v17 = (void *)MEMORY[0x19F3A64A0]();
    id v18 = self;
    uint64_t v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v26 = v20;
      __int16 v27 = 2112;
      uint64_t v28 = (const char *)v16;
      _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v21 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v16 userInfo:0];
    objc_exception_throw(v21);
  }
  BOOL v9 = v8;
  if (v8)
  {
    id v10 = [v8 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__HMMediaSystem_updateApplicationData_completionHandler___block_invoke;
    block[3] = &unk_1E5945138;
    block[4] = self;
    id v23 = v6;
    id v24 = v7;
    dispatch_async(v10, block);
  }
  else
  {
    id v11 = (void *)MEMORY[0x19F3A64A0]();
    long long v12 = self;
    int v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v26 = v14;
      __int16 v27 = 2080;
      uint64_t v28 = "-[HMMediaSystem updateApplicationData:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    __int16 v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void *))v7 + 2))(v7, v15);
  }
}

uint64_t __57__HMMediaSystem_updateApplicationData_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateApplicationData:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (void)setApplicationData:(id)a3
{
  id v4 = (HMApplicationData *)a3;
  os_unfair_lock_lock_with_options();
  applicationData = self->_applicationData;
  self->_applicationData = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (HMApplicationData)applicationData
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_applicationData;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (HMSymptomsHandler)symptomsHandler
{
  return 0;
}

- (void)setSettings:(id)a3
{
  id v4 = (HMAccessorySettings *)a3;
  os_unfair_lock_lock_with_options();
  settings = self->_settings;
  self->_settings = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (HMAccessorySettings)settings
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_settings;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (HMMediaSession)mediaSession
{
  id v2 = [(HMMediaSystem *)self components];
  id v3 = [v2 sortedArrayUsingComparator:&__block_literal_global_30_18953];

  if ([v3 count])
  {
    id v4 = [v3 firstObject];
    uint64_t v5 = [v4 mediaProfile];
    id v6 = [v5 mediaSession];
  }
  else
  {
    id v6 = 0;
  }

  return (HMMediaSession *)v6;
}

uint64_t __29__HMMediaSystem_mediaSession__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 uuid];
  id v6 = [v5 UUIDString];
  id v7 = [v4 uuid];

  id v8 = [v7 UUIDString];
  uint64_t v9 = [v6 compare:v8];

  return v9;
}

- (HMAccessoryCategory)category
{
  id v2 = [[HMAccessoryCategory alloc] initWithType:@"1D8FD40E-7CAE-4AD5-9973-977D18890DE2" name:@"homepod"];
  id v3 = +[HMFObjectCacheHMAccessoryCategory cachedInstanceForHMAccessoryCategory:v2];

  return (HMAccessoryCategory *)v3;
}

- (NSArray)components
{
  id v2 = [(HMMediaSystem *)self componentsArray];
  id v3 = [v2 array];

  return (NSArray *)v3;
}

- (BOOL)isCompatible
{
  id v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_compatible;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (NSUUID)uniqueIdentifier
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uniqueIdentifier = self->_uniqueIdentifier;
  if (!uniqueIdentifier)
  {
    objc_msgSend(MEMORY[0x1E4F29128], "hm_deriveUUIDFromBaseUUID:", self->_uuid);
    uint64_t v5 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    id v6 = self->_uniqueIdentifier;
    self->_uniqueIdentifier = v5;

    uniqueIdentifier = self->_uniqueIdentifier;
  }
  id v7 = uniqueIdentifier;
  os_unfair_lock_unlock(p_lock);

  return v7;
}

- (void)setConfiguredName:(id)a3
{
  id v4 = (NSString *)a3;
  os_unfair_lock_lock_with_options();
  configuredName = self->_configuredName;
  self->_configuredName = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)configuredName
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_configuredName;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setName:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  id v4 = (NSString *)[v6 copy];
  name = self->_name;
  self->_name = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)name
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_name;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setDelegate:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock_with_options();
  objc_storeWeak((id *)&self->_delegate, v5);

  os_unfair_lock_unlock(p_lock);
}

- (HMMediaSystemDelegate)delegate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  os_unfair_lock_unlock(p_lock);

  return (HMMediaSystemDelegate *)WeakRetained;
}

- (void)_updateAccessoryReference
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = [(HMMediaSystem *)self components];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v10 + 1) + 8 * v7);
        uint64_t v9 = [(HMMediaSystem *)self home];
        [v8 _updateAccessoryReference:v9];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (void)_registerNotificationHandlers
{
  id v3 = [(HMMediaSystem *)self context];
  uint64_t v4 = [v3 messageDispatcher];
  [v4 registerForMessage:kMediaSystemRootSettingsUpdatedNotification receiver:self selector:sel__handleRootSettingsUpdated_];

  id v6 = [(HMMediaSystem *)self context];
  uint64_t v5 = [v6 messageDispatcher];
  [v5 registerForMessage:kMediaSystemUpdatedNotification receiver:self selector:sel__handleSystemUpdatedNotification_];
}

- (void)updateComponentsSettingsAdapterToSettingReflected
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMMediaSystem *)self components];
  uint64_t v4 = (void *)MEMORY[0x19F3A64A0]();
  uint64_t v5 = self;
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    uint64_t v9 = v7;
    __int16 v10 = 2112;
    long long v11 = v3;
    _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_INFO, "%{public}@Updating components settings adapter to setting reflected for components: %@", (uint8_t *)&v8, 0x16u);
  }
  objc_msgSend(v3, "na_each:", &__block_literal_global_17_18964);
}

void __66__HMMediaSystem_updateComponentsSettingsAdapterToSettingReflected__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 accessory];
  [v2 updateSettingsAdapterSettingReflected:1];
}

- (BOOL)configureSettingsAdaptorIfNeeded
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMMediaSystem *)self home];
  uint64_t v4 = [v3 homeManager];
  uint64_t v5 = [v4 configuration];
  char v6 = [v5 options];

  if ((v6 & 0x20) == 0) {
    return 0;
  }
  uint64_t v7 = [(HMMediaSystem *)self mediaSystemSettingsAdapter];

  if (v7)
  {
    int v8 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v9 = self;
    __int16 v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      long long v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v46 = v11;
      uint64_t v12 = "%{public}@Asked to create settings adapter again";
      long long v13 = v10;
      os_log_type_t v14 = OS_LOG_TYPE_INFO;
LABEL_16:
      _os_log_impl(&dword_19D1A8000, v13, v14, v12, buf, 0xCu);

      goto LABEL_17;
    }
    goto LABEL_17;
  }
  uint64_t v15 = [(HMMediaSystem *)self context];
  if (!v15) {
    goto LABEL_14;
  }
  uint64_t v16 = (void *)v15;
  id v17 = [(HMMediaSystem *)self context];
  id v18 = [v17 queue];

  if (!v18)
  {
LABEL_14:
    int v8 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v9 = self;
    __int16 v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      long long v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v46 = v11;
      uint64_t v12 = "%{public}@Context or context queue is nil";
      long long v13 = v10;
      os_log_type_t v14 = OS_LOG_TYPE_ERROR;
      goto LABEL_16;
    }
LABEL_17:

    return 0;
  }
  uint64_t v19 = [(HMMediaSystem *)self settings];

  if (v19)
  {
    uint64_t v20 = (void *)MEMORY[0x19F3A64A0]();
    id v21 = self;
    id v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      id v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v46 = v23;
      _os_log_impl(&dword_19D1A8000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@Removing all existing settings on update to support HPLS", buf, 0xCu);
    }
    [(HMMediaSystem *)v21 setSettings:0];
  }
  id v24 = [(HMMediaSystem *)self home];
  uint64_t v25 = (void *)MEMORY[0x19F3A64A0]();
  uint64_t v26 = self;
  __int16 v27 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    uint64_t v28 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    v46 = v28;
    __int16 v47 = 2112;
    v48 = v26;
    __int16 v49 = 2112;
    v50 = v24;
    _os_log_impl(&dword_19D1A8000, v27, OS_LOG_TYPE_INFO, "%{public}@Create settings adapter for media system: %@ home: %@", buf, 0x20u);
  }
  uint64_t v29 = [v24 homeManager];
  id v30 = [v29 createAccessorySettingsDataSource];
  [(HMMediaSystem *)v26 setAccessorySettingsDataSource:v30];

  __int16 v31 = [v29 createAccessorySettingsController];
  [(HMMediaSystem *)v26 setAccessorySettingsController:v31];

  id v32 = [HMAccessorySettingsAdapter alloc];
  id v33 = [v24 uniqueIdentifier];
  id v34 = [(HMMediaSystem *)v26 accessorySettingsDataSource];
  uint64_t v35 = [(HMMediaSystem *)v26 accessorySettingsController];
  id v36 = [(HMMediaSystem *)v26 context];
  id v37 = [v36 queue];
  id v38 = [(HMMediaSystem *)v26 uniqueIdentifier];
  [(HMMediaSystem *)v26 context];
  uint64_t v39 = v44 = v24;
  __int16 v40 = [(HMAccessorySettingsAdapter *)v32 initWithHomeIdentifier:v33 dataSource:v34 controller:v35 workQueue:v37 settingsContainer:v26 containerIdentifier:v38 containerType:2 settingsControl:v26 context:v39];
  [(HMMediaSystem *)v26 setMediaSystemSettingsAdapter:v40];

  __int16 v41 = [(HMMediaSystem *)v26 mediaSystemSettingsAdapter];
  [v41 setDelegate:v26];

  uint64_t v42 = [(HMMediaSystem *)v26 mediaSystemSettingsAdapter];
  [v42 configureWithCompletionHandler:&__block_literal_global_18971];

  [(HMMediaSystem *)v26 updateComponentsSettingsAdapterToSettingReflected];
  return 1;
}

- (void)postConfigure
{
  if ([(HMMediaSystem *)self supportsMessagedHomepodSettings])
  {
    [(HMMediaSystem *)self configureSettingsAdaptorIfNeeded];
  }
}

- (void)__configureWithContext:(id)a3 home:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = (void *)MEMORY[0x19F3A64A0]();
  uint64_t v9 = self;
  __int16 v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    long long v11 = HMFGetLogIdentifier();
    int v16 = 138544130;
    id v17 = v11;
    __int16 v18 = 2112;
    uint64_t v19 = v9;
    __int16 v20 = 2112;
    id v21 = v6;
    __int16 v22 = 2112;
    id v23 = v7;
    _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Configuring media system: %@ context: %@ home: %@", (uint8_t *)&v16, 0x2Au);
  }
  [(HMMediaSystem *)v9 setHome:v7];
  [(HMMediaSystem *)v9 setContext:v6];
  [(HMMediaSystem *)v9 _updateAccessoryReference];
  if (![(HMMediaSystem *)v9 supportsMessagedHomepodSettings])
  {
    uint64_t v12 = [(HMMediaSystem *)v9 settings];
    long long v13 = [v12 rootGroup];
    os_log_type_t v14 = [v13 internal];
    uint64_t v15 = [(HMMediaSystem *)v9 settings];
    [v14 configureWithAccessorySettings:v15 context:v6];
  }
  [(HMMediaSystem *)v9 _registerNotificationHandlers];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HMMediaSystem *)a3;
  if (v4 == self)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = [(HMMediaSystem *)v4 uuid];
      id v6 = [(HMMediaSystem *)self uuid];
      char v7 = [v5 isEqual:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  id v2 = [(HMMediaSystem *)self uuid];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSString)description
{
  unint64_t v3 = [(HMMediaSystem *)self audioDestination];
  uint64_t v4 = NSString;
  uint64_t v5 = [(HMMediaSystem *)self uniqueIdentifier];
  id v6 = [(HMMediaSystem *)self uuid];
  char v7 = [(HMMediaSystem *)self name];
  int v8 = [(HMMediaSystem *)self configuredName];
  uint64_t v9 = [(HMMediaSystem *)self components];
  __int16 v10 = (void *)v9;
  if (v3)
  {
    long long v11 = [NSString stringWithFormat:@" audioDestination: %@", v3];
    uint64_t v12 = [v4 stringWithFormat:@"[HMMediaSystem identifier: %@ uuid: %@ name: %@ configured name: %@ components: %@%@]", v5, v6, v7, v8, v10, v11];
  }
  else
  {
    uint64_t v12 = [v4 stringWithFormat:@"[HMMediaSystem identifier: %@ uuid: %@ name: %@ configured name: %@ components: %@%@]", v5, v6, v7, v8, v9, &stru_1EEE9DD88];
  }

  return (NSString *)v12;
}

- (void)_unconfigure
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  context = self->_context;
  uint64_t v4 = (void *)MEMORY[0x19F3A64A0]();
  uint64_t v28 = self;
  uint64_t v5 = HMFGetOSLogHandle();
  id v6 = v5;
  if (context)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      char v7 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v34 = v7;
      _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Unconfiguring mediaSystem and child objects", buf, 0xCu);
    }
    int v8 = v28;

    [(HMMediaSystem *)v28 setSettings:0];
    uint64_t v9 = [(HMMediaSystem *)v28 mediaSystemSettingsAdapter];
    [v9 unconfigure];

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    __int16 v10 = [(HMMediaSystem *)v28 components];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v29 objects:v37 count:16];
    if (v11)
    {
      uint64_t v13 = v11;
      uint64_t v14 = *(void *)v30;
      *(void *)&long long v12 = 138543618;
      long long v27 = v12;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v30 != v14) {
            objc_enumerationMutation(v10);
          }
          int v16 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          id v17 = objc_msgSend(v16, "accessory", v27);
          __int16 v18 = (void *)MEMORY[0x19F3A64A0]();
          uint64_t v19 = v8;
          __int16 v20 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            id v21 = HMFGetLogIdentifier();
            *(_DWORD *)buf = v27;
            id v34 = v21;
            __int16 v35 = 2112;
            id v36 = v17;
            _os_log_impl(&dword_19D1A8000, v20, OS_LOG_TYPE_DEBUG, "%{public}@Reset component accessory %@ settings reflected", buf, 0x16u);

            int v8 = v28;
          }

          [v17 updateSettingsAdapterSettingReflected:0];
          [v16 _unconfigure];
        }
        uint64_t v13 = [v10 countByEnumeratingWithState:&v29 objects:v37 count:16];
      }
      while (v13);
    }

    __int16 v22 = [(HMMediaSystem *)v8 componentsArray];
    [v22 setArray:0];

    id v23 = [(HMMediaSystem *)v8 context];
    uint64_t v24 = [v23 messageDispatcher];
    [v24 deregisterReceiver:v8];

    [(HMMediaSystem *)v8 setContext:0];
    uint64_t v25 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v25 removeObserver:v8];
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v26 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v34 = v26;
      _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_INFO, "%{public}@Skipping unconfigure on already unconfigured object", buf, 0xCu);
    }
  }
}

- (HMMediaSystem)initWithHome:(id)a3 uuid:(id)a4 name:(id)a5 configuredName:(id)a6 compatible:(BOOL)a7 components:(id)a8 settings:(id)a9
{
  id v15 = a3;
  id v27 = a4;
  id v26 = a5;
  id v16 = a6;
  id v17 = a8;
  id v18 = a9;
  v28.receiver = self;
  v28.super_class = (Class)HMMediaSystem;
  uint64_t v19 = [(HMMediaSystem *)&v28 init];
  __int16 v20 = v19;
  if (v19)
  {
    objc_storeWeak((id *)&v19->_home, v15);
    objc_storeStrong((id *)&v20->_uuid, a4);
    objc_storeStrong((id *)&v20->_name, a5);
    objc_storeStrong((id *)&v20->_configuredName, a6);
    v20->_compatible = a7;
    uint64_t v21 = +[HMMutableArray arrayWithArray:](HMMutableArray, "arrayWithArray:", v17, v26, v27);
    componentsArray = v20->_componentsArray;
    v20->_componentsArray = (HMMutableArray *)v21;

    objc_storeStrong((id *)&v20->_settings, a9);
    id v23 = objc_alloc_init(HMApplicationData);
    applicationData = v20->_applicationData;
    v20->_applicationData = v23;
  }
  return v20;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t55 != -1) {
    dispatch_once(&logCategory__hmf_once_t55, &__block_literal_global_73);
  }
  id v2 = (void *)logCategory__hmf_once_v56;

  return v2;
}

uint64_t __28__HMMediaSystem_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v56;
  logCategory__hmf_once_v56 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)mediaSystemWithDictionary:(id)a3 home:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  __int16 v22 = objc_msgSend(v5, "hmf_stringForKey:", kMediaSystemNameCodingKey);
  uint64_t v21 = objc_msgSend(v5, "hmf_stringForKey:", kMediaSystemConfiguredNameCodingKey);
  char v7 = objc_msgSend(v5, "hmf_UUIDForKey:", kMediaSystemUUIDCodingKey);
  unsigned int v20 = objc_msgSend(v5, "hmf_BOOLForKey:", kMediaSystemCompatibleCodingKey);
  int v8 = objc_msgSend(v5, "hmf_arrayForKey:", kMediaSystemComponentsCodingKey);
  uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v24 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = +[HMMediaSystemComponent mediaSystemComponentWithDictionary:*(void *)(*((void *)&v23 + 1) + 8 * i) home:v6];
        [v9 addObject:v15];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v12);
  }

  id v16 = [HMMediaSystem alloc];
  id v17 = (void *)[v9 copy];
  id v18 = [(HMMediaSystem *)v16 initWithHome:v6 uuid:v7 name:v22 configuredName:v21 compatible:v20 components:v17 settings:0];

  return v18;
}

@end