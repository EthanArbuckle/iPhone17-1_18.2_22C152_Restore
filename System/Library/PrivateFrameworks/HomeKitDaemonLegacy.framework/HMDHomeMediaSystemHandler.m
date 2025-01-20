@interface HMDHomeMediaSystemHandler
+ (BOOL)supportsSecureCoding;
+ (id)logCategory;
- (BOOL)doAccessoriesSupportStereoPairVersion:(void *)a3 leftHomePod:(void *)a4 rightHomePod:;
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

- (NSArray)mediaSystems
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = [(NSMutableDictionary *)self->_uuidToMediaSystems allValues];
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

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
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
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

    v19 = (void *)MEMORY[0x1D9452090]();
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
      _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_DEBUG, "%{public}@accessories in media system somePresent:%d allPresent:%d, ms acc:%@, incoming acc: %@", buf, 0x2Cu);

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
    v30 = (void *)MEMORY[0x1D9452090]();
    v31 = self;
    v32 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      v33 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v48 = v33;
      __int16 v49 = 2112;
      *(void *)v50 = v8;
      _os_log_impl(&dword_1D49D5000, v32, OS_LOG_TYPE_INFO, "%{public}@audit discovered accessories added by old controller, will remove %@", buf, 0x16u);
    }
    v34 = [(HMDHomeMediaSystemHandler *)v31 delegate];
    v35 = (void *)[v8 copy];
    [v34 mediaSystemController:v31 removeAccessories:v35 fromAssistantAccessControl:v6];
  }
}

- (id)_currentMediaSystemIfPrimary
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
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
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v21 = a3;
  uint64_t v22 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v23 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v24 = [MEMORY[0x1E4F1CA48] array];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v4 = [(HMDHomeMediaSystemHandler *)self mediaSystems];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v26 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(id *)(*((void *)&v25 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          long long v10 = v9;
        }
        else {
          long long v10 = 0;
        }
        id v11 = v10;

        id v12 = v9;
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          long long v13 = v12;
        }
        else {
          long long v13 = 0;
        }
        id v14 = v13;

        if (v14)
        {
          uint64_t v15 = (void *)v24;
          id v16 = v14;
        }
        else if (v11)
        {
          uint64_t v15 = (void *)v23;
          id v16 = v11;
        }
        else
        {
          uint64_t v15 = (void *)v22;
          id v16 = v12;
        }
        [v15 addObject:v16];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v6);
  }

  if (objc_msgSend(v21, "hmd_isForXPCTransport"))
  {
    v17 = [(HMDHomeMediaSystemHandler *)self mediaSystems];
    [v21 encodeObject:v17 forKey:*MEMORY[0x1E4F2ED90]];

    int v18 = (void *)v22;
    v19 = (void *)v23;
    v20 = (void *)v24;
  }
  else
  {
    int v18 = (void *)v22;
    [v21 encodeObject:v22 forKey:*MEMORY[0x1E4F2ED90]];
    v19 = (void *)v23;
    [v21 encodeObject:v23 forKey:@"ms.homepod"];
    v20 = (void *)v24;
    [v21 encodeObject:v24 forKey:@"ms.homepod6_1"];
  }
}

- (HMDHomeMediaSystemHandler)initWithCoder:(id)a3
{
  v25[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1E4F1CAD0];
  v25[0] = objc_opt_class();
  v25[1] = objc_opt_class();
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
  uint64_t v7 = [v5 setWithArray:v6];

  id v8 = [v4 decodeObjectOfClasses:v7 forKey:*MEMORY[0x1E4F2ED90]];
  id v9 = [v4 decodeObjectOfClasses:v7 forKey:@"ms.homepod"];
  uint64_t v10 = [v4 decodeObjectOfClasses:v7 forKey:@"ms.homepod6_1"];
  id v11 = (void *)v10;
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
      id v14 = (id)MEMORY[0x1E4F1CBF0];
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
  v17 = (void *)MEMORY[0x1D9452090]();
  int v18 = self;
  v19 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    v20 = HMFGetLogIdentifier();
    int v23 = 138543362;
    uint64_t v24 = v20;
    _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_ERROR, "%{public}@Decoded home media system handler with no media systems", (uint8_t *)&v23, 0xCu);
  }
  id v14 = (id)MEMORY[0x1E4F1CBF0];
LABEL_16:
  id v21 = [(HMDHomeMediaSystemHandler *)self initWithMediaSystems:v14];

  return v21;
}

