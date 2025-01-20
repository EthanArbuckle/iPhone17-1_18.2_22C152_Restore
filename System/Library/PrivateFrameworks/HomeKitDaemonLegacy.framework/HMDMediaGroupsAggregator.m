@interface HMDMediaGroupsAggregator
+ (id)logCategory;
- (BOOL)isRunning;
- (BOOL)isRunningAsPrimary;
- (BOOL)removeDestinationControllerDataWithParentIdentifier:(id)a3;
- (BOOL)removeDestinationWithParentIdentifier:(id)a3;
- (BOOL)setState:(unint64_t)a3;
- (BOOL)setState:(unint64_t)a3 previousState:(unint64_t *)a4;
- (BOOL)shouldWarmUp;
- (BOOL)updateAssociatedGroupIdentifier:(id)a3 forGroupIdentifier:(id)a4 error:(id *)a5;
- (HMDFeaturesDataSource)featuresDataSource;
- (HMDMediaGroupsAggregateData)aggregateData;
- (HMDMediaGroupsAggregator)initWithIdentifier:(id)a3 messenger:(id)a4 eventForwarder:(id)a5 subscriptionProvider:(id)a6 eventStoreReadHandle:(id)a7 groupsLocalDataStorage:(id)a8;
- (HMDMediaGroupsAggregator)initWithIdentifier:(id)a3 messenger:(id)a4 eventForwarder:(id)a5 subscriptionProvider:(id)a6 eventStoreReadHandle:(id)a7 groupsLocalDataStorage:(id)a8 timerProvider:(id)a9 featuresDataSource:(id)a10;
- (HMDMediaGroupsAggregatorDataSource)dataSource;
- (HMDMediaGroupsAggregatorDelegate)delegate;
- (HMDMediaGroupsAggregatorMessenger)messenger;
- (HMDMediaGroupsLocalDataStorage)groupLocalDataStorage;
- (HMDTimerProvider)timerProvider;
- (HMEEventForwarder)eventForwarder;
- (HMELastEventStoreReadHandle)eventStoreReadHandle;
- (HMESubscriptionProviding)subscriptionProvider;
- (HMFTimer)warmUpTimer;
- (NSArray)generators;
- (NSUUID)identifier;
- (id)aggregateDataTopic;
- (id)appleMediaAccessories;
- (id)createGenerators;
- (id)destinationControllersData;
- (id)destinationManagerWithIdentifier:(id)a3;
- (id)destinations;
- (id)eventSource;
- (id)groups;
- (id)localGroupWithIdentifier:(id)a3;
- (id)logIdentifier;
- (id)participantAccessoryUUIDFromTopic:(id)a3;
- (id)participantDataTopicForAccessory:(id)a3;
- (id)roomForAllDestinationParentIdentifiers:(id)a3 mediaSystemsAggregateDataGenerator:(id)a4;
- (id)timerWithTimeInterval:(double)a3 options:(unint64_t)a4;
- (void)clearCachedData;
- (void)clearCachedDataForParticipantAccessoryUUID:(id)a3;
- (void)configureWithHome:(id)a3 messageDispatcher:(id)a4 notificationCenter:(id)a5 primaryResidentChangeMonitor:(id)a6;
- (void)didReceiveEvent:(id)a3 topic:(id)a4;
- (void)didReceiveUpdateAssociatedGroupRequestMessage:(id)a3 withGroupIdentifier:(id)a4 associatedGroupIdentifier:(id)a5 messenger:(id)a6;
- (void)fixupGroupsForRemovedParticipantAccessoryUUID:(id)a3;
- (void)forwardAggregateData;
- (void)handleAccessoryChangedRoomNotification:(id)a3;
- (void)handleHomeAddedAccessoryNotification:(id)a3;
- (void)handleHomeRemovedAccessoryNotification:(id)a3;
- (void)handleIncomingParticipantData:(id)a3 forAccessoryUUID:(id)a4;
- (void)handleMediaSystemAddedNotification:(id)a3;
- (void)handleParticipantDataEvent:(id)a3 accessoryUUID:(id)a4;
- (void)handleParticipantDestination:(id)a3 backedUpGroups:(id)a4 forParticipantAccessoryUUID:(id)a5;
- (void)handlePrimaryResidentDeviceChangeNotification:(id)a3;
- (void)notifyOfStoppedState;
- (void)refreshAggregateData;
- (void)refreshRunningStateUsingPrimaryResidentChangeMonitor:(id)a3;
- (void)registerForEvents;
- (void)registerForEventsForAccessory:(id)a3;
- (void)registerForNotificationsWithHome:(id)a3 notificationCenter:(id)a4 primaryResidentChangeMonitor:(id)a5;
- (void)removeGroupWithIdentifier:(id)a3;
- (void)runAsPrimary;
- (void)setAggregateData:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDestination:(id)a3;
- (void)setDestinationControllerData:(id)a3;
- (void)setTimerProvider:(id)a3;
- (void)setWarmUpTimer:(id)a3;
- (void)startWarmUpTimer;
- (void)stop;
- (void)stopWarmUpTimer;
- (void)timerDidFire:(id)a3;
- (void)unregisterForAllEvents;
- (void)unregisterForEventsForAccessory:(id)a3;
- (void)updateDestinationWithIdentifier:(id)a3 audioGroupIdentifier:(id)a4;
- (void)updateGroup:(id)a3;
- (void)updateGroup:(id)a3 participantAccessoryUUIDs:(id)a4;
@end

@implementation HMDMediaGroupsAggregator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_generators, 0);
  objc_storeStrong((id *)&self->_aggregateData, 0);
  objc_storeStrong((id *)&self->_warmUpTimer, 0);
  objc_storeStrong((id *)&self->_featuresDataSource, 0);
  objc_storeStrong((id *)&self->_groupLocalDataStorage, 0);
  objc_storeStrong((id *)&self->_eventStoreReadHandle, 0);
  objc_storeStrong((id *)&self->_subscriptionProvider, 0);
  objc_storeStrong((id *)&self->_eventForwarder, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_timerProvider);
  objc_storeStrong((id *)&self->_messenger, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_destinationControllersData, 0);
  objc_storeStrong((id *)&self->_destinations, 0);
}

- (NSArray)generators
{
  return (NSArray *)objc_getProperty(self, a2, 136, 1);
}

- (void)setAggregateData:(id)a3
{
}

- (HMDMediaGroupsAggregateData)aggregateData
{
  return (HMDMediaGroupsAggregateData *)objc_getProperty(self, a2, 128, 1);
}

- (void)setWarmUpTimer:(id)a3
{
}

- (HMFTimer)warmUpTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 120, 1);
}

- (HMDFeaturesDataSource)featuresDataSource
{
  return (HMDFeaturesDataSource *)objc_getProperty(self, a2, 112, 1);
}

- (HMDMediaGroupsLocalDataStorage)groupLocalDataStorage
{
  return (HMDMediaGroupsLocalDataStorage *)objc_getProperty(self, a2, 104, 1);
}

- (HMELastEventStoreReadHandle)eventStoreReadHandle
{
  return (HMELastEventStoreReadHandle *)objc_getProperty(self, a2, 96, 1);
}

- (HMESubscriptionProviding)subscriptionProvider
{
  return (HMESubscriptionProviding *)objc_getProperty(self, a2, 88, 1);
}

- (HMEEventForwarder)eventForwarder
{
  return (HMEEventForwarder *)objc_getProperty(self, a2, 80, 1);
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 72, 1);
}

- (void)setTimerProvider:(id)a3
{
}

- (HMDTimerProvider)timerProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_timerProvider);
  return (HMDTimerProvider *)WeakRetained;
}

- (HMDMediaGroupsAggregatorMessenger)messenger
{
  return (HMDMediaGroupsAggregatorMessenger *)objc_getProperty(self, a2, 56, 1);
}

- (void)setDelegate:(id)a3
{
}

- (HMDMediaGroupsAggregatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDMediaGroupsAggregatorDelegate *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (HMDMediaGroupsAggregatorDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (HMDMediaGroupsAggregatorDataSource *)WeakRetained;
}

- (id)logIdentifier
{
  v2 = [(HMDMediaGroupsAggregator *)self identifier];
  v3 = [v2 UUIDString];

  return v3;
}

- (void)timerDidFire:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDMediaGroupsAggregator *)self warmUpTimer];

  v6 = (void *)MEMORY[0x1D9452090]();
  v7 = self;
  v8 = HMFGetOSLogHandle();
  v9 = v8;
  if (v5 == v4)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v11 = HMFGetLogIdentifier();
      int v12 = 138543362;
      v13 = v11;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Warm up timer fired", (uint8_t *)&v12, 0xCu);
    }
    [(HMDMediaGroupsAggregator *)v7 setWarmUpTimer:0];
    [(HMDMediaGroupsAggregator *)v7 forwardAggregateData];
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v10 = HMFGetLogIdentifier();
      int v12 = 138543362;
      v13 = v10;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Skipping warmUp debounce refresh due to miss matched timer when fired", (uint8_t *)&v12, 0xCu);
    }
  }
}

- (id)timerWithTimeInterval:(double)a3 options:(unint64_t)a4
{
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F65580]) initWithTimeInterval:a4 options:a3];
  return v4;
}

- (id)roomForAllDestinationParentIdentifiers:(id)a3 mediaSystemsAggregateDataGenerator:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [(HMDMediaGroupsAggregator *)self dataSource];
  v9 = v8;
  if (v8)
  {
    v10 = [v8 roomForAllDestinationParentIdentifiers:v6 mediaGroupsAggregator:self];
  }
  else
  {
    v11 = (void *)MEMORY[0x1D9452090]();
    int v12 = self;
    v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = HMFGetLogIdentifier();
      int v16 = 138543618;
      v17 = v14;
      __int16 v18 = 2112;
      id v19 = v6;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to get room name for destination parent identifiers: %@ due to no data source", (uint8_t *)&v16, 0x16u);
    }
    v10 = 0;
  }

  return v10;
}

- (void)didReceiveUpdateAssociatedGroupRequestMessage:(id)a3 withGroupIdentifier:(id)a4 associatedGroupIdentifier:(id)a5 messenger:(id)a6
{
  id v11 = 0;
  id v9 = a3;
  [(HMDMediaGroupsAggregator *)self updateAssociatedGroupIdentifier:a5 forGroupIdentifier:a4 error:&v11];
  id v10 = v11;
  [v9 respondWithPayload:0 error:v10];
}

- (void)handleParticipantDestination:(id)a3 backedUpGroups:(id)a4 forParticipantAccessoryUUID:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  [(HMDMediaGroupsAggregator *)self setDestination:v10];
  id v12 = [(HMDMediaGroupsAggregator *)self groupLocalDataStorage];
  id v11 = [v10 audioGroupIdentifier];

  [v12 updateUsingParticipantAccessoryUUID:v8 associatedGroupIdentifier:v11 backedUpGroupData:v9];
}

- (void)removeGroupWithIdentifier:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v11 = 138543618;
    id v12 = v8;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Removing group with identifier: %@", (uint8_t *)&v11, 0x16u);
  }
  id v9 = [(HMDMediaGroupsAggregator *)v6 groupLocalDataStorage];
  [v9 removeGroupWithIdentifier:v4];

  [(HMDMediaGroupsAggregator *)v6 refreshAggregateData];
  id v10 = [(HMDMediaGroupsAggregator *)v6 groupLocalDataStorage];
  [v10 backupData];
}

- (void)updateGroup:(id)a3 participantAccessoryUUIDs:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1D9452090]();
  id v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v11 = HMFGetLogIdentifier();
    int v14 = 138543874;
    uint64_t v15 = v11;
    __int16 v16 = 2112;
    id v17 = v6;
    __int16 v18 = 2112;
    id v19 = v7;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Updating group: %@ for participant accessory uuids: %@", (uint8_t *)&v14, 0x20u);
  }
  id v12 = [(HMDMediaGroupsAggregator *)v9 groupLocalDataStorage];
  [v12 updateGroup:v6 participantAccessoryUUIDs:v7];

  [(HMDMediaGroupsAggregator *)v9 refreshAggregateData];
  __int16 v13 = [(HMDMediaGroupsAggregator *)v9 groupLocalDataStorage];
  [v13 backupData];
}

- (void)updateGroup:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v11 = 138543618;
    id v12 = v8;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Updating group: %@", (uint8_t *)&v11, 0x16u);
  }
  id v9 = [(HMDMediaGroupsAggregator *)v6 groupLocalDataStorage];
  [v9 updateGroup:v4];

  [(HMDMediaGroupsAggregator *)v6 refreshAggregateData];
  id v10 = [(HMDMediaGroupsAggregator *)v6 groupLocalDataStorage];
  [v10 backupData];
}

- (BOOL)updateAssociatedGroupIdentifier:(id)a3 forGroupIdentifier:(id)a4 error:(id *)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)MEMORY[0x1D9452090]();
  int v11 = self;
  id v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    __int16 v13 = HMFGetLogIdentifier();
    int v24 = 138543874;
    v25 = v13;
    __int16 v26 = 2112;
    id v27 = v8;
    __int16 v28 = 2112;
    id v29 = v9;
    _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@Updating associated group identifier: %@ for group identifier: %@", (uint8_t *)&v24, 0x20u);
  }
  id v14 = [(HMDMediaGroupsAggregator *)v11 localGroupWithIdentifier:v9];
  uint64_t v15 = v14;
  if (v14)
  {
    __int16 v16 = (void *)[v14 mutableCopy];
    [v16 setAssociatedGroupIdentifier:v8];
    id v17 = [(HMDMediaGroupsAggregator *)v11 groupLocalDataStorage];
    [v17 updateGroup:v16];

    [(HMDMediaGroupsAggregator *)v11 refreshAggregateData];
    __int16 v18 = [(HMDMediaGroupsAggregator *)v11 groupLocalDataStorage];
    [v18 backupData];
  }
  else
  {
    id v19 = (void *)MEMORY[0x1D9452090]();
    uint64_t v20 = v11;
    v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = HMFGetLogIdentifier();
      int v24 = 138543618;
      v25 = v22;
      __int16 v26 = 2112;
      id v27 = v9;
      _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to find an local group with identifier: %@", (uint8_t *)&v24, 0x16u);
    }
    if (a5)
    {
      *a5 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:2];
    }
  }

  return v15 != 0;
}

- (void)handleIncomingParticipantData:(id)a3 forAccessoryUUID:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  id v7 = [v12 destinationControllerData];

  if (v7)
  {
    id v8 = [v12 destinationControllerData];
    [(HMDMediaGroupsAggregator *)self setDestinationControllerData:v8];
  }
  id v9 = [v12 destination];

  if (v9)
  {
    id v10 = [v12 destination];
    int v11 = [v12 backedUpGroups];
    [(HMDMediaGroupsAggregator *)self handleParticipantDestination:v10 backedUpGroups:v11 forParticipantAccessoryUUID:v6];
  }
  [(HMDMediaGroupsAggregator *)self refreshAggregateData];
}

- (void)handleParticipantDataEvent:(id)a3 accessoryUUID:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [HMDMediaGroupsParticipantData alloc];
  id v9 = [v6 encodedData];
  id v10 = [(HMDMediaGroupsParticipantData *)v8 initWithProtoBufferData:v9];

  if (v10)
  {
    [(HMDMediaGroupsAggregator *)self handleIncomingParticipantData:v10 forAccessoryUUID:v7];
  }
  else
  {
    int v11 = (void *)MEMORY[0x1D9452090]();
    id v12 = self;
    __int16 v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = HMFGetLogIdentifier();
      int v15 = 138543618;
      __int16 v16 = v14;
      __int16 v17 = 2112;
      id v18 = v6;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to deserialize participant event data from event: %@", (uint8_t *)&v15, 0x16u);
    }
  }
}

- (id)participantAccessoryUUIDFromTopic:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F2E7A0] decodeTopic:v4];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 asAccessoryTopic];
    id v8 = v7;
    if (v7)
    {
      uint64_t v9 = [v7 accessoryEventTopicSuffixID];
      if (v9 == *MEMORY[0x1E4F2C380])
      {
        id v10 = [v8 accessoryUUID];
LABEL_14:

        goto LABEL_15;
      }
      int v15 = (void *)MEMORY[0x1D9452090]();
      __int16 v16 = self;
      __int16 v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        id v18 = HMFGetLogIdentifier();
        uint64_t v19 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v8, "accessoryEventTopicSuffixID"));
        int v21 = 138543874;
        v22 = v18;
        __int16 v23 = 2112;
        id v24 = v19;
        __int16 v25 = 2112;
        __int16 v26 = v6;
        _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_ERROR, "%{public}@Received unexpected topic id: %@ topic: %@", (uint8_t *)&v21, 0x20u);

        goto LABEL_12;
      }
    }
    else
    {
      int v15 = (void *)MEMORY[0x1D9452090]();
      __int16 v16 = self;
      __int16 v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        id v18 = HMFGetLogIdentifier();
        int v21 = 138543618;
        v22 = v18;
        __int16 v23 = 2112;
        id v24 = v6;
        _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to convert to parsed accessory topic using topic: %@", (uint8_t *)&v21, 0x16u);
LABEL_12:
      }
    }

    id v10 = 0;
    goto LABEL_14;
  }
  int v11 = (void *)MEMORY[0x1D9452090]();
  id v12 = self;
  __int16 v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    id v14 = HMFGetLogIdentifier();
    int v21 = 138543618;
    v22 = v14;
    __int16 v23 = 2112;
    id v24 = v4;
    _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse topic: %@", (uint8_t *)&v21, 0x16u);
  }
  id v10 = 0;
LABEL_15:

  return v10;
}

- (void)didReceiveEvent:(id)a3 topic:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1D9452090]();
  uint64_t v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v11 = HMFGetLogIdentifier();
    int v17 = 138543874;
    id v18 = v11;
    __int16 v19 = 2112;
    id v20 = v7;
    __int16 v21 = 2112;
    id v22 = v6;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Received topic: %@ event: %@", (uint8_t *)&v17, 0x20u);
  }
  id v12 = [(HMDMediaGroupsAggregator *)v9 participantAccessoryUUIDFromTopic:v7];
  if (v12)
  {
    [(HMDMediaGroupsAggregator *)v9 handleParticipantDataEvent:v6 accessoryUUID:v12];
  }
  else
  {
    __int16 v13 = (void *)MEMORY[0x1D9452090]();
    id v14 = v9;
    int v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      __int16 v16 = HMFGetLogIdentifier();
      int v17 = 138543618;
      id v18 = v16;
      __int16 v19 = 2112;
      id v20 = v7;
      _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to get participant accessory uuid from topic: %@", (uint8_t *)&v17, 0x16u);
    }
  }
}

- (void)clearCachedData
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  destinations = self->_destinations;
  self->_destinations = v4;

  id v6 = [MEMORY[0x1E4F1CA60] dictionary];
  destinationControllersData = self->_destinationControllersData;
  self->_destinationControllersData = v6;

  os_unfair_lock_unlock(p_lock);
}

- (void)clearCachedDataForParticipantAccessoryUUID:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HMDMediaGroupsAggregator *)self groupLocalDataStorage];
  [(id)v5 clearCachedDataForParticipantAccessoryUUID:v4];

  LOBYTE(v5) = [(HMDMediaGroupsAggregator *)self removeDestinationWithParentIdentifier:v4];
  BOOL v6 = [(HMDMediaGroupsAggregator *)self removeDestinationControllerDataWithParentIdentifier:v4];
  if ((v5 & 1) != 0 || v6)
  {
    id v7 = (void *)MEMORY[0x1D9452090](v6);
    id v8 = self;
    uint64_t v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = HMFGetLogIdentifier();
      int v11 = 138543618;
      id v12 = v10;
      __int16 v13 = 2112;
      id v14 = v4;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Refreshing aggregate data due to cleared cached data for participant uuid: %@", (uint8_t *)&v11, 0x16u);
    }
    [(HMDMediaGroupsAggregator *)v8 refreshAggregateData];
  }
}

- (void)updateDestinationWithIdentifier:(id)a3 audioGroupIdentifier:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDMediaGroupsAggregator *)self destinationManagerWithIdentifier:v6];
  if (v8)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __81__HMDMediaGroupsAggregator_updateDestinationWithIdentifier_audioGroupIdentifier___block_invoke;
    v13[3] = &unk_1E6A196E0;
    v13[4] = self;
    id v14 = v6;
    [v8 requestToUpdateAudioGroupIdentifier:v7 completion:v13];
  }
  else
  {
    uint64_t v9 = (void *)MEMORY[0x1D9452090]();
    id v10 = self;
    int v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v16 = v12;
      __int16 v17 = 2112;
      id v18 = v6;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to update destination with identifier: %@ due to no destination manager", buf, 0x16u);
    }
  }
}

void __81__HMDMediaGroupsAggregator_updateDestinationWithIdentifier_audioGroupIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)MEMORY[0x1D9452090]();
    id v5 = *(id *)(a1 + 32);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = HMFGetLogIdentifier();
      uint64_t v8 = *(void *)(a1 + 40);
      int v9 = 138543874;
      id v10 = v7;
      __int16 v11 = 2112;
      uint64_t v12 = v8;
      __int16 v13 = 2112;
      id v14 = v3;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to update destination with identifier: %@ due to request error: %@", (uint8_t *)&v9, 0x20u);
    }
  }
}

- (void)fixupGroupsForRemovedParticipantAccessoryUUID:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(HMDMediaGroupsAggregator *)self isRunningAsPrimary])
  {
    id v5 = [(HMDMediaGroupsAggregator *)self aggregateData];
    id v6 = [v5 destinations];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __74__HMDMediaGroupsAggregator_fixupGroupsForRemovedParticipantAccessoryUUID___block_invoke;
    v28[3] = &unk_1E6A12240;
    id v29 = v4;
    id v7 = objc_msgSend(v6, "na_firstObjectPassingTest:", v28);

    if (v7)
    {
      uint64_t v8 = [(HMDMediaGroupsAggregator *)self aggregateData];
      int v9 = [v8 groups];
      uint64_t v23 = MEMORY[0x1E4F143A8];
      uint64_t v24 = 3221225472;
      __int16 v25 = __74__HMDMediaGroupsAggregator_fixupGroupsForRemovedParticipantAccessoryUUID___block_invoke_2;
      __int16 v26 = &unk_1E6A0FCF8;
      id v10 = v7;
      id v27 = v10;
      __int16 v11 = objc_msgSend(v9, "na_firstObjectPassingTest:", &v23);

      if (v11)
      {
        uint64_t v12 = objc_msgSend(v11, "mediaSystemData", v23, v24, v25, v26);
        __int16 v13 = v12;
        if (v12)
        {
          id v14 = [v12 associatedGroupIdentifier];

          if (v14)
          {
            uint64_t v15 = [v13 rightDestinationIdentifier];
            __int16 v16 = [v10 uniqueIdentifier];
            if (objc_msgSend(v15, "hmf_isEqualToUUID:", v16)) {
              [v13 leftDestinationIdentifier];
            }
            else {
            __int16 v17 = [v13 rightDestinationIdentifier];
            }

            id v18 = (void *)MEMORY[0x1D9452090]();
            uint64_t v19 = self;
            id v20 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              __int16 v21 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138544130;
              v31 = v21;
              __int16 v32 = 2112;
              v33 = v17;
              __int16 v34 = 2112;
              v35 = v13;
              __int16 v36 = 2112;
              id v37 = v10;
              _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_INFO, "%{public}@Fixing up destination: %@ on removed media system: %@ due to removed destination: %@", buf, 0x2Au);
            }
            id v22 = [v13 associatedGroupIdentifier];
            [(HMDMediaGroupsAggregator *)v19 updateDestinationWithIdentifier:v17 audioGroupIdentifier:v22];
          }
        }
      }
    }
  }
}

uint64_t __74__HMDMediaGroupsAggregator_fixupGroupsForRemovedParticipantAccessoryUUID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 parentIdentifier];
  uint64_t v4 = objc_msgSend(v3, "hmf_isEqualToUUID:", *(void *)(a1 + 32));

  return v4;
}

uint64_t __74__HMDMediaGroupsAggregator_fixupGroupsForRemovedParticipantAccessoryUUID___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 destinationUniqueIdentifiers];
  uint64_t v4 = [*(id *)(a1 + 32) uniqueIdentifier];
  uint64_t v5 = [v3 containsObject:v4];

  return v5;
}

- (id)destinationControllersData
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uint64_t v4 = [(NSMutableDictionary *)self->_destinationControllersData allValues];
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)groups
{
  v2 = [(HMDMediaGroupsAggregator *)self groupLocalDataStorage];
  id v3 = [v2 groups];

  return v3;
}

- (id)localGroupWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HMDMediaGroupsAggregator *)self groups];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __53__HMDMediaGroupsAggregator_localGroupWithIdentifier___block_invoke;
  v9[3] = &unk_1E6A0FCF8;
  id v10 = v4;
  id v6 = v4;
  id v7 = objc_msgSend(v5, "na_firstObjectPassingTest:", v9);

  return v7;
}

uint64_t __53__HMDMediaGroupsAggregator_localGroupWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  uint64_t v4 = objc_msgSend(v3, "hmf_isEqualToUUID:", *(void *)(a1 + 32));

  return v4;
}

- (BOOL)removeDestinationControllerDataWithParentIdentifier:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  uint64_t v5 = [(NSMutableDictionary *)self->_destinationControllersData allValues];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __80__HMDMediaGroupsAggregator_removeDestinationControllerDataWithParentIdentifier___block_invoke;
  v15[3] = &unk_1E6A0F330;
  id v6 = v4;
  id v16 = v6;
  id v7 = objc_msgSend(v5, "na_firstObjectPassingTest:", v15);

  if (v7)
  {
    destinationControllersData = self->_destinationControllersData;
    int v9 = [v7 identifier];
    [(NSMutableDictionary *)destinationControllersData removeObjectForKey:v9];

    os_unfair_lock_unlock(&self->_lock);
    id v10 = (void *)MEMORY[0x1D9452090]();
    __int16 v11 = self;
    uint64_t v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      __int16 v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v18 = v13;
      __int16 v19 = 2112;
      id v20 = v7;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@Removed destination controller data: %@", buf, 0x16u);
    }
  }
  else
  {

    os_unfair_lock_unlock(&self->_lock);
  }

  return v7 != 0;
}

uint64_t __80__HMDMediaGroupsAggregator_removeDestinationControllerDataWithParentIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 parentIdentifier];
  uint64_t v4 = objc_msgSend(v3, "hmf_isEqualToUUID:", *(void *)(a1 + 32));

  return v4;
}

- (void)setDestinationControllerData:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    int v12 = 138543618;
    __int16 v13 = v8;
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Setting destination controller data: %@", (uint8_t *)&v12, 0x16u);
  }
  p_lock = &v6->_lock;
  os_unfair_lock_lock_with_options();
  destinationControllersData = v6->_destinationControllersData;
  __int16 v11 = [v4 identifier];
  [(NSMutableDictionary *)destinationControllersData setObject:v4 forKey:v11];

  os_unfair_lock_unlock(p_lock);
}

- (id)destinations
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = [(NSMutableDictionary *)self->_destinations allValues];
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BOOL)removeDestinationWithParentIdentifier:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  uint64_t v5 = [(NSMutableDictionary *)self->_destinations allValues];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __66__HMDMediaGroupsAggregator_removeDestinationWithParentIdentifier___block_invoke;
  v15[3] = &unk_1E6A12240;
  id v6 = v4;
  id v16 = v6;
  id v7 = objc_msgSend(v5, "na_firstObjectPassingTest:", v15);

  if (v7)
  {
    destinations = self->_destinations;
    int v9 = [v7 uniqueIdentifier];
    [(NSMutableDictionary *)destinations removeObjectForKey:v9];

    os_unfair_lock_unlock(&self->_lock);
    id v10 = (void *)MEMORY[0x1D9452090]();
    __int16 v11 = self;
    int v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      __int16 v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v18 = v13;
      __int16 v19 = 2112;
      id v20 = v7;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@Removed destination: %@", buf, 0x16u);
    }
  }
  else
  {

    os_unfair_lock_unlock(&self->_lock);
  }

  return v7 != 0;
}

uint64_t __66__HMDMediaGroupsAggregator_removeDestinationWithParentIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 parentIdentifier];
  uint64_t v4 = objc_msgSend(v3, "hmf_isEqualToUUID:", *(void *)(a1 + 32));

  return v4;
}

- (void)setDestination:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    int v12 = 138543618;
    __int16 v13 = v8;
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Setting destination: %@", (uint8_t *)&v12, 0x16u);
  }
  p_lock = &v6->_lock;
  os_unfair_lock_lock_with_options();
  destinations = v6->_destinations;
  __int16 v11 = [v4 uniqueIdentifier];
  [(NSMutableDictionary *)destinations setObject:v4 forKey:v11];

  os_unfair_lock_unlock(p_lock);
}

- (void)stop
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if ([(HMDMediaGroupsAggregator *)self setState:0])
  {
    id v3 = (void *)MEMORY[0x1D9452090]();
    id v4 = self;
    uint64_t v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = HMFGetLogIdentifier();
      int v8 = 138543362;
      int v9 = v6;
      _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Stopping destination controller aggregator", (uint8_t *)&v8, 0xCu);
    }
    [(HMDMediaGroupsAggregator *)v4 notifyOfStoppedState];
    [(HMDMediaGroupsAggregator *)v4 stopWarmUpTimer];
    [(HMDMediaGroupsAggregator *)v4 unregisterForAllEvents];
    [(HMDMediaGroupsAggregator *)v4 clearCachedData];
    id v7 = [(HMDMediaGroupsAggregator *)v4 groupLocalDataStorage];
    [v7 clearCachedData];
  }
}

- (void)stopWarmUpTimer
{
  id v3 = [(HMDMediaGroupsAggregator *)self warmUpTimer];
  [v3 setDelegate:0];

  [(HMDMediaGroupsAggregator *)self setWarmUpTimer:0];
}

- (void)startWarmUpTimer
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ([(HMDMediaGroupsAggregator *)self shouldWarmUp])
  {
    id v3 = (void *)MEMORY[0x1D9452090]();
    id v4 = self;
    uint64_t v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = HMFGetLogIdentifier();
      int v11 = 138543362;
      int v12 = v6;
      _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Starting warmup timer", (uint8_t *)&v11, 0xCu);
    }
    id v7 = [(HMDMediaGroupsAggregator *)v4 timerProvider];
    int v8 = [v7 timerWithTimeInterval:2 options:60.0];
    [(HMDMediaGroupsAggregator *)v4 setWarmUpTimer:v8];

    int v9 = [(HMDMediaGroupsAggregator *)v4 warmUpTimer];
    [v9 setDelegate:v4];

    uint64_t v10 = [(HMDMediaGroupsAggregator *)v4 warmUpTimer];
    [v10 resume];
  }
}

- (void)runAsPrimary
{
  uint64_t v3 = 0;
  if ([(HMDMediaGroupsAggregator *)self setState:1 previousState:&v3])
  {
    [(HMDMediaGroupsAggregator *)self startWarmUpTimer];
    [(HMDMediaGroupsAggregator *)self registerForEvents];
  }
}

- (BOOL)setState:(unint64_t)a3 previousState:(unint64_t *)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  unint64_t state = self->_state;
  if (state == a3)
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    if (a4) {
      *a4 = state;
    }
    self->_unint64_t state = a3;
    os_unfair_lock_unlock(p_lock);
    int v9 = (void *)MEMORY[0x1D9452090]();
    uint64_t v10 = self;
    int v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v12 = (id)objc_claimAutoreleasedReturnValue();
      if (a3)
      {
        if (a3 == 1)
        {
          uint64_t v13 = @"HMDMediaGroupsAggregatorRunningAsPrimaryState";
        }
        else
        {
          __int16 v14 = NSString;
          id v15 = [NSNumber numberWithUnsignedInteger:a3];
          uint64_t v13 = [v14 stringWithFormat:@"Unknown State (%@)", v15];
        }
      }
      else
      {
        uint64_t v13 = @"HMDMediaGroupsAggregatorStoppedState";
      }
      *(_DWORD *)buf = 138543618;
      id v18 = v12;
      __int16 v19 = 2112;
      id v20 = v13;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Updated state: %@", buf, 0x16u);
    }
  }
  return state != a3;
}

- (BOOL)setState:(unint64_t)a3
{
  return [(HMDMediaGroupsAggregator *)self setState:a3 previousState:0];
}

- (BOOL)isRunningAsPrimary
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_state == 1;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)isRunning
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_state == 1;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (id)destinationManagerWithIdentifier:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HMDMediaGroupsAggregator *)self dataSource];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 destinationManagerWithIdentifier:v4 mediaGroupsAggregator:self];
  }
  else
  {
    int v8 = (void *)MEMORY[0x1D9452090]();
    int v9 = self;
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v11 = HMFGetLogIdentifier();
      int v13 = 138543618;
      __int16 v14 = v11;
      __int16 v15 = 2112;
      id v16 = v4;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to get destination manager with identifier: %@ due to no data source", (uint8_t *)&v13, 0x16u);
    }
    id v7 = 0;
  }

  return v7;
}

- (id)appleMediaAccessories
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(HMDMediaGroupsAggregator *)self dataSource];
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 appleMediaAccessoriesForMediaGroupsAggregator:self];
  }
  else
  {
    id v6 = (void *)MEMORY[0x1D9452090]();
    id v7 = self;
    int v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = HMFGetLogIdentifier();
      int v11 = 138543362;
      id v12 = v9;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to get apple media accessories due to no data source", (uint8_t *)&v11, 0xCu);
    }
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)eventSource
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(HMDMediaGroupsAggregator *)self dataSource];
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 eventSourceForMediaGroupsAggregator:self];
  }
  else
  {
    id v6 = (void *)MEMORY[0x1D9452090]();
    id v7 = self;
    int v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = HMFGetLogIdentifier();
      int v11 = 138543362;
      id v12 = v9;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to get event source due to no data source", (uint8_t *)&v11, 0xCu);
    }
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)participantDataTopicForAccessory:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HMDMediaGroupsAggregator *)self dataSource];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 participantDataTopicForAccessory:v4 mediaGroupsAggregator:self];
  }
  else
  {
    int v8 = (void *)MEMORY[0x1D9452090]();
    int v9 = self;
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v11 = HMFGetLogIdentifier();
      int v13 = 138543362;
      __int16 v14 = v11;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to get destination topic due to no data source", (uint8_t *)&v13, 0xCu);
    }
    id v7 = 0;
  }

  return v7;
}

- (id)aggregateDataTopic
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(HMDMediaGroupsAggregator *)self dataSource];
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 aggregateDataTopicForMediaGroupsAggregator:self];
  }
  else
  {
    id v6 = (void *)MEMORY[0x1D9452090]();
    id v7 = self;
    int v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = HMFGetLogIdentifier();
      int v11 = 138543362;
      id v12 = v9;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to get aggregated data topic due to no data source", (uint8_t *)&v11, 0xCu);
    }
    uint64_t v5 = 0;
  }

  return v5;
}

- (BOOL)shouldWarmUp
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(HMDMediaGroupsAggregator *)self aggregateDataTopic];
  if (v3)
  {
    id v4 = [(HMDMediaGroupsAggregator *)self eventStoreReadHandle];
    uint64_t v5 = [v4 lastEventForTopic:v3];

    if (v5)
    {
      id v6 = [HMDMediaGroupsAggregateData alloc];
      id v7 = [v5 encodedData];
      int v8 = [(HMDMediaGroupsAggregateData *)v6 initWithProtoBufferData:v7];

      if (v8)
      {
        int v9 = [(HMDMediaGroupsAggregateData *)v8 destinations];
        if ([v9 count])
        {
          BOOL v10 = 1;
        }
        else
        {
          id v20 = [(HMDMediaGroupsAggregateData *)v8 destinationControllersData];
          BOOL v10 = [v20 count] != 0;
        }
      }
      else
      {
        uint64_t v15 = (void *)MEMORY[0x1D9452090]();
        id v16 = self;
        uint64_t v17 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          id v18 = HMFGetLogIdentifier();
          __int16 v19 = [v5 encodedData];
          int v22 = 138543874;
          uint64_t v23 = v18;
          __int16 v24 = 2112;
          __int16 v25 = v19;
          __int16 v26 = 2112;
          id v27 = v5;
          _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode last cached event participant data: %@ from event: %@", (uint8_t *)&v22, 0x20u);
        }
        BOOL v10 = 0;
      }
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
    int v11 = (void *)MEMORY[0x1D9452090]();
    id v12 = self;
    uint64_t v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      __int16 v14 = HMFGetLogIdentifier();
      int v22 = 138543362;
      uint64_t v23 = v14;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to get last cached event participant data due to missing topic name", (uint8_t *)&v22, 0xCu);
    }
    BOOL v10 = 0;
  }

  return v10;
}

- (void)forwardAggregateData
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(HMDMediaGroupsAggregator *)self warmUpTimer];

  if (!v3)
  {
    id v4 = [(HMDMediaGroupsAggregator *)self aggregateDataTopic];
    if (v4)
    {
      uint64_t v5 = [(HMDMediaGroupsAggregator *)self eventSource];
      if (v5)
      {
        id v6 = [(HMDMediaGroupsAggregator *)self aggregateData];
        id v7 = (void *)MEMORY[0x1D9452090]();
        int v8 = self;
        int v9 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          BOOL v10 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543874;
          id v27 = v10;
          __int16 v28 = 2112;
          id v29 = v4;
          __int16 v30 = 2112;
          v31 = v6;
          _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Publishing topic: %@ data: %@", buf, 0x20u);
        }
        id v11 = objc_alloc(MEMORY[0x1E4F69F48]);
        [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
        id v12 = objc_msgSend(v11, "initWithSource:cachePolicy:combineType:timestamp:", v5, 2, 2);
        id v13 = objc_alloc(MEMORY[0x1E4F69F38]);
        __int16 v14 = [v6 encodeToProtoBufferData];
        uint64_t v15 = (void *)[v13 initWithEventData:v14 metadata:v12];

        id v16 = [(HMDMediaGroupsAggregator *)v8 eventForwarder];
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __48__HMDMediaGroupsAggregator_forwardAggregateData__block_invoke;
        v25[3] = &unk_1E6A197F0;
        v25[4] = v8;
        [v16 forwardEvent:v15 topic:v4 completion:v25];
      }
      else
      {
        uint64_t v21 = (void *)MEMORY[0x1D9452090]();
        int v22 = self;
        uint64_t v23 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          __int16 v24 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          id v27 = v24;
          _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_ERROR, "%{public}@Failed to get event source to forward data", buf, 0xCu);
        }
      }
    }
    else
    {
      uint64_t v17 = (void *)MEMORY[0x1D9452090]();
      id v18 = self;
      __int16 v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        id v20 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        id v27 = v20;
        _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to get topic name to forward data", buf, 0xCu);
      }
    }
  }
}

void __48__HMDMediaGroupsAggregator_forwardAggregateData__block_invoke(uint64_t a1, void *a2)
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
      id v7 = HMFGetLogIdentifier();
      int v8 = 138543618;
      int v9 = v7;
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_ERROR, "%{public}@Forwarding event resulted in error: %@", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (void)notifyOfStoppedState
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDMediaGroupsAggregator *)self delegate];
  id v4 = v3;
  if (v3)
  {
    [v3 didStopMediaGroupsAggregator:self];
  }
  else
  {
    id v5 = (void *)MEMORY[0x1D9452090]();
    id v6 = self;
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v8 = HMFGetLogIdentifier();
      int v9 = 138543362;
      __int16 v10 = v8;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Failed to notify of stopped state due to no delegate", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (void)refreshAggregateData
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if ([(HMDMediaGroupsAggregator *)self isRunning])
  {
    id v3 = [HMDMediaGroupsAggregateData alloc];
    id v4 = [(HMDMediaGroupsAggregator *)self destinations];
    id v5 = [(HMDMediaGroupsAggregator *)self destinationControllersData];
    id v6 = [(HMDMediaGroupsAggregator *)self groups];
    id v7 = [(HMDMediaGroupsAggregateData *)v3 initWithDestinations:v4 destinationControllersData:v5 groups:v6];

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    int v8 = [(HMDMediaGroupsAggregator *)self generators];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v28 objects:v36 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v29;
      do
      {
        uint64_t v12 = 0;
        id v13 = v7;
        do
        {
          if (*(void *)v29 != v11) {
            objc_enumerationMutation(v8);
          }
          __int16 v14 = *(void **)(*((void *)&v28 + 1) + 8 * v12);
          uint64_t v15 = [(HMDMediaGroupsAggregateData *)v13 destinations];
          id v16 = [(HMDMediaGroupsAggregateData *)v13 destinationControllersData];
          uint64_t v17 = [(HMDMediaGroupsAggregateData *)v13 groups];
          id v7 = [v14 aggregateDataWithDestinations:v15 controllers:v16 groups:v17];

          ++v12;
          id v13 = v7;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v28 objects:v36 count:16];
      }
      while (v10);
    }

    id v18 = [(HMDMediaGroupsAggregator *)self aggregateData];
    int v19 = [v18 isEqual:v7];

    if (v19)
    {
      id v20 = (void *)MEMORY[0x1D9452090]();
      uint64_t v21 = self;
      int v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        uint64_t v23 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v33 = v23;
        __int16 v34 = 2112;
        v35 = v7;
        _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_INFO, "%{public}@Refresh resulted in no change to aggregate data: %@", buf, 0x16u);
      }
    }
    else
    {
      __int16 v24 = (void *)MEMORY[0x1D9452090]([(HMDMediaGroupsAggregator *)self setAggregateData:v7]);
      __int16 v25 = self;
      __int16 v26 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        id v27 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v33 = v27;
        __int16 v34 = 2112;
        v35 = v7;
        _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_INFO, "%{public}@Updated aggregate data: %@", buf, 0x16u);
      }
      [(HMDMediaGroupsAggregator *)v25 notifyOfUpdatedMediaGroupsAggregateData:v7];
      [(HMDMediaGroupsAggregator *)v25 forwardAggregateData];
    }
  }
}

- (void)unregisterForEventsForAccessory:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(HMDMediaGroupsAggregator *)self isRunningAsPrimary])
  {
    id v5 = [(HMDMediaGroupsAggregator *)self participantDataTopicForAccessory:v4];
    if (v5)
    {
      id v6 = (void *)MEMORY[0x1D9452090]();
      id v7 = self;
      int v8 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        uint64_t v9 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        id v16 = v9;
        __int16 v17 = 2112;
        id v18 = v5;
        __int16 v19 = 2112;
        id v20 = v4;
        _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Unregistering destination topic: %@ for accessory: %@", buf, 0x20u);
      }
      uint64_t v10 = [(HMDMediaGroupsAggregator *)v7 subscriptionProvider];
      __int16 v14 = v5;
      uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __60__HMDMediaGroupsAggregator_unregisterForEventsForAccessory___block_invoke;
      v12[3] = &unk_1E6A196E0;
      v12[4] = v7;
      id v13 = v5;
      [v10 unregisterConsumer:v7 topicFilters:v11 completion:v12];
    }
  }
}

void __60__HMDMediaGroupsAggregator_unregisterForEventsForAccessory___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)MEMORY[0x1D9452090]();
    id v5 = *(id *)(a1 + 32);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = HMFGetLogIdentifier();
      uint64_t v8 = *(void *)(a1 + 40);
      int v9 = 138543874;
      uint64_t v10 = v7;
      __int16 v11 = 2112;
      uint64_t v12 = v8;
      __int16 v13 = 2112;
      id v14 = v3;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_ERROR, "%{public}@Unregister for destination topic: %@ resulted in error: %@", (uint8_t *)&v9, 0x20u);
    }
  }
}

- (void)unregisterForAllEvents
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1D9452090](self, a2);
  id v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v10 = v6;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Unregister for all events", buf, 0xCu);
  }
  id v7 = [(HMDMediaGroupsAggregator *)v4 subscriptionProvider];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __50__HMDMediaGroupsAggregator_unregisterForAllEvents__block_invoke;
  v8[3] = &unk_1E6A197F0;
  v8[4] = v4;
  [v7 unregisterConsumer:v4 completion:v8];
}

void __50__HMDMediaGroupsAggregator_unregisterForAllEvents__block_invoke(uint64_t a1, void *a2)
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
      id v7 = HMFGetLogIdentifier();
      int v8 = 138543618;
      int v9 = v7;
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_ERROR, "%{public}@Unregistering for all events returned with error: %@", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (void)registerForEventsForAccessory:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(HMDMediaGroupsAggregator *)self isRunningAsPrimary])
  {
    id v5 = [(HMDMediaGroupsAggregator *)self participantDataTopicForAccessory:v4];
    if (v5)
    {
      id v6 = (void *)MEMORY[0x1D9452090]();
      id v7 = self;
      int v8 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v9 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        id v16 = v9;
        __int16 v17 = 2112;
        id v18 = v5;
        __int16 v19 = 2112;
        id v20 = v4;
        _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Registering participant data topic: %@ for accessory: %@", buf, 0x20u);
      }
      __int16 v10 = [(HMDMediaGroupsAggregator *)v7 subscriptionProvider];
      id v14 = v5;
      id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __58__HMDMediaGroupsAggregator_registerForEventsForAccessory___block_invoke;
      v12[3] = &unk_1E6A192B8;
      v12[4] = v7;
      id v13 = v5;
      [v10 registerConsumer:v7 topicFilters:v11 completion:v12];
    }
  }
}

void __58__HMDMediaGroupsAggregator_registerForEventsForAccessory___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = (void *)MEMORY[0x1D9452090]();
    id v8 = *(id *)(a1 + 32);
    int v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      __int16 v10 = HMFGetLogIdentifier();
      uint64_t v11 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      __int16 v17 = v10;
      __int16 v18 = 2112;
      uint64_t v19 = v11;
      __int16 v20 = 2112;
      id v21 = v6;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_ERROR, "%{public}@Register for destination topic: %@ resulted in error: %@", buf, 0x20u);
    }
  }
  uint64_t v12 = [v5 allKeys];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __58__HMDMediaGroupsAggregator_registerForEventsForAccessory___block_invoke_40;
  v14[3] = &unk_1E6A16928;
  v14[4] = *(void *)(a1 + 32);
  id v15 = v5;
  id v13 = v5;
  objc_msgSend(v12, "na_each:", v14);
}

void __58__HMDMediaGroupsAggregator_registerForEventsForAccessory___block_invoke_40(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  id v4 = a2;
  id v5 = [v3 objectForKeyedSubscript:v4];
  [v2 didReceiveEvent:v5 topic:v4];
}

- (void)registerForEvents
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDMediaGroupsAggregator *)self appleMediaAccessories];
  id v4 = v3;
  if (v3)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __45__HMDMediaGroupsAggregator_registerForEvents__block_invoke;
    v9[3] = &unk_1E6A153B0;
    void v9[4] = self;
    objc_msgSend(v3, "na_each:", v9);
  }
  else
  {
    id v5 = (void *)MEMORY[0x1D9452090]();
    id v6 = self;
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v11 = v8;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to register for events due to no accessories", buf, 0xCu);
    }
  }
}

uint64_t __45__HMDMediaGroupsAggregator_registerForEvents__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) registerForEventsForAccessory:a2];
}

- (void)handleAccessoryChangedRoomNotification:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(HMDMediaGroupsAggregator *)self isRunning])
  {
    id v5 = (void *)MEMORY[0x1D9452090]();
    id v6 = self;
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = HMFGetLogIdentifier();
      int v9 = 138543362;
      __int16 v10 = v8;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Refreshing aggregate data due to change room notification", (uint8_t *)&v9, 0xCu);
    }
    [(HMDMediaGroupsAggregator *)v6 refreshAggregateData];
  }
}

- (void)handlePrimaryResidentDeviceChangeNotification:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    [(HMDMediaGroupsAggregator *)self refreshRunningStateUsingPrimaryResidentChangeMonitor:v7];
  }
  else
  {
    id v8 = (void *)MEMORY[0x1D9452090]();
    int v9 = self;
    __int16 v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      int v12 = 138543618;
      id v13 = v11;
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to get primary resident change monitor from notification: %@", (uint8_t *)&v12, 0x16u);
    }
  }
}

- (void)handleMediaSystemAddedNotification:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(HMDMediaGroupsAggregator *)self isRunning])
  {
    id v5 = (void *)MEMORY[0x1D9452090]();
    id v6 = self;
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = HMFGetLogIdentifier();
      int v9 = 138543362;
      __int16 v10 = v8;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Refreshing aggregate data due to added media system notification", (uint8_t *)&v9, 0xCu);
    }
    [(HMDMediaGroupsAggregator *)v6 refreshAggregateData];
  }
}

- (void)handleHomeRemovedAccessoryNotification:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 userInfo];
  id v6 = [v5 objectForKey:@"HMDAccessoryNotificationKey"];

  if (v6)
  {
    id v7 = [v6 uuid];
    [(HMDMediaGroupsAggregator *)self fixupGroupsForRemovedParticipantAccessoryUUID:v7];

    id v8 = [v6 uuid];
    [(HMDMediaGroupsAggregator *)self clearCachedDataForParticipantAccessoryUUID:v8];

    id v9 = v6;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass) {
      uint64_t v11 = v9;
    }
    else {
      uint64_t v11 = 0;
    }
    id v12 = v11;

    if (isKindOfClass) {
      [(HMDMediaGroupsAggregator *)self unregisterForEventsForAccessory:v9];
    }
  }
  else
  {
    id v13 = (void *)MEMORY[0x1D9452090]();
    __int16 v14 = self;
    id v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = HMFGetLogIdentifier();
      int v17 = 138543618;
      __int16 v18 = v16;
      __int16 v19 = 2112;
      id v20 = v4;
      _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to get removed accessory from notification: %@", (uint8_t *)&v17, 0x16u);
    }
  }
}

- (void)handleHomeAddedAccessoryNotification:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 userInfo];
  id v6 = [v5 objectForKey:@"HMDNotificationAddedAccessoryKey"];

  if (v6)
  {
    id v7 = v6;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass) {
      id v9 = v7;
    }
    else {
      id v9 = 0;
    }
    id v10 = v9;

    if (isKindOfClass) {
      [(HMDMediaGroupsAggregator *)self registerForEventsForAccessory:v7];
    }
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x1D9452090]();
    id v12 = self;
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      __int16 v14 = HMFGetLogIdentifier();
      int v15 = 138543618;
      uint64_t v16 = v14;
      __int16 v17 = 2112;
      id v18 = v4;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to get added accessory from notification: %@", (uint8_t *)&v15, 0x16u);
    }
  }
}

- (void)refreshRunningStateUsingPrimaryResidentChangeMonitor:(id)a3
{
  if ([a3 isCurrentDevicePrimaryResident])
  {
    [(HMDMediaGroupsAggregator *)self runAsPrimary];
  }
  else
  {
    [(HMDMediaGroupsAggregator *)self stop];
  }
}

- (void)registerForNotificationsWithHome:(id)a3 notificationCenter:(id)a4 primaryResidentChangeMonitor:(id)a5
{
  id v8 = a5;
  id v10 = a4;
  id v9 = a3;
  [v10 addObserver:self selector:sel_handleHomeAddedAccessoryNotification_ name:@"HMDNotificationHomeAddedAccessory" object:v9];
  [v10 addObserver:self selector:sel_handleHomeRemovedAccessoryNotification_ name:@"HMDHomeAccessoryRemovedNotification" object:v9];
  [v10 addObserver:self selector:sel_handleMediaSystemAddedNotification_ name:@"HMDMediaSystemAddedNotification" object:v9];

  [v10 addObserver:self selector:sel_handlePrimaryResidentDeviceChangeNotification_ name:@"HMDPrimaryResidentChangeMonitorIsCurrentDeviceChangeNotification" object:v8];
  [v10 addObserver:self selector:sel_handlePrimaryResidentDeviceChangeNotification_ name:@"HMDPrimaryResidentChangeMonitorHasResidentDevicesChangeNotification" object:v8];

  [v10 addObserver:self selector:sel_handleAccessoryChangedRoomNotification_ name:@"HMDNotificationAccessoryChangedRoom" object:0];
}

- (void)configureWithHome:(id)a3 messageDispatcher:(id)a4 notificationCenter:(id)a5 primaryResidentChangeMonitor:(id)a6
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  __int16 v14 = (void *)MEMORY[0x1D9452090]();
  int v15 = self;
  uint64_t v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    __int16 v17 = HMFGetLogIdentifier();
    int v19 = 138543362;
    id v20 = v17;
    _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_INFO, "%{public}@Configuring media groups aggregator", (uint8_t *)&v19, 0xCu);
  }
  [(HMDMediaGroupsAggregator *)v15 registerForNotificationsWithHome:v10 notificationCenter:v12 primaryResidentChangeMonitor:v13];
  [(HMDMediaGroupsAggregator *)v15 refreshRunningStateUsingPrimaryResidentChangeMonitor:v13];
  id v18 = [(HMDMediaGroupsAggregator *)v15 messenger];
  [v18 configureWithMessageDispatcher:v11 home:v10];
}

- (id)createGenerators
{
  v7[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(HMDMediaSystemsAggregateDataGenerator);
  [(HMDMediaSystemsAggregateDataGenerator *)v3 setDataSource:self];
  v7[0] = v3;
  id v4 = objc_alloc_init(HMDMediaDestinationControllerAggregateDataGenerator);
  v7[1] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];

  return v5;
}

- (HMDMediaGroupsAggregator)initWithIdentifier:(id)a3 messenger:(id)a4 eventForwarder:(id)a5 subscriptionProvider:(id)a6 eventStoreReadHandle:(id)a7 groupsLocalDataStorage:(id)a8 timerProvider:(id)a9 featuresDataSource:(id)a10
{
  id v17 = a3;
  id obj = a4;
  id v18 = a4;
  id v44 = a5;
  id v19 = a5;
  id v48 = a6;
  id v46 = a7;
  id v47 = a8;
  id v20 = a9;
  id v21 = a10;
  if (!v17)
  {
    _HMFPreconditionFailure();
    goto LABEL_13;
  }
  if (!v18)
  {
LABEL_13:
    _HMFPreconditionFailure();
    goto LABEL_14;
  }
  if (!v19)
  {
LABEL_14:
    _HMFPreconditionFailure();
    goto LABEL_15;
  }
  if (!v48)
  {
LABEL_15:
    _HMFPreconditionFailure();
    goto LABEL_16;
  }
  if (!v47)
  {
LABEL_16:
    _HMFPreconditionFailure();
    goto LABEL_17;
  }
  if (!v46)
  {
LABEL_17:
    _HMFPreconditionFailure();
    goto LABEL_18;
  }
  if (!v20)
  {
LABEL_18:
    _HMFPreconditionFailure();
    goto LABEL_19;
  }
  if (!v21)
  {
LABEL_19:
    v35 = (HMDMediaGroupsAggregator *)_HMFPreconditionFailure();
    return [(HMDMediaGroupsAggregator *)v35 initWithIdentifier:v37 messenger:v38 eventForwarder:v39 subscriptionProvider:v40 eventStoreReadHandle:v41 groupsLocalDataStorage:v42];
  }
  v45 = v21;
  v49.receiver = self;
  v49.super_class = (Class)HMDMediaGroupsAggregator;
  uint64_t v22 = [(HMDMediaGroupsAggregator *)&v49 init];
  uint64_t v23 = v22;
  if (v22)
  {
    v22->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v22->_featuresDataSource, a10);
    objc_storeStrong((id *)&v23->_identifier, a3);
    v23->_unint64_t state = 0;
    warmUpTimer = v23->_warmUpTimer;
    v23->_warmUpTimer = 0;

    objc_storeWeak((id *)&v23->_timerProvider, v20);
    objc_storeStrong((id *)&v23->_messenger, obj);
    objc_storeStrong((id *)&v23->_eventForwarder, v44);
    objc_storeStrong((id *)&v23->_subscriptionProvider, a6);
    objc_storeStrong((id *)&v23->_groupLocalDataStorage, a8);
    objc_storeStrong((id *)&v23->_eventStoreReadHandle, a7);
    uint64_t v25 = [MEMORY[0x1E4F1CA60] dictionary];
    destinations = v23->_destinations;
    v23->_destinations = (NSMutableDictionary *)v25;

    uint64_t v27 = [MEMORY[0x1E4F1CA60] dictionary];
    destinationControllersData = v23->_destinationControllersData;
    v23->_destinationControllersData = (NSMutableDictionary *)v27;

    long long v29 = [HMDMediaGroupsAggregateData alloc];
    uint64_t v30 = [(HMDMediaGroupsAggregateData *)v29 initWithDestinations:MEMORY[0x1E4F1CBF0] destinationControllersData:MEMORY[0x1E4F1CBF0]];
    aggregateData = v23->_aggregateData;
    v23->_aggregateData = (HMDMediaGroupsAggregateData *)v30;

    uint64_t v32 = [(HMDMediaGroupsAggregator *)v23 createGenerators];
    generators = v23->_generators;
    v23->_generators = (NSArray *)v32;
  }
  return v23;
}

- (HMDMediaGroupsAggregator)initWithIdentifier:(id)a3 messenger:(id)a4 eventForwarder:(id)a5 subscriptionProvider:(id)a6 eventStoreReadHandle:(id)a7 groupsLocalDataStorage:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  id v20 = objc_alloc_init(HMDFeaturesDataSource);
  id v21 = [(HMDMediaGroupsAggregator *)self initWithIdentifier:v19 messenger:v18 eventForwarder:v17 subscriptionProvider:v16 eventStoreReadHandle:v15 groupsLocalDataStorage:v14 timerProvider:self featuresDataSource:v20];

  return v21;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t67 != -1) {
    dispatch_once(&logCategory__hmf_once_t67, &__block_literal_global_106994);
  }
  v2 = (void *)logCategory__hmf_once_v68;
  return v2;
}

uint64_t __39__HMDMediaGroupsAggregator_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v68;
  logCategory__hmf_once_v68 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end