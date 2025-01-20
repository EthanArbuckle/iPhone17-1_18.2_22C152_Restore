@interface HMDStereoPairSettingsController
+ (id)logCategory;
- (BOOL)_currentDevicePrimaryResident;
- (HMDCompositeSettingControllerManagerStateManager)residentRunStateManager;
- (HMDStereoPairSettingsController)initWithDataSource:(id)a3 workQueue:(id)a4;
- (HMDStereoPairSettingsController)initWithDataSource:(id)a3 workQueue:(id)a4 stateManagerFactory:(id)a5;
- (HMDStereoPairSettingsControllerDataSource)dataSource;
- (NSArray)homes;
- (NSMutableDictionary)topicToLastReceivedEvent;
- (OS_dispatch_queue)workQueue;
- (id)_groupOwnerTopicsForMediaSystem:(id)a3;
- (id)_homeUUID;
- (id)_mediaSystemGroupOwnerAccessoryUUID:(id)a3;
- (id)_mediaSystemWithAccessorryUUID:(id)a3;
- (id)_mediaSystems;
- (id)logIdentifier;
- (id)mediaSystemGroupOwner:(id)a3;
- (void)_postAsStereoPairEventsIfDifferentForHome:(id)a3 mediaSystem:(id)a4 keyPath:(id)a5 setting:(id)a6;
- (void)_processReceivedEvent:(id)a3 topic:(id)a4 home:(id)a5 mediaSystem:(id)a6;
- (void)_subscribeToAddedMediaSystem:(id)a3;
- (void)_unsubscribeToRemovedMediaSystem:(id)a3;
- (void)didReceiveCachedEvent:(id)a3 topic:(id)a4 source:(id)a5;
- (void)didReceiveEvent:(id)a3 topic:(id)a4;
- (void)didUpdateCurrentRunState:(int64_t)a3 updatedState:(int64_t)a4 forHome:(id)a5;
- (void)pushLastEvent:(id)a3 topic:(id)a4;
- (void)setDataSource:(id)a3;
- (void)setResidentRunStateManager:(id)a3;
- (void)setTopicToLastReceivedEvent:(id)a3;
- (void)startIfPrimaryResident;
- (void)stopIfPrimaryResidentChange;
- (void)subscribeToAddedMediaSystemIfPrimaryResident:(id)a3;
- (void)unsubscribeToRemovedMediaSystemIfPrimaryResident:(id)a3;
@end

@implementation HMDStereoPairSettingsController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topicToLastReceivedEvent, 0);
  objc_storeStrong((id *)&self->_residentRunStateManager, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_dataSource);
}

- (void)setTopicToLastReceivedEvent:(id)a3
{
}

- (NSMutableDictionary)topicToLastReceivedEvent
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setResidentRunStateManager:(id)a3
{
}

- (HMDCompositeSettingControllerManagerStateManager)residentRunStateManager
{
  return self->_residentRunStateManager;
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDataSource:(id)a3
{
}

- (HMDStereoPairSettingsControllerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (HMDStereoPairSettingsControllerDataSource *)WeakRetained;
}

- (void)pushLastEvent:(id)a3 topic:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HMDStereoPairSettingsController *)self topicToLastReceivedEvent];
  [v8 setObject:v7 forKeyedSubscript:v6];
}

- (void)didReceiveCachedEvent:(id)a3 topic:(id)a4 source:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)MEMORY[0x1D9452090]();
  v12 = self;
  v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = HMFGetLogIdentifier();
    int v15 = 138543874;
    v16 = v14;
    __int16 v17 = 2112;
    id v18 = v8;
    __int16 v19 = 2112;
    id v20 = v9;
    _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Process cached event: %@ topic: %@", (uint8_t *)&v15, 0x20u);
  }
  [(HMDStereoPairSettingsController *)v12 didReceiveEvent:v8 topic:v9];
}

- (void)didReceiveEvent:(id)a3 topic:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F2E7A0] decodeTopic:v7];
  id v9 = [v8 asAccessorySettingTopic];
  id v10 = v9;
  if (!v9)
  {
    id v18 = (void *)MEMORY[0x1D9452090]();
    __int16 v19 = self;
    id v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v29 = v21;
      __int16 v30 = 2112;
      id v31 = v7;
      _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse topic: %@", buf, 0x16u);
LABEL_8:
    }
