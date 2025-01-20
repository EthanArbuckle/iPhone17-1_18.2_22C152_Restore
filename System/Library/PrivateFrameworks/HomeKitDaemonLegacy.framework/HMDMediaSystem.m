@interface HMDMediaSystem
+ (BOOL)supportsSecureCoding;
+ (id)destinationIdentifierForComponentRoleType:(unint64_t)a3 components:(id)a4;
+ (id)initalizeDataWithIdentifier:(id)a3 parentIdentifier:(id)a4 name:(id)a5 defaultName:(BOOL)a6 components:(id)a7;
+ (id)logCategory;
+ (id)sortMediaComponents:(id)a3;
+ (void)_configureMediaSystemComponents:(id)a3 mediaSystem:(id)a4;
- (BOOL)_otherAccessoryUsesVersionBasedMigrationOwner;
- (BOOL)componentsSupportsHomeLevelLocationServiceSetting;
- (BOOL)isCurrentComponent;
- (BOOL)isMultiUserEnabledForAccessorySettingsController:(id)a3;
- (BOOL)isValid;
- (BOOL)supportsUserMediaSettings;
- (HMDAccessorySettingsController)settingsController;
- (HMDAccessorySetupMetricDispatcher)accessorySetupMetricDispatcher;
- (HMDAppleMediaAccessory)targetAccessory;
- (HMDApplicationData)appData;
- (HMDBackingStore)backingStore;
- (HMDCurrentAccessorySetupMetricDispatcher)currentAccessorySetupMetricDispatcher;
- (HMDHome)home;
- (HMDMediaDestinationsManager)audioDestinationsManager;
- (HMDMediaGroupsAggregateConsumerDataProvider)aggregateDataProvider;
- (HMDMediaSession)mediaSession;
- (HMDMediaSystem)initWithCoder:(id)a3;
- (HMDMediaSystem)initWithMediaSystemData:(id)a3 home:(id)a4;
- (HMDMediaSystem)initWithMediaSystemModel:(id)a3 home:(id)a4;
- (HMDMediaSystem)initWithUUID:(id)a3 configuredName:(id)a4 home:(id)a5 data:(id)a6 components:(id)a7;
- (HMDMediaSystem)initWithUUID:(id)a3 configuredName:(id)a4 home:(id)a5 data:(id)a6 components:(id)a7 settingsControllerCreator:(id)a8;
- (HMDMediaSystemDataSource)dataSource;
- (HMDRoom)room;
- (HMFActivity)setupActivity;
- (HMFMessageDispatcher)msgDispatcher;
- (HMMediaDestination)audioDestination;
- (HMMediaSystemData)data;
- (NSArray)accessories;
- (NSArray)associatedAudioDestinationManagers;
- (NSArray)components;
- (NSNotificationCenter)notificationCenter;
- (NSString)configuredName;
- (NSString)name;
- (NSUUID)uuid;
- (OS_dispatch_queue)workQueue;
- (double)setupStartTimestamp;
- (id)_modelForMediaSystem;
- (id)assistantAccessControlModelWithRemovedAccessoriesForAccessorySettingsController:(id)a3;
- (id)assistantObject;
- (id)attributeDescriptions;
- (id)audioDestinationIdentifier;
- (id)audioDestinationsManagerFactory;
- (id)backingStoreObjectsForVersion:(int64_t)a3;
- (id)createNewAudioDestination;
- (id)destinationControllerGroupedWithAssociatedDestination;
- (id)dumpState;
- (id)generateComponents;
- (id)legacyAudioDestination;
- (id)legacyComponents;
- (id)legacyConfiguredName;
- (id)legacyName;
- (id)logIdentifier;
- (id)mediaDestinationsManager:(id)a3 destinationControllerWithIdentifier:(id)a4;
- (id)mediaGroupsAggregatorMessengerForMediaDestinationsManager:(id)a3;
- (id)messageDestination;
- (id)modelForMediaSystem;
- (id)modelObjectWithChangeType:(unint64_t)a3;
- (id)modelsToMakeSettingsForController:(id)a3 parentUUID:(id)a4;
- (id)modelsToMigrateSettingsForController:(id)a3;
- (id)remoteMessageDestinationForAccessorySettingsController:(id)a3 target:(id)a4;
- (id)serialize;
- (id)supportedMultiUserLanguageCodesForAccessorySettingsController:(id)a3;
- (id)targetAccessoryBySerial;
- (id)urlString;
- (void)_appDataRemoved:(id)a3 message:(id)a4;
- (void)_appDataUpdated:(id)a3 message:(id)a4;
- (void)_handleAppData:(id)a3;
- (void)_registerForMessages;
- (void)_registerForNotifications;
- (void)_routeUpdateMediaSystem:(id)a3;
- (void)_transactionMediaSystemUpdated:(id)a3 message:(id)a4;
- (void)_updateAppData:(id)a3;
- (void)accessorySettingsController:(id)a3 saveWithReason:(id)a4;
- (void)accessorySettingsController:(id)a3 saveWithReason:(id)a4 model:(id)a5;
- (void)auditMediaComponents;
- (void)configureAudioDestinationsManager;
- (void)configureMediaSystemComponents:(id)a3;
- (void)configureWithMessageDispatcher:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)handleAccessorySoftwareUpdated:(id)a3;
- (void)handleHomeCloudZoneReadyNotification:(id)a3;
- (void)mediaDestinationsManager:(id)a3 didUpdateDestination:(id)a4;
- (void)mergeAudioDestination:(id)a3;
- (void)mergeMediaSystemData:(id)a3;
- (void)reevaluateSettingOwner;
- (void)relayMessage:(id)a3;
- (void)removeManagedConfigurationProfileWithProfileData:(id)a3 completion:(id)a4;
- (void)repairAnyPreExistingAudioGroups;
- (void)setAppData:(id)a3;
- (void)setAudioDestinationsManager:(id)a3;
- (void)setAudioDestinationsManagerFactory:(id)a3;
- (void)setComponents:(id)a3;
- (void)setConfiguredName:(id)a3;
- (void)setData:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setMediaSession:(id)a3;
- (void)setMsgDispatcher:(id)a3;
- (void)setName:(id)a3;
- (void)setNotificationCenter:(id)a3;
- (void)setSetupActivity:(id)a3;
- (void)setSetupStartTimestamp:(double)a3;
- (void)setWorkQueue:(id)a3;
- (void)transactionObjectRemoved:(id)a3 message:(id)a4;
- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5;
- (void)unconfigureMediaSystemComponents;
- (void)unconfigureMediaSystemComponents:(id)a3;
@end

@implementation HMDMediaSystem

- (void).cxx_destruct
{
  objc_storeStrong(&self->_audioDestinationsManagerFactory, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_aggregateDataProvider, 0);
  objc_storeStrong((id *)&self->_audioDestinationsManager, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_settingsController, 0);
  objc_storeStrong((id *)&self->_msgDispatcher, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_audioDestination, 0);
  objc_storeStrong((id *)&self->_configuredName, 0);
  objc_storeStrong((id *)&self->_mediaSession, 0);
  objc_storeStrong((id *)&self->_appData, 0);
  objc_storeStrong((id *)&self->_components, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)setAudioDestinationsManagerFactory:(id)a3
{
}

- (id)audioDestinationsManagerFactory
{
  return objc_getProperty(self, a2, 144, 1);
}

- (void)setNotificationCenter:(id)a3
{
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 136, 1);
}

- (HMDMediaGroupsAggregateConsumerDataProvider)aggregateDataProvider
{
  return (HMDMediaGroupsAggregateConsumerDataProvider *)objc_getProperty(self, a2, 128, 1);
}

- (void)setAudioDestinationsManager:(id)a3
{
}

- (HMDMediaDestinationsManager)audioDestinationsManager
{
  return (HMDMediaDestinationsManager *)objc_getProperty(self, a2, 120, 1);
}

- (void)setData:(id)a3
{
}

- (HMMediaSystemData)data
{
  return (HMMediaSystemData *)objc_getProperty(self, a2, 112, 1);
}

- (HMDAccessorySettingsController)settingsController
{
  return (HMDAccessorySettingsController *)objc_getProperty(self, a2, 104, 1);
}

- (void)setMsgDispatcher:(id)a3
{
}

- (HMFMessageDispatcher)msgDispatcher
{
  return self->_msgDispatcher;
}

- (void)setWorkQueue:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (HMDHome)home
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  return (HMDHome *)WeakRetained;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setDataSource:(id)a3
{
}

- (HMDMediaSystemDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (HMDMediaSystemDataSource *)WeakRetained;
}

- (BOOL)componentsSupportsHomeLevelLocationServiceSetting
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = [(HMDMediaSystem *)self accessories];
  v4 = objc_msgSend(v3, "na_map:", &__block_literal_global_112_96341);
  uint64_t v5 = [v4 count];
  if (v5 == [v3 count])
  {
    char v6 = objc_msgSend(v4, "na_all:", &__block_literal_global_116_96343);
  }
  else
  {
    v7 = (void *)MEMORY[0x1D9452090]();
    v8 = self;
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = HMFGetLogIdentifier();
      int v12 = 138543618;
      v13 = v10;
      __int16 v14 = 2112;
      v15 = v3;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_ERROR, "%{public}@Unable to determine supports home level location services setting for all components: %@", (uint8_t *)&v12, 0x16u);
    }
    char v6 = 0;
  }

  return v6;
}

uint64_t __67__HMDMediaSystem_componentsSupportsHomeLevelLocationServiceSetting__block_invoke_113(uint64_t a1, void *a2)
{
  return [a2 supportsHomeLevelLocationServiceSetting];
}

id __67__HMDMediaSystem_componentsSupportsHomeLevelLocationServiceSetting__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (id)assistantAccessControlModelWithRemovedAccessoriesForAccessorySettingsController:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", a3);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v5 = [(HMDMediaSystem *)self components];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = [*(id *)(*((void *)&v18 + 1) + 8 * i) accessory];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v11 = v10;
        }
        else {
          v11 = 0;
        }
        id v12 = v11;

        if (v12) {
          [v4 addObject:v12];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }

  v13 = [(HMDMediaSystem *)self home];
  __int16 v14 = [v13 currentUser];
  v15 = [v14 assistantAccessControl];
  uint64_t v16 = [v15 assistantAccessControlModelWithRemovedAccessories:v4];

  return v16;
}

- (id)remoteMessageDestinationForAccessorySettingsController:(id)a3 target:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(HMDMediaSystem *)self targetAccessory];
  uint64_t v7 = [v6 device];

  if (v7)
  {
    uint64_t v8 = [HMDRemoteDeviceMessageDestination alloc];
    v9 = [v6 device];
    uint64_t v7 = [(HMDRemoteDeviceMessageDestination *)v8 initWithTarget:v5 device:v9];
  }
  return v7;
}

- (id)supportedMultiUserLanguageCodesForAccessorySettingsController:(id)a3
{
  v3 = [(HMDMediaSystem *)self targetAccessory];
  id v4 = [v3 supportedMultiUserLanguageCodes];

  return v4;
}

- (BOOL)isMultiUserEnabledForAccessorySettingsController:(id)a3
{
  v3 = [(HMDMediaSystem *)self home];
  char v4 = [v3 isMultiUserEnabled];

  return v4;
}

- (void)accessorySettingsController:(id)a3 saveWithReason:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(HMDMediaSystem *)self home];
  id v9 = [v6 homeManager];

  uint64_t v7 = [[HMDHomeSaveRequest alloc] initWithReason:v5 information:0 saveOptions:0];
  [v9 saveWithRequest:v7];
  uint64_t v8 = [(HMDMediaSystem *)self uuid];
  [v9 updateGenerationCounterWithReason:v5 sourceUUID:v8 shouldNotifyClients:1];
}

- (void)accessorySettingsController:(id)a3 saveWithReason:(id)a4 model:(id)a5
{
  id v7 = a4;
  id v8 = [(HMDMediaSystem *)self home];
  [v8 saveWithReason:v7 postSyncNotification:0 objectChange:a5 != 0];
}