- (BOOL)supportsDeviceWithCapabilities:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HMDHomeMediaSystemHandler *)self mediaSystems];
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
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
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
        id v11 = [*(id *)(*((void *)&v14 + 1) + 8 * i) backingStoreObjectsForVersion:a3];
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
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (isFeatureHomeTheaterQFAEnabledForTests
    && [(id)isFeatureHomeTheaterQFAEnabledForTests BOOLValue])
  {
    uint64_t v8 = (void *)MEMORY[0x1D9452090]();
    uint64_t v9 = self;
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      int v20 = 138543362;
      id v21 = v11;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Skipping update model due to Home Theater QFA enabled", (uint8_t *)&v20, 0xCu);
    }
  }
  else
  {
    BOOL v12 = [v6 uuid];
    long long v13 = [(HMDHomeMediaSystemHandler *)self mediaSystemWithUUID:v12];

    long long v14 = (void *)MEMORY[0x1D9452090]();
    long long v15 = self;
    long long v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      long long v17 = HMFGetLogIdentifier();
      int v18 = [v6 uuid];
      uint64_t v19 = [v18 UUIDString];
      int v20 = 138543874;
      id v21 = v17;
      __int16 v22 = 2112;
      int v23 = v19;
      __int16 v24 = 2112;
      long long v25 = v13;
      _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_INFO, "%{public}@Handling update of media system %@, system: %@", (uint8_t *)&v20, 0x20u);
    }
    [v13 transactionObjectUpdated:0 newValues:v6 message:v7];
  }
}

- (void)_handleRemoveMediaSystemModel:(id)a3 message:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (isFeatureHomeTheaterQFAEnabledForTests
    && [(id)isFeatureHomeTheaterQFAEnabledForTests BOOLValue])
  {
    uint64_t v8 = (void *)MEMORY[0x1D9452090]();
    uint64_t v9 = self;
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      int v29 = 138543362;
      uint64_t v30 = v11;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Skipping remove model due to Home Theater QFA enabled", (uint8_t *)&v29, 0xCu);
    }
    BOOL v12 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
    [v7 respondWithError:v12];
  }
  else
  {
    long long v13 = [v6 uuid];
    BOOL v12 = [(HMDHomeMediaSystemHandler *)self mediaSystemWithUUID:v13];

    long long v14 = (void *)MEMORY[0x1D9452090]();
    long long v15 = self;
    long long v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      long long v17 = HMFGetLogIdentifier();
      int v18 = [v6 uuid];
      uint64_t v19 = [v18 UUIDString];
      int v20 = [v7 identifier];
      int v29 = 138544130;
      uint64_t v30 = v17;
      __int16 v31 = 2112;
      v32 = v19;
      __int16 v33 = 2112;
      v34 = v20;
      __int16 v35 = 2112;
      v36 = v12;
      _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_INFO, "%{public}@Handling transaction removal of media system model uuid: %@ message identifier: %@ media system: %@", (uint8_t *)&v29, 0x2Au);
    }
    if (v12)
    {
      [(HMDHomeMediaSystemHandler *)v15 removeMediaSystem:v12];
      id v21 = [v7 transactionResult];
      [v21 markChanged];
      [v21 markSaveToAssistant];
      [v7 respondWithSuccess];
    }
    else
    {
      __int16 v22 = (void *)MEMORY[0x1D9452090]();
      int v23 = v15;
      __int16 v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        long long v25 = HMFGetLogIdentifier();
        uint64_t v26 = [v6 uuid];
        long long v27 = [v26 UUIDString];
        long long v28 = [(HMDHomeMediaSystemHandler *)v23 mediaSystems];
        int v29 = 138543874;
        uint64_t v30 = v25;
        __int16 v31 = 2112;
        v32 = v27;
        __int16 v33 = 2112;
        v34 = v28;
        _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_ERROR, "%{public}@Cannot find media system with UUID %@, current media systems: %@", (uint8_t *)&v29, 0x20u);
      }
      id v21 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
      [v7 respondWithError:v21];
    }
  }
}

- (void)confirmPrimaryResidentIfFirstMediaSystem
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = [(HMDHomeMediaSystemHandler *)self mediaSystems];
  uint64_t v4 = [v3 count];

  if (v4 == 1)
  {
    uint64_t v5 = [(HMDHomeMediaSystemHandler *)self home];
    id v6 = v5;
    if (v5)
    {
      if ([v5 isCurrentDevicePrimaryResident])
      {
        id v7 = (void *)MEMORY[0x1D9452090]();
        uint64_t v8 = self;
        uint64_t v9 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          uint64_t v10 = HMFGetLogIdentifier();
          int v16 = 138543362;
          long long v17 = v10;
          _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Confirming primary resident due to first added media system", (uint8_t *)&v16, 0xCu);
        }
        id v11 = [v6 residentDeviceManager];
        [v11 confirmWithCompletionHandler:0];
      }
    }
    else
    {
      BOOL v12 = (void *)MEMORY[0x1D9452090]();
      long long v13 = self;
      long long v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        long long v15 = HMFGetLogIdentifier();
        int v16 = 138543362;
        long long v17 = v15;
        _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to confirm primary resident due to no home", (uint8_t *)&v16, 0xCu);
      }
    }
  }
}