LABEL_9:

    goto LABEL_10;
  }
  v11 = [v9 accessoryUUID];
  v12 = [(HMDStereoPairSettingsController *)self _mediaSystemWithAccessorryUUID:v11];

  if (!v12)
  {
    id v18 = (void *)MEMORY[0x1D9452090]();
    __int16 v19 = self;
    id v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = HMFGetLogIdentifier();
      v22 = [v10 accessoryUUID];
      *(_DWORD *)buf = 138544130;
      v29 = v21;
      __int16 v30 = 2112;
      id v31 = v6;
      __int16 v32 = 2112;
      id v33 = v7;
      __int16 v34 = 2112;
      v35 = v22;
      _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_ERROR, "%{public}@Received event: %@ topic: %@, failed to find media system with accessory: %@", buf, 0x2Au);

      goto LABEL_8;
    }
    goto LABEL_9;
  }
  v13 = [(HMDStereoPairSettingsController *)self _homeUUID];
  v14 = [v12 uuid];
  int v15 = [(HMDStereoPairSettingsController *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__HMDStereoPairSettingsController_didReceiveEvent_topic___block_invoke;
  block[3] = &unk_1E6A190C0;
  block[4] = self;
  id v24 = v6;
  id v25 = v7;
  id v26 = v13;
  id v27 = v14;
  id v16 = v14;
  id v17 = v13;
  dispatch_async(v15, block);

LABEL_10:
}

uint64_t __57__HMDStereoPairSettingsController_didReceiveEvent_topic___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    int v9 = 138543874;
    id v10 = v5;
    __int16 v11 = 2112;
    uint64_t v12 = v6;
    __int16 v13 = 2112;
    uint64_t v14 = v7;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@Process event: %@ topic: %@", (uint8_t *)&v9, 0x20u);
  }
  return [*(id *)(a1 + 32) _processReceivedEvent:*(void *)(a1 + 40) topic:*(void *)(a1 + 48) home:*(void *)(a1 + 56) mediaSystem:*(void *)(a1 + 64)];
}

- (id)_mediaSystemWithAccessorryUUID:(id)a3
{
  id v4 = a3;
  v5 = [(HMDStereoPairSettingsController *)self _mediaSystems];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __66__HMDStereoPairSettingsController__mediaSystemWithAccessorryUUID___block_invoke;
  v9[3] = &unk_1E6A086C0;
  v9[4] = self;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = objc_msgSend(v5, "na_firstObjectPassingTest:", v9);

  return v7;
}

BOOL __66__HMDStereoPairSettingsController__mediaSystemWithAccessorryUUID___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) _mediaSystemGroupOwnerAccessoryUUID:a2];
  id v4 = v3;
  BOOL v5 = v3 && ([v3 isEqual:*(void *)(a1 + 40)] & 1) != 0;

  return v5;
}

- (id)logIdentifier
{
  v2 = [(HMDStereoPairSettingsController *)self _homeUUID];
  id v3 = [v2 UUIDString];

  return v3;
}

- (void)didUpdateCurrentRunState:(int64_t)a3 updatedState:(int64_t)a4 forHome:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  int v9 = [(HMDStereoPairSettingsController *)self _homeUUID];
  if ([v9 isEqual:v8])
  {
    if (a3 != 3 || a4 == 3)
    {
      if (a3 != 3 && a4 == 3)
      {
        uint64_t v14 = (void *)MEMORY[0x1D9452090]();
        uint64_t v15 = self;
        id v16 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          id v17 = HMFGetLogIdentifier();
          int v18 = 138543362;
          __int16 v19 = v17;
          _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_DEBUG, "%{public}@State change from primary to non-primary: subscribe to the group owner", (uint8_t *)&v18, 0xCu);
        }
        [(HMDStereoPairSettingsController *)v15 startIfPrimaryResident];
      }
    }
    else
    {
      id v10 = (void *)MEMORY[0x1D9452090]();
      __int16 v11 = self;
      uint64_t v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        __int16 v13 = HMFGetLogIdentifier();
        int v18 = 138543362;
        __int16 v19 = v13;
        _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_DEBUG, "%{public}@State change from primary to non-primary: unsubscribe to the group owner", (uint8_t *)&v18, 0xCu);
      }
      [(HMDStereoPairSettingsController *)v11 stopIfPrimaryResidentChange];
    }
  }
}