- (id)modelsToMigrateSettingsForController:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v35 = objc_alloc_init(HMDAccessorySettingsMetadata);
  if (v35)
  {
    id v32 = v4;
    id v5 = [(HMDMediaSystem *)self settingsController];
    uint64_t v6 = [v5 rootGroup];
    v31 = (void *)[v6 copyIdentical];

    id v7 = [(HMDMediaSystem *)self settingsController];
    id v8 = [v7 rootGroup];
    id v9 = (void *)[v8 copyIdentical];

    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id obj = [(HMDMediaSystem *)self components];
    uint64_t v10 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      v33 = self;
      uint64_t v12 = *(void *)v37;
      char v13 = 1;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v37 != v12) {
            objc_enumerationMutation(obj);
          }
          v15 = [*(id *)(*((void *)&v36 + 1) + 8 * i) accessory];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            uint64_t v16 = v15;
          }
          else {
            uint64_t v16 = 0;
          }
          id v17 = v16;

          long long v18 = [v17 settingsController];
          long long v19 = [v18 rootGroup];
          long long v20 = (void *)[v19 copyReplica];

          if (v9)
          {
            if (v20)
            {
              long long v21 = [(HMDAccessorySettingsMetadata *)v35 rootGroup];
              [v9 intersectSettingGroup:v20 groupMetadata:v21 shouldAddMissingItems:v13 & 1];

              char v13 = 0;
              v22 = v20;
            }
            else
            {
              v22 = 0;
            }
          }
          else
          {
            uint64_t v23 = [(HMDMediaSystem *)v33 uuid];
            [v20 setParentIdentifier:v23];

            v22 = [(HMDAccessorySettingsMetadata *)v35 rootGroup];
            [v20 intersectSettingGroup:v20 groupMetadata:v22 shouldAddMissingItems:0];
            char v13 = 0;
            id v9 = v20;
          }
        }
        uint64_t v11 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
      }
      while (v11);
    }

    if (v9)
    {
      v24 = v31;
      id v4 = v32;
      if (v31 && ([v31 compareSettingsTree:v9] & 1) != 0)
      {
        v25 = 0;
      }
      else
      {
        v25 = +[HMDAccessorySettingTransform modelsForGroupDiff:v31 fromGroup:v9];
      }
    }
    else
    {
      v25 = 0;
      v24 = v31;
      id v4 = v32;
    }
  }
  else
  {
    v26 = (void *)MEMORY[0x1D9452090]();
    v27 = self;
    v28 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v29 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v42 = v29;
      _os_log_impl(&dword_1D49D5000, v28, OS_LOG_TYPE_ERROR, "%{public}@Cannot load settings metadata", buf, 0xCu);
    }
    v25 = 0;
  }

  return v25;
}

- (id)modelsToMakeSettingsForController:(id)a3 parentUUID:(id)a4
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v41 = objc_alloc_init(HMDAccessorySettingsMetadata);
  if (v41)
  {
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id obj = [(HMDMediaSystem *)self components];
    uint64_t v8 = [obj countByEnumeratingWithState:&v43 objects:v51 count:16];
    if (!v8)
    {
      id v32 = 0;
      uint64_t v10 = obj;
      goto LABEL_26;
    }
    uint64_t v9 = v8;
    id v38 = v7;
    id v39 = v6;
    uint64_t v10 = 0;
    uint64_t v42 = *(void *)v44;
    uint64_t v11 = obj;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v44 != v42) {
          objc_enumerationMutation(v11);
        }
        char v13 = objc_msgSend(*(id *)(*((void *)&v43 + 1) + 8 * i), "accessory", v38);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          __int16 v14 = v13;
        }
        else {
          __int16 v14 = 0;
        }
        id v15 = v14;

        if (v10)
        {
          uint64_t v16 = [v15 settingsController];
          id v17 = [v16 rootGroup];
          long long v18 = (void *)[v17 copyReplica];

          if (v18)
          {
            long long v19 = (void *)MEMORY[0x1D9452090]();
            long long v20 = self;
            long long v21 = self;
            v22 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
            {
              uint64_t v23 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              v48 = v23;
              __int16 v49 = 2112;
              id v50 = v15;
              _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_INFO, "%{public}@Merging root group of %@", buf, 0x16u);
            }
            v24 = [(HMDAccessorySettingsMetadata *)v41 rootGroup];
            [v10 intersectSettingGroup:v18 groupMetadata:v24 shouldAddMissingItems:0];

            self = v20;
            uint64_t v11 = obj;
          }
        }
        else
        {
          v25 = (void *)MEMORY[0x1D9452090]();
          v26 = self;
          v27 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
          {
            v28 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v48 = v28;
            __int16 v49 = 2112;
            id v50 = v15;
            _os_log_impl(&dword_1D49D5000, v27, OS_LOG_TYPE_INFO, "%{public}@Took first group from %@", buf, 0x16u);
          }
          v29 = [v15 settingsController];
          v30 = [v29 rootGroup];
          uint64_t v10 = (void *)[v30 copyReplica];

          v31 = [(HMDMediaSystem *)v26 uuid];
          [v10 setParentIdentifier:v31];

          long long v18 = [(HMDAccessorySettingsMetadata *)v41 rootGroup];
          [v10 intersectSettingGroup:v10 groupMetadata:v18 shouldAddMissingItems:0];
        }
      }
      uint64_t v9 = [v11 countByEnumeratingWithState:&v43 objects:v51 count:16];
    }
    while (v9);

    id v6 = v39;
    if (v10)
    {
      id v32 = +[HMDAccessorySettingTransform modelsForGroup:v10];
      id v7 = v38;
LABEL_26:

      goto LABEL_28;
    }
    id v32 = 0;
    id v7 = v38;
  }
  else
  {
    v33 = (void *)MEMORY[0x1D9452090]();
    v34 = self;
    v35 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      long long v36 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v48 = v36;
      _os_log_impl(&dword_1D49D5000, v35, OS_LOG_TYPE_ERROR, "%{public}@Cannot load settings metadata", buf, 0xCu);
    }
    id v32 = 0;
  }
LABEL_28:

  return v32;
}

- (void)removeManagedConfigurationProfileWithProfileData:(id)a3 completion:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  uint64_t v8 = (void *)MEMORY[0x1D9452090]();
  uint64_t v9 = self;
  uint64_t v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    int v13 = 138543362;
    __int16 v14 = v11;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@Remove managed configuration profile not supported", (uint8_t *)&v13, 0xCu);
  }
  uint64_t v12 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:5];
  v7[2](v7, v12);
}

- (HMDCurrentAccessorySetupMetricDispatcher)currentAccessorySetupMetricDispatcher
{
  return 0;
}

- (double)setupStartTimestamp
{
  id v2 = [(HMDMediaSystem *)self home];
  v3 = [v2 homeManager];
  [v3 setupStartTimestamp];
  double v5 = v4;

  return v5;
}

- (void)setSetupStartTimestamp:(double)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  double v5 = (void *)MEMORY[0x1D9452090](self, a2);
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    int v11 = 138543618;
    uint64_t v12 = v8;
    __int16 v13 = 2048;
    double v14 = a3;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Setup start timestamp %f", (uint8_t *)&v11, 0x16u);
  }
  uint64_t v9 = [(HMDMediaSystem *)v6 home];
  uint64_t v10 = [v9 homeManager];
  [v10 setSetupStartTimestamp:a3];
}

- (HMFActivity)setupActivity
{
  id v2 = [(HMDMediaSystem *)self home];
  v3 = [v2 homeManager];
  double v4 = [v3 setupActivity];

  return (HMFActivity *)v4;
}

- (HMDAccessorySetupMetricDispatcher)accessorySetupMetricDispatcher
{
  return 0;
}

- (void)setSetupActivity:(id)a3
{
  id v4 = a3;
  id v6 = [(HMDMediaSystem *)self home];
  double v5 = [v6 homeManager];
  [v5 setSetupActivity:v4];
}

- (HMDBackingStore)backingStore
{
  id v2 = [(HMDMediaSystem *)self home];
  v3 = [v2 backingStore];

  return (HMDBackingStore *)v3;
}

- (id)modelObjectWithChangeType:(unint64_t)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  double v5 = [(HMDMediaSystem *)self modelForMediaSystem];
  id v6 = v5;
  if (v5)
  {
    [v5 setObjectChangeType:a3];
    id v7 = [(HMDMediaSystem *)self configuredName];
    [v6 setConfiguredName:v7];

    uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v9 = [(HMDMediaSystem *)self components];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v23 != v12) {
            objc_enumerationMutation(v9);
          }
          double v14 = [*(id *)(*((void *)&v22 + 1) + 8 * i) serialize];
          [v8 addObject:v14];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v11);
    }

    [v6 setMediaSystemComponents:v8];
    id v15 = v6;
  }
  else
  {
    uint64_t v16 = (void *)MEMORY[0x1D9452090]();
    id v17 = self;
    long long v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      long long v19 = HMFGetLogIdentifier();
      long long v20 = [NSNumber numberWithUnsignedInteger:a3];
      *(_DWORD *)buf = 138543618;
      v28 = v19;
      __int16 v29 = 2112;
      v30 = v20;
      _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to derive media system model with change type: %@ due to no provided model for media system", buf, 0x16u);
    }
  }

  return v6;
}

- (id)backingStoreObjectsForVersion:(int64_t)a3
{
  id v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", a3);
  double v5 = [(HMDMediaSystem *)self modelObjectWithChangeType:1];
  if (v5) {
    [v4 addObject:v5];
  }
  id v6 = [(HMDMediaSystem *)self settingsController];
  id v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 modelObjectsForSettings];
    [v4 addObjectsFromArray:v8];
  }
  uint64_t v9 = (void *)[v4 copy];

  return v9;
}

- (void)mergeMediaSystemData:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [(HMDMediaSystem *)self data];
  char v6 = [v5 isEqual:v4];

  if ((v6 & 1) == 0)
  {
    id v7 = (void *)MEMORY[0x1D9452090]();
    uint64_t v8 = self;
    uint64_t v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      int v11 = 138543618;
      uint64_t v12 = v10;
      __int16 v13 = 2112;
      id v14 = v4;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Merging media system data: %@", (uint8_t *)&v11, 0x16u);
    }
    [(HMDMediaSystem *)v8 setData:v4];
  }
}

- (void)mergeAudioDestination:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDMediaSystem *)self audioDestinationsManager];
  [v5 mergeDestination:v4];
}

- (void)encodeWithCoder:(id)a3
{
  id v16 = a3;
  id v4 = [(HMDMediaSystem *)self home];
  id v5 = [(HMDMediaSystem *)self name];
  [v16 encodeObject:v5 forKey:*MEMORY[0x1E4F2ED68]];

  char v6 = [(HMDMediaSystem *)self configuredName];
  [v16 encodeObject:v6 forKey:*MEMORY[0x1E4F2ED58]];

  id v7 = [(HMDMediaSystem *)self uuid];
  [v16 encodeObject:v7 forKey:*MEMORY[0x1E4F2ED80]];

  uint64_t v8 = [(HMDMediaSystem *)self components];
  [v16 encodeObject:v8 forKey:*MEMORY[0x1E4F2ED50]];

  if (objc_msgSend(v16, "hmd_isForLocalStore"))
  {
    uint64_t v9 = [(HMDMediaSystem *)self data];
    uint64_t v10 = [MEMORY[0x1E4F2E930] codingKey];
    [v16 encodeObject:v9 forKey:v10];
  }
  if (!objc_msgSend(v16, "hmd_isForXPCTransport")
    || objc_msgSend(v16, "hmd_isForXPCTransportEntitledForSPIAccess"))
  {
    int v11 = [(HMDMediaSystem *)self audioDestination];
    [v16 encodeObject:v11 forKey:*MEMORY[0x1E4F2DA28]];
  }
  [v16 encodeConditionalObject:v4 forKey:@"home"];
  if ((objc_msgSend(v16, "hmd_homeManagerOptions") & 0x20) != 0
    && ((objc_msgSend(v16, "hmd_isForRemoteTransport") & 1) != 0
     || objc_msgSend(v16, "hmd_isForXPCTransport")
     && (objc_msgSend(v16, "hmd_isForXPCTransportEntitledForSPIAccess") & 1) != 0
     || objc_msgSend(v16, "hmd_isForLocalStore")))
  {
    uint64_t v12 = [(HMDMediaSystem *)self settingsController];
    [v12 encodeWithCoder:v16];
  }
  int v13 = objc_msgSend(v16, "hmd_isForXPCTransport");
  id v14 = [(HMDMediaSystem *)self appData];
  uint64_t v15 = v14;
  if (v13) {
    [v14 encodeForXPCTransportWithCoder:v16 key:@"HM.appData"];
  }
  else {
    [v16 encodeObject:v14 forKey:@"HM.appDataRepository"];
  }
}