- (void)subscribeToSettingsForNewlyAddedMediaSystem:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HMDHomeMediaSystemHandler *)self stereoPairSettingsController];

  if (v5)
  {
    id v6 = (void *)MEMORY[0x1D9452090]();
    id v7 = self;
    uint64_t v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = HMFGetLogIdentifier();
      int v11 = 138543618;
      BOOL v12 = v9;
      __int16 v13 = 2112;
      id v14 = v4;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Stereo pair settings controller add media system: %@", (uint8_t *)&v11, 0x16u);
    }
    uint64_t v10 = [(HMDHomeMediaSystemHandler *)v7 stereoPairSettingsController];
    [v10 subscribeToAddedMediaSystemIfPrimaryResident:v4];
  }
}

- (void)addMediaSystem:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 setDataSource:self];
  uint64_t v5 = [(HMDHomeMediaSystemHandler *)self messageDispatcher];
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
    _os_signpost_emit_with_name_impl(&dword_1D49D5000, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "AddedMediaSystem", "mediaSystemUUID=%{signpost.description:attribute}@ ", buf, 0xCu);
  }
  uint64_t v9 = [(HMDHomeMediaSystemHandler *)self notificationCenter];
  uint64_t v10 = [(HMDHomeMediaSystemHandler *)self delegate];
  BOOL v12 = @"HMDMediaSystemNotificationKey";
  id v13 = v4;
  int v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  [v9 postNotificationName:@"HMDMediaSystemAddedNotification" object:v10 userInfo:v11];
}

- (void)_handleAddMediaSystemModel:(id)a3 message:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (isFeatureHomeTheaterQFAEnabledForTests
    && [(id)isFeatureHomeTheaterQFAEnabledForTests BOOLValue])
  {
    uint64_t v8 = (void *)MEMORY[0x1D9452090]();
    uint64_t v9 = self;
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      long long v39 = v11;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Skipping add model due to Home Theater QFA enabled", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v12 = [(HMDHomeMediaSystemHandler *)self home];
    id v35 = v6;
    id v13 = v6;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v14 = v13;
    }
    else {
      id v14 = 0;
    }
    id v15 = v14;

    id v16 = v13;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      long long v17 = v16;
    }
    else {
      long long v17 = 0;
    }
    id v18 = v17;

    uint64_t v19 = off_1E6A034B8;
    if (v15) {
      uint64_t v19 = off_1E6A034C0;
    }
    if (v18) {
      uint64_t v19 = off_1E6A034C8;
    }
    v34 = (void *)v12;
    int v20 = (void *)[objc_alloc(*v19) initWithMediaSystemModel:v16 home:v12];
    id v21 = (void *)MEMORY[0x1D9452090]();
    __int16 v22 = self;
    int v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      __int16 v24 = HMFGetLogIdentifier();
      long long v25 = [v16 uuid];
      uint64_t v26 = [v25 UUIDString];
      *(_DWORD *)buf = 138543874;
      long long v39 = v24;
      __int16 v40 = 2112;
      long long v41 = v26;
      __int16 v42 = 2112;
      long long v43 = v20;
      _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_INFO, "%{public}@Handling add of media system %@, system: %@", buf, 0x20u);
    }
    if (v20)
    {
      [(HMDHomeMediaSystemHandler *)v22 addMediaSystem:v20];
      uint64_t v36 = *MEMORY[0x1E4F2ED30];
      long long v27 = [v20 serialize];
      uint64_t v37 = v27;
      long long v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v37 forKeys:&v36 count:1];
      [v7 respondWithPayload:v28];

      int v29 = [v7 transactionResult];
      [v29 markChanged];
      [v29 markSaveToAssistant];
    }
    else
    {
      uint64_t v30 = (void *)MEMORY[0x1D9452090]();
      __int16 v31 = v22;
      v32 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        __int16 v33 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        long long v39 = v33;
        _os_log_impl(&dword_1D49D5000, v32, OS_LOG_TYPE_ERROR, "%{public}@Cannot create media system object", buf, 0xCu);
      }
      int v29 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
      [v7 respondWithError:v29];
    }

    id v6 = v35;
  }
}

- (void)addMediaSystemWithGroupIdentifier:(id)a3 usingData:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x1D9452090]();
  uint64_t v9 = self;
  uint64_t v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v11 = HMFGetLogIdentifier();
    int v23 = 138543618;
    __int16 v24 = v11;
    __int16 v25 = 2112;
    id v26 = v6;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Adding media system with identifier: %@", (uint8_t *)&v23, 0x16u);
  }
  uint64_t v12 = [(HMDHomeMediaSystemHandler *)v9 mediaSystemData:v7 withIdentifier:v6];
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
      uint64_t v19 = (void *)MEMORY[0x1D9452090]();
      int v20 = v9;
      id v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        __int16 v22 = HMFGetLogIdentifier();
        int v23 = 138543618;
        __int16 v24 = v22;
        __int16 v25 = 2112;
        id v26 = v7;
        _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to add media system using data: %@ due to no home", (uint8_t *)&v23, 0x16u);
      }
    }
  }
  else
  {
    id v15 = (void *)MEMORY[0x1D9452090]();
    id v16 = v9;
    long long v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v18 = HMFGetLogIdentifier();
      int v23 = 138543874;
      __int16 v24 = v18;
      __int16 v25 = 2112;
      id v26 = v6;
      __int16 v27 = 2112;
      id v28 = v7;
      _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to get data for media system to add with identifier: %@ data: %@", (uint8_t *)&v23, 0x20u);
    }
  }
}