- (NSArray)homes
{
  v2 = [(HMDStereoPairSettingsController *)self dataSource];
  id v3 = [v2 home];

  id v4 = [v3 homeManager];
  BOOL v5 = [v4 homes];

  return (NSArray *)v5;
}

- (id)_mediaSystems
{
  v2 = [(HMDStereoPairSettingsController *)self dataSource];
  id v3 = [v2 uuidToMediaSystems];
  id v4 = [v3 allValues];

  return v4;
}

- (BOOL)_currentDevicePrimaryResident
{
  v2 = [(HMDStereoPairSettingsController *)self dataSource];
  id v3 = [v2 home];

  LOBYTE(v2) = [v3 isCurrentDeviceConfirmedPrimaryResident];
  return (char)v2;
}

- (void)_unsubscribeToRemovedMediaSystem:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(HMDStereoPairSettingsController *)self _homeUUID];
  uint64_t v6 = [(HMDStereoPairSettingsController *)self _mediaSystemGroupOwnerAccessoryUUID:v4];
  uint64_t v7 = (void *)v6;
  if (v5 && v6)
  {
    id v8 = [(HMDStereoPairSettingsController *)self _groupOwnerTopicsForMediaSystem:v4];
    int v9 = v8;
    if (v8 && [v8 count])
    {
      id v10 = (void *)MEMORY[0x1D9452090]();
      __int16 v11 = self;
      uint64_t v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        __int16 v13 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138544130;
        id v26 = v13;
        __int16 v27 = 2112;
        id v28 = v5;
        __int16 v29 = 2112;
        __int16 v30 = v7;
        __int16 v31 = 2112;
        __int16 v32 = v9;
        _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@unsubscribing to home: %@, (owner) accessory: %@ topics: %@", buf, 0x2Au);
      }
      uint64_t v14 = [(HMDStereoPairSettingsController *)v11 dataSource];
      uint64_t v15 = [v14 localAndRemoteSubscriptionProvider];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __68__HMDStereoPairSettingsController__unsubscribeToRemovedMediaSystem___block_invoke;
      v24[3] = &unk_1E6A18CB8;
      v24[4] = v11;
      [v15 changeRegistrationsForConsumer:v11 topicFilterAdditions:MEMORY[0x1E4F1CBF0] topicFilterRemovals:v9 completion:v24];
    }
    else
    {
      uint64_t v20 = (void *)MEMORY[0x1D9452090]();
      uint64_t v21 = self;
      v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v23 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        id v26 = v23;
        __int16 v27 = 2112;
        id v28 = v5;
        __int16 v29 = 2112;
        __int16 v30 = v7;
        _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_ERROR, "%{public}@No topics for home: %@ accessory: %@", buf, 0x20u);
      }
    }
  }
  else
  {
    id v16 = (void *)MEMORY[0x1D9452090]();
    id v17 = self;
    int v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      __int16 v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v26 = v19;
      __int16 v27 = 2112;
      id v28 = v4;
      _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_ERROR, "%{public}@Media system %@ does not have an owner", buf, 0x16u);
    }
  }
}

void __68__HMDStereoPairSettingsController__unsubscribeToRemovedMediaSystem___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = (void *)MEMORY[0x1D9452090]();
    id v8 = *(id *)(a1 + 32);
    int v9 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
LABEL_5:

      goto LABEL_6;
    }
    id v10 = HMFGetLogIdentifier();
    int v12 = 138543618;
    __int16 v13 = v10;
    __int16 v14 = 2112;
    id v15 = v6;
    __int16 v11 = "%{public}@Error in unsubscribing: %@";