- (HMDMediaSystem)initWithCoder:(id)a3
{
  v24[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x1E4F2ED80]];
  char v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x1E4F2ED58]];
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"home"];
  uint64_t v8 = (void *)MEMORY[0x1E4F1CAD0];
  v24[0] = objc_opt_class();
  v24[1] = objc_opt_class();
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
  uint64_t v10 = [v8 setWithArray:v9];
  int v11 = [v4 decodeObjectOfClasses:v10 forKey:*MEMORY[0x1E4F2ED50]];

  uint64_t v12 = objc_opt_class();
  int v13 = [MEMORY[0x1E4F2E930] codingKey];
  id v14 = [v4 decodeObjectOfClass:v12 forKey:v13];

  uint64_t v15 = [(HMDMediaSystem *)self initWithUUID:v5 configuredName:v6 home:v7 data:v14 components:v11];
  if (v15)
  {
    id v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x1E4F2ED68]];
    uint64_t v17 = objc_msgSend(v16, "hm_truncatedNameString");
    name = v15->_name;
    v15->_name = (NSString *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.appDataRepository"];
    appData = v15->_appData;
    v15->_appData = (HMDApplicationData *)v19;

    [(HMDApplicationData *)v15->_appData updateParentUUIDIfNil:v15->_uuid];
    [(HMDAccessorySettingsController *)v15->_settingsController decodeWithCoder:v4];
    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x1E4F2DA28]];
    audioDestination = v15->_audioDestination;
    v15->_audioDestination = (HMMediaDestination *)v21;
  }
  return v15;
}

- (void)_appDataRemoved:(id)a3 message:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x1D9452090]();
  uint64_t v9 = self;
  uint64_t v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v11 = HMFGetLogIdentifier();
    int v13 = 138543362;
    id v14 = v11;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Handling removal of app data", (uint8_t *)&v13, 0xCu);
  }
  [(HMDMediaSystem *)v9 setAppData:0];
  uint64_t v12 = [v7 transactionResult];
  [v12 markChanged];
  [v7 respondWithPayload:0];
}

- (void)transactionObjectRemoved:(id)a3 message:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v8 = v6;
  }
  else {
    uint64_t v8 = 0;
  }
  id v9 = v8;
  if (v9)
  {
    [(HMDMediaSystem *)self _appDataRemoved:v9 message:v7];
    id v10 = v6;
  }
  else
  {
    id v10 = v6;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      int v11 = v10;
    }
    else {
      int v11 = 0;
    }
    id v12 = v11;

    if (v12)
    {
      int v13 = [(HMDMediaSystem *)self settingsController];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __51__HMDMediaSystem_transactionObjectRemoved_message___block_invoke;
      v19[3] = &unk_1E6A197F0;
      v19[4] = self;
      [v13 handleRemovedGroupModel:v12 completion:v19];
    }
    else
    {
      id v14 = (void *)MEMORY[0x1D9452090]();
      uint64_t v15 = self;
      id v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        uint64_t v17 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        uint64_t v21 = v17;
        __int16 v22 = 2112;
        id v23 = v10;
        __int16 v24 = 2112;
        id v25 = (id)objc_opt_class();
        id v18 = v25;
        _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_ERROR, "%{public}@Unknown model object (%@) sent to [%@ transactionObjectRemoved]", buf, 0x20u);
      }
      id v10 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
      [v7 respondWithError:v10];
    }
  }
}

void __51__HMDMediaSystem_transactionObjectRemoved_message___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)MEMORY[0x1D9452090]();
    id v5 = *(id *)(a1 + 32);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = HMFGetLogIdentifier();
      int v8 = 138543362;
      id v9 = v7;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_ERROR, "%{public}@Error removing root group.", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void)_appDataUpdated:(id)a3 message:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = [(HMDMediaSystem *)self appData];

  if (v8)
  {
    id v9 = [(HMDMediaSystem *)self appData];
    [v9 updateWithModel:v6];
  }
  else
  {
    uint64_t v10 = [HMDApplicationData alloc];
    int v11 = [v6 appDataDictionary];
    id v12 = [(HMDMediaSystem *)self uuid];
    int v13 = [(HMDApplicationData *)v10 initWithDictionary:v11 parentUUID:v12];
    [(HMDMediaSystem *)self setAppData:v13];

    id v14 = (void *)MEMORY[0x1D9452090]();
    uint64_t v15 = self;
    id v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v17 = HMFGetLogIdentifier();
      id v18 = [v6 appDataDictionary];
      int v20 = 138543618;
      uint64_t v21 = v17;
      __int16 v22 = 2112;
      id v23 = v18;
      _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Updating the application data : %@", (uint8_t *)&v20, 0x16u);
    }
  }
  uint64_t v19 = [v7 transactionResult];
  [v19 markChanged];
  [v7 respondWithPayload:0];
}

- (void)_transactionMediaSystemUpdated:(id)a3 message:(id)a4
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = (void *)MEMORY[0x1D9452090]();
  id v9 = self;
  uint64_t v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v55 = v11;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Applying the changes", buf, 0xCu);
  }
  if (isFeatureHomeTheaterQFAEnabledForTests
    && [(id)isFeatureHomeTheaterQFAEnabledForTests BOOLValue])
  {
    id v12 = (void *)MEMORY[0x1D9452090]();
    int v13 = v9;
    id v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v55 = v15;
      _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_INFO, "%{public}@Skipping transaction update due to Home Theater QFA enabled", buf, 0xCu);
    }
  }
  else
  {
    id v16 = [v6 setProperties];
    int v17 = [v16 containsObject:@"configuredName"];

    if (v17)
    {
      id v18 = [v6 configuredName];
      [(HMDMediaSystem *)v9 setConfiguredName:v18];
    }
    uint64_t v19 = [v6 setProperties];
    int v20 = [v19 containsObject:@"mediaSystemComponents"];

    if (v20)
    {
      uint64_t v21 = [MEMORY[0x1E4F1CA48] array];
      long long v48 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      id v47 = v6;
      __int16 v22 = [v6 mediaSystemComponents];
      uint64_t v23 = [v22 countByEnumeratingWithState:&v48 objects:v60 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v49;
        while (2)
        {
          for (uint64_t i = 0; i != v24; ++i)
          {
            if (*(void *)v49 != v25) {
              objc_enumerationMutation(v22);
            }
            v27 = *(HMDMediaSystem **)(*((void *)&v48 + 1) + 8 * i);
            v28 = [(HMDMediaSystem *)v9 home];
            __int16 v29 = +[HMDMediaSystemComponent mediaSystemComponentWithDictionary:v27 home:v28];

            if (!v29)
            {
              uint64_t v42 = (void *)MEMORY[0x1D9452090]();
              long long v43 = v9;
              long long v44 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
              {
                long long v45 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543618;
                v55 = v45;
                __int16 v56 = 2112;
                v57 = v27;
                _os_log_impl(&dword_1D49D5000, v44, OS_LOG_TYPE_ERROR, "%{public}@Unable to initialize a mediaSystemComponent from %@", buf, 0x16u);
              }
              long long v46 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
              [v7 respondWithError:v46];

              id v6 = v47;
              goto LABEL_26;
            }
            [v21 addObject:v29];
          }
          uint64_t v24 = [v22 countByEnumeratingWithState:&v48 objects:v60 count:16];
          if (v24) {
            continue;
          }
          break;
        }
      }

      v30 = (void *)MEMORY[0x1D9452090]();
      uint64_t v31 = v9;
      id v32 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        v33 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v55 = v33;
        __int16 v56 = 2112;
        v57 = v31;
        __int16 v58 = 2112;
        v59 = v21;
        _os_log_impl(&dword_1D49D5000, v32, OS_LOG_TYPE_INFO, "%{public}@Updated the media system %@ components to %@", buf, 0x20u);
      }
      v34 = (void *)[v21 copy];
      [(HMDMediaSystem *)v31 setComponents:v34];

      -[HMDMediaSystem reevaluateSettingOwner](v31);
      id v6 = v47;
    }
    uint64_t v52 = *MEMORY[0x1E4F2ED30];
    v35 = [(HMDMediaSystem *)v9 serialize];
    v53 = v35;
    long long v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v53 forKeys:&v52 count:1];
    [v7 respondWithPayload:v36];

    long long v37 = [v7 transactionResult];
    [v37 markChanged];
    [v37 markSaveToAssistant];
    id v38 = [(HMDMediaSystem *)v9 serialize];
    id v39 = [MEMORY[0x1E4F65480] entitledMessageWithName:*MEMORY[0x1E4F2ED88] messagePayload:v38];
    v40 = [(HMDMediaSystem *)v9 msgDispatcher];
    v41 = [(HMDMediaSystem *)v9 uuid];
    [v40 sendMessage:v39 target:v41];
  }
LABEL_26:
}

- (void)reevaluateSettingOwner
{
  if (a1)
  {
    id v2 = [a1 workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __40__HMDMediaSystem_reevaluateSettingOwner__block_invoke;
    block[3] = &unk_1E6A19B30;
    block[4] = a1;
    dispatch_sync(v2, block);
  }
}

void __40__HMDMediaSystem_reevaluateSettingOwner__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) targetAccessory];
  uint64_t v3 = [v2 isCurrentAccessory];
  id v4 = [*(id *)(a1 + 32) settingsController];
  int v5 = [v4 isSettingOwner];

  if (v3 != v5)
  {
    id v6 = (void *)MEMORY[0x1D9452090]();
    id v7 = *(id *)(a1 + 32);
    int v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = HMFGetLogIdentifier();
      int v12 = 138543618;
      int v13 = v9;
      __int16 v14 = 2112;
      uint64_t v15 = v2;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Target accessory sorting order has changed updating setting owner to %@", (uint8_t *)&v12, 0x16u);
    }
    uint64_t v10 = [*(id *)(a1 + 32) settingsController];
    [v10 updateSettingOwner:v3];
  }
  if (-[HMDMediaSystem _otherAccessoryUsesVersionBasedMigrationOwner](*(void **)(a1 + 32)))
  {
    int v11 = [*(id *)(a1 + 32) settingsController];
    [v11 didDetectCounterpartUsesSoftwareVersionBasedMigrationOwner];
  }
}

- (BOOL)_otherAccessoryUsesVersionBasedMigrationOwner
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v1 = [a1 components];
  uint64_t v2 = [v1 countByEnumeratingWithState:&v12 objects:&v16 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v13;
LABEL_4:
    uint64_t v5 = 0;
    while (1)
    {
      if (*(void *)v13 != v4) {
        objc_enumerationMutation(v1);
      }
      id v6 = [*(id *)(*((void *)&v12 + 1) + 8 * v5) accessory];
      objc_opt_class();
      id v7 = (objc_opt_isKindOfClass() & 1) != 0 ? v6 : 0;
      id v8 = v7;

      if (v8)
      {
        if (![v8 isCurrentAccessory]) {
          break;
        }
      }

      if (v3 == ++v5)
      {
        uint64_t v3 = [v1 countByEnumeratingWithState:&v12 objects:&v16 count:16];
        if (v3) {
          goto LABEL_4;
        }
        goto LABEL_14;
      }
    }
    id v9 = [v8 softwareVersion];

    if (!v9) {
      goto LABEL_17;
    }
    [v9 operatingSystemVersion];
    long long v16 = *MEMORY[0x1E4F64F68];
    uint64_t v17 = *(void *)(MEMORY[0x1E4F64F68] + 16);
    BOOL v10 = HMFOperatingSystemVersionCompare() == -1;
  }
  else
  {
LABEL_14:

    id v9 = 0;
LABEL_17:
    BOOL v10 = 0;
  }

  return v10;
}

- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = (void *)MEMORY[0x1D9452090]();
  long long v12 = self;
  long long v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    long long v14 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v34 = v14;
    _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Received transaction object updated", buf, 0xCu);
  }
  id v15 = v9;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    long long v16 = v15;
  }
  else {
    long long v16 = 0;
  }
  id v17 = v16;

  if (v17)
  {
    [(HMDMediaSystem *)v12 _transactionMediaSystemUpdated:v17 message:v10];
    id v18 = v15;
  }
  else
  {
    id v18 = v15;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v19 = v18;
    }
    else {
      uint64_t v19 = 0;
    }
    id v20 = v19;

    if (v20)
    {
      [(HMDMediaSystem *)v12 _appDataUpdated:v20 message:v10];
    }
    else
    {
      id v18 = v18;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v21 = v18;
      }
      else {
        uint64_t v21 = 0;
      }
      id v22 = v21;

      uint64_t v23 = (void *)MEMORY[0x1D9452090]();
      uint64_t v24 = v12;
      uint64_t v25 = HMFGetOSLogHandle();
      uint64_t v26 = v25;
      if (v22)
      {
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          v27 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v34 = v27;
          __int16 v35 = 2112;
          id v36 = v22;
          _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_INFO, "%{public}@Handling add of root settings %@", buf, 0x16u);
        }
        v28 = [(HMDMediaSystem *)v24 settingsController];
        v32[0] = MEMORY[0x1E4F143A8];
        v32[1] = 3221225472;
        v32[2] = __61__HMDMediaSystem_transactionObjectUpdated_newValues_message___block_invoke;
        v32[3] = &unk_1E6A197F0;
        v32[4] = v24;
        [v28 handleUpdatedGroupModel:v22 completion:v32];
      }
      else
      {
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          __int16 v29 = HMFGetLogIdentifier();
          v30 = objc_opt_class();
          *(_DWORD *)buf = 138543874;
          v34 = v29;
          __int16 v35 = 2112;
          id v36 = v18;
          __int16 v37 = 2112;
          id v38 = v30;
          id v31 = v30;
          _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_ERROR, "%{public}@Unknown model object (%@) sent to [%@ transactionObjectUpdated]", buf, 0x20u);
        }
        id v18 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
        [v10 respondWithError:v18];
      }
    }
  }
}

void __61__HMDMediaSystem_transactionObjectUpdated_newValues_message___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = (void *)MEMORY[0x1D9452090]();
    id v5 = *(id *)(a1 + 32);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = HMFGetLogIdentifier();
      int v8 = 138543362;
      id v9 = v7;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_ERROR, "%{public}@Error adding root group.", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (id)targetAccessoryBySerial
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = [(HMDMediaSystem *)self components];
  uint64_t v3 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    v27 = self;
    id v5 = 0;
    uint64_t v6 = *(void *)v30;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v30 != v6) {
        objc_enumerationMutation(obj);
      }
      int v8 = objc_msgSend(*(id *)(*((void *)&v29 + 1) + 8 * v7), "accessory", v27);
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v9 = v8;
      }
      else {
        id v9 = 0;
      }
      id v10 = v9;

      if (!v10)
      {
        id v18 = (void *)MEMORY[0x1D9452090]();
        uint64_t v19 = v27;
        id v20 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          uint64_t v21 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v34 = v21;
          _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_INFO, "%{public}@Missing accessory cannot determine target.", buf, 0xCu);
        }
        goto LABEL_27;
      }
      int v11 = [v10 serialNumber];

      if (!v11)
      {
        id v22 = (void *)MEMORY[0x1D9452090]();
        uint64_t v23 = v27;
        uint64_t v24 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          uint64_t v25 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v34 = v25;
          _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_INFO, "%{public}@Missing serial cannot determine target.", buf, 0xCu);
        }

LABEL_27:
        id v17 = 0;
        goto LABEL_28;
      }
      if (!v5) {
        break;
      }
      long long v12 = [v5 serialNumber];
      long long v13 = [v10 serialNumber];
      uint64_t v14 = [v12 compare:v13];

      if (v14 == -1)
      {
        id v15 = v10;

LABEL_15:
        id v5 = v8;
      }

      if (v4 == ++v7)
      {
        uint64_t v4 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
        if (v4) {
          goto LABEL_3;
        }
        goto LABEL_20;
      }
    }
    id v16 = v10;
    goto LABEL_15;
  }
  id v5 = 0;
LABEL_20:

  id v5 = v5;
  id v17 = v5;
LABEL_28:

  return v17;
}

- (HMDAppleMediaAccessory)targetAccessory
{
  uint64_t v2 = [(HMDMediaSystem *)self components];
  uint64_t v3 = +[HMDMediaSystem sortMediaComponents:v2];

  if ([v3 count])
  {
    uint64_t v4 = [v3 firstObject];
    id v5 = [v4 accessory];
  }
  else
  {
    id v5 = 0;
  }

  return (HMDAppleMediaAccessory *)v5;
}

- (void)setAppData:(id)a3
{
  uint64_t v4 = (HMDApplicationData *)a3;
  os_unfair_lock_lock_with_options();
  appData = self->_appData;
  self->_appData = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (HMDApplicationData)appData
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uint64_t v4 = self->_appData;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setMediaSession:(id)a3
{
  id v7 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  p_mediaSession = &self->_mediaSession;
  if ((HMFEqualObjects() & 1) == 0) {
    objc_storeStrong((id *)p_mediaSession, a3);
  }
  os_unfair_lock_unlock(p_lock);
}

- (HMDMediaSession)mediaSession
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uint64_t v4 = self->_mediaSession;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSArray)accessories
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v4 = [(HMDMediaSystem *)self components];
  id v5 = (void *)[v4 copy];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) accessory];
        if (v10) {
          [v3 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  int v11 = (void *)[v3 copy];
  return (NSArray *)v11;
}

- (void)setComponents:(id)a3
{
  id v5 = a3;
  os_unfair_lock_lock_with_options();
  [(HMDMediaSystem *)self unconfigureMediaSystemComponents:self->_components];
  objc_storeStrong((id *)&self->_components, a3);
  [(HMDMediaSystem *)self configureMediaSystemComponents:v5];
  os_unfair_lock_unlock(&self->_lock);
}

- (id)legacyComponents
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uint64_t v4 = (void *)[(NSArray *)self->_components copy];
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)generateComponents
{
  uint64_t v3 = [(HMDMediaSystem *)self data];
  uint64_t v4 = [(HMDMediaSystem *)self home];
  id v5 = [v4 appleMediaAccessories];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __36__HMDMediaSystem_generateComponents__block_invoke;
  v9[3] = &unk_1E6A0E998;
  id v10 = v3;
  id v6 = v3;
  uint64_t v7 = objc_msgSend(v5, "na_map:", v9);

  return v7;
}

HMDMediaSystemComponent *__36__HMDMediaSystem_generateComponents__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 audioDestination];
  id v5 = [*(id *)(a1 + 32) leftDestinationIdentifier];
  id v6 = [v4 uniqueIdentifier];
  if (objc_msgSend(v5, "hmf_isEqualToUUID:", v6))
  {

LABEL_4:
    id v10 = [HMDMediaSystemComponent alloc];
    int v11 = [v4 uniqueIdentifier];
    long long v12 = v11;
    if (!v11)
    {
      long long v12 = [MEMORY[0x1E4F29128] UUID];
    }
    id v13 = objc_alloc(MEMORY[0x1E4F2E938]);
    uint64_t v14 = 1;
    goto LABEL_13;
  }
  uint64_t v7 = [*(id *)(a1 + 32) leftDestinationIdentifier];
  uint64_t v8 = [v3 uuid];
  int v9 = objc_msgSend(v7, "hmf_isEqualToUUID:", v8);

  if (v9) {
    goto LABEL_4;
  }
  long long v15 = [*(id *)(a1 + 32) rightDestinationIdentifier];
  long long v16 = [v4 uniqueIdentifier];
  if (objc_msgSend(v15, "hmf_isEqualToUUID:", v16))
  {
  }
  else
  {
    id v17 = [*(id *)(a1 + 32) rightDestinationIdentifier];
    uint64_t v18 = [v3 uuid];
    int v19 = objc_msgSend(v17, "hmf_isEqualToUUID:", v18);

    if (!v19)
    {
      uint64_t v21 = 0;
      goto LABEL_16;
    }
  }
  id v10 = [HMDMediaSystemComponent alloc];
  int v11 = [v4 uniqueIdentifier];
  long long v12 = v11;
  if (!v11)
  {
    long long v12 = [MEMORY[0x1E4F29128] UUID];
  }
  id v13 = objc_alloc(MEMORY[0x1E4F2E938]);
  uint64_t v14 = 2;
LABEL_13:
  id v20 = (void *)[v13 initWithRole:v14];
  uint64_t v21 = [(HMDMediaSystemComponent *)v10 initWithUUID:v12 accessory:v3 role:v20];

  if (!v11)
  {

    int v11 = 0;
  }

LABEL_16:
  return v21;
}

- (NSArray)components
{
  if (isFeatureHomeTheaterQFAEnabledForTests
    && ([(id)isFeatureHomeTheaterQFAEnabledForTests BOOLValue] & 1) != 0)
  {
    id v3 = [(HMDMediaSystem *)self generateComponents];
  }
  else
  {
    id v3 = [(HMDMediaSystem *)self legacyComponents];
  }
  return (NSArray *)v3;
}

- (void)setConfiguredName:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  objc_msgSend(v6, "hm_truncatedNameString");
  uint64_t v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  configuredName = self->_configuredName;
  self->_configuredName = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (id)legacyConfiguredName
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uint64_t v4 = self->_configuredName;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSString)configuredName
{
  if (isFeatureHomeTheaterQFAEnabledForTests
    && ([(id)isFeatureHomeTheaterQFAEnabledForTests BOOLValue] & 1) != 0)
  {
    id v3 = [(HMDMediaSystem *)self data];
    char v4 = [v3 isDefaultName];

    if (v4)
    {
      id v5 = 0;
    }
    else
    {
      uint64_t v7 = [(HMDMediaSystem *)self data];
      id v5 = [v7 name];
    }
  }
  else
  {
    id v5 = [(HMDMediaSystem *)self legacyConfiguredName];
  }
  return (NSString *)v5;
}

- (HMDRoom)room
{
  uint64_t v2 = [(HMDMediaSystem *)self targetAccessory];
  id v3 = [v2 room];

  return (HMDRoom *)v3;
}

- (void)setName:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  objc_msgSend(v6, "hm_truncatedNameString");
  char v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  name = self->_name;
  self->_name = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (id)legacyName
{
  id v3 = [(HMDMediaSystem *)self room];
  char v4 = [v3 name];

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  configuredName = self->_configuredName;
  if (!configuredName) {
    configuredName = v4;
  }
  uint64_t v7 = configuredName;
  os_unfair_lock_unlock(p_lock);

  return v7;
}

- (NSString)name
{
  if (isFeatureHomeTheaterQFAEnabledForTests
    && ([(id)isFeatureHomeTheaterQFAEnabledForTests BOOLValue] & 1) != 0)
  {
    id v3 = [(HMDMediaSystem *)self data];
    char v4 = [v3 name];
  }
  else
  {
    char v4 = [(HMDMediaSystem *)self legacyName];
  }
  return (NSString *)v4;
}

- (id)serialize
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char v4 = [(HMDMediaSystem *)self name];

  if (v4)
  {
    id v5 = [(HMDMediaSystem *)self name];
    [v3 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F2ED68]];
  }
  id v6 = [(HMDMediaSystem *)self configuredName];

  if (v6)
  {
    uint64_t v7 = [(HMDMediaSystem *)self configuredName];
    [v3 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F2ED58]];
  }
  uint64_t v8 = [(HMDMediaSystem *)self uuid];
  int v9 = [v8 UUIDString];
  [v3 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F2ED80]];

  [v3 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F2ED38]];
  id v10 = [MEMORY[0x1E4F1CA48] array];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  int v11 = [(HMDMediaSystem *)self components];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        long long v16 = [*(id *)(*((void *)&v19 + 1) + 8 * i) serialize];
        [v10 addObject:v16];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v13);
  }

  [v3 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F2ED50]];
  id v17 = (void *)[v3 copy];

  return v17;
}