- (void)addMediaSystemsWithIdentifiers:(id)a3 usingData:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __70__HMDHomeMediaSystemHandler_addMediaSystemsWithIdentifiers_usingData___block_invoke;
  v8[3] = &unk_1E6A0D6F0;
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
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __60__HMDHomeMediaSystemHandler_mediaSystemData_withIdentifier___block_invoke;
  v9[3] = &unk_1E6A0A8A0;
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
  return (id)objc_msgSend(a3, "na_map:", &__block_literal_global_65);
}

uint64_t __58__HMDHomeMediaSystemHandler_identifiersInMediaSystemData___block_invoke(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

- (void)mergeMediaSystemData:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__44168;
  id v15 = __Block_byref_object_dispose__44169;
  id v5 = [(HMDHomeMediaSystemHandler *)self identifiersInMediaSystemData:v4];
  id v16 = (id)[v5 mutableCopy];

  id v6 = [(HMDHomeMediaSystemHandler *)self mediaSystems];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __50__HMDHomeMediaSystemHandler_mergeMediaSystemData___block_invoke;
  v8[3] = &unk_1E6A0A858;
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
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (void *)MEMORY[0x1D9452090]();
  uint64_t v12 = self;
  uint64_t v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    id v14 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v28 = v14;
    __int16 v29 = 2112;
    id v30 = v9;
    _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Received remove media system message for session ID %@", buf, 0x16u);
  }
  id v15 = [(HMDHomeMediaSystemHandler *)v12 mediaSystemWithUUID:v8];
  id v16 = v15;
  if (v15)
  {
    long long v17 = [v15 modelForMediaSystem];
    [v17 setObjectChangeType:3];
    id v18 = [(HMDHomeMediaSystemHandler *)v12 dataSource];
    uint64_t v19 = [v18 backingStore];
    int v20 = +[HMDBackingStoreTransactionOptions defaultXPCOptions];
    id v21 = [v19 transaction:@"Remove media system" options:v20];

    [v21 add:v17 withMessage:v10];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __84__HMDHomeMediaSystemHandler_messageHandlerRemoveMediaSystem_builderSession_message___block_invoke;
    v26[3] = &unk_1E6A197F0;
    v26[4] = v12;
    [v21 run:v26];
  }
  else
  {
    __int16 v22 = (void *)MEMORY[0x1D9452090]();
    int v23 = v12;
    __int16 v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      __int16 v25 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v28 = v25;
      __int16 v29 = 2112;
      id v30 = v9;
      _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_ERROR, "%{public}@No media system for session ID found %@", buf, 0x16u);
    }
    long long v17 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
    [v10 respondWithError:v17];
  }
}