LABEL_4:
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v12, 0x16u);

    goto LABEL_5;
  }
  if (v5 && [v5 count])
  {
    uint64_t v7 = (void *)MEMORY[0x1D9452090]();
    id v8 = *(id *)(a1 + 32);
    int v9 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_5;
    }
    id v10 = HMFGetLogIdentifier();
    int v12 = 138543618;
    __int16 v13 = v10;
    __int16 v14 = 2112;
    id v15 = v5;
    __int16 v11 = "%{public}@Received cached events: %@ when unsubscribing all topics";
    goto LABEL_4;
  }
LABEL_6:
}

- (id)mediaSystemGroupOwner:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v30 = v4;
    [v4 components];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = [v6 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      __int16 v29 = self;
      id v9 = 0;
      uint64_t v10 = *(void *)v33;
      id obj = v6;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v33 != v10) {
            objc_enumerationMutation(obj);
          }
          int v12 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          if (!v12)
          {
            __int16 v19 = (void *)MEMORY[0x1D9452090]();
            uint64_t v20 = v29;
            uint64_t v21 = HMFGetOSLogHandle();
            id v5 = v30;
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              v22 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              v38 = v22;
              __int16 v39 = 2112;
              id v40 = v30;
              _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_ERROR, "%{public}@Component is nil for media system %@", buf, 0x16u);
            }
            id v6 = obj;

            v23 = 0;
            goto LABEL_22;
          }
          if (!v9) {
            goto LABEL_10;
          }
          __int16 v13 = [v9 accessory];
          __int16 v14 = [v13 serialNumber];
          id v15 = [v12 accessory];
          uint64_t v16 = [v15 serialNumber];
          uint64_t v17 = [v14 compare:v16];

          if (v17 == 1)
          {
LABEL_10:
            id v18 = v12;

            id v9 = v18;
          }
        }
        id v6 = obj;
        uint64_t v8 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
    else
    {
      id v9 = 0;
    }

    id v9 = v9;
    v23 = v9;
    id v5 = v30;
LABEL_22:
  }
  else
  {
    id v24 = (void *)MEMORY[0x1D9452090]();
    id v25 = self;
    id v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      __int16 v27 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v38 = v27;
      __int16 v39 = 2112;
      id v40 = 0;
      _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_ERROR, "%{public}@Ask to compute owner for media system: %@", buf, 0x16u);
    }
    v23 = 0;
  }

  return v23;
}

- (id)_mediaSystemGroupOwnerAccessoryUUID:(id)a3
{
  id v3 = [(HMDStereoPairSettingsController *)self mediaSystemGroupOwner:a3];
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 accessory];
    id v6 = [v5 uuid];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)_homeUUID
{
  v2 = [(HMDStereoPairSettingsController *)self dataSource];
  id v3 = [v2 home];

  id v4 = [v3 uuid];

  return v4;
}