- (void)relayMessage:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 isRemote])
  {
    id v5 = (void *)MEMORY[0x1D9452090]();
    id v6 = self;
    uint64_t v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = HMFGetLogIdentifier();
      int v33 = 138543618;
      v34 = v8;
      __int16 v35 = 2112;
      id v36 = v4;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_ERROR, "%{public}@Cannot relay remote message: %@", (uint8_t *)&v33, 0x16u);
    }
    int v9 = [MEMORY[0x1E4F28C58] hmErrorWithCode:52];
    [v4 respondWithError:v9];
  }
  else
  {
    int v9 = [(HMDMediaSystem *)self msgDispatcher];
    if (v9)
    {
      id v10 = [(HMDMediaSystem *)self targetAccessory];
      int v11 = [v10 device];

      if (v11)
      {
        uint64_t v12 = [HMDRemoteDeviceMessageDestination alloc];
        uint64_t v13 = [(HMDMediaSystem *)self messageTargetUUID];
        uint64_t v14 = [(HMDRemoteDeviceMessageDestination *)v12 initWithTarget:v13 device:v11];

        if (v14)
        {
          long long v15 = [v4 name];
          uint64_t v16 = [v4 qualityOfService];
          id v17 = [v4 messagePayload];
          uint64_t v18 = +[HMDRemoteMessage secureMessageWithName:v15 qualityOfService:v16 destination:v14 messagePayload:v17];

          long long v19 = [v4 responseHandler];
          [v18 setResponseHandler:v19];

          [v9 sendMessage:v18];
        }
        else
        {
          v28 = (void *)MEMORY[0x1D9452090]();
          long long v29 = self;
          long long v30 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            long long v31 = HMFGetLogIdentifier();
            int v33 = 138543618;
            v34 = v31;
            __int16 v35 = 2112;
            id v36 = v4;
            _os_log_impl(&dword_1D49D5000, v30, OS_LOG_TYPE_ERROR, "%{public}@Failed to get message destination to relay message: %@", (uint8_t *)&v33, 0x16u);
          }
          long long v32 = [MEMORY[0x1E4F28C58] hmErrorWithCode:54];
          [v4 respondWithError:v32];

          uint64_t v14 = 0;
        }
      }
      else
      {
        uint64_t v24 = (void *)MEMORY[0x1D9452090]();
        uint64_t v25 = self;
        uint64_t v26 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          v27 = HMFGetLogIdentifier();
          int v33 = 138543618;
          v34 = v27;
          __int16 v35 = 2112;
          id v36 = v4;
          _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_ERROR, "%{public}@Failed to get target device to relay message: %@", (uint8_t *)&v33, 0x16u);
        }
        uint64_t v14 = [MEMORY[0x1E4F28C58] hmErrorWithCode:54];
        [v4 respondWithError:v14];
      }
    }
    else
    {
      long long v20 = (void *)MEMORY[0x1D9452090]();
      long long v21 = self;
      long long v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        uint64_t v23 = HMFGetLogIdentifier();
        int v33 = 138543618;
        v34 = v23;
        __int16 v35 = 2112;
        id v36 = v4;
        _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to get message dispatcher to relay message: %@", (uint8_t *)&v33, 0x16u);
      }
      int v11 = [MEMORY[0x1E4F28C58] hmErrorWithCode:54];
      [v4 respondWithError:v11];
    }
  }
}

- (void)handleAccessorySoftwareUpdated:(id)a3
{
  id v4 = [a3 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v9 = v5;

  id v6 = v9;
  if (v9)
  {
    uint64_t v7 = [(HMDMediaSystem *)self accessories];
    int v8 = [v7 containsObject:v9];

    id v6 = v9;
    if (v8)
    {
      -[HMDMediaSystem reevaluateSettingOwner](self);
      id v6 = v9;
    }
  }
}

- (void)handleHomeCloudZoneReadyNotification:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 userInfo];
  id v6 = objc_msgSend(v5, "hmf_UUIDForKey:", @"HMDCR.id");
  if (v6)
  {
    uint64_t v7 = [(HMDMediaSystem *)self home];
    int v8 = [v7 zoneID];
    if (([v6 isEqual:v8] & 1) == 0)
    {

LABEL_8:
      goto LABEL_9;
    }
    id v9 = [(HMDMediaSystem *)self targetAccessory];
    int v10 = [v9 isCurrentAccessory];

    if (v10)
    {
      int v11 = (void *)MEMORY[0x1D9452090]();
      uint64_t v12 = self;
      uint64_t v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        uint64_t v14 = HMFGetLogIdentifier();
        long long v15 = [(HMDMediaSystem *)v12 uuid];
        uint64_t v16 = [v15 UUIDString];
        id v17 = [v6 UUIDString];
        int v18 = 138543874;
        long long v19 = v14;
        __int16 v20 = 2112;
        long long v21 = v16;
        __int16 v22 = 2112;
        uint64_t v23 = v17;
        _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Received zone ready for media system %@/%@", (uint8_t *)&v18, 0x20u);
      }
      uint64_t v7 = [(HMDMediaSystem *)v12 settingsController];
      [v7 auditOnFirstFetch];
      goto LABEL_8;
    }
  }
LABEL_9:
}

- (void)_updateAppData:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = self;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = HMFGetLogIdentifier();
    int v24 = 138543618;
    uint64_t v25 = v8;
    __int16 v26 = 2112;
    id v27 = v4;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Updating app data with message: %@", (uint8_t *)&v24, 0x16u);
  }
  id v9 = @"com.apple.homekit-entitledclient.identifer";
  int v10 = [v4 dictionaryForKey:@"kAppDataInformationKey"];
  int v11 = [(HMDMediaSystem *)v6 appData];
  uint64_t v12 = (HMDApplicationData *)[v11 copy];
  if (v12)
  {
    uint64_t v13 = v12;
    if (v10) {
      [(HMDApplicationData *)v12 setApplicationData:v10 forIdentifier:@"com.apple.homekit-entitledclient.identifer"];
    }
    else {
      [(HMDApplicationData *)v12 removeApplicationDataForIdentifier:@"com.apple.homekit-entitledclient.identifer"];
    }
    uint64_t v16 = v13;
    uint64_t v17 = 2;
  }
  else
  {
    if (!v10)
    {
      uint64_t v13 = 0;
      goto LABEL_13;
    }
    uint64_t v14 = [HMDApplicationData alloc];
    long long v15 = [(HMDMediaSystem *)v6 uuid];
    uint64_t v13 = [(HMDApplicationData *)v14 initWithParentUUID:v15];

    [(HMDApplicationData *)v13 setApplicationData:v10 forIdentifier:@"com.apple.homekit-entitledclient.identifer"];
    uint64_t v16 = v13;
    uint64_t v17 = 1;
  }
  int v18 = [(HMDApplicationData *)v16 modelObjectWithChangeType:v17];
  if (!v18)
  {
LABEL_13:
    [v4 respondWithPayload:0];
    goto LABEL_14;
  }
  long long v19 = [(HMDMediaSystem *)v6 home];
  __int16 v20 = [v19 backingStore];
  long long v21 = [v4 name];
  __int16 v22 = +[HMDBackingStoreTransactionOptions defaultXPCOptions];
  uint64_t v23 = [v20 transaction:v21 options:v22];

  [v23 add:v18 withMessage:v4];
  [v23 run];

LABEL_14:
}

- (void)_handleAppData:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDMediaSystem *)self home];
  id v6 = [v5 mediaSystemController];
  uint64_t v7 = [v6 processedMediaSystemBuilderMessageFor:v4];

  if (v7)
  {
    [(HMDMediaSystem *)self _updateAppData:v7];
  }
  else
  {
    int v8 = (void *)MEMORY[0x1D9452090]();
    id v9 = self;
    int v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v11 = HMFGetLogIdentifier();
      int v12 = 138543618;
      uint64_t v13 = v11;
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to pre process update media system app data message: %@", (uint8_t *)&v12, 0x16u);
    }
  }
}

- (void)_routeUpdateMediaSystem:(id)a3
{
  id v4 = a3;
  id v6 = [(HMDMediaSystem *)self home];
  id v5 = [v6 mediaSystemController];
  [v5 routeMediaSystemWithMessage:v4];
}

- (void)_registerForNotifications
{
  id v3 = [(HMDMediaSystem *)self notificationCenter];
  [v3 addObserver:self selector:sel_handleHomeCloudZoneReadyNotification_ name:@"HMDCloudZoneReadyNotification" object:0];

  id v4 = [(HMDMediaSystem *)self notificationCenter];
  [v4 addObserver:self selector:sel_handleRemovedAccessory_ name:@"HMDHomeAccessoryRemovedNotification" object:0];

  id v5 = [(HMDMediaSystem *)self notificationCenter];
  [v5 addObserver:self selector:sel_handleAccessorySoftwareUpdated_ name:@"HMDAppleMediaAccessorySoftwareVersionUpdatedNotification" object:0];
}

- (void)_registerForMessages
{
  v16[4] = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDMediaSystem *)self msgDispatcher];
  id v4 = +[HMDRemoteMessagePolicy defaultSecurePolicy];
  objc_msgSend(v4, "setRoles:", objc_msgSend(v4, "roles") | 4);
  id v5 = (void *)[v4 copy];
  id v6 = [(HMDMediaSystem *)self home];
  uint64_t v7 = +[HMDConfigurationMessagePolicy policyWithOperationTypes:2];
  v16[0] = v7;
  int v8 = +[HMDXPCMessagePolicy policyWithEntitlements:5];
  v16[1] = v8;
  v16[2] = v5;
  id v9 = +[HMDUserMessagePolicy userMessagePolicyWithHome:v6 userPrivilege:4 remoteAccessRequired:0];
  v16[3] = v9;
  int v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:4];

  [v3 registerForMessage:*MEMORY[0x1E4F2EE98] receiver:self policies:v10 selector:sel__routeUpdateMediaSystem_];
  int v11 = +[HMDConfigurationMessagePolicy policyWithOperationTypes:7];
  v15[0] = v11;
  int v12 = +[HMDXPCMessagePolicy policyWithEntitlements:5];
  v15[1] = v12;
  v15[2] = v5;
  uint64_t v13 = +[HMDUserMessagePolicy userMessagePolicyWithHome:v6 userPrivilege:4 remoteAccessRequired:0];
  v15[3] = v13;
  __int16 v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:4];

  [v3 registerForMessage:*MEMORY[0x1E4F2ED78] receiver:self policies:v14 selector:sel__handleAppData_];
}

- (void)auditMediaComponents
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (isFeatureHomeTheaterQFAEnabledForTests
    && [(id)isFeatureHomeTheaterQFAEnabledForTests BOOLValue])
  {
    id v3 = (void *)MEMORY[0x1D9452090]();
    id v4 = self;
    id v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      int v10 = v6;
      _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Skipping audit due to Home Theater QFA enabled", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v7 = [(HMDMediaSystem *)self workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __38__HMDMediaSystem_auditMediaComponents__block_invoke;
    block[3] = &unk_1E6A19B30;
    block[4] = self;
    dispatch_async(v7, block);
  }
}

void __38__HMDMediaSystem_auditMediaComponents__block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (([*(id *)(a1 + 32) isValid] & 1) == 0)
  {
    uint64_t v2 = (void *)MEMORY[0x1D9452090]();
    id v3 = *(id *)(a1 + 32);
    id v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v5 = HMFGetLogIdentifier();
      int v16 = 138543362;
      uint64_t v17 = v5;
      _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@Media system isn't valid anymore, removing it", (uint8_t *)&v16, 0xCu);
    }
    id v6 = [*(id *)(a1 + 32) home];
    uint64_t v7 = -[HMDMediaSystem _modelForMediaSystem](*(id *)(a1 + 32));
    int v8 = v7;
    if (v7)
    {
      [v7 setObjectChangeType:3];
      id v9 = [v6 backingStore];
      int v10 = +[HMDBackingStoreTransactionOptions defaultXPCOptions];
      uint64_t v11 = [v9 transaction:@"Remove-Invalid-Media-System" options:v10];

      [v11 add:v8 withMessage:0];
      [v11 run];
    }
    else
    {
      int v12 = (void *)MEMORY[0x1D9452090]();
      id v13 = *(id *)(a1 + 32);
      __int16 v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        id v15 = HMFGetLogIdentifier();
        int v16 = 138543362;
        uint64_t v17 = v15;
        _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_ERROR, "%{public}@Did not obtain media system model, not deleting.", (uint8_t *)&v16, 0xCu);
      }
    }
  }
}