void __84__HMDHomeMediaSystemHandler_messageHandlerRemoveMediaSystem_builderSession_message___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)MEMORY[0x1D9452090]();
    id v5 = *(id *)(a1 + 32);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = HMFGetLogIdentifier();
      int v8 = 138543618;
      id v9 = v7;
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_ERROR, "%{public}@Remove media system transaction run completed with error: %@", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (void)messageHandlerUpdateMediaSystem:(id)a3 configuredName:(id)a4 leftUUID:(id)a5 leftAccessoryUUID:(id)a6 rightUUID:(id)a7 rightAccessoryUUID:(id)a8 builderSession:(id)a9 completion:(id)a10
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v63 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v60 = a7;
  id v62 = a8;
  id v19 = a9;
  int v20 = (void (**)(id, void, void *))a10;
  id v21 = (void *)MEMORY[0x1D9452090]();
  __int16 v22 = self;
  int v23 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    __int16 v24 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v68 = v24;
    __int16 v69 = 2112;
    id v70 = v19;
    _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_INFO, "%{public}@Received update media system message for session ID %@", buf, 0x16u);
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
      long long v43 = (void *)MEMORY[0x1D9452090]();
      uint64_t v44 = v22;
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
        _os_log_impl(&dword_1D49D5000, v45, OS_LOG_TYPE_ERROR, "%{public}@Accessory cannot be found in home %@ for accessory IDs %@ %@", buf, 0x2Au);

        id v17 = v47;
        __int16 v27 = v18;
      }
      __int16 v49 = (void *)MEMORY[0x1E4F28C58];
      v34 = [MEMORY[0x1E4F28C58] hmPrivateErrorWithCode:2021];
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
        id v35 = [MEMORY[0x1E4F2E928] encodeComponentDataWithLeftComponentUUID:v56 leftAccessoryUUID:v27 rightComponentUUID:v60 rightAccessoryUUID:v62];
        [v34 setMediaSystemComponents:v35];

        uint64_t v36 = [v26 backingStore];
        uint64_t v37 = +[HMDBackingStoreTransactionOptions defaultXPCOptions];
        long long v38 = [v36 transaction:@"Update media system" options:v37];

        id v17 = v56;
        [v38 add:v34];
        v64[0] = MEMORY[0x1E4F143A8];
        v64[1] = 3221225472;
        v64[2] = __158__HMDHomeMediaSystemHandler_messageHandlerUpdateMediaSystem_configuredName_leftUUID_leftAccessoryUUID_rightUUID_rightAccessoryUUID_builderSession_completion___block_invoke;
        v64[3] = &unk_1E6A18F68;
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
    __int16 v51 = (void *)MEMORY[0x1D9452090]();
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
      _os_log_impl(&dword_1D49D5000, v53, OS_LOG_TYPE_ERROR, "%{public}@Accessories %@ in media system %@ cannot be changed - accessory IDs %@ %@", buf, 0x34u);
    }
    v34 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
    v20[2](v20, 0, v34);
    id v17 = v56;
    goto LABEL_19;
  }
  long long v39 = (void *)MEMORY[0x1D9452090]();
  __int16 v40 = v22;
  long long v41 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
  {
    __int16 v42 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v68 = v42;
    __int16 v69 = 2112;
    id v70 = v63;
    _os_log_impl(&dword_1D49D5000, v41, OS_LOG_TYPE_ERROR, "%{public}@Media system with uuid %@ not found", buf, 0x16u);
  }
  id v26 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
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
  uint64_t v150 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v119 = a7;
  id v120 = a8;
  id v20 = a9;
  id v21 = (void (**)(id, void, void *))a10;
  __int16 v22 = (void *)MEMORY[0x1D9452090]();
  int v23 = self;
  __int16 v24 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    __int16 v25 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v143 = v25;
    __int16 v144 = 2112;
    id v145 = v20;
    _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_INFO, "%{public}@Received add media system message for session ID %@", buf, 0x16u);
  }
  v118 = v20;

  id v26 = [(HMDHomeMediaSystemHandler *)v23 mediaSystemWithUUID:v16];

  if (!v26)
  {
    v32 = [(HMDHomeMediaSystemHandler *)v23 dataSource];
    char v33 = [(HMDHomeMediaSystemHandler *)v23 home];
    v114 = [v33 homeManager];

    v34 = [v32 mediaSystemController:v23 accessoryForUUID:v19];
    id v30 = v120;
    uint64_t v35 = [v32 mediaSystemController:v23 accessoryForUUID:v120];
    id v115 = v17;
    v116 = (void *)v35;
    v117 = v34;
    if (!v34 || (uint64_t v36 = (void *)v35) == 0)
    {
      v50 = (void *)MEMORY[0x1D9452090]();
      __int16 v51 = v23;
      v52 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v54 = __int16 v53 = v32;
        *(_DWORD *)buf = 138544130;
        v143 = v54;
        __int16 v144 = 2112;
        id v145 = v53;
        __int16 v146 = 2112;
        id v147 = v19;
        __int16 v148 = 2112;
        id v149 = v120;
        _os_log_impl(&dword_1D49D5000, v52, OS_LOG_TYPE_ERROR, "%{public}@Accessory cannot be found in home %@ for accessory IDs %@ %@", buf, 0x2Au);

        v32 = v53;
      }

      v55 = [MEMORY[0x1E4F28C58] hmPrivateErrorWithCode:2021];
      v21[2](v21, 0, v55);

      long long v45 = v114;
      id v56 = [v114 setupActivity];
      v140 = @"error.code";
      v57 = [NSNumber numberWithInteger:2021];
      v141 = v57;
      id v58 = (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v141 forKeys:&v140 count:1];

      __int16 v49 = [v114 setupActivity];
      [v49 markWithReason:@"HMDHomeMediaSystemHandler.addedMediaSystem.failure"];
      goto LABEL_49;
    }
    v113 = v32;
    uint64_t v37 = [v34 uuid];
    long long v38 = [v36 uuid];
    int v39 = objc_msgSend(v37, "hmf_isEqualToUUID:", v38);

    if (v39)
    {
      __int16 v40 = (void *)MEMORY[0x1D9452090]();
      long long v41 = v23;
      __int16 v42 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        long long v43 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v143 = v43;
        __int16 v144 = 2112;
        id v145 = v19;
        __int16 v146 = 2112;
        id v147 = v120;
        _os_log_impl(&dword_1D49D5000, v42, OS_LOG_TYPE_ERROR, "%{public}@Accessories in media system are not unique %@ - %@", buf, 0x20u);
      }
      uint64_t v44 = [MEMORY[0x1E4F28C58] hmPrivateErrorWithCode:2022];
      v21[2](v21, 0, v44);

      long long v45 = v114;
      v46 = [v114 setupActivity];
      v138 = @"error.code";
      id v47 = [NSNumber numberWithInteger:2022];
      v139 = v47;
      id v48 = (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v139 forKeys:&v138 count:1];

      __int16 v49 = [v114 setupActivity];
      [v49 markWithReason:@"HMDHomeMediaSystemHandler.addedMediaSystem.failure"];
      v32 = v113;
      goto LABEL_49;
    }
    v111 = v21;
    __int16 v49 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", v19, v120, 0);
    long long v128 = 0u;
    long long v129 = 0u;
    long long v130 = 0u;
    long long v131 = 0u;
    v59 = [(HMDHomeMediaSystemHandler *)v23 mediaSystems];
    id v112 = v19;
    v32 = v113;
    v61 = v116;
    id v60 = v117;
    uint64_t v107 = [v59 countByEnumeratingWithState:&v128 objects:v137 count:16];
    if (v107)
    {
      uint64_t v62 = *(void *)v129;
      id v109 = v18;
      id v110 = v16;
      v108 = v59;
      uint64_t v105 = *(void *)v129;
      do
      {
        uint64_t v63 = 0;
        do
        {
          if (*(void *)v129 != v62) {
            objc_enumerationMutation(v59);
          }
          v64 = *(void **)(*((void *)&v128 + 1) + 8 * v63);
          long long v124 = 0u;
          long long v125 = 0u;
          long long v126 = 0u;
          long long v127 = 0u;
          v106 = v64;
          id v65 = [v64 components];
          uint64_t v66 = [v65 countByEnumeratingWithState:&v124 objects:v136 count:16];
          if (v66)
          {
            uint64_t v67 = v66;
            uint64_t v68 = *(void *)v125;
            while (2)
            {
              for (uint64_t i = 0; i != v67; ++i)
              {
                if (*(void *)v125 != v68) {
                  objc_enumerationMutation(v65);
                }
                id v70 = [*(id *)(*((void *)&v124 + 1) + 8 * i) accessory];
                __int16 v71 = [v70 uuid];
                int v72 = [v49 containsObject:v71];

                if (v72)
                {
                  __int16 v75 = (void *)MEMORY[0x1D9452090]();
                  id v76 = v23;
                  uint64_t v77 = HMFGetOSLogHandle();
                  if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
                  {
                    v78 = HMFGetLogIdentifier();
                    *(_DWORD *)buf = 138543874;
                    v143 = v78;
                    __int16 v144 = 2112;
                    id v145 = v70;
                    __int16 v146 = 2112;
                    id v147 = v106;
                    _os_log_impl(&dword_1D49D5000, v77, OS_LOG_TYPE_ERROR, "%{public}@Accessory %@ already used in another media system %@", buf, 0x20u);
                  }
                  v79 = [v114 setupActivity];
                  v134[0] = @"accessory.uuid";
                  v80 = [v70 uuid];
                  uint64_t v81 = HMDailyRotatedUUID();
                  v82 = (void *)v81;
                  if (v81) {
                    v83 = (__CFString *)v81;
                  }
                  else {
                    v83 = @"no uuid";
                  }
                  v134[1] = @"error.code";
                  v135[0] = v83;
                  v84 = [NSNumber numberWithInteger:2023];
                  v135[1] = v84;
                  id v85 = (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v135 forKeys:v134 count:2];

                  v86 = [v114 setupActivity];
                  [v86 markWithReason:@"HMDHomeMediaSystemHandler.addedMediaSystem.failure"];

                  v87 = [MEMORY[0x1E4F28C58] hmPrivateErrorWithCode:2023];
                  id v21 = v111;
                  v111[2](v111, 0, v87);

                  long long v45 = v114;
                  id v18 = v109;
                  id v16 = v110;
                  id v30 = v120;
                  v32 = v113;
                  v88 = v108;
                  goto LABEL_48;
                }
              }
              uint64_t v67 = [v65 countByEnumeratingWithState:&v124 objects:v136 count:16];
              if (v67) {
                continue;
              }
              break;
            }
          }

          ++v63;
          v59 = v108;
          id v18 = v109;
          id v16 = v110;
          id v30 = v120;
          v32 = v113;
          v61 = v116;
          id v60 = v117;
          uint64_t v62 = v105;
        }
        while (v63 != v107);
        uint64_t v73 = [v108 countByEnumeratingWithState:&v128 objects:v137 count:16];
        uint64_t v62 = v105;
        uint64_t v107 = v73;
      }
      while (v73);
    }

    if (!isInternalBuild()
      || !-[HMDHomeMediaSystemHandler doAccessoriesSupportStereoPairVersion:leftHomePod:rightHomePod:]((BOOL)v23, 8, v60, v61))
    {
      if (-[HMDHomeMediaSystemHandler doAccessoriesSupportStereoPairVersion:leftHomePod:rightHomePod:]((BOOL)v23, 4, v60, v61))
      {
        id v74 = HMDMediaSystemModelExtendedV2;
LABEL_45:
        id v89 = [v74 alloc];
        v90 = [(HMDHomeMediaSystemHandler *)v23 parentUUID];
        v91 = (void *)[v89 initWithObjectChangeType:1 uuid:v16 parentUUID:v90];

        if (v115) {
          objc_msgSend(v91, "setConfiguredName:");
        }
        v92 = [MEMORY[0x1E4F2E928] encodeComponentDataWithLeftComponentUUID:v18 leftAccessoryUUID:v112 rightComponentUUID:v119 rightAccessoryUUID:v30];
        [v91 setMediaSystemComponents:v92];

        v93 = [v32 backingStore];
        +[HMDBackingStoreTransactionOptions defaultXPCOptions];
        v95 = v94 = v91;
        id v65 = [v93 transaction:@"Add media system" options:v95];

        v88 = v94;
        [v65 add:v94];
        v121[0] = MEMORY[0x1E4F143A8];
        v121[1] = 3221225472;
        v121[2] = __155__HMDHomeMediaSystemHandler_messageHandlerAddMediaSystem_configuredName_leftUUID_leftAccessoryUUID_rightUUID_rightAccessoryUUID_builderSession_completion___block_invoke;
        v121[3] = &unk_1E6A18F68;
        v121[4] = v23;
        id v122 = v16;
        id v21 = v111;
        v123 = v111;
        [v65 run:v121];

        long long v45 = v114;
LABEL_48:

        id v19 = v112;
LABEL_49:

        id v17 = v115;
        goto LABEL_50;
      }
      if (-[HMDHomeMediaSystemHandler doAccessoriesSupportStereoPairVersion:leftHomePod:rightHomePod:]((BOOL)v23, 2, v60, v61))
      {
        id v74 = HMDMediaSystemModelExtended;
        goto LABEL_45;
      }
      if (!-[HMDHomeMediaSystemHandler doAccessoriesSupportStereoPairVersion:leftHomePod:rightHomePod:]((BOOL)v23, 1, v60, v61))
      {
        v96 = (void *)MEMORY[0x1D9452090]();
        v97 = v23;
        v98 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR))
        {
          v99 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543874;
          v143 = v99;
          __int16 v144 = 2112;
          id v145 = v117;
          __int16 v146 = 2112;
          id v147 = v116;
          _os_log_impl(&dword_1D49D5000, v98, OS_LOG_TYPE_ERROR, "%{public}@There is a mismatch in the supported stereo pair versions %@, %@", buf, 0x20u);
        }
        long long v45 = v114;
        v100 = [v114 setupActivity];
        v132[0] = @"error.code";
        v101 = [NSNumber numberWithInteger:3];
        v132[1] = @"error.code.private";
        v133[0] = v101;
        v102 = [NSNumber numberWithInteger:2024];
        v133[1] = v102;
        id v103 = (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v133 forKeys:v132 count:2];

        v104 = (void *)MEMORY[0x1E4F28C58];
        v88 = [MEMORY[0x1E4F28C58] hmPrivateErrorWithCode:2024];
        id v65 = [v104 hmErrorWithCode:3 description:0 reason:0 suggestion:0 underlyingError:v88];
        id v21 = v111;
        v111[2](v111, 0, v65);
        goto LABEL_48;
      }
    }
    id v74 = HMDMediaSystemModel;
    goto LABEL_45;
  }
  __int16 v27 = (void *)MEMORY[0x1D9452090]();
  uint64_t v28 = v23;
  uint64_t v29 = HMFGetOSLogHandle();
  id v30 = v120;
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    uint64_t v31 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v143 = v31;
    __int16 v144 = 2112;
    id v145 = v16;
    _os_log_impl(&dword_1D49D5000, v29, OS_LOG_TYPE_ERROR, "%{public}@Media system with uuid %@ already exists", buf, 0x16u);
  }
  v32 = [MEMORY[0x1E4F28C58] hmErrorWithCode:1];
  v21[2](v21, 0, v32);
LABEL_50:
}

- (BOOL)doAccessoriesSupportStereoPairVersion:(void *)a3 leftHomePod:(void *)a4 rightHomePod:
{
  if (result)
  {
    id v6 = a4;
    BOOL v7 = ([a3 supportedStereoPairVersions] & a2) != 0;
    uint64_t v8 = [v6 supportedStereoPairVersions];

    return (v8 & a2) != 0 && v7;
  }
  return result;
}

void __155__HMDHomeMediaSystemHandler_messageHandlerAddMediaSystem_configuredName_leftUUID_leftAccessoryUUID_rightUUID_rightAccessoryUUID_builderSession_completion___block_invoke(uint64_t a1, void *a2)
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 home];
  id v6 = [v5 homeManager];

  if (v4)
  {
    BOOL v7 = 0;
  }
  else
  {
    uint64_t v8 = [*(id *)(a1 + 32) mediaSystemWithUUID:*(void *)(a1 + 40)];
    BOOL v7 = [v8 serialize];
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
  id v14 = (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];

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
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __53__HMDHomeMediaSystemHandler_mediaSystemForAccessory___block_invoke;
  v9[3] = &unk_1E6A0A830;
  id v10 = v4;
  id v6 = v4;
  BOOL v7 = objc_msgSend(v5, "na_firstObjectPassingTest:", v9);

  return v7;
}

uint64_t __53__HMDHomeMediaSystemHandler_mediaSystemForAccessory___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 accessories];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__HMDHomeMediaSystemHandler_mediaSystemForAccessory___block_invoke_2;
  v6[3] = &unk_1E6A10BD0;
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
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v33 = a4;
  id v32 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  id v18 = [v14 uuid];
  [(HMDHomeMediaSystemHandler *)self setParentUUID:v18];

  id v19 = (void *)MEMORY[0x1D9452090]();
  id v20 = self;
  id v21 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    __int16 v22 = HMFGetLogIdentifier();
    int v23 = [(HMDHomeMediaSystemHandler *)v20 mediaSystems];
    *(_DWORD *)buf = 138543874;
    __int16 v40 = v22;
    __int16 v41 = 2112;
    id v42 = v14;
    __int16 v43 = 2112;
    uint64_t v44 = v23;
    _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_INFO, "%{public}@Configuring media system controller for home: %@ media systems: %@", buf, 0x20u);
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
  v11[2] = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDHomeMediaSystemHandler *)self mediaSystems];
  uint64_t v4 = objc_msgSend(v3, "na_map:", &__block_literal_global_5);
  id v5 = objc_alloc(MEMORY[0x1E4F653F8]);
  uint64_t v6 = [(HMDHomeMediaSystemHandler *)self parentUUID];
  id v7 = (void *)[v5 initWithName:@"homeUUID" value:v6];
  v11[0] = v7;
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F653F8]) initWithName:@"mediaSystemUUIDs" value:v4];
  v11[1] = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];

  return v9;
}

uint64_t __50__HMDHomeMediaSystemHandler_attributeDescriptions__block_invoke(uint64_t a1, void *a2)
{
  return [a2 uuid];
}

- (void)notifyOfRemovedMediaSystem:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v9 = *MEMORY[0x1E4F2ED80];
  uint64_t v4 = [a3 uuid];
  id v5 = [v4 UUIDString];
  v10[0] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];

  id v7 = [(HMDHomeMediaSystemHandler *)self notificationCenter];
  uint64_t v8 = [(HMDHomeMediaSystemHandler *)self delegate];
  [v7 postNotificationName:@"HMDMediaSystemRemovedNotification" object:v8 userInfo:v6];
}

- (void)unsubscribeToSettingsForMediaSystem:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDHomeMediaSystemHandler *)self stereoPairSettingsController];

  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1D9452090]();
    id v7 = self;
    uint64_t v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = HMFGetLogIdentifier();
      int v11 = 138543618;
      uint64_t v12 = v9;
      __int16 v13 = 2112;
      id v14 = v4;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Stereo pair settings controller remove media system: %@", (uint8_t *)&v11, 0x16u);
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
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    int v14 = 138543618;
    uint64_t v15 = v8;
    __int16 v16 = 2112;
    id v17 = v4;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Removing media system: %@", (uint8_t *)&v14, 0x16u);
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
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    int v12 = 138543618;
    __int16 v13 = v8;
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Updating media system: %@", (uint8_t *)&v12, 0x16u);
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
  id v3 = objc_msgSend(v2, "na_filter:", &__block_literal_global_3_44231);

  return v3;
}

uint64_t __49__HMDHomeMediaSystemHandler_filteredMediaSystems__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isValid];
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

    uint64_t v8 = objc_msgSend(v4, "na_dictionaryWithKeyGenerator:", &__block_literal_global_44236);
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
  if (logCategory__hmf_once_t7_44246 != -1) {
    dispatch_once(&logCategory__hmf_once_t7_44246, &__block_literal_global_14_44247);
  }
  v2 = (void *)logCategory__hmf_once_v8_44248;
  return v2;
}

uint64_t __40__HMDHomeMediaSystemHandler_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v8_44248;
  logCategory__hmf_once_v8_44248 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end