- (void)_postAsStereoPairEventsIfDifferentForHome:(id)a3 mediaSystem:(id)a4 keyPath:(id)a5 setting:(id)a6
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v47 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v46 = [(HMDStereoPairSettingsController *)self dataSource];
  __int16 v13 = [(HMDStereoPairSettingsController *)self workQueue];
  dispatch_assert_queue_V2(v13);

  __int16 v14 = (void *)MEMORY[0x1D9452090]();
  id v15 = self;
  uint64_t v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v18 = id v17 = v12;
    *(_DWORD *)buf = 138543874;
    v50 = v18;
    __int16 v51 = 2112;
    id v52 = v10;
    __int16 v53 = 2112;
    id v54 = v11;
    _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_INFO, "%{public}@Forward media system %@ keypath: %@", buf, 0x20u);

    id v12 = v17;
  }

  uint64_t v19 = [v10 UUIDString];
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  v45 = (void *)v19;
  uint64_t v44 = [objc_alloc(MEMORY[0x1E4F2E858]) initWithSetting:v12 eventSource:v19 eventTimestamp:v20];
  uint64_t v21 = HMImmutableSettingChangeEventTopicFromMediaSystem();
  v22 = v46;
  v23 = [v46 eventStoreReadHandle];
  id v24 = [v23 lastEventForTopic:v21];
  if (!v24)
  {
    id v25 = 0;
    goto LABEL_15;
  }
  id v48 = 0;
  id v25 = [MEMORY[0x1E4F2E858] decodeSettingFromEvent:v24 error:&v48];
  id v26 = v48;
  if (v26)
  {
    id v40 = v12;
    id v42 = v11;
    __int16 v27 = (void *)MEMORY[0x1D9452090]();
    id v28 = v15;
    __int16 v29 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      id v30 = v39 = v27;
      *(_DWORD *)buf = 138543874;
      v50 = v30;
      __int16 v51 = 2112;
      id v52 = v21;
      __int16 v53 = 2112;
      id v54 = v26;
      _os_log_impl(&dword_1D49D5000, v29, OS_LOG_TYPE_ERROR, "%{public}@Error reading stored setting for topic %@, error: %@", buf, 0x20u);

      __int16 v27 = v39;
    }

    id v12 = v40;
    id v11 = v42;
  }

  if (!v25 || ![v25 isEqual:v12])
  {
    v22 = v46;
LABEL_15:
    v38 = objc_msgSend(v22, "eventForwarder", v39);
    v37 = (void *)v44;
    [v38 forwardEvent:v44 topic:v21 completion:&__block_literal_global_14];

    goto LABEL_16;
  }
  __int16 v31 = v12;
  long long v32 = (void *)MEMORY[0x1D9452090]();
  long long v33 = v15;
  long long v34 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    long long v35 = v43 = v11;
    [v31 keyPath];
    uint64_t v36 = v41 = v32;
    *(_DWORD *)buf = 138543618;
    v50 = v35;
    __int16 v51 = 2114;
    id v52 = v36;
    _os_log_impl(&dword_1D49D5000, v34, OS_LOG_TYPE_INFO, "%{public}@Skip sending event for keyPath: %{public}@ as it matches stored", buf, 0x16u);

    long long v32 = v41;
    id v11 = v43;
  }

  id v12 = v31;
  v22 = v46;
  v37 = (void *)v44;
LABEL_16:
}

- (void)_processReceivedEvent:(id)a3 topic:(id)a4 home:(id)a5 mediaSystem:(id)a6
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  __int16 v14 = [(HMDStereoPairSettingsController *)self workQueue];
  dispatch_assert_queue_V2(v14);

  id v15 = +[HMDLegacyAccessorySettingsAdaptor parsedBoolSettingEvent:v10 topic:v11];
  uint64_t v16 = v15;
  if (v15)
  {
    id v17 = [v15 keyPath];
    [(HMDStereoPairSettingsController *)self _postAsStereoPairEventsIfDifferentForHome:v12 mediaSystem:v13 keyPath:v17 setting:v16];
  }
  else
  {
    id v18 = +[HMDLegacyAccessorySettingsAdaptor parsedIntegerSettingEvent:v10 topic:v11];
    id v17 = v18;
    if (v18)
    {
      uint64_t v19 = [v18 keyPath];
      [(HMDStereoPairSettingsController *)self _postAsStereoPairEventsIfDifferentForHome:v12 mediaSystem:v13 keyPath:v19 setting:v17];
    }
    else
    {
      double v20 = +[HMDLegacyAccessorySettingsAdaptor parsedLanguageSetting:v10 topic:v11];
      uint64_t v19 = v20;
      if (v20)
      {
        uint64_t v21 = [v20 keyPath];
        [(HMDStereoPairSettingsController *)self _postAsStereoPairEventsIfDifferentForHome:v12 mediaSystem:v13 keyPath:v21 setting:v19];
      }
      else
      {
        v22 = +[HMDLegacyAccessorySettingsAdaptor parsedLanguageListSetting:v10 topic:v11];
        context = (void *)MEMORY[0x1D9452090]();
        v23 = self;
        id v24 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          id v25 = v34 = v22;
          *(_DWORD *)buf = 138543618;
          uint64_t v36 = v25;
          __int16 v37 = 2112;
          id v38 = v34;
          _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_DEBUG, "%{public}@Language List:%@", buf, 0x16u);

          v22 = v34;
        }

        id v26 = v22;
        if (v22)
        {
          __int16 v27 = [v22 keyPath];
          [(HMDStereoPairSettingsController *)v23 _postAsStereoPairEventsIfDifferentForHome:v12 mediaSystem:v13 keyPath:v27 setting:v26];
        }
        else
        {
          id v28 = (void *)MEMORY[0x1D9452090]();
          __int16 v29 = v23;
          id v30 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            __int16 v31 = contexta = v28;
            *(_DWORD *)buf = 138543874;
            uint64_t v36 = v31;
            __int16 v37 = 2112;
            id v38 = v10;
            __int16 v39 = 2112;
            id v40 = v11;
            _os_log_impl(&dword_1D49D5000, v30, OS_LOG_TYPE_ERROR, "%{public}@Received unknown event type: %@ topic: %@", buf, 0x20u);

            id v28 = contexta;
          }

          id v26 = 0;
        }
      }
    }
  }
}