- (id)_modelForMediaSystem
{
  id v1 = a1;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v2 = [a1 accessories];
    id v3 = (void *)[v2 copy];

    id v4 = [v3 firstObject];
    if (v4)
    {
      id v5 = [v1 home];
      id v6 = [v5 uuid];
      id v7 = v4;
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      if (isKindOfClass) {
        id v9 = v7;
      }
      else {
        id v9 = 0;
      }
      id v10 = v9;

      if (isKindOfClass)
      {
        uint64_t v11 = HMDMediaSystemModelExtendedV2;
      }
      else
      {
        id v16 = v7;
        objc_opt_class();
        char v17 = objc_opt_isKindOfClass();

        if (v17) {
          uint64_t v11 = HMDMediaSystemModelExtended;
        }
        else {
          uint64_t v11 = HMDMediaSystemModel;
        }
      }
      id v18 = [v11 alloc];
      long long v19 = [v1 uuid];
      id v1 = (id)[v18 initWithUUID:v19 parentUUID:v6];
    }
    else
    {
      int v12 = (void *)MEMORY[0x1D9452090]();
      id v13 = v1;
      __int16 v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        id v15 = HMFGetLogIdentifier();
        int v21 = 138543362;
        __int16 v22 = v15;
        _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to determine model type due to no accessories in media system", (uint8_t *)&v21, 0xCu);
      }
      id v1 = 0;
    }
  }
  return v1;
}

- (void)unconfigureMediaSystemComponents:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDMediaSystem *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__HMDMediaSystem_unconfigureMediaSystemComponents___block_invoke;
  block[3] = &unk_1E6A19B30;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);
}

uint64_t __51__HMDMediaSystem_unconfigureMediaSystemComponents___block_invoke(uint64_t a1)
{
  return +[HMDMediaSystem _configureMediaSystemComponents:*(void *)(a1 + 32) mediaSystem:0];
}

- (void)unconfigureMediaSystemComponents
{
  id v3 = [(HMDMediaSystem *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__HMDMediaSystem_unconfigureMediaSystemComponents__block_invoke;
  block[3] = &unk_1E6A19B30;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __50__HMDMediaSystem_unconfigureMediaSystemComponents__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) components];
  +[HMDMediaSystem _configureMediaSystemComponents:v2 mediaSystem:0];

  id v3 = [*(id *)(a1 + 32) settingsController];
  [v3 removeAllDependants];
}

- (void)mediaDestinationsManager:(id)a3 didUpdateDestination:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1D9452090]();
  id v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    int v16 = 138543618;
    char v17 = v11;
    __int16 v18 = 2112;
    id v19 = v7;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Updating home and siri sync data due to updated destination: %@", (uint8_t *)&v16, 0x16u);
  }
  int v12 = [(HMDMediaSystem *)v9 home];
  id v13 = [v12 homeManager];

  uint64_t v14 = *MEMORY[0x1E4F2D8D0];
  id v15 = [(HMDMediaSystem *)v9 uuid];
  [v13 updateGenerationCounterWithReason:v14 sourceUUID:v15 shouldNotifyClients:1];

  [v13 assistantSyncDataChanged:v14];
}

- (id)mediaDestinationsManager:(id)a3 destinationControllerWithIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = [(HMDMediaSystem *)self home];
  id v7 = [v6 destinationControllerWithIdentifier:v5];

  return v7;
}

- (id)mediaGroupsAggregatorMessengerForMediaDestinationsManager:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDMediaSystem *)self home];
  id v6 = [v5 mediaGroupsAggregator];
  id v7 = [v6 messenger];
  id v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v10 = (void *)MEMORY[0x1D9452090]();
    uint64_t v11 = self;
    int v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = HMFGetLogIdentifier();
      int v15 = 138543874;
      int v16 = v13;
      __int16 v17 = 2112;
      __int16 v18 = v5;
      __int16 v19 = 2112;
      uint64_t v20 = v6;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to get messenger from dependencies home: %@ aggregator: %@", (uint8_t *)&v15, 0x20u);
    }
  }

  return v8;
}

- (BOOL)isCurrentComponent
{
  uint64_t v2 = [(HMDMediaSystem *)self components];
  char v3 = objc_msgSend(v2, "na_any:", &__block_literal_global_68_96458);

  return v3;
}

uint64_t __36__HMDMediaSystem_isCurrentComponent__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 accessory];
  uint64_t v3 = [v2 isCurrentAccessory];

  return v3;
}

- (id)destinationControllerGroupedWithAssociatedDestination
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v3 = [(HMDMediaSystem *)self associatedAudioDestinationManagers];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v14 != v6) {
        objc_enumerationMutation(v3);
      }
      id v8 = *(void **)(*((void *)&v13 + 1) + 8 * v7);
      id v9 = [(HMDMediaSystem *)self home];
      id v10 = [v8 identifier];
      uint64_t v11 = [v9 destinationControllerWithDestinationIdentifier:v10];

      if (v11) {
        break;
      }
      if (v5 == ++v7)
      {
        uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    uint64_t v11 = 0;
  }

  return v11;
}

- (void)repairAnyPreExistingAudioGroups
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ([(HMDMediaSystem *)self isCurrentComponent])
  {
    uint64_t v3 = [(HMDMediaSystem *)self home];
    uint64_t v4 = [(HMDMediaSystem *)self audioDestinationIdentifier];
    uint64_t v5 = [v3 destinationControllerWithCommittedDestinationIdentifier:v4];

    if (v5
      || ([(HMDMediaSystem *)self uuid],
          uint64_t v6 = objc_claimAutoreleasedReturnValue(),
          [v3 destinationControllerWithCommittedDestinationIdentifier:v6],
          uint64_t v5 = objc_claimAutoreleasedReturnValue(),
          v6,
          v5)
      || ([(HMDMediaSystem *)self destinationControllerGroupedWithAssociatedDestination], (uint64_t v5 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      uint64_t v7 = (void *)MEMORY[0x1D9452090]();
      id v8 = self;
      id v9 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        id v10 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        long long v16 = v10;
        __int16 v17 = 2112;
        uint64_t v18 = v5;
        _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Repairing existing audio group with destination controller: %@", buf, 0x16u);
      }
      uint64_t v11 = [(HMDMediaSystem *)v8 audioDestinationsManager];
      int v12 = [v11 messageHandler];
      long long v13 = [v5 identifier];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __49__HMDMediaSystem_repairAnyPreExistingAudioGroups__block_invoke;
      v14[3] = &unk_1E6A197F0;
      v14[4] = v8;
      [v12 sendRequestToUpdateAudioGroupIdentifier:v13 completion:v14];
    }
  }
}

void __49__HMDMediaSystem_repairAnyPreExistingAudioGroups__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = (void *)MEMORY[0x1D9452090]();
    id v5 = *(id *)(a1 + 32);
    uint64_t v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = HMFGetLogIdentifier();
      int v12 = 138543618;
      long long v13 = v7;
      __int16 v14 = 2112;
      id v15 = v3;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_ERROR, "%{public}@Repair existing audio group request completed with error: %@", (uint8_t *)&v12, 0x16u);
    }
  }
  id v8 = (void *)MEMORY[0x1D9452090]();
  id v9 = *(id *)(a1 + 32);
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    int v12 = 138543362;
    long long v13 = v11;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Repair existing audio group request completed", (uint8_t *)&v12, 0xCu);
  }
}

- (id)createNewAudioDestination
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1D9452090](self, a2);
  uint64_t v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = HMFGetLogIdentifier();
    int v12 = 138543362;
    long long v13 = v6;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Creating new audio destination", (uint8_t *)&v12, 0xCu);
  }
  id v7 = objc_alloc(MEMORY[0x1E4F2E8C8]);
  id v8 = [(HMDMediaSystem *)v4 audioDestinationIdentifier];
  id v9 = [(HMDMediaSystem *)v4 uuid];
  id v10 = (void *)[v7 initWithUniqueIdentifier:v8 parentIdentifier:v9 supportedOptions:0];

  return v10;
}

- (void)configureAudioDestinationsManager
{
  uint64_t v3 = [(HMDMediaSystem *)self audioDestination];
  uint64_t v4 = v3;
  if (!v3)
  {
    uint64_t v3 = [(HMDMediaSystem *)self createNewAudioDestination];
  }
  id v11 = (id)v3;
  id v5 = [(HMDMediaSystem *)self audioDestinationsManagerFactory];
  uint64_t v6 = [(HMDMediaSystem *)self msgDispatcher];
  id v7 = [(HMDMediaSystem *)self notificationCenter];
  id v8 = ((void (**)(void, id, void *, void *, HMDMediaSystem *, HMDMediaSystem *))v5)[2](v5, v11, v6, v7, self, self);
  [(HMDMediaSystem *)self setAudioDestinationsManager:v8];

  id v9 = [(HMDMediaSystem *)self audioDestinationsManager];
  id v10 = [(HMDMediaSystem *)self home];
  [v9 configureWithHome:v10];

  if (!v4) {
    [(HMDMediaSystem *)self repairAnyPreExistingAudioGroups];
  }
}

- (NSArray)associatedAudioDestinationManagers
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([(HMDMediaSystem *)self isValid])
  {
    uint64_t v3 = [(HMDMediaSystem *)self components];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __52__HMDMediaSystem_associatedAudioDestinationManagers__block_invoke;
    v13[3] = &unk_1E6A0E950;
    v13[4] = self;
    uint64_t v4 = objc_msgSend(v3, "na_map:", v13);
    uint64_t v5 = [v4 count];
    if (v5 == [v3 count]) {
      uint64_t v6 = v4;
    }
    else {
      uint64_t v6 = 0;
    }
    id v7 = v6;
  }
  else
  {
    id v8 = (void *)MEMORY[0x1D9452090]();
    id v9 = self;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v15 = v11;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to get associated destination managers due to invalid media system", buf, 0xCu);
    }
    id v7 = 0;
  }
  return (NSArray *)v7;
}

id __52__HMDMediaSystem_associatedAudioDestinationManagers__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 accessory];
  uint64_t v5 = [v3 accessory];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = v6;

  id v8 = [v7 audioDestinationManager];
  if (!v8)
  {
    id v9 = (void *)MEMORY[0x1D9452090]();
    id v10 = *(id *)(a1 + 32);
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v12 = HMFGetLogIdentifier();
      int v14 = 138544130;
      id v15 = v12;
      __int16 v16 = 2112;
      id v17 = v3;
      __int16 v18 = 2112;
      uint64_t v19 = v4;
      __int16 v20 = 2112;
      id v21 = v7;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@No audio destination manager found for component: %@ accessory: %@ apple media accessory: %@", (uint8_t *)&v14, 0x2Au);
    }
  }

  return v8;
}

- (id)legacyAudioDestination
{
  id v3 = [(HMDMediaSystem *)self audioDestinationsManager];
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 destination];
  }
  else
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock_with_options();
    uint64_t v5 = self->_audioDestination;
    os_unfair_lock_unlock(p_lock);
  }

  return v5;
}

- (HMMediaDestination)audioDestination
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (isFeatureHomeTheaterQFAEnabledForTests
    && ([(id)isFeatureHomeTheaterQFAEnabledForTests BOOLValue] & 1) != 0)
  {
    id v3 = [(HMDMediaSystem *)self dataSource];
    uint64_t v4 = v3;
    if (v3)
    {
      uint64_t v5 = [v3 destinationForMediaSystem:self];
      p_lock = &self->_lock;
      os_unfair_lock_lock_with_options();
      audioDestination = v5;
      if (!v5) {
        audioDestination = self->_audioDestination;
      }
      id v8 = audioDestination;
      os_unfair_lock_unlock(p_lock);
    }
    else
    {
      id v9 = (void *)MEMORY[0x1D9452090]();
      id v10 = self;
      id v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        int v12 = HMFGetLogIdentifier();
        int v14 = 138543362;
        id v15 = v12;
        _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to get audio destination data due to no data source set", (uint8_t *)&v14, 0xCu);
      }
      id v8 = 0;
    }
  }
  else
  {
    id v8 = [(HMDMediaSystem *)self legacyAudioDestination];
  }
  return v8;
}

- (id)audioDestinationIdentifier
{
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"222AA6C0-21DB-4EE6-8E62-019974477350"];
  uint64_t v4 = (void *)MEMORY[0x1E4F29128];
  uint64_t v5 = [(HMDMediaSystem *)self uuid];
  uint64_t v6 = [v5 UUIDString];
  id v7 = [v6 dataUsingEncoding:4];
  id v8 = objc_msgSend(v4, "hmf_UUIDWithNamespace:data:", v3, v7);

  return v8;
}

- (void)configureMediaSystemComponents:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HMDMediaSystem *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__HMDMediaSystem_configureMediaSystemComponents___block_invoke;
  v7[3] = &unk_1E6A197C8;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __49__HMDMediaSystem_configureMediaSystemComponents___block_invoke(uint64_t a1)
{
  return +[HMDMediaSystem _configureMediaSystemComponents:*(void *)(a1 + 32) mediaSystem:*(void *)(a1 + 40)];
}

- (void)configureWithMessageDispatcher:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    id v9 = [(HMDMediaSystem *)v6 components];
    *(_DWORD *)buf = 138543618;
    id v38 = v8;
    __int16 v39 = 2112;
    v40 = v9;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Configuring media system with components: %@", buf, 0x16u);
  }
  long long v31 = v4;
  [(HMDMediaSystem *)v6 setMsgDispatcher:v4];
  [(HMDMediaSystem *)v6 _registerForMessages];
  [(HMDMediaSystem *)v6 _registerForNotifications];
  id v10 = [(HMDMediaSystem *)v6 components];
  +[HMDMediaSystem _configureMediaSystemComponents:v10 mediaSystem:v6];

  id v11 = [(HMDMediaSystem *)v6 home];
  int v12 = [(HMDMediaSystem *)v6 targetAccessoryBySerial];
  uint64_t v13 = [v12 isCurrentAccessory];

  int v14 = [(HMDMediaSystem *)v6 settingsController];
  id v15 = [(HMDMediaSystem *)v6 targetAccessory];
  objc_msgSend(v14, "configureIsSettingOwner:migrationOwner:home:legacySettingsAdaptor:", objc_msgSend(v15, "isCurrentAccessory"), v13, v11, 0);

  if ((v13 & 1) == 0 && -[HMDMediaSystem _otherAccessoryUsesVersionBasedMigrationOwner](v6))
  {
    uint64_t v16 = [(HMDMediaSystem *)v6 settingsController];
    [v16 didDetectCounterpartUsesSoftwareVersionBasedMigrationOwner];
  }
  id v17 = [(HMDMediaSystem *)v6 settingsController];
  __int16 v18 = [v17 messageHandler];
  uint64_t v19 = [(HMDMediaSystem *)v6 msgDispatcher];
  [v18 configureWithMessageDispatcher:v19];

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  __int16 v20 = [(HMDMediaSystem *)v6 components];
  uint64_t v21 = [v20 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v33;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v33 != v23) {
          objc_enumerationMutation(v20);
        }
        uint64_t v25 = [*(id *)(*((void *)&v32 + 1) + 8 * v24) accessory];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          __int16 v26 = v25;
        }
        else {
          __int16 v26 = 0;
        }
        id v27 = v26;

        uint64_t v28 = [v27 settingsController];

        if (v28)
        {
          long long v29 = [(HMDMediaSystem *)v6 settingsController];
          long long v30 = [v27 settingsController];
          [v29 addDependant:v30];
        }
        ++v24;
      }
      while (v22 != v24);
      uint64_t v22 = [v20 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v22);
  }

  [(HMDMediaSystem *)v6 configureAudioDestinationsManager];
}

- (BOOL)supportsUserMediaSettings
{
  id v3 = [(HMDMediaSystem *)self accessories];
  int v4 = objc_msgSend(v3, "na_any:", &__block_literal_global_62);

  if (!v4) {
    return 0;
  }
  uint64_t v5 = [(HMDMediaSystem *)self accessories];
  BOOL v6 = [v5 count] != 0;

  return v6;
}

uint64_t __43__HMDMediaSystem_supportsUserMediaSettings__block_invoke(uint64_t a1, void *a2)
{
  return [a2 supportsUserMediaSettings];
}

- (BOOL)isValid
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDMediaSystem *)self components];
  unint64_t v4 = [v3 count];

  if (v4 > 1)
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v10 = [(HMDMediaSystem *)self components];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v35 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v26;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v26 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          uint64_t v16 = [v15 accessory];
          if (!v16
            || ([(HMDMediaSystem *)self home],
                id v17 = objc_claimAutoreleasedReturnValue(),
                [v17 accessories],
                __int16 v18 = objc_claimAutoreleasedReturnValue(),
                char v19 = [v18 containsObject:v16],
                v18,
                v17,
                (v19 & 1) == 0))
          {
            __int16 v20 = (void *)MEMORY[0x1D9452090]();
            uint64_t v21 = self;
            uint64_t v22 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              uint64_t v23 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543874;
              long long v30 = v23;
              __int16 v31 = 2112;
              long long v32 = v15;
              __int16 v33 = 2112;
              long long v34 = v16;
              _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_ERROR, "%{public}@Component %@ contains an invalid accessory %@", buf, 0x20u);
            }

            BOOL v9 = 0;
            goto LABEL_19;
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v25 objects:v35 count:16];
        BOOL v9 = 1;
        if (v12) {
          continue;
        }
        break;
      }
    }
    else
    {
      BOOL v9 = 1;
    }
LABEL_19:
  }
  else
  {
    uint64_t v5 = (void *)MEMORY[0x1D9452090]();
    BOOL v6 = self;
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      long long v30 = v8;
      __int16 v31 = 2112;
      long long v32 = &unk_1F2DC82D8;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_ERROR, "%{public}@There are fewer than %@ components, not valid", buf, 0x16u);
    }
    return 0;
  }
  return v9;
}

- (id)messageDestination
{
  id v3 = objc_alloc(MEMORY[0x1E4F65488]);
  unint64_t v4 = [(HMDMediaSystem *)self messageTargetUUID];
  uint64_t v5 = (void *)[v3 initWithTarget:v4];

  return v5;
}

- (id)dumpState
{
  return 0;
}

- (void)dealloc
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1D9452090](self, a2);
  unint64_t v4 = self;
  uint64_t v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    BOOL v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    BOOL v9 = v6;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Dealloc-ing MediaSystem", buf, 0xCu);
  }
  v7.receiver = v4;
  v7.super_class = (Class)HMDMediaSystem;
  [(HMDMediaSystem *)&v7 dealloc];
}

- (id)logIdentifier
{
  uint64_t v2 = [(HMDMediaSystem *)self uuid];
  id v3 = [v2 UUIDString];

  return v3;
}

- (id)attributeDescriptions
{
  v20[5] = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDMediaSystem *)self components];
  char v19 = (void *)[v3 copy];

  unint64_t v4 = objc_msgSend(v19, "na_map:", &__block_literal_global_30);
  uint64_t v5 = objc_msgSend(v19, "na_map:", &__block_literal_global_32_96478);
  id v6 = objc_alloc(MEMORY[0x1E4F653F8]);
  __int16 v18 = [(HMDMediaSystem *)self uuid];
  objc_super v7 = (void *)[v6 initWithName:@"uuid" value:v18];
  v20[0] = v7;
  id v8 = objc_alloc(MEMORY[0x1E4F653F8]);
  BOOL v9 = [(HMDMediaSystem *)self name];
  uint64_t v10 = (void *)[v8 initWithName:@"name" value:v9];
  v20[1] = v10;
  id v11 = objc_alloc(MEMORY[0x1E4F653F8]);
  uint64_t v12 = [(HMDMediaSystem *)self configuredName];
  uint64_t v13 = (void *)[v11 initWithName:@"configuredName" value:v12];
  v20[2] = v13;
  int v14 = (void *)[objc_alloc(MEMORY[0x1E4F653F8]) initWithName:@"componentUUIDs" value:v4];
  v20[3] = v14;
  id v15 = (void *)[objc_alloc(MEMORY[0x1E4F653F8]) initWithName:@"accessoryUUIDs" value:v5];
  v20[4] = v15;
  uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:5];

  return v16;
}

id __39__HMDMediaSystem_attributeDescriptions__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 accessory];
  id v3 = [v2 uuid];

  return v3;
}

uint64_t __39__HMDMediaSystem_attributeDescriptions__block_invoke(uint64_t a1, void *a2)
{
  return [a2 uuid];
}

- (id)modelForMediaSystem
{
  id v3 = [(HMDMediaSystem *)self accessories];
  unint64_t v4 = (void *)[v3 copy];

  if ([v4 count])
  {
    uint64_t v5 = -[HMDMediaSystem _modelForMediaSystem](self);
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (HMDMediaSystem)initWithMediaSystemModel:(id)a3 home:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F1CA48] array];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  BOOL v9 = objc_msgSend(v6, "mediaSystemComponents", 0);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v20;
    while (2)
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = +[HMDMediaSystemComponent mediaSystemComponentWithDictionary:*(void *)(*((void *)&v19 + 1) + 8 * v13) home:v7];
        if (!v14)
        {
          id v17 = 0;
          goto LABEL_11;
        }
        id v15 = (void *)v14;
        [v8 addObject:v14];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  BOOL v9 = [v6 uuid];
  uint64_t v16 = [v6 configuredName];
  self = [(HMDMediaSystem *)self initWithUUID:v9 configuredName:v16 home:v7 data:0 components:v8];

  id v17 = self;
LABEL_11:

  return v17;
}

- (HMDMediaSystem)initWithUUID:(id)a3 configuredName:(id)a4 home:(id)a5 data:(id)a6 components:(id)a7 settingsControllerCreator:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  if (v18)
  {
    long long v21 = v20;
    v49.receiver = self;
    v49.super_class = (Class)HMDMediaSystem;
    long long v22 = [(HMDMediaSystem *)&v49 init];
    if (v22)
    {
      HMDispatchQueueNameString();
      id v48 = v15;
      id v23 = objc_claimAutoreleasedReturnValue();
      id obj = a7;
      uint64_t v24 = v21;
      id v25 = v17;
      id v26 = v19;
      id v27 = v16;
      uint64_t v28 = [v23 UTF8String];
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      long long v29 = v47 = v18;
      long long v30 = (const char *)v28;
      id v16 = v27;
      id v19 = v26;
      id v17 = v25;
      long long v21 = v24;
      dispatch_queue_t v31 = dispatch_queue_create(v30, v29);
      workQueue = v22->_workQueue;
      v22->_workQueue = (OS_dispatch_queue *)v31;

      objc_storeStrong((id *)&v22->_uuid, a3);
      uint64_t v33 = objc_msgSend(v16, "hm_truncatedNameString");
      configuredName = v22->_configuredName;
      v22->_configuredName = (NSString *)v33;

      objc_storeWeak((id *)&v22->_home, v17);
      objc_storeStrong((id *)&v22->_data, a6);
      objc_storeStrong((id *)&v22->_components, obj);
      uint64_t v35 = [MEMORY[0x1E4F28EB8] defaultCenter];
      notificationCenter = v22->_notificationCenter;
      v22->_notificationCenter = (NSNotificationCenter *)v35;

      uint64_t v37 = [(HMDMediaSystem *)v22 workQueue];
      id v38 = [(HMDMediaSystem *)v22 uuid];
      uint64_t v39 = (*((void (**)(void *, void *, HMDMediaSystem *, HMDMediaSystem *, void *, void))v24 + 2))(v24, v37, v22, v22, v38, *MEMORY[0x1E4F2ED70]);
      settingsController = v22->_settingsController;
      v22->_settingsController = (HMDAccessorySettingsController *)v39;

      id v18 = v47;
      id v15 = v48;
      id audioDestinationsManagerFactory = v22->_audioDestinationsManagerFactory;
      v22->_id audioDestinationsManagerFactory = &__block_literal_global_96494;

      uint64_t v42 = [v17 mediaGroupsAggregateConsumer];
      aggregateDataProvider = v22->_aggregateDataProvider;
      v22->_aggregateDataProvider = (HMDMediaGroupsAggregateConsumerDataProvider *)v42;
    }
    return v22;
  }
  else
  {
    uint64_t v45 = _HMFPreconditionFailure();
    return (HMDMediaSystem *)__93__HMDMediaSystem_initWithUUID_configuredName_home_data_components_settingsControllerCreator___block_invoke(v45);
  }
}

HMDMediaDestinationsManager *__93__HMDMediaSystem_initWithUUID_configuredName_home_data_components_settingsControllerCreator___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = a2;
  id v15 = [[HMDMediaDestinationsManager alloc] initWithDestination:v14 messageDispatcher:v13 notificationCenter:v12 dataSource:v11 delegate:v10];

  return v15;
}

- (HMDMediaSystem)initWithUUID:(id)a3 configuredName:(id)a4 home:(id)a5 data:(id)a6 components:(id)a7
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (!v15)
  {
    id v17 = [v14 uuid];
    if (v13)
    {
      id v15 = +[HMDMediaSystem initalizeDataWithIdentifier:v12 parentIdentifier:v17 name:v13 defaultName:0 components:v16];
    }
    else
    {
      id v18 = [MEMORY[0x1E4F2E930] roomNameSentinel];
      id v15 = +[HMDMediaSystem initalizeDataWithIdentifier:v12 parentIdentifier:v17 name:v18 defaultName:1 components:v16];
    }
    id v19 = (void *)MEMORY[0x1D9452090]();
    id v20 = self;
    long long v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      long long v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      long long v29 = v22;
      __int16 v30 = 2112;
      id v31 = v15;
      _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_DEBUG, "%{public}@Initializing with derived data: %@", buf, 0x16u);
    }
  }
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __67__HMDMediaSystem_initWithUUID_configuredName_home_data_components___block_invoke;
  v26[3] = &unk_1E6A0E8C8;
  id v27 = v14;
  id v23 = v14;
  uint64_t v24 = [(HMDMediaSystem *)self initWithUUID:v12 configuredName:v13 home:v23 data:v15 components:v16 settingsControllerCreator:v26];

  return v24;
}

HMDAccessorySettingsController *__67__HMDMediaSystem_initWithUUID_configuredName_home_data_components___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v15 = a2;
  id v16 = [HMDAccessorySettingsController alloc];
  id v17 = [*(id *)(a1 + 32) logEventSubmitter];
  id v18 = [(HMDAccessorySettingsController *)v16 initWithQueue:v15 delegate:v14 dataSource:v13 parentUUID:v12 codingKey:v11 logEventSubmitter:v17];

  return v18;
}

- (HMDMediaSystem)initWithMediaSystemData:(id)a3 home:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 identifier];
  BOOL v9 = [v7 name];
  id v10 = [(HMDMediaSystem *)self initWithUUID:v8 configuredName:v9 home:v6 data:v7 components:MEMORY[0x1E4F1CBF0]];

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)sortMediaComponents:(id)a3
{
  id v4 = a3;
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  id v12 = __38__HMDMediaSystem_sortMediaComponents___block_invoke;
  id v13 = &unk_1E6A0E9C0;
  id v14 = v4;
  id v15 = a1;
  id v5 = v4;
  id v6 = [v5 sortedArrayUsingComparator:&v10];
  id v7 = objc_msgSend(v6, "reverseObjectEnumerator", v10, v11, v12, v13);
  id v8 = [v7 allObjects];

  return v8;
}

uint64_t __38__HMDMediaSystem_sortMediaComponents___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [v5 accessory];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  uint64_t v10 = [v6 accessory];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = 0;
  }
  id v12 = v11;

  if (v9) {
    BOOL v13 = v12 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (v13)
  {
    id v14 = (void *)MEMORY[0x1D9452090]();
    id v15 = *(id *)(a1 + 40);
    id v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v17 = HMFGetLogIdentifier();
      uint64_t v18 = *(void *)(a1 + 32);
      int v27 = 138544130;
      uint64_t v28 = v17;
      __int16 v29 = 2112;
      uint64_t v30 = v18;
      __int16 v31 = 2112;
      id v32 = v9;
      __int16 v33 = 2112;
      id v34 = v12;
      _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_ERROR, "%{public}@Unexpected media accessory not found for components %@, acc1: %@, acc2: %@", (uint8_t *)&v27, 0x2Au);
    }
    if (v9) {
      uint64_t v21 = 1;
    }
    else {
      uint64_t v21 = -1;
    }
  }
  else
  {
    id v19 = [v9 softwareVersion];
    id v20 = [v12 softwareVersion];
    uint64_t v21 = [v19 compare:v20];

    if (!v21)
    {
      long long v22 = [v9 uuid];
      id v23 = [v22 UUIDString];
      uint64_t v24 = [v12 uuid];
      id v25 = [v24 UUIDString];
      uint64_t v21 = [v23 compare:v25];
    }
  }

  return v21;
}

+ (void)_configureMediaSystemComponents:(id)a3 mediaSystem:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = [*(id *)(*((void *)&v14 + 1) + 8 * v10) mediaProfile];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v12 = v11;
        }
        else {
          id v12 = 0;
        }
        id v13 = v12;

        if (v13) {
          [v13 setMediaSystem:v6];
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
  [v6 auditMediaComponents];
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t5_96519 != -1) {
    dispatch_once(&logCategory__hmf_once_t5_96519, &__block_literal_global_52);
  }
  uint64_t v2 = (void *)logCategory__hmf_once_v6_96520;
  return v2;
}

uint64_t __29__HMDMediaSystem_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v6_96520;
  logCategory__hmf_once_v6_96520 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)destinationIdentifierForComponentRoleType:(unint64_t)a3 components:(id)a4
{
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __71__HMDMediaSystem_destinationIdentifierForComponentRoleType_components___block_invoke;
  v11[3] = &__block_descriptor_40_e33_B16__0__HMDMediaSystemComponent_8l;
  v11[4] = a3;
  id v4 = objc_msgSend(a4, "na_firstObjectPassingTest:", v11);
  id v5 = [v4 accessory];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  uint64_t v8 = [v7 audioDestination];

  uint64_t v9 = [v8 uniqueIdentifier];

  return v9;
}

BOOL __71__HMDMediaSystem_destinationIdentifierForComponentRoleType_components___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 role];
  BOOL v4 = [v3 type] == *(void *)(a1 + 32);

  return v4;
}

+ (id)initalizeDataWithIdentifier:(id)a3 parentIdentifier:(id)a4 name:(id)a5 defaultName:(BOOL)a6 components:(id)a7
{
  BOOL v7 = a6;
  id v11 = a7;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  long long v15 = +[HMDMediaSystem destinationIdentifierForComponentRoleType:1 components:v11];
  long long v16 = +[HMDMediaSystem destinationIdentifierForComponentRoleType:2 components:v11];

  if (v15)
  {
    if (v16) {
      goto LABEL_3;
    }
  }
  else
  {
    long long v15 = [MEMORY[0x1E4F2E930] unknownDestinationSentinel];
    if (v16) {
      goto LABEL_3;
    }
  }
  long long v16 = [MEMORY[0x1E4F2E930] unknownDestinationSentinel];
LABEL_3:
  long long v17 = (void *)[objc_alloc(MEMORY[0x1E4F2E930]) initWithIdentifier:v14 parentIdentifier:v13 name:v12 defaultName:v7 associatedGroupIdentifier:0 leftDestinationIdentifier:v15 rightDestinationIdentifier:v16];

  return v17;
}

- (id)assistantObject
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDMediaSystem *)self home];
  BOOL v4 = [(HMDMediaSystem *)self name];
  id v5 = v4;
  if (v4 && v3)
  {
    id v6 = [v3 name];

    if (v6)
    {
      id v7 = (id)*MEMORY[0x1E4F97130];
      uint64_t v8 = [(HMDMediaSystem *)self components];
      uint64_t v9 = [v8 count];

      if (v9 == 2)
      {
        id v10 = (id)*MEMORY[0x1E4F97138];

        id v7 = v10;
      }
      v58[0] = *MEMORY[0x1E4F96FC8];
      v57[0] = @"objectType";
      v57[1] = @"objectName";
      id v11 = [(HMDMediaSystem *)self name];
      v58[1] = v11;
      v57[2] = @"objectIdentifier";
      id v12 = [(HMDMediaSystem *)self urlString];
      v58[2] = v12;
      v57[3] = @"objectHome";
      id v13 = [v3 name];
      v58[3] = v13;
      v57[4] = @"objectHomeIdentifier";
      [v3 urlString];
      id v14 = v46 = v3;
      v58[4] = v14;
      v58[5] = self;
      v57[5] = @"objectReference";
      v57[6] = @"objectServiceType";
      v58[6] = *MEMORY[0x1E4F971B0];
      v58[7] = v7;
      v57[7] = @"objectServiceSubType";
      v57[8] = @"objectGroupType";
      v58[8] = *MEMORY[0x1E4F97018];
      long long v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v58 forKeys:v57 count:9];
      uint64_t v45 = (void *)[v15 mutableCopy];

      id v3 = v46;
      objc_super v49 = [(HMDMediaSystem *)self audioDestination];
      if (!v49) {
        goto LABEL_26;
      }
      long long v16 = [v46 accessories];
      long long v17 = objc_msgSend(v16, "na_map:", &__block_literal_global_37_114029);

      long long v52 = 0u;
      long long v53 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      id v18 = v17;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v50 objects:v56 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        id obj = v18;
        id v48 = 0;
        id v44 = v7;
        uint64_t v21 = 0;
        uint64_t v22 = *(void *)v51;
        do
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v51 != v22) {
              objc_enumerationMutation(obj);
            }
            uint64_t v24 = *(void **)(*((void *)&v50 + 1) + 8 * i);
            id v25 = objc_msgSend(v24, "audioDestinationController", v44);
            id v26 = [v25 data];
            int v27 = [v26 destinationIdentifier];
            uint64_t v28 = [v49 uniqueIdentifier];
            int v29 = objc_msgSend(v27, "hmf_isEqualToUUID:", v28);

            if (v29)
            {
              uint64_t v30 = [v24 name];

              uint64_t v31 = [v25 urlString];

              uint64_t v21 = (void *)v30;
              id v48 = (void *)v31;
            }
          }
          uint64_t v20 = [obj countByEnumeratingWithState:&v50 objects:v56 count:16];
        }
        while (v20);
        id v18 = obj;

        id v32 = v21;
        if (!v21)
        {
          id v3 = v46;
          id v7 = v44;
          __int16 v33 = v48;
          goto LABEL_25;
        }
        id v3 = v46;
        __int16 v33 = v48;
        if (!v48)
        {
          id v7 = v44;
          goto LABEL_25;
        }
        v55 = v32;
        id v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v55 count:1];
        [v45 setObject:v34 forKey:@"objectGroups"];

        v54 = v48;
        uint64_t v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v54 count:1];
        [v45 setObject:v35 forKey:@"objectGroupIdentifiers"];
        id v7 = v44;
      }
      else
      {
        __int16 v33 = 0;
        id v32 = 0;
        uint64_t v35 = v18;
      }

LABEL_25:
LABEL_26:
      uint64_t v42 = (void *)[v45 copy];

      goto LABEL_27;
    }
  }
  else
  {
  }
  uint64_t v36 = (void *)MEMORY[0x1D9452090]();
  uint64_t v37 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    id v38 = HMFGetLogIdentifier();
    uint64_t v39 = [(HMDMediaSystem *)self name];
    v40 = [(HMDMediaSystem *)self uuid];
    uint64_t v41 = [v40 UUIDString];
    *(_DWORD *)buf = 138544130;
    v60 = v38;
    __int16 v61 = 2112;
    v62 = v39;
    __int16 v63 = 2112;
    v64 = v41;
    __int16 v65 = 2112;
    v66 = v3;
    _os_log_impl(&dword_1D49D5000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@Skipping because attribute(s) is nil self %@/%@  self.home %@", buf, 0x2Au);
  }
  uint64_t v42 = 0;
LABEL_27:

  return v42;
}

id __44__HMDMediaSystem_Assistant__assistantObject__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (id)urlString
{
  id v2 = [(HMDMediaSystem *)self uuid];
  id v3 = hm_assistantIdentifier();

  return v3;
}

@end