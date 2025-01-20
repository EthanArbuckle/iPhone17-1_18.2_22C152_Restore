@interface HMDHomeMediaSystemHandler
+ (BOOL)supportsSecureCoding;
+ (id)logCategory;
- (BOOL)supportsDeviceWithCapabilities:(id)a3;
- (HMDHome)home;
- (HMDHomeMediaSystemControllerMessageHandler)messageHandler;
- (HMDHomeMediaSystemHandler)initWithCoder:(id)a3;
- (HMDHomeMediaSystemHandler)initWithMediaSystems:(id)a3;
- (HMDHomeMediaSystemHandlerDataSource)dataSource;
- (HMDHomeMediaSystemHandlerDelegate)delegate;
- (HMDStereoPairSettingsController)stereoPairSettingsController;
- (HMFMessageDispatcher)messageDispatcher;
- (NSArray)mediaSystems;
- (NSNotificationCenter)notificationCenter;
- (NSUUID)parentUUID;
- (OS_dispatch_queue)workQueue;
- (id)_currentMediaSystemIfPrimary;
- (id)attributeDescriptions;
- (id)backingStoreObjectsForVersion:(int64_t)a3;
- (id)destinationForMediaSystem:(id)a3;
- (id)eventForwarder;
- (id)eventStoreReadHandle;
- (id)filteredMediaSystems;
- (id)identifiersInMediaSystemData:(id)a3;
- (id)localAndRemoteSubscriptionProvider;
- (id)logIdentifier;
- (id)mediaSystemData:(id)a3 withIdentifier:(id)a4;
- (id)mediaSystemForAccessory:(id)a3;
- (id)mediaSystemWithUUID:(id)a3;
- (id)processedMediaSystemBuilderMessageFor:(id)a3;
- (id)uuidToMediaSystems;
- (void)_handleAddMediaSystemModel:(id)a3 message:(id)a4;
- (void)_handleRemoveMediaSystemModel:(id)a3 message:(id)a4;
- (void)_handleUpdateMediaSystemModel:(id)a3 message:(id)a4;
- (void)_userAssistantAccessControlDidUpdate:(id)a3 accessories:(id)a4;
- (void)addMediaSystem:(id)a3;
- (void)addMediaSystemWithGroupIdentifier:(id)a3 usingData:(id)a4;
- (void)addMediaSystemsWithIdentifiers:(id)a3 usingData:(id)a4;
- (void)configure:(id)a3 delegate:(id)a4 dataSource:(id)a5 queue:(id)a6 messageDispatcher:(id)a7 notificationCenter:(id)a8;
- (void)confirmPrimaryResidentIfFirstMediaSystem;
- (void)encodeWithCoder:(id)a3;
- (void)handleRemovedMediaSystem:(id)a3;
- (void)mergeMediaSystemData:(id)a3;
- (void)messageHandlerAddMediaSystem:(id)a3 configuredName:(id)a4 leftUUID:(id)a5 leftAccessoryUUID:(id)a6 rightUUID:(id)a7 rightAccessoryUUID:(id)a8 builderSession:(id)a9 completion:(id)a10;
- (void)messageHandlerRemoveMediaSystem:(id)a3 builderSession:(id)a4 message:(id)a5;
- (void)messageHandlerUpdateMediaSystem:(id)a3 configuredName:(id)a4 leftUUID:(id)a5 leftAccessoryUUID:(id)a6 rightUUID:(id)a7 rightAccessoryUUID:(id)a8 builderSession:(id)a9 completion:(id)a10;
- (void)notifyOfRemovedMediaSystem:(id)a3;
- (void)removeMediaSystem:(id)a3;
- (void)routeMediaSystemWithMessage:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHome:(id)a3;
- (void)setMessageDispatcher:(id)a3;
- (void)setMessageHandler:(id)a3;
- (void)setNotificationCenter:(id)a3;
- (void)setParentUUID:(id)a3;
- (void)setStereoPairSettingsController:(id)a3;
- (void)setWorkQueue:(id)a3;
- (void)subscribeToSettingsForNewlyAddedMediaSystem:(id)a3;
- (void)unsubscribeToSettingsForMediaSystem:(id)a3;
- (void)updateMediaSystem:(id)a3;
@end

@implementation HMDHomeMediaSystemHandler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stereoPairSettingsController, 0);
  objc_storeStrong((id *)&self->_messageHandler, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_parentUUID, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_uuidToMediaSystems, 0);
  objc_storeStrong((id *)&self->_logger, 0);
}

- (void)setStereoPairSettingsController:(id)a3
{
}

- (HMDStereoPairSettingsController)stereoPairSettingsController
{
  return self->_stereoPairSettingsController;
}

- (void)setMessageHandler:(id)a3
{
}

- (HMDHomeMediaSystemControllerMessageHandler)messageHandler
{
  return (HMDHomeMediaSystemControllerMessageHandler *)objc_getProperty(self, a2, 88, 1);
}

- (void)setHome:(id)a3
{
}

- (HMDHome)home
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  return (HMDHome *)WeakRetained;
}

- (void)setNotificationCenter:(id)a3
{
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 72, 1);
}

- (void)setMessageDispatcher:(id)a3
{
}

- (HMFMessageDispatcher)messageDispatcher
{
  return self->_messageDispatcher;
}

- (void)setWorkQueue:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setParentUUID:(id)a3
{
}

- (NSUUID)parentUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDelegate:(id)a3
{
}

- (HMDHomeMediaSystemHandlerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDHomeMediaSystemHandlerDelegate *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (HMDHomeMediaSystemHandlerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (HMDHomeMediaSystemHandlerDataSource *)WeakRetained;
}

- (id)destinationForMediaSystem:(id)a3
{
  id v4 = a3;
  v5 = [(HMDHomeMediaSystemHandler *)self dataSource];
  v6 = [v5 destinationForMediaSystem:v4];

  return v6;
}

- (void)_userAssistantAccessControlDidUpdate:(id)a3 accessories:(id)a4
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
  v9 = [(HMDHomeMediaSystemHandler *)self _currentMediaSystemIfPrimary];
  v10 = v9;
  if (v9)
  {
    v37 = self;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    v11 = [v9 accessories];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v42 objects:v55 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      char v14 = 0;
      uint64_t v15 = *(void *)v43;
      int v16 = 1;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v43 != v15) {
            objc_enumerationMutation(v11);
          }
          int v18 = [v7 containsObject:*(void *)(*((void *)&v42 + 1) + 8 * i)];
          v14 |= v18;
          v16 &= v18;
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v42 objects:v55 count:16];
      }
      while (v13);
    }
    else
    {
      char v14 = 0;
      int v16 = 1;
    }

    v19 = (void *)MEMORY[0x230FBD990]();
    self = v37;
    v20 = v37;
    v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      v22 = HMFGetLogIdentifier();
      [v10 accessories];
      v23 = v36 = v10;
      *(_DWORD *)buf = 138544386;
      v48 = v22;
      __int16 v49 = 1024;
      *(_DWORD *)v50 = v14 & 1;
      *(_WORD *)&v50[4] = 1024;
      *(_DWORD *)&v50[6] = v16;
      __int16 v51 = 2112;
      v52 = v23;
      __int16 v53 = 2112;
      id v54 = v7;
      _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_DEBUG, "%{public}@accessories in media system somePresent:%d allPresent:%d, ms acc:%@, incoming acc: %@", buf, 0x2Cu);

      v10 = v36;
      self = v37;
    }

    if (!(v16 & 1 | ((v14 & 1) == 0)))
    {
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      v24 = [v10 accessories];
      uint64_t v25 = [v24 countByEnumeratingWithState:&v38 objects:v46 count:16];
      if (v25)
      {
        uint64_t v26 = v25;
        uint64_t v27 = *(void *)v39;
        do
        {
          for (uint64_t j = 0; j != v26; ++j)
          {
            if (*(void *)v39 != v27) {
              objc_enumerationMutation(v24);
            }
            uint64_t v29 = *(void *)(*((void *)&v38 + 1) + 8 * j);
            if ([v7 containsObject:v29]) {
              [v8 addObject:v29];
            }
          }
          uint64_t v26 = [v24 countByEnumeratingWithState:&v38 objects:v46 count:16];
        }
        while (v26);
      }
    }
  }
  if ([v8 count])
  {
    v30 = (void *)MEMORY[0x230FBD990]();
    v31 = self;
    v32 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      v33 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v48 = v33;
      __int16 v49 = 2112;
      *(void *)v50 = v8;
      _os_log_impl(&dword_22F52A000, v32, OS_LOG_TYPE_INFO, "%{public}@audit discovered accessories added by old controller, will remove %@", buf, 0x16u);
    }
    v34 = [(HMDHomeMediaSystemHandler *)v31 delegate];
    v35 = (void *)[v8 copy];
    [v34 mediaSystemController:v31 removeAccessories:v35 fromAssistantAccessControl:v6];
  }
}