- (void)_subscribeToAddedMediaSystem:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDStereoPairSettingsController *)self _homeUUID];
  uint64_t v6 = [(HMDStereoPairSettingsController *)self _mediaSystemGroupOwnerAccessoryUUID:v4];
  uint64_t v7 = (void *)v6;
  if (v5 && v6)
  {
    uint64_t v8 = [(HMDStereoPairSettingsController *)self _groupOwnerTopicsForMediaSystem:v4];
    id v9 = v8;
    if (v8 && [v8 count])
    {
      id v10 = (void *)MEMORY[0x1D9452090]();
      id v11 = self;
      id v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        id v13 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138544130;
        id v30 = v13;
        __int16 v31 = 2112;
        id v32 = v5;
        __int16 v33 = 2112;
        long long v34 = v7;
        __int16 v35 = 2112;
        uint64_t v36 = v9;
        _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@Subscribing to home: %@, (owner) accessory: %@ topics: %@", buf, 0x2Au);
      }
      __int16 v14 = [(HMDStereoPairSettingsController *)v11 dataSource];
      id v15 = [v14 localAndRemoteSubscriptionProvider];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __64__HMDStereoPairSettingsController__subscribeToAddedMediaSystem___block_invoke;
      v24[3] = &unk_1E6A0CC08;
      v24[4] = v11;
      id v25 = v9;
      id v26 = v7;
      id v27 = v5;
      id v28 = v4;
      [v15 changeRegistrationsForConsumer:v11 topicFilterAdditions:v25 topicFilterRemovals:MEMORY[0x1E4F1CBF0] completion:v24];
    }
    else
    {
      double v20 = (void *)MEMORY[0x1D9452090]();
      uint64_t v21 = self;
      v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v23 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        id v30 = v23;
        __int16 v31 = 2112;
        id v32 = v5;
        __int16 v33 = 2112;
        long long v34 = v7;
        _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_ERROR, "%{public}@No topics for home: %@ accessory: %@", buf, 0x20u);
      }
    }
  }
  else
  {
    uint64_t v16 = (void *)MEMORY[0x1D9452090]();
    id v17 = self;
    id v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v30 = v19;
      __int16 v31 = 2112;
      id v32 = v4;
      _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_ERROR, "%{public}@Media system %@ does not have an owner", buf, 0x16u);
    }
  }
}

void __64__HMDStereoPairSettingsController__subscribeToAddedMediaSystem___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (void *)MEMORY[0x1D9452090]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  id v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      uint64_t v12 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      id v24 = v11;
      __int16 v25 = 2112;
      uint64_t v26 = v12;
      __int16 v27 = 2112;
      id v28 = v6;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@Error in subscribing to topics %@ error: %@", buf, 0x20u);
    }
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v13 = HMFGetLogIdentifier();
      uint64_t v14 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138543618;
      id v24 = v13;
      __int16 v25 = 2112;
      uint64_t v26 = v14;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Successfully subscribed to (owner) accessory: %@", buf, 0x16u);
    }
    id v15 = [*(id *)(a1 + 32) workQueue];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __64__HMDStereoPairSettingsController__subscribeToAddedMediaSystem___block_invoke_7;
    v18[3] = &unk_1E6A18668;
    id v16 = v5;
    uint64_t v17 = *(void *)(a1 + 32);
    id v19 = v16;
    uint64_t v20 = v17;
    id v21 = *(id *)(a1 + 56);
    id v22 = *(id *)(a1 + 64);
    dispatch_async(v15, v18);
  }
}

void __64__HMDStereoPairSettingsController__subscribeToAddedMediaSystem___block_invoke_7(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v2 = [obj countByEnumeratingWithState:&v18 objects:v28 count:16];
  if (v2)
  {
    uint64_t v4 = v2;
    uint64_t v5 = *(void *)v19;
    *(void *)&long long v3 = 138543874;
    long long v16 = v3;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v19 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        id v8 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v7, v16);
        id v9 = (void *)MEMORY[0x1D9452090]();
        id v10 = *(id *)(a1 + 40);
        id v11 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          uint64_t v12 = HMFGetLogIdentifier();
          *(_DWORD *)buf = v16;
          v23 = v12;
          __int16 v24 = 2112;
          __int16 v25 = v8;
          __int16 v26 = 2112;
          uint64_t v27 = v7;
          _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Process cached event: %@ topic: %@", buf, 0x20u);
        }
        id v13 = *(void **)(a1 + 40);
        uint64_t v14 = *(void *)(a1 + 48);
        id v15 = [*(id *)(a1 + 56) uuid];
        [v13 _processReceivedEvent:v8 topic:v7 home:v14 mediaSystem:v15];
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v18 objects:v28 count:16];
    }
    while (v4);
  }
}

- (id)_groupOwnerTopicsForMediaSystem:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HMDStereoPairSettingsController *)self _homeUUID];
  uint64_t v6 = [(HMDStereoPairSettingsController *)self _mediaSystemGroupOwnerAccessoryUUID:v4];
  uint64_t v7 = (void *)v6;
  if (v5 && v6)
  {
    id v8 = [MEMORY[0x1E4F2E5F8] defaultSettingsAllKeyPaths];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __67__HMDStereoPairSettingsController__groupOwnerTopicsForMediaSystem___block_invoke;
    v26[3] = &unk_1E6A18CE0;
    id v9 = v5;
    id v27 = v9;
    id v10 = v7;
    id v28 = v10;
    id v11 = objc_msgSend(v8, "na_map:", v26);

    uint64_t v12 = [MEMORY[0x1E4F2E5F8] languageKeyPaths];
    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    id v22 = __67__HMDStereoPairSettingsController__groupOwnerTopicsForMediaSystem___block_invoke_2;
    v23 = &unk_1E6A18CE0;
    id v24 = v9;
    id v25 = v10;
    id v13 = objc_msgSend(v12, "na_map:", &v20);
    uint64_t v14 = objc_msgSend(v13, "arrayByAddingObjectsFromArray:", v11, v20, v21, v22, v23);
  }
  else
  {
    id v15 = (void *)MEMORY[0x1D9452090]();
    long long v16 = self;
    uint64_t v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      long long v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v30 = v18;
      __int16 v31 = 2112;
      id v32 = v4;
      _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_ERROR, "%{public}@Media system %@ does not have an owner", buf, 0x16u);
    }
    uint64_t v14 = 0;
  }

  return v14;
}

void __67__HMDStereoPairSettingsController__groupOwnerTopicsForMediaSystem___block_invoke()
{
}

void __67__HMDStereoPairSettingsController__groupOwnerTopicsForMediaSystem___block_invoke_2()
{
}

- (void)stopIfPrimaryResidentChange
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(HMDStereoPairSettingsController *)self _currentDevicePrimaryResident];
  id v4 = (void *)MEMORY[0x1D9452090]();
  uint64_t v5 = self;
  uint64_t v6 = HMFGetOSLogHandle();
  uint64_t v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v8 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v25 = v8;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_ERROR, "%{public}@Ask to stop subscription on primary resident", buf, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v25 = v9;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Primary resident changed and unsubscribe all", buf, 0xCu);
    }
    id v10 = [(HMDStereoPairSettingsController *)v5 dataSource];
    id v11 = [v10 uuidToMediaSystems];
    uint64_t v12 = [v11 allValues];

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v13 = v12;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v20;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v20 != v16) {
            objc_enumerationMutation(v13);
          }
          -[HMDStereoPairSettingsController _unsubscribeToRemovedMediaSystem:](v5, "_unsubscribeToRemovedMediaSystem:", *(void *)(*((void *)&v19 + 1) + 8 * v17++), (void)v19);
        }
        while (v15 != v17);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v15);
    }

    long long v18 = [(HMDStereoPairSettingsController *)v5 topicToLastReceivedEvent];
    [v18 removeAllObjects];
  }
}

- (void)unsubscribeToRemovedMediaSystemIfPrimaryResident:(id)a3
{
  id v4 = a3;
  if ([(HMDStereoPairSettingsController *)self _currentDevicePrimaryResident]) {
    [(HMDStereoPairSettingsController *)self _unsubscribeToRemovedMediaSystem:v4];
  }
}

- (void)subscribeToAddedMediaSystemIfPrimaryResident:(id)a3
{
  id v4 = a3;
  if ([(HMDStereoPairSettingsController *)self _currentDevicePrimaryResident]) {
    [(HMDStereoPairSettingsController *)self _subscribeToAddedMediaSystem:v4];
  }
}

- (void)startIfPrimaryResident
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if ([(HMDStereoPairSettingsController *)self _currentDevicePrimaryResident])
  {
    BOOL v3 = (void *)MEMORY[0x1D9452090]();
    id v4 = self;
    uint64_t v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = HMFGetLogIdentifier();
      uint64_t v7 = [(HMDStereoPairSettingsController *)v4 dataSource];
      id v8 = [v7 home];
      *(_DWORD *)buf = 138543618;
      v23 = v6;
      __int16 v24 = 2112;
      id v25 = v8;
      _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Current device for home %@ is primary resident", buf, 0x16u);
    }
    id v9 = [(HMDStereoPairSettingsController *)v4 dataSource];
    id v10 = [v9 uuidToMediaSystems];
    id v11 = [v10 allValues];

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v12 = v11;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v18;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v18 != v15) {
            objc_enumerationMutation(v12);
          }
          -[HMDStereoPairSettingsController _subscribeToAddedMediaSystem:](v4, "_subscribeToAddedMediaSystem:", *(void *)(*((void *)&v17 + 1) + 8 * v16++), (void)v17);
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v14);
    }
  }
}

- (HMDStereoPairSettingsController)initWithDataSource:(id)a3 workQueue:(id)a4
{
  return [(HMDStereoPairSettingsController *)self initWithDataSource:a3 workQueue:a4 stateManagerFactory:0];
}

- (HMDStereoPairSettingsController)initWithDataSource:(id)a3 workQueue:(id)a4 stateManagerFactory:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  v24.receiver = self;
  v24.super_class = (Class)HMDStereoPairSettingsController;
  id v11 = [(HMDStereoPairSettingsController *)&v24 init];
  id v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_dataSource, v8);
    objc_storeStrong((id *)&v12->_workQueue, a4);
    uint64_t v13 = [v8 home];
    uint64_t v14 = v13;
    if (v10)
    {
      uint64_t v15 = [v13 uuid];
      uint64_t v16 = v10[2](v10, v15);
      residentRunStateManager = v12->_residentRunStateManager;
      v12->_residentRunStateManager = (HMDCompositeSettingControllerManagerStateManager *)v16;
    }
    else
    {
      long long v18 = [HMDStereoPairSettingsControllerStateManager alloc];
      uint64_t v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
      residentRunStateManager = [v14 uuid];
      uint64_t v19 = [(HMDCompositeSettingControllerManagerStateManager *)v18 initWithDataSource:v12 notificationRegistrationProvider:v15 subscribeWithOptions:1 delegate:v12 uuid:residentRunStateManager];
      long long v20 = v12->_residentRunStateManager;
      v12->_residentRunStateManager = (HMDCompositeSettingControllerManagerStateManager *)v19;
    }
    uint64_t v21 = [MEMORY[0x1E4F1CA60] dictionary];
    topicToLastReceivedEvent = v12->_topicToLastReceivedEvent;
    v12->_topicToLastReceivedEvent = (NSMutableDictionary *)v21;
  }
  return v12;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t26_22574 != -1) {
    dispatch_once(&logCategory__hmf_once_t26_22574, &__block_literal_global_16_22575);
  }
  uint64_t v2 = (void *)logCategory__hmf_once_v27_22576;
  return v2;
}

uint64_t __46__HMDStereoPairSettingsController_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v27_22576;
  logCategory__hmf_once_v27_22576 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end