- (id)_currentMediaSystemIfPrimary
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (+[HMDDeviceCapabilities isAppleMediaAccessory])
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    v3 = [(HMDHomeMediaSystemHandler *)self mediaSystems];
    id v4 = (id)[v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v11;
      while (2)
      {
        for (uint64_t i = 0; i != v4; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v11 != v5) {
            objc_enumerationMutation(v3);
          }
          id v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
          id v8 = [v7 targetAccessory];
          if ([v8 isCurrentAccessory])
          {
            id v4 = v7;

            goto LABEL_13;
          }
        }
        id v4 = (id)[v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v4) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDHomeMediaSystemHandler *)self mediaSystems];
  [v4 encodeObject:v5 forKey:*MEMORY[0x263F0EAB8]];
}

- (HMDHomeMediaSystemHandler)initWithCoder:(id)a3
{
  v25[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x263EFFA08];
  v25[0] = objc_opt_class();
  v25[1] = objc_opt_class();
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:2];
  id v7 = [v5 setWithArray:v6];

  id v8 = [v4 decodeObjectOfClasses:v7 forKey:*MEMORY[0x263F0EAB8]];
  v9 = [v4 decodeObjectOfClasses:v7 forKey:@"ms.homepod"];
  uint64_t v10 = [v4 decodeObjectOfClasses:v7 forKey:@"ms.homepod6_1"];
  long long v11 = (void *)v10;
  if (v8) {
    BOOL v12 = 0;
  }
  else {
    BOOL v12 = v9 == 0;
  }
  if (!v12 || v10 != 0)
  {
    if (v8)
    {
      id v14 = v8;
      if (!v9) {
        goto LABEL_11;
      }
    }
    else
    {
      id v14 = (id)MEMORY[0x263EFFA68];
      if (!v9)
      {
LABEL_11:
        if (v11)
        {
          uint64_t v16 = [v14 arrayByAddingObjectsFromArray:v11];

          id v14 = (id)v16;
        }
        goto LABEL_16;
      }
    }
    uint64_t v15 = [v14 arrayByAddingObjectsFromArray:v9];

    id v14 = (id)v15;
    goto LABEL_11;
  }
  v17 = (void *)MEMORY[0x230FBD990]();
  int v18 = self;
  v19 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    v20 = HMFGetLogIdentifier();
    int v23 = 138543362;
    v24 = v20;
    _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@Decoded home media system handler with no media systems", (uint8_t *)&v23, 0xCu);
  }
  id v14 = (id)MEMORY[0x263EFFA68];
LABEL_16:
  v21 = [(HMDHomeMediaSystemHandler *)self initWithMediaSystems:v14];

  return v21;
}

- (BOOL)supportsDeviceWithCapabilities:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDHomeMediaSystemHandler *)self mediaSystems];
  uint64_t v6 = [v5 count];

  if (v6) {
    char v7 = [v4 supportsWholeHouseAudio];
  }
  else {
    char v7 = 1;
  }

  return v7;
}

- (id)uuidToMediaSystems
{
  return self->_uuidToMediaSystems;
}

- (id)eventStoreReadHandle
{
  v2 = [(HMDHomeMediaSystemHandler *)self home];
  v3 = [v2 homeManager];

  id v4 = [v3 eventStoreReadHandle];

  return v4;
}

- (id)eventForwarder
{
  v2 = [(HMDHomeMediaSystemHandler *)self home];
  v3 = [v2 homeManager];

  id v4 = [v3 eventForwarder];

  return v4;
}

- (id)localAndRemoteSubscriptionProvider
{
  v2 = [(HMDHomeMediaSystemHandler *)self home];
  v3 = [v2 homeManager];

  id v4 = [v3 localAndRemoteSubscriptionProvider];

  return v4;
}

- (id)backingStoreObjectsForVersion:(int64_t)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = [MEMORY[0x263EFF980] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v6 = [(HMDHomeMediaSystemHandler *)self mediaSystems];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = [*(id *)(*((void *)&v14 + 1) + 8 * i) backingStoreObjectsForVersion:a3];
        [v5 addObjectsFromArray:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  BOOL v12 = (void *)[v5 copy];
  return v12;
}

- (void)_handleUpdateMediaSystemModel:(id)a3 message:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (isFeatureHomeTheaterQFAEnabledForTests
    && ![(id)isFeatureHomeTheaterQFAEnabledForTests BOOLValue])
  {
    BOOL v12 = [v6 uuid];
    long long v13 = [(HMDHomeMediaSystemHandler *)self mediaSystemWithUUID:v12];

    long long v14 = (void *)MEMORY[0x230FBD990]();
    long long v15 = self;
    long long v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      long long v17 = HMFGetLogIdentifier();
      int v18 = [v6 uuid];
      uint64_t v19 = [v18 UUIDString];
      int v20 = 138543874;
      v21 = v17;
      __int16 v22 = 2112;
      int v23 = v19;
      __int16 v24 = 2112;
      uint64_t v25 = v13;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Handling update of media system %@, system: %@", (uint8_t *)&v20, 0x20u);
    }
    [v13 transactionObjectUpdated:0 newValues:v6 message:v7];
  }
  else
  {
    uint64_t v8 = (void *)MEMORY[0x230FBD990]();
    uint64_t v9 = self;
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      long long v11 = HMFGetLogIdentifier();
      int v20 = 138543362;
      v21 = v11;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Skipping update model due to Home Theater QFA enabled", (uint8_t *)&v20, 0xCu);
    }
  }
}

- (void)_handleRemoveMediaSystemModel:(id)a3 message:(id)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (isFeatureHomeTheaterQFAEnabledForTests
    && ![(id)isFeatureHomeTheaterQFAEnabledForTests BOOLValue])
  {
    long long v13 = [v6 uuid];
    BOOL v12 = [(HMDHomeMediaSystemHandler *)self mediaSystemWithUUID:v13];

    long long v14 = (void *)MEMORY[0x230FBD990]();
    long long v15 = self;
    long long v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      long long v17 = HMFGetLogIdentifier();
      int v18 = [v6 uuid];
      uint64_t v19 = [v18 UUIDString];
      int v20 = [v7 identifier];
      int v29 = 138544130;
      v30 = v17;
      __int16 v31 = 2112;
      v32 = v19;
      __int16 v33 = 2112;
      v34 = v20;
      __int16 v35 = 2112;
      v36 = v12;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Handling transaction removal of media system model uuid: %@ message identifier: %@ media system: %@", (uint8_t *)&v29, 0x2Au);
    }
    if (v12)
    {
      [(HMDHomeMediaSystemHandler *)v15 removeMediaSystem:v12];
      v21 = [v7 transactionResult];
      [v21 markChanged];
      [v21 markSaveToAssistant];
      [v7 respondWithSuccess];
    }
    else
    {
      __int16 v22 = (void *)MEMORY[0x230FBD990]();
      int v23 = v15;
      __int16 v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        uint64_t v25 = HMFGetLogIdentifier();
        uint64_t v26 = [v6 uuid];
        uint64_t v27 = [v26 UUIDString];
        v28 = [(HMDHomeMediaSystemHandler *)v23 mediaSystems];
        int v29 = 138543874;
        v30 = v25;
        __int16 v31 = 2112;
        v32 = v27;
        __int16 v33 = 2112;
        v34 = v28;
        _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_ERROR, "%{public}@Cannot find media system with UUID %@, current media systems: %@", (uint8_t *)&v29, 0x20u);
      }
      v21 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
      [v7 respondWithError:v21];
    }
  }
  else
  {
    uint64_t v8 = (void *)MEMORY[0x230FBD990]();
    uint64_t v9 = self;
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      long long v11 = HMFGetLogIdentifier();
      int v29 = 138543362;
      v30 = v11;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Skipping remove model due to Home Theater QFA enabled", (uint8_t *)&v29, 0xCu);
    }
    BOOL v12 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
    [v7 respondWithError:v12];
  }
}

- (void)confirmPrimaryResidentIfFirstMediaSystem
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v3 = [(HMDHomeMediaSystemHandler *)self mediaSystems];
  uint64_t v4 = [v3 count];

  if (v4 == 1)
  {
    id v5 = [(HMDHomeMediaSystemHandler *)self home];
    id v6 = v5;
    if (v5)
    {
      if ([v5 isCurrentDevicePrimaryResident])
      {
        id v7 = (void *)MEMORY[0x230FBD990]();
        uint64_t v8 = self;
        uint64_t v9 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          uint64_t v10 = HMFGetLogIdentifier();
          int v16 = 138543362;
          long long v17 = v10;
          _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Confirming primary resident due to first added media system", (uint8_t *)&v16, 0xCu);
        }
        long long v11 = [v6 residentDeviceManager];
        [v11 confirmWithCompletionHandler:0];
      }
    }
    else
    {
      BOOL v12 = (void *)MEMORY[0x230FBD990]();
      long long v13 = self;
      long long v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        long long v15 = HMFGetLogIdentifier();
        int v16 = 138543362;
        long long v17 = v15;
        _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to confirm primary resident due to no home", (uint8_t *)&v16, 0xCu);
      }
    }
  }
}

- (void)subscribeToSettingsForNewlyAddedMediaSystem:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDHomeMediaSystemHandler *)self stereoPairSettingsController];

  if (v5)
  {
    id v6 = (void *)MEMORY[0x230FBD990]();
    id v7 = self;
    uint64_t v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = HMFGetLogIdentifier();
      int v11 = 138543618;
      BOOL v12 = v9;
      __int16 v13 = 2112;
      id v14 = v4;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Stereo pair settings controller add media system: %@", (uint8_t *)&v11, 0x16u);
    }
    uint64_t v10 = [(HMDHomeMediaSystemHandler *)v7 stereoPairSettingsController];
    [v10 subscribeToAddedMediaSystemIfPrimaryResident:v4];
  }
}

- (void)addMediaSystem:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [v4 setDataSource:self];
  id v5 = [(HMDHomeMediaSystemHandler *)self messageDispatcher];
  [v4 configureWithMessageDispatcher:v5];

  [(HMDHomeMediaSystemHandler *)self updateMediaSystem:v4];
  [(HMDHomeMediaSystemHandler *)self subscribeToSettingsForNewlyAddedMediaSystem:v4];
  [(HMDHomeMediaSystemHandler *)self confirmPrimaryResidentIfFirstMediaSystem];
  logger = self->_logger;
  if (os_signpost_enabled(logger))
  {
    id v7 = logger;
    uint64_t v8 = [v4 uuid];
    *(_DWORD *)buf = 138412290;
    uint64_t v15 = v8;
    _os_signpost_emit_with_name_impl(&dword_22F52A000, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "AddedMediaSystem", "mediaSystemUUID=%{signpost.description:attribute}@ ", buf, 0xCu);
  }
  uint64_t v9 = [(HMDHomeMediaSystemHandler *)self notificationCenter];
  uint64_t v10 = [(HMDHomeMediaSystemHandler *)self delegate];
  BOOL v12 = @"HMDMediaSystemNotificationKey";
  id v13 = v4;
  int v11 = [NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  [v9 postNotificationName:@"HMDMediaSystemAddedNotification" object:v10 userInfo:v11];
}

- (void)_handleAddMediaSystemModel:(id)a3 message:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (isFeatureHomeTheaterQFAEnabledForTests
    && ![(id)isFeatureHomeTheaterQFAEnabledForTests BOOLValue])
  {
    BOOL v12 = [(HMDHomeMediaSystemHandler *)self home];
    id v13 = [[HMDMediaSystem alloc] initWithMediaSystemModel:v6 home:v12];
    id v14 = (void *)MEMORY[0x230FBD990]();
    uint64_t v15 = self;
    uint64_t v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      long long v17 = HMFGetLogIdentifier();
      uint64_t v18 = [v6 uuid];
      uint64_t v19 = [v18 UUIDString];
      *(_DWORD *)buf = 138543874;
      v30 = v17;
      __int16 v31 = 2112;
      v32 = v19;
      __int16 v33 = 2112;
      v34 = v13;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Handling add of media system %@, system: %@", buf, 0x20u);
    }
    if (v13)
    {
      [(HMDHomeMediaSystemHandler *)v15 addMediaSystem:v13];
      int v20 = [(HMDMediaSystem *)v13 serialize];
      v28 = v20;
      v21 = [NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
      [v7 respondWithPayload:v21];

      __int16 v22 = [v7 transactionResult];
      [v22 markChanged];
      [v22 markSaveToAssistant];
    }
    else
    {
      int v23 = (void *)MEMORY[0x230FBD990]();
      __int16 v24 = v15;
      uint64_t v25 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        uint64_t v26 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v30 = v26;
        _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_ERROR, "%{public}@Cannot create media system object", buf, 0xCu);
      }
      __int16 v22 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
      [v7 respondWithError:v22];
    }
  }
  else
  {
    uint64_t v8 = (void *)MEMORY[0x230FBD990]();
    uint64_t v9 = self;
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v30 = v11;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Skipping add model due to Home Theater QFA enabled", buf, 0xCu);
    }
  }
}

- (void)addMediaSystemWithGroupIdentifier:(id)a3 usingData:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x230FBD990]();
  uint64_t v9 = self;
  uint64_t v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v11 = HMFGetLogIdentifier();
    int v23 = 138543618;
    __int16 v24 = v11;
    __int16 v25 = 2112;
    id v26 = v6;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Adding media system with identifier: %@", (uint8_t *)&v23, 0x16u);
  }
  BOOL v12 = [(HMDHomeMediaSystemHandler *)v9 mediaSystemData:v7 withIdentifier:v6];
  if (v12)
  {
    id v13 = [(HMDHomeMediaSystemHandler *)v9 home];
    if (v13)
    {
      id v14 = [[HMDMediaSystem alloc] initWithMediaSystemData:v12 home:v13];
      [(HMDHomeMediaSystemHandler *)v9 addMediaSystem:v14];
    }
    else
    {
      uint64_t v19 = (void *)MEMORY[0x230FBD990]();
      int v20 = v9;
      v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        __int16 v22 = HMFGetLogIdentifier();
        int v23 = 138543618;
        __int16 v24 = v22;
        __int16 v25 = 2112;
        id v26 = v7;
        _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to add media system using data: %@ due to no home", (uint8_t *)&v23, 0x16u);
      }
    }
  }
  else
  {
    uint64_t v15 = (void *)MEMORY[0x230FBD990]();
    uint64_t v16 = v9;
    long long v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = HMFGetLogIdentifier();
      int v23 = 138543874;
      __int16 v24 = v18;
      __int16 v25 = 2112;
      id v26 = v6;
      __int16 v27 = 2112;
      id v28 = v7;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to get data for media system to add with identifier: %@ data: %@", (uint8_t *)&v23, 0x20u);
    }
  }
}

- (void)addMediaSystemsWithIdentifiers:(id)a3 usingData:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __70__HMDHomeMediaSystemHandler_addMediaSystemsWithIdentifiers_usingData___block_invoke;
  v8[3] = &unk_264A1E448;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  objc_msgSend(a3, "na_each:", v8);
}

uint64_t __70__HMDHomeMediaSystemHandler_addMediaSystemsWithIdentifiers_usingData___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addMediaSystemWithGroupIdentifier:a2 usingData:*(void *)(a1 + 40)];
}

- (id)mediaSystemData:(id)a3 withIdentifier:(id)a4
{
  id v5 = a4;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __60__HMDHomeMediaSystemHandler_mediaSystemData_withIdentifier___block_invoke;
  v9[3] = &unk_264A1BC08;
  id v10 = v5;
  id v6 = v5;
  id v7 = objc_msgSend(a3, "na_firstObjectPassingTest:", v9);

  return v7;
}

uint64_t __60__HMDHomeMediaSystemHandler_mediaSystemData_withIdentifier___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 identifier];
  uint64_t v4 = objc_msgSend(v3, "hmf_isEqualToUUID:", *(void *)(a1 + 32));

  return v4;
}

- (id)identifiersInMediaSystemData:(id)a3
{
  return (id)objc_msgSend(a3, "na_map:", &__block_literal_global_63_64500);
}

uint64_t __58__HMDHomeMediaSystemHandler_identifiersInMediaSystemData___block_invoke(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

- (void)mergeMediaSystemData:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  BOOL v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__64503;
  uint64_t v15 = __Block_byref_object_dispose__64504;
  id v5 = [(HMDHomeMediaSystemHandler *)self identifiersInMediaSystemData:v4];
  id v16 = (id)[v5 mutableCopy];

  id v6 = [(HMDHomeMediaSystemHandler *)self mediaSystems];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __50__HMDHomeMediaSystemHandler_mergeMediaSystemData___block_invoke;
  v8[3] = &unk_264A1BBC0;
  id v10 = &v11;
  v8[4] = self;
  id v7 = v4;
  id v9 = v7;
  objc_msgSend(v6, "na_each:", v8);

  [(HMDHomeMediaSystemHandler *)self addMediaSystemsWithIdentifiers:v12[5] usingData:v7];
  _Block_object_dispose(&v11, 8);
}

void __50__HMDHomeMediaSystemHandler_mergeMediaSystemData___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  id v4 = a2;
  id v5 = [v4 uuid];
  [v3 removeObject:v5];

  id v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = [v4 uuid];
  id v9 = [v6 mediaSystemData:v7 withIdentifier:v8];

  if (v9) {
    [v4 mergeMediaSystemData:v9];
  }
  else {
    [*(id *)(a1 + 32) removeMediaSystem:v4];
  }
}

- (void)messageHandlerRemoveMediaSystem:(id)a3 builderSession:(id)a4 message:(id)a5
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (void *)MEMORY[0x230FBD990]();
  BOOL v12 = self;
  uint64_t v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    id v14 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v28 = v14;
    __int16 v29 = 2112;
    id v30 = v9;
    _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Received remove media system message for session ID %@", buf, 0x16u);
  }
  uint64_t v15 = [(HMDHomeMediaSystemHandler *)v12 mediaSystemWithUUID:v8];
  id v16 = v15;
  if (v15)
  {
    long long v17 = [v15 modelForMediaSystem];
    [v17 setObjectChangeType:3];
    uint64_t v18 = [(HMDHomeMediaSystemHandler *)v12 dataSource];
    uint64_t v19 = [v18 backingStore];
    int v20 = +[HMDBackingStoreTransactionOptions defaultXPCOptions];
    v21 = [v19 transaction:@"Remove media system" options:v20];

    [v21 add:v17 withMessage:v10];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __84__HMDHomeMediaSystemHandler_messageHandlerRemoveMediaSystem_builderSession_message___block_invoke;
    v26[3] = &unk_264A2F3E8;
    v26[4] = v12;
    [v21 run:v26];
  }
  else
  {
    __int16 v22 = (void *)MEMORY[0x230FBD990]();
    int v23 = v12;
    __int16 v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      __int16 v25 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v28 = v25;
      __int16 v29 = 2112;
      id v30 = v9;
      _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_ERROR, "%{public}@No media system for session ID found %@", buf, 0x16u);
    }
    long long v17 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
    [v10 respondWithError:v17];
  }
}

void __84__HMDHomeMediaSystemHandler_messageHandlerRemoveMediaSystem_builderSession_message___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)MEMORY[0x230FBD990]();
    id v5 = *(id *)(a1 + 32);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = HMFGetLogIdentifier();
      int v8 = 138543618;
      id v9 = v7;
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_ERROR, "%{public}@Remove media system transaction run completed with error: %@", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (void)messageHandlerUpdateMediaSystem:(id)a3 configuredName:(id)a4 leftUUID:(id)a5 leftAccessoryUUID:(id)a6 rightUUID:(id)a7 rightAccessoryUUID:(id)a8 builderSession:(id)a9 completion:(id)a10
{
  uint64_t v77 = *MEMORY[0x263EF8340];
  id v63 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v60 = a7;
  id v62 = a8;
  id v19 = a9;
  int v20 = (void (**)(id, void, void *))a10;
  v21 = (void *)MEMORY[0x230FBD990]();
  __int16 v22 = self;
  int v23 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    __int16 v24 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v68 = v24;
    __int16 v69 = 2112;
    id v70 = v19;
    _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_INFO, "%{public}@Received update media system message for session ID %@", buf, 0x16u);
  }
  v61 = v19;

  __int16 v25 = [(HMDHomeMediaSystemHandler *)v22 mediaSystemWithUUID:v63];
  if (v25)
  {
    id v26 = [(HMDHomeMediaSystemHandler *)v22 dataSource];
    __int16 v27 = v18;
    uint64_t v28 = [v26 mediaSystemController:v22 accessoryForUUID:v18];
    uint64_t v29 = [v26 mediaSystemController:v22 accessoryForUUID:v62];
    v57 = (void *)v28;
    id v58 = v16;
    v59 = (void *)v29;
    if (!v28 || !v29)
    {
      long long v43 = (void *)MEMORY[0x230FBD990]();
      long long v44 = v22;
      long long v45 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        v46 = HMFGetLogIdentifier();
        [(HMDHomeMediaSystemHandler *)v44 delegate];
        v48 = id v47 = v17;
        *(_DWORD *)buf = 138544130;
        v68 = v46;
        __int16 v69 = 2112;
        id v70 = v48;
        __int16 v71 = 2112;
        id v72 = v18;
        __int16 v73 = 2112;
        id v74 = v62;
        _os_log_impl(&dword_22F52A000, v45, OS_LOG_TYPE_ERROR, "%{public}@Accessory cannot be found in home %@ for accessory IDs %@ %@", buf, 0x2Au);

        id v17 = v47;
        __int16 v27 = v18;
      }
      __int16 v49 = (void *)MEMORY[0x263F087E8];
      v34 = [MEMORY[0x263F087E8] hmPrivateErrorWithCode:2021];
      v50 = [v49 hmErrorWithCode:2 description:0 reason:0 suggestion:0 underlyingError:v34];
      v20[2](v20, 0, v50);

      uint64_t v31 = v60;
      goto LABEL_19;
    }
    id v56 = v17;
    id v30 = [v25 accessories];
    uint64_t v31 = v60;
    if ([v30 containsObject:v28])
    {
      v32 = [v25 accessories];
      char v33 = [v32 containsObject:v59];

      if (v33)
      {
        v34 = [v25 modelForMediaSystem];
        [v34 setObjectChangeType:2];
        [v34 setConfiguredName:v58];
        uint64_t v35 = [MEMORY[0x263F0E548] encodeComponentDataWithLeftComponentUUID:v56 leftAccessoryUUID:v27 rightComponentUUID:v60 rightAccessoryUUID:v62];
        [v34 setMediaSystemComponents:v35];

        v36 = [v26 backingStore];
        uint64_t v37 = +[HMDBackingStoreTransactionOptions defaultXPCOptions];
        long long v38 = [v36 transaction:@"Update media system" options:v37];

        id v17 = v56;
        [v38 add:v34];
        v64[0] = MEMORY[0x263EF8330];
        v64[1] = 3221225472;
        v64[2] = __158__HMDHomeMediaSystemHandler_messageHandlerUpdateMediaSystem_configuredName_leftUUID_leftAccessoryUUID_rightUUID_rightAccessoryUUID_builderSession_completion___block_invoke;
        v64[3] = &unk_264A2E788;
        v64[4] = v22;
        id v65 = v63;
        v66 = v20;
        [v38 run:v64];

LABEL_19:
        id v16 = v58;
        goto LABEL_20;
      }
    }
    else
    {
    }
    __int16 v51 = (void *)MEMORY[0x230FBD990]();
    v52 = v22;
    __int16 v53 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
    {
      id v54 = HMFGetLogIdentifier();
      v55 = [v25 accessories];
      *(_DWORD *)buf = 138544386;
      v68 = v54;
      __int16 v69 = 2112;
      id v70 = v55;
      __int16 v71 = 2112;
      id v72 = v25;
      __int16 v73 = 2112;
      id v74 = v27;
      __int16 v75 = 2112;
      id v76 = v62;
      _os_log_impl(&dword_22F52A000, v53, OS_LOG_TYPE_ERROR, "%{public}@Accessories %@ in media system %@ cannot be changed - accessory IDs %@ %@", buf, 0x34u);
    }
    v34 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
    v20[2](v20, 0, v34);
    id v17 = v56;
    goto LABEL_19;
  }
  long long v39 = (void *)MEMORY[0x230FBD990]();
  long long v40 = v22;
  long long v41 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
  {
    long long v42 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v68 = v42;
    __int16 v69 = 2112;
    id v70 = v63;
    _os_log_impl(&dword_22F52A000, v41, OS_LOG_TYPE_ERROR, "%{public}@Media system with uuid %@ not found", buf, 0x16u);
  }
  id v26 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
  v20[2](v20, 0, v26);
  __int16 v27 = v18;
  uint64_t v31 = v60;
LABEL_20:
}

void __158__HMDHomeMediaSystemHandler_messageHandlerUpdateMediaSystem_configuredName_leftUUID_leftAccessoryUUID_rightUUID_rightAccessoryUUID_builderSession_completion___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (v5)
  {
    id v3 = 0;
  }
  else
  {
    id v4 = [*(id *)(a1 + 32) mediaSystemWithUUID:*(void *)(a1 + 40)];
    id v3 = [v4 serialize];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)messageHandlerAddMediaSystem:(id)a3 configuredName:(id)a4 leftUUID:(id)a5 leftAccessoryUUID:(id)a6 rightUUID:(id)a7 rightAccessoryUUID:(id)a8 builderSession:(id)a9 completion:(id)a10
{
  uint64_t v152 = *MEMORY[0x263EF8340];
  id v16 = a3;
  id v122 = a4;
  id v17 = a5;
  id v18 = a6;
  id v121 = a7;
  id v19 = a8;
  id v20 = a9;
  v119 = (void (**)(id, void, void *))a10;
  v21 = (void *)MEMORY[0x230FBD990]();
  __int16 v22 = self;
  int v23 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    __int16 v24 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v145 = v24;
    __int16 v146 = 2112;
    id v147 = v20;
    _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_INFO, "%{public}@Received add media system message for session ID %@", buf, 0x16u);
  }
  v120 = v20;

  __int16 v25 = [(HMDHomeMediaSystemHandler *)v22 mediaSystemWithUUID:v16];

  if (!v25)
  {
    char v33 = [(HMDHomeMediaSystemHandler *)v22 dataSource];
    v34 = [(HMDHomeMediaSystemHandler *)v22 home];
    uint64_t v35 = [v34 homeManager];

    uint64_t v36 = [v33 mediaSystemController:v22 accessoryForUUID:v18];
    v116 = v33;
    uint64_t v37 = v33;
    long long v38 = (void *)v36;
    uint64_t v29 = v19;
    uint64_t v39 = [v37 mediaSystemController:v22 accessoryForUUID:v19];
    v117 = v16;
    v118 = (void *)v39;
    if (v38 && (long long v40 = (void *)v39) != 0)
    {
      v114 = v35;
      long long v41 = [v38 uuid];
      long long v42 = [v40 uuid];
      int v43 = objc_msgSend(v41, "hmf_isEqualToUUID:", v42);

      if (!v43)
      {
        v113 = v38;
        id v62 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", v18, v19, 0);
        long long v130 = 0u;
        long long v131 = 0u;
        long long v132 = 0u;
        long long v133 = 0u;
        id v63 = [(HMDHomeMediaSystemHandler *)v22 mediaSystems];
        id v112 = v18;
        uint64_t v35 = v114;
        v64 = v118;
        uint64_t v108 = [v63 countByEnumeratingWithState:&v130 objects:v139 count:16];
        if (v108)
        {
          uint64_t v65 = *(void *)v131;
          v110 = v63;
          id v111 = v17;
          uint64_t v106 = *(void *)v131;
          do
          {
            uint64_t v66 = 0;
            do
            {
              if (*(void *)v131 != v65)
              {
                uint64_t v67 = v66;
                objc_enumerationMutation(v63);
                uint64_t v66 = v67;
              }
              uint64_t v109 = v66;
              v68 = *(void **)(*((void *)&v130 + 1) + 8 * v66);
              long long v126 = 0u;
              long long v127 = 0u;
              long long v128 = 0u;
              long long v129 = 0u;
              v107 = v68;
              __int16 v69 = [v68 components];
              uint64_t v70 = [v69 countByEnumeratingWithState:&v126 objects:v138 count:16];
              if (v70)
              {
                uint64_t v71 = v70;
                uint64_t v72 = *(void *)v127;
                while (2)
                {
                  for (uint64_t i = 0; i != v71; ++i)
                  {
                    if (*(void *)v127 != v72) {
                      objc_enumerationMutation(v69);
                    }
                    id v74 = [*(id *)(*((void *)&v126 + 1) + 8 * i) accessory];
                    __int16 v75 = [v74 uuid];
                    int v76 = [v62 containsObject:v75];

                    if (v76)
                    {
                      v84 = (void *)MEMORY[0x230FBD990]();
                      v85 = v22;
                      v86 = HMFGetOSLogHandle();
                      if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
                      {
                        v87 = HMFGetLogIdentifier();
                        *(_DWORD *)buf = 138543874;
                        v145 = v87;
                        __int16 v146 = 2112;
                        id v147 = v74;
                        __int16 v148 = 2112;
                        id v149 = v107;
                        _os_log_impl(&dword_22F52A000, v86, OS_LOG_TYPE_ERROR, "%{public}@Accessory %@ already used in another media system %@", buf, 0x20u);
                      }
                      v88 = [v114 setupActivity];
                      v136[0] = @"accessory.uuid";
                      v89 = [v74 uuid];
                      uint64_t v90 = HMDailyRotatedUUID();
                      v91 = (void *)v90;
                      if (v90) {
                        v92 = (__CFString *)v90;
                      }
                      else {
                        v92 = @"no uuid";
                      }
                      v136[1] = @"error.code";
                      v137[0] = v92;
                      v93 = [NSNumber numberWithInteger:2023];
                      v137[1] = v93;
                      id v94 = (id)[NSDictionary dictionaryWithObjects:v137 forKeys:v136 count:2];

                      uint64_t v35 = v114;
                      v95 = [v114 setupActivity];
                      [v95 markWithReason:@"HMDHomeMediaSystemHandler.addedMediaSystem.failure"];

                      v96 = [MEMORY[0x263F087E8] hmPrivateErrorWithCode:2023];
                      v119[2](v119, 0, v96);

                      v32 = v119;
                      v82 = v110;
                      id v17 = v111;
                      uint64_t v29 = v19;
                      uint64_t v31 = v116;
                      long long v38 = v113;
                      goto LABEL_42;
                    }
                  }
                  uint64_t v71 = [v69 countByEnumeratingWithState:&v126 objects:v138 count:16];
                  if (v71) {
                    continue;
                  }
                  break;
                }
              }

              uint64_t v66 = v109 + 1;
              id v63 = v110;
              id v17 = v111;
              long long v38 = v113;
              uint64_t v35 = v114;
              v64 = v118;
              uint64_t v65 = v106;
            }
            while (v109 + 1 != v108);
            uint64_t v29 = v19;
            uint64_t v108 = [v110 countByEnumeratingWithState:&v130 objects:v139 count:16];
          }
          while (v108);
        }

        uint64_t v77 = [v38 supportedStereoPairVersions];
        if (([v64 supportedStereoPairVersions] & v77) != 0)
        {
          v78 = [HMDMediaSystemModel alloc];
          v79 = [(HMDHomeMediaSystemHandler *)v22 parentUUID];
          v80 = [(HMDBackingStoreModelObject *)v78 initWithObjectChangeType:1 uuid:v117 parentUUID:v79];

          uint64_t v31 = v116;
          if (v122) {
            -[HMDMediaSystemModel setConfiguredName:](v80, "setConfiguredName:");
          }
          v81 = [MEMORY[0x263F0E548] encodeComponentDataWithLeftComponentUUID:v17 leftAccessoryUUID:v112 rightComponentUUID:v121 rightAccessoryUUID:v29];
          [(HMDMediaSystemModel *)v80 setMediaSystemComponents:v81];

          v115 = [v116 backingStore];
          +[HMDBackingStoreTransactionOptions defaultXPCOptions];
          v83 = v82 = v80;
          __int16 v69 = [v115 transaction:@"Add media system" options:v83];

          [v69 add:v82];
          v123[0] = MEMORY[0x263EF8330];
          v123[1] = 3221225472;
          v123[2] = __155__HMDHomeMediaSystemHandler_messageHandlerAddMediaSystem_configuredName_leftUUID_leftAccessoryUUID_rightUUID_rightAccessoryUUID_builderSession_completion___block_invoke;
          v123[3] = &unk_264A2E788;
          v123[4] = v22;
          id v124 = v117;
          v32 = v119;
          v125 = v119;
          [v69 run:v123];
        }
        else
        {
          v97 = (void *)MEMORY[0x230FBD990]();
          v98 = v22;
          v99 = HMFGetOSLogHandle();
          uint64_t v31 = v116;
          if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR))
          {
            v100 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543874;
            v145 = v100;
            __int16 v146 = 2112;
            id v147 = v38;
            __int16 v148 = 2112;
            id v149 = v118;
            _os_log_impl(&dword_22F52A000, v99, OS_LOG_TYPE_ERROR, "%{public}@There is a mismatch in the supported stereo pair versions %@, %@", buf, 0x20u);
          }
          v101 = [v35 setupActivity];
          v134[0] = @"error.code";
          v102 = [NSNumber numberWithInteger:3];
          v134[1] = @"error.code.private";
          v135[0] = v102;
          long long v38 = v113;
          v103 = [NSNumber numberWithInteger:2024];
          v135[1] = v103;
          id v104 = (id)[NSDictionary dictionaryWithObjects:v135 forKeys:v134 count:2];

          v105 = (void *)MEMORY[0x263F087E8];
          v82 = [MEMORY[0x263F087E8] hmPrivateErrorWithCode:2024];
          __int16 v69 = [v105 hmErrorWithCode:3 description:0 reason:0 suggestion:0 underlyingError:v82];
          v32 = v119;
          v119[2](v119, 0, v69);
        }
LABEL_42:

        id v18 = v112;
        goto LABEL_43;
      }
      long long v44 = (void *)MEMORY[0x230FBD990]();
      long long v45 = v22;
      v46 = HMFGetOSLogHandle();
      uint64_t v31 = v116;
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        id v47 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v145 = v47;
        __int16 v146 = 2112;
        id v147 = v18;
        __int16 v148 = 2112;
        id v149 = v29;
        _os_log_impl(&dword_22F52A000, v46, OS_LOG_TYPE_ERROR, "%{public}@Accessories in media system are not unique %@ - %@", buf, 0x20u);
      }
      v48 = [MEMORY[0x263F087E8] hmPrivateErrorWithCode:2022];
      v32 = v119;
      v119[2](v119, 0, v48);

      uint64_t v35 = v114;
      __int16 v49 = [v114 setupActivity];
      v140 = @"error.code";
      v50 = [NSNumber numberWithInteger:2022];
      v141 = v50;
      __int16 v51 = NSDictionary;
      v52 = &v141;
      __int16 v53 = &v140;
    }
    else
    {
      id v54 = (void *)MEMORY[0x230FBD990]();
      v55 = v22;
      id v56 = HMFGetOSLogHandle();
      uint64_t v31 = v116;
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v57 = v38;
        v59 = id v58 = v35;
        *(_DWORD *)buf = 138544130;
        v145 = v59;
        __int16 v146 = 2112;
        id v147 = v116;
        __int16 v148 = 2112;
        id v149 = v18;
        __int16 v150 = 2112;
        v151 = v29;
        _os_log_impl(&dword_22F52A000, v56, OS_LOG_TYPE_ERROR, "%{public}@Accessory cannot be found in home %@ for accessory IDs %@ %@", buf, 0x2Au);

        uint64_t v35 = v58;
        long long v38 = v57;
      }

      id v60 = [MEMORY[0x263F087E8] hmPrivateErrorWithCode:2021];
      v32 = v119;
      v119[2](v119, 0, v60);

      __int16 v49 = [v35 setupActivity];
      v142 = @"error.code";
      v50 = [NSNumber numberWithInteger:2021];
      v143 = v50;
      __int16 v51 = NSDictionary;
      v52 = &v143;
      __int16 v53 = &v142;
    }
    id v61 = (id)[v51 dictionaryWithObjects:v52 forKeys:v53 count:1];

    id v62 = [v35 setupActivity];
    [v62 markWithReason:@"HMDHomeMediaSystemHandler.addedMediaSystem.failure"];
LABEL_43:

    id v16 = v117;
    goto LABEL_44;
  }
  id v26 = (void *)MEMORY[0x230FBD990]();
  __int16 v27 = v22;
  uint64_t v28 = HMFGetOSLogHandle();
  uint64_t v29 = v19;
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    id v30 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v145 = v30;
    __int16 v146 = 2112;
    id v147 = v16;
    _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_ERROR, "%{public}@Media system with uuid %@ already exists", buf, 0x16u);
  }
  uint64_t v31 = [MEMORY[0x263F087E8] hmErrorWithCode:1];
  v32 = v119;
  v119[2](v119, 0, v31);
LABEL_44:
}

void __155__HMDHomeMediaSystemHandler_messageHandlerAddMediaSystem_configuredName_leftUUID_leftAccessoryUUID_rightUUID_rightAccessoryUUID_builderSession_completion___block_invoke(uint64_t a1, void *a2)
{
  v16[2] = *MEMORY[0x263EF8340];
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 home];
  id v6 = [v5 homeManager];

  if (v4)
  {
    uint64_t v7 = 0;
  }
  else
  {
    int v8 = [*(id *)(a1 + 32) mediaSystemWithUUID:*(void *)(a1 + 40)];
    uint64_t v7 = [v8 serialize];
  }
  id v9 = [v6 setupActivity];
  v15[0] = @"error.code";
  __int16 v10 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "code"));
  v15[1] = @"domain";
  v16[0] = v10;
  uint64_t v11 = [v4 domain];
  uint64_t v12 = (void *)v11;
  uint64_t v13 = @"no domain";
  if (v11) {
    uint64_t v13 = (__CFString *)v11;
  }
  v16[1] = v13;
  id v14 = (id)[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)routeMediaSystemWithMessage:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDHomeMediaSystemHandler *)self messageHandler];
  [v5 routeUpdateMediaSystem:v4];
}

- (id)processedMediaSystemBuilderMessageFor:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDHomeMediaSystemHandler *)self messageHandler];
  id v6 = [v5 preProcessMediaSystemMessage:v4];

  return v6;
}

- (id)mediaSystemForAccessory:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDHomeMediaSystemHandler *)self mediaSystems];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __53__HMDHomeMediaSystemHandler_mediaSystemForAccessory___block_invoke;
  v9[3] = &unk_264A1BB98;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = objc_msgSend(v5, "na_firstObjectPassingTest:", v9);

  return v7;
}

uint64_t __53__HMDHomeMediaSystemHandler_mediaSystemForAccessory___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 accessories];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __53__HMDHomeMediaSystemHandler_mediaSystemForAccessory___block_invoke_2;
  v6[3] = &unk_264A27218;
  id v7 = *(id *)(a1 + 32);
  uint64_t v4 = objc_msgSend(v3, "na_any:", v6);

  return v4;
}

uint64_t __53__HMDHomeMediaSystemHandler_mediaSystemForAccessory___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 uuid];
  id v5 = [v3 uuid];

  uint64_t v6 = objc_msgSend(v4, "hmf_isEqualToUUID:", v5);
  return v6;
}

- (void)configure:(id)a3 delegate:(id)a4 dataSource:(id)a5 queue:(id)a6 messageDispatcher:(id)a7 notificationCenter:(id)a8
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v33 = a4;
  id v32 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  id v18 = [v14 uuid];
  [(HMDHomeMediaSystemHandler *)self setParentUUID:v18];

  id v19 = (void *)MEMORY[0x230FBD990]();
  id v20 = self;
  v21 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    __int16 v22 = HMFGetLogIdentifier();
    int v23 = [(HMDHomeMediaSystemHandler *)v20 mediaSystems];
    *(_DWORD *)buf = 138543874;
    long long v40 = v22;
    __int16 v41 = 2112;
    id v42 = v14;
    __int16 v43 = 2112;
    long long v44 = v23;
    _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_INFO, "%{public}@Configuring media system controller for home: %@ media systems: %@", buf, 0x20u);
  }
  [(HMDHomeMediaSystemHandler *)v20 setHome:v14];
  [(HMDHomeMediaSystemHandler *)v20 setDelegate:v33];
  [(HMDHomeMediaSystemHandler *)v20 setDataSource:v32];
  __int16 v24 = [v14 residentDeviceManager];
  [v24 addDataSource:v20];

  [(HMDHomeMediaSystemHandler *)v20 setWorkQueue:v15];
  [(HMDHomeMediaSystemHandler *)v20 setMessageDispatcher:v16];
  [(HMDHomeMediaSystemHandler *)v20 setNotificationCenter:v17];
  __int16 v25 = [[HMDHomeMediaSystemControllerMessageHandler alloc] initWithQueue:v15 home:v14 messageDispatcher:v16 delegate:v20];
  [(HMDHomeMediaSystemHandler *)v20 setMessageHandler:v25];

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v26 = [(HMDHomeMediaSystemHandler *)v20 mediaSystems];
  uint64_t v27 = [v26 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v35 != v29) {
          objc_enumerationMutation(v26);
        }
        uint64_t v31 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        objc_msgSend(v31, "setDataSource:", v20, v32);
        [v31 configureWithMessageDispatcher:v16];
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v28);
  }
}

- (id)logIdentifier
{
  v2 = [(HMDHomeMediaSystemHandler *)self parentUUID];
  id v3 = [v2 UUIDString];

  return v3;
}

- (id)attributeDescriptions
{
  v11[2] = *MEMORY[0x263EF8340];
  id v3 = [(HMDHomeMediaSystemHandler *)self mediaSystems];
  uint64_t v4 = objc_msgSend(v3, "na_map:", &__block_literal_global_5);
  id v5 = objc_alloc(MEMORY[0x263F424F8]);
  uint64_t v6 = [(HMDHomeMediaSystemHandler *)self parentUUID];
  id v7 = (void *)[v5 initWithName:@"homeUUID" value:v6];
  v11[0] = v7;
  int v8 = (void *)[objc_alloc(MEMORY[0x263F424F8]) initWithName:@"mediaSystemUUIDs" value:v4];
  v11[1] = v8;
  id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:2];

  return v9;
}

uint64_t __50__HMDHomeMediaSystemHandler_attributeDescriptions__block_invoke(uint64_t a1, void *a2)
{
  return [a2 uuid];
}

- (void)notifyOfRemovedMediaSystem:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  uint64_t v9 = *MEMORY[0x263F0EAA8];
  uint64_t v4 = [a3 uuid];
  id v5 = [v4 UUIDString];
  v10[0] = v5;
  uint64_t v6 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];

  id v7 = [(HMDHomeMediaSystemHandler *)self notificationCenter];
  int v8 = [(HMDHomeMediaSystemHandler *)self delegate];
  [v7 postNotificationName:@"HMDMediaSystemRemovedNotification" object:v8 userInfo:v6];
}

- (void)unsubscribeToSettingsForMediaSystem:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDHomeMediaSystemHandler *)self stereoPairSettingsController];

  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x230FBD990]();
    id v7 = self;
    int v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = HMFGetLogIdentifier();
      int v11 = 138543618;
      uint64_t v12 = v9;
      __int16 v13 = 2112;
      id v14 = v4;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Stereo pair settings controller remove media system: %@", (uint8_t *)&v11, 0x16u);
    }
    id v10 = [(HMDHomeMediaSystemHandler *)v7 stereoPairSettingsController];
    [v10 unsubscribeToRemovedMediaSystemIfPrimaryResident:v4];
  }
}

- (void)handleRemovedMediaSystem:(id)a3
{
  id v6 = a3;
  [v6 unconfigureMediaSystemComponents];
  [(HMDHomeMediaSystemHandler *)self unsubscribeToSettingsForMediaSystem:v6];
  id v4 = [(HMDHomeMediaSystemHandler *)self delegate];
  id v5 = [v6 uuid];
  [v4 mediaSystemController:self didRemoveMediaSystem:v5];

  [(HMDHomeMediaSystemHandler *)self notifyOfRemovedMediaSystem:v6];
}

- (void)removeMediaSystem:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = HMFGetLogIdentifier();
    int v14 = 138543618;
    uint64_t v15 = v8;
    __int16 v16 = 2112;
    id v17 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Removing media system: %@", (uint8_t *)&v14, 0x16u);
  }
  os_unfair_lock_lock_with_options();
  uuidToMediaSystems = v6->_uuidToMediaSystems;
  id v10 = [v4 uuid];
  int v11 = [(NSMutableDictionary *)uuidToMediaSystems objectForKey:v10];

  if (v11)
  {
    uint64_t v12 = v6->_uuidToMediaSystems;
    __int16 v13 = [v4 uuid];
    [(NSMutableDictionary *)v12 removeObjectForKey:v13];

    os_unfair_lock_unlock(&v6->_lock);
    [(HMDHomeMediaSystemHandler *)v6 handleRemovedMediaSystem:v4];
  }
  else
  {
    os_unfair_lock_unlock(&v6->_lock);
  }
}

- (void)updateMediaSystem:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = HMFGetLogIdentifier();
    int v12 = 138543618;
    __int16 v13 = v8;
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Updating media system: %@", (uint8_t *)&v12, 0x16u);
  }
  p_lock = &v6->_lock;
  os_unfair_lock_lock_with_options();
  uuidToMediaSystems = v6->_uuidToMediaSystems;
  int v11 = [v4 uuid];
  [(NSMutableDictionary *)uuidToMediaSystems setObject:v4 forKey:v11];

  os_unfair_lock_unlock(p_lock);
}

- (id)mediaSystemWithUUID:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v6 = [(NSMutableDictionary *)self->_uuidToMediaSystems objectForKey:v4];
  os_unfair_lock_unlock(p_lock);

  return v6;
}

- (id)filteredMediaSystems
{
  v2 = [(HMDHomeMediaSystemHandler *)self mediaSystems];
  id v3 = objc_msgSend(v2, "na_filter:", &__block_literal_global_3_64566);

  return v3;
}

uint64_t __49__HMDHomeMediaSystemHandler_filteredMediaSystems__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isValid];
}

- (NSArray)mediaSystems
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = [(NSMutableDictionary *)self->_uuidToMediaSystems allValues];
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (HMDHomeMediaSystemHandler)initWithMediaSystems:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HMDHomeMediaSystemHandler;
  id v5 = [(HMDHomeMediaSystemHandler *)&v12 init];
  if (v5)
  {
    uint64_t v6 = HMFGetOSLogHandle();
    logger = v5->_logger;
    v5->_logger = (OS_os_log *)v6;

    int v8 = objc_msgSend(v4, "na_dictionaryWithKeyGenerator:", &__block_literal_global_64571);
    uint64_t v9 = [v8 mutableCopy];
    uuidToMediaSystems = v5->_uuidToMediaSystems;
    v5->_uuidToMediaSystems = (NSMutableDictionary *)v9;
  }
  return v5;
}

uint64_t __50__HMDHomeMediaSystemHandler_initWithMediaSystems___block_invoke(uint64_t a1, void *a2)
{
  return [a2 uuid];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t7_64581 != -1) {
    dispatch_once(&logCategory__hmf_once_t7_64581, &__block_literal_global_14);
  }
  v2 = (void *)logCategory__hmf_once_v8_64582;
  return v2;
}

void __40__HMDHomeMediaSystemHandler_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v8_64582;
  logCategory__hmf_once_v8_64582 = v0;
}

@end