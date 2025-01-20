@interface HMDMediaGroupParticipantLocalDataStorage
+ (id)logCategory;
- (BOOL)hasDataToPublishInParticipantData:(id)a3;
- (HMDFeaturesDataSource)featuresDataSource;
- (HMDMediaGroupParticipantLocalDataStorage)initWithIdentifier:(id)a3 backUpReciever:(id)a4 userDefaults:(id)a5 eventForwarder:(id)a6 eventStoreReadHandle:(id)a7;
- (HMDMediaGroupParticipantLocalDataStorage)initWithIdentifier:(id)a3 backUpReciever:(id)a4 userDefaults:(id)a5 eventForwarder:(id)a6 eventStoreReadHandle:(id)a7 featuresDataSource:(id)a8;
- (HMDMediaGroupParticipantLocalDataStorageDataSource)dataSource;
- (HMDMediaGroupParticipantLocalDataStorageDelegate)delegate;
- (HMDMediaGroupsAggregatorBackupReceiver)groupsBackupReceiver;
- (HMEEventForwarder)eventForwarder;
- (HMELastEventStoreReadHandle)eventStoreReadHandle;
- (HMMediaDestination)destination;
- (HMMediaDestinationControllerData)destinationControllerData;
- (NSUUID)identifier;
- (NSUserDefaults)userDefaults;
- (id)createDefaultParticipantData;
- (id)eventSource;
- (id)lastCachedEventParticipantData;
- (id)logIdentifier;
- (id)migratedParticipantData:(id)a3 withDestinationSupportOptions:(unint64_t)a4;
- (id)participantData;
- (id)protoParticipantData;
- (id)topicName;
- (void)configureWithHome:(id)a3 messageDispatcher:(id)a4;
- (void)migrateWithExpectedDestinationControllerSupportOptions:(unint64_t)a3;
- (void)migrateWithExpectedDestinationSupportOptions:(unint64_t)a3;
- (void)notifyDidChangeDestinationIdentifier:(id)a3 forDestinationControllerIdentifier:(id)a4;
- (void)publishCachedObject;
- (void)publishCachedObjectIfNeeded;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)updateAudioGroupIdentifier:(id)a3;
- (void)updateBackupGroupData:(id)a3;
- (void)updateDestinationControllerAvailableDestinationIdentifiers:(id)a3;
- (void)updateDestinationControllerData:(id)a3;
- (void)updateDestinationControllerDestinationIdentifier:(id)a3;
- (void)updateDestinationControllerSupportedOptions:(unint64_t)a3;
- (void)updateDestinationSupportOptions:(unint64_t)a3;
- (void)updateMediaDestination:(id)a3;
- (void)updateParticipantData:(id)a3;
@end

@implementation HMDMediaGroupParticipantLocalDataStorage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featuresDataSource, 0);
  objc_storeStrong((id *)&self->_eventStoreReadHandle, 0);
  objc_storeStrong((id *)&self->_eventForwarder, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_groupsBackupReceiver, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_logger, 0);
}

- (HMDFeaturesDataSource)featuresDataSource
{
  return (HMDFeaturesDataSource *)objc_getProperty(self, a2, 72, 1);
}

- (HMELastEventStoreReadHandle)eventStoreReadHandle
{
  return (HMELastEventStoreReadHandle *)objc_getProperty(self, a2, 64, 1);
}

- (HMEEventForwarder)eventForwarder
{
  return (HMEEventForwarder *)objc_getProperty(self, a2, 56, 1);
}

- (NSUserDefaults)userDefaults
{
  return (NSUserDefaults *)objc_getProperty(self, a2, 48, 1);
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 40, 1);
}

- (HMDMediaGroupsAggregatorBackupReceiver)groupsBackupReceiver
{
  return (HMDMediaGroupsAggregatorBackupReceiver *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDelegate:(id)a3
{
}

- (HMDMediaGroupParticipantLocalDataStorageDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDMediaGroupParticipantLocalDataStorageDelegate *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (HMDMediaGroupParticipantLocalDataStorageDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (HMDMediaGroupParticipantLocalDataStorageDataSource *)WeakRetained;
}

- (id)logIdentifier
{
  v2 = [(HMDMediaGroupParticipantLocalDataStorage *)self identifier];
  v3 = [v2 UUIDString];

  return v3;
}

- (void)updateBackupGroupData:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)MEMORY[0x230FBD990]();
  v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "count"));
    int v26 = 138543618;
    v27 = v8;
    __int16 v28 = 2112;
    v29 = v9;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Update backup groups: count(%@)", (uint8_t *)&v26, 0x16u);
  }
  logger = v6->_logger;
  if (os_signpost_enabled(logger))
  {
    LOWORD(v26) = 0;
    _os_signpost_emit_with_name_impl(&dword_22F52A000, logger, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "MediaGroupsParticipantUpdateBackupGroup", "", (uint8_t *)&v26, 2u);
  }
  v11 = [(HMDMediaGroupParticipantLocalDataStorage *)v6 participantData];
  v12 = [v11 backedUpGroups];
  uint64_t v13 = [v12 count];
  if (v13 != [v4 count])
  {

    goto LABEL_11;
  }
  v14 = (void *)MEMORY[0x263EFFA08];
  v15 = [v11 backedUpGroups];
  v16 = [v14 setWithArray:v15];
  v17 = [MEMORY[0x263EFFA08] setWithArray:v4];
  int v18 = [v16 isEqual:v17];

  if (!v18)
  {
LABEL_11:
    v24 = (void *)[v11 mutableCopy];
    v25 = (void *)[v4 mutableCopy];
    [v24 setBackedUpGroups:v25];

    [(HMDMediaGroupParticipantLocalDataStorage *)v6 updateParticipantData:v24];
    goto LABEL_12;
  }
  v19 = (void *)MEMORY[0x230FBD990]();
  v20 = v6;
  v21 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    v22 = HMFGetLogIdentifier();
    v23 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "count"));
    int v26 = 138543618;
    v27 = v22;
    __int16 v28 = 2112;
    v29 = v23;
    _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_INFO, "%{public}@Skipping backup groups update due to no change to values: count(%@)", (uint8_t *)&v26, 0x16u);
  }
LABEL_12:
}

- (void)updateDestinationSupportOptions:(unint64_t)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v5 = (void *)MEMORY[0x230FBD990](self, a2);
  v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    v9 = HMMediaDestinationSupportOptionsAsString();
    int v19 = 138543618;
    v20 = v8;
    __int16 v21 = 2112;
    v22 = v9;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Updating destination support options: %@", (uint8_t *)&v19, 0x16u);
  }
  v10 = [(HMDMediaGroupParticipantLocalDataStorage *)v6 participantData];
  v11 = [v10 destination];

  if (v11)
  {
    v12 = [v10 destination];
    uint64_t v13 = (void *)[v12 mutableCopy];

    [v13 setSupportedOptions:a3];
    [(HMDMediaGroupParticipantLocalDataStorage *)v6 updateMediaDestination:v13];
  }
  else
  {
    v14 = (void *)MEMORY[0x230FBD990]();
    v15 = v6;
    v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = HMFGetLogIdentifier();
      int v18 = HMMediaDestinationSupportOptionsAsString();
      int v19 = 138543618;
      v20 = v17;
      __int16 v21 = 2112;
      v22 = v18;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to update destination support options: %@ due to no destination data", (uint8_t *)&v19, 0x16u);
    }
  }
}

- (void)updateAudioGroupIdentifier:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)MEMORY[0x230FBD990]();
  v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    int v17 = 138543618;
    int v18 = v8;
    __int16 v19 = 2112;
    id v20 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Updating audio group identifier: %@", (uint8_t *)&v17, 0x16u);
  }
  v9 = [(HMDMediaGroupParticipantLocalDataStorage *)v6 participantData];
  v10 = [v9 destination];

  if (v10)
  {
    v11 = [v9 destination];
    v12 = (void *)[v11 mutableCopy];

    [v12 setAudioGroupIdentifier:v4];
    [(HMDMediaGroupParticipantLocalDataStorage *)v6 updateMediaDestination:v12];
  }
  else
  {
    uint64_t v13 = (void *)MEMORY[0x230FBD990]();
    v14 = v6;
    v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = HMFGetLogIdentifier();
      int v17 = 138543618;
      int v18 = v16;
      __int16 v19 = 2112;
      id v20 = v4;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to update audio group identifier: %@ due to no destination data", (uint8_t *)&v17, 0x16u);
    }
  }
}

- (void)updateMediaDestination:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)MEMORY[0x230FBD990]();
  v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    int v18 = 138543618;
    __int16 v19 = v8;
    __int16 v20 = 2112;
    id v21 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Updating media destination: %@", (uint8_t *)&v18, 0x16u);
  }
  logger = v6->_logger;
  if (os_signpost_enabled(logger))
  {
    LOWORD(v18) = 0;
    _os_signpost_emit_with_name_impl(&dword_22F52A000, logger, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "MediaGroupsParticipantUpdateDestination", "", (uint8_t *)&v18, 2u);
  }
  v10 = [(HMDMediaGroupParticipantLocalDataStorage *)v6 participantData];
  v11 = [v10 destination];
  int v12 = HMFEqualObjects();

  if (v12)
  {
    uint64_t v13 = (void *)MEMORY[0x230FBD990]();
    v14 = v6;
    v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = HMFGetLogIdentifier();
      int v18 = 138543618;
      __int16 v19 = v16;
      __int16 v20 = 2112;
      id v21 = v4;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Skipping destination update due to no changed in value: %@", (uint8_t *)&v18, 0x16u);
    }
  }
  else
  {
    int v17 = (void *)[v10 mutableCopy];
    [v17 setDestination:v4];
    [(HMDMediaGroupParticipantLocalDataStorage *)v6 updateParticipantData:v17];
  }
}

- (void)updateDestinationControllerAvailableDestinationIdentifiers:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)MEMORY[0x230FBD990]();
  v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    int v17 = 138543618;
    int v18 = v8;
    __int16 v19 = 2112;
    id v20 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Updating destination controller available destination identifiers: %@", (uint8_t *)&v17, 0x16u);
  }
  v9 = [(HMDMediaGroupParticipantLocalDataStorage *)v6 participantData];
  v10 = [v9 destinationControllerData];

  if (v10)
  {
    v11 = [v9 destinationControllerData];
    int v12 = (void *)[v11 mutableCopy];

    [v12 setAvailableDestinationIdentifiers:v4];
    [(HMDMediaGroupParticipantLocalDataStorage *)v6 updateDestinationControllerData:v12];
  }
  else
  {
    uint64_t v13 = (void *)MEMORY[0x230FBD990]();
    v14 = v6;
    v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = HMFGetLogIdentifier();
      int v17 = 138543618;
      int v18 = v16;
      __int16 v19 = 2112;
      id v20 = v4;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to update destination controller available destination identifiers: %@ due to no controller data", (uint8_t *)&v17, 0x16u);
    }
  }
}

- (void)updateDestinationControllerSupportedOptions:(unint64_t)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v5 = (void *)MEMORY[0x230FBD990](self, a2);
  v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    v9 = HMMediaDestinationControllerSupportOptionsAsString();
    int v19 = 138543618;
    id v20 = v8;
    __int16 v21 = 2112;
    uint64_t v22 = v9;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Updating destination controller supported options: %@", (uint8_t *)&v19, 0x16u);
  }
  v10 = [(HMDMediaGroupParticipantLocalDataStorage *)v6 participantData];
  v11 = [v10 destinationControllerData];

  if (v11)
  {
    int v12 = [v10 destinationControllerData];
    uint64_t v13 = (void *)[v12 mutableCopy];

    [v13 setSupportedOptions:a3];
    [(HMDMediaGroupParticipantLocalDataStorage *)v6 updateDestinationControllerData:v13];
  }
  else
  {
    v14 = (void *)MEMORY[0x230FBD990]();
    v15 = v6;
    v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v17 = HMFGetLogIdentifier();
      int v18 = HMMediaDestinationControllerSupportOptionsAsString();
      int v19 = 138543618;
      id v20 = v17;
      __int16 v21 = 2112;
      uint64_t v22 = v18;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to update destination controller supported options: %@ due to no controller data", (uint8_t *)&v19, 0x16u);
    }
  }
}

- (void)notifyDidChangeDestinationIdentifier:(id)a3 forDestinationControllerIdentifier:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [(HMDMediaGroupParticipantLocalDataStorage *)self delegate];
  v9 = v8;
  if (v8)
  {
    [v8 mediaGroupParticipantLocalDataStorage:self didChangeDestinationIdentifier:v6 forDestinationControllerIdentifier:v7];
  }
  else
  {
    v10 = (void *)MEMORY[0x230FBD990]();
    v11 = self;
    int v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = HMFGetLogIdentifier();
      int v14 = 138543362;
      v15 = v13;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to notify of updated destination identifier due to missing delegate", (uint8_t *)&v14, 0xCu);
    }
  }
}

- (void)updateDestinationControllerDestinationIdentifier:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    int v18 = 138543618;
    int v19 = v8;
    __int16 v20 = 2112;
    id v21 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Updating destinaiton controller destination identifier: %@", (uint8_t *)&v18, 0x16u);
  }
  v9 = [(HMDMediaGroupParticipantLocalDataStorage *)v6 participantData];
  v10 = [v9 destinationControllerData];

  if (v10)
  {
    v11 = [v9 destinationControllerData];
    int v12 = (void *)[v11 mutableCopy];

    [v12 setDestinationIdentifier:v4];
    [(HMDMediaGroupParticipantLocalDataStorage *)v6 updateDestinationControllerData:v12];
    uint64_t v13 = [v12 identifier];
    [(HMDMediaGroupParticipantLocalDataStorage *)v6 notifyDidChangeDestinationIdentifier:v4 forDestinationControllerIdentifier:v13];
  }
  else
  {
    int v14 = (void *)MEMORY[0x230FBD990]();
    v15 = v6;
    uint64_t v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v17 = HMFGetLogIdentifier();
      int v18 = 138543618;
      int v19 = v17;
      __int16 v20 = 2112;
      id v21 = v4;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to update destination controller destination identifier: %@ due to no controller data", (uint8_t *)&v18, 0x16u);
    }
  }
}

- (void)updateDestinationControllerData:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    int v18 = 138543618;
    int v19 = v8;
    __int16 v20 = 2112;
    id v21 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Updating DestinationControllerData: %@", (uint8_t *)&v18, 0x16u);
  }
  logger = v6->_logger;
  if (os_signpost_enabled(logger))
  {
    LOWORD(v18) = 0;
    _os_signpost_emit_with_name_impl(&dword_22F52A000, logger, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "MediaGroupsParticipantUpdateDestinationController", "", (uint8_t *)&v18, 2u);
  }
  v10 = [(HMDMediaGroupParticipantLocalDataStorage *)v6 participantData];
  v11 = [v10 destinationControllerData];
  int v12 = HMFEqualObjects();

  if (v12)
  {
    uint64_t v13 = (void *)MEMORY[0x230FBD990]();
    int v14 = v6;
    v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      uint64_t v16 = HMFGetLogIdentifier();
      int v18 = 138543618;
      int v19 = v16;
      __int16 v20 = 2112;
      id v21 = v4;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Skipping update destination controller due to no change to value: %@", (uint8_t *)&v18, 0x16u);
    }
  }
  else
  {
    int v17 = (void *)[v10 mutableCopy];
    [v17 setDestinationControllerData:v4];
    [(HMDMediaGroupParticipantLocalDataStorage *)v6 updateParticipantData:v17];
  }
}

- (void)updateParticipantData:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    int v11 = 138543618;
    int v12 = v8;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Updating participant data: %@", (uint8_t *)&v11, 0x16u);
  }
  v9 = [(HMDMediaGroupParticipantLocalDataStorage *)v6 userDefaults];
  v10 = [v4 encodeToProtoBufferData];
  [v9 setObject:v10 forKey:@"HMDMediaDestinationControllerLocalDataStorageHandlerObjectDataKey"];

  [(HMDMediaGroupParticipantLocalDataStorage *)v6 publishCachedObject];
}

- (id)eventSource
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v3 = [(HMDMediaGroupParticipantLocalDataStorage *)self dataSource];
  id v4 = v3;
  if (v3)
  {
    v5 = [v3 eventSourceForMediaGroupParticipantDataLocalStorage:self];
  }
  else
  {
    id v6 = (void *)MEMORY[0x230FBD990]();
    id v7 = self;
    v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = HMFGetLogIdentifier();
      int v11 = 138543362;
      int v12 = v9;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to get event source due to no data source", (uint8_t *)&v11, 0xCu);
    }
    v5 = 0;
  }

  return v5;
}

- (id)topicName
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v3 = [(HMDMediaGroupParticipantLocalDataStorage *)self dataSource];
  id v4 = v3;
  if (v3)
  {
    v5 = [v3 topicNameForMediaGroupParticipantDataLocalStorage:self];
  }
  else
  {
    id v6 = (void *)MEMORY[0x230FBD990]();
    id v7 = self;
    v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = HMFGetLogIdentifier();
      int v11 = 138543362;
      int v12 = v9;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to get topic name due to no data source", (uint8_t *)&v11, 0xCu);
    }
    v5 = 0;
  }

  return v5;
}

- (void)publishCachedObject
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  v3 = [(HMDMediaGroupParticipantLocalDataStorage *)self participantData];
  if ([(HMDMediaGroupParticipantLocalDataStorage *)self hasDataToPublishInParticipantData:v3])
  {
    id v4 = [(HMDMediaGroupParticipantLocalDataStorage *)self topicName];
    v5 = [(HMDMediaGroupParticipantLocalDataStorage *)self eventSource];
    id v6 = (void *)MEMORY[0x230FBD990]();
    id v7 = self;
    v8 = HMFGetOSLogHandle();
    v9 = v8;
    if (v4 && v5)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v10 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v24 = v10;
        __int16 v25 = 2112;
        int v26 = v4;
        __int16 v27 = 2112;
        __int16 v28 = v3;
        _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Publishing topic: %@ data: %@", buf, 0x20u);
      }
      id v11 = objc_alloc(MEMORY[0x263F49390]);
      [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
      int v12 = objc_msgSend(v11, "initWithSource:cachePolicy:combineType:timestamp:", v5, 2, 2);
      id v13 = objc_alloc(MEMORY[0x263F49380]);
      id v14 = [v3 encodeToProtoBufferData];
      uint64_t v15 = (void *)[v13 initWithEventData:v14 metadata:v12];

      uint64_t v16 = [(HMDMediaGroupParticipantLocalDataStorage *)v7 eventForwarder];
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __63__HMDMediaGroupParticipantLocalDataStorage_publishCachedObject__block_invoke;
      v22[3] = &unk_264A2F3E8;
      v22[4] = v7;
      [v16 forwardEvent:v15 topic:v4 completion:v22];
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        id v21 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v24 = v21;
        _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to publish data due to no topic name or event source", buf, 0xCu);
      }
    }
  }
  else
  {
    int v17 = (void *)MEMORY[0x230FBD990]();
    int v18 = self;
    int v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      __int16 v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v24 = v20;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, "%{public}@Skipping publish due to no data", buf, 0xCu);
    }
  }
}

void __63__HMDMediaGroupParticipantLocalDataStorage_publishCachedObject__block_invoke(uint64_t a1, void *a2)
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
      id v7 = HMFGetLogIdentifier();
      int v8 = 138543618;
      v9 = v7;
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_ERROR, "%{public}@Forwarding event completed with error: %@", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (void)publishCachedObjectIfNeeded
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = [(HMDMediaGroupParticipantLocalDataStorage *)self participantData];
  if ([(HMDMediaGroupParticipantLocalDataStorage *)self hasDataToPublishInParticipantData:v3])
  {
    id v4 = [(HMDMediaGroupParticipantLocalDataStorage *)self lastCachedEventParticipantData];
    int v5 = HMFEqualObjects();
    id v6 = (void *)MEMORY[0x230FBD990]();
    id v7 = self;
    int v8 = HMFGetOSLogHandle();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
    if (v5)
    {
      if (v9)
      {
        __int16 v10 = HMFGetLogIdentifier();
        int v12 = 138543618;
        id v13 = v10;
        __int16 v14 = 2112;
        uint64_t v15 = v4;
        _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Skipping publish due to last cached event participant data: %@", (uint8_t *)&v12, 0x16u);
      }
    }
    else
    {
      if (v9)
      {
        id v11 = HMFGetLogIdentifier();
        int v12 = 138543362;
        id v13 = v11;
        _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Publishing cached object due to mismatching last cached event data", (uint8_t *)&v12, 0xCu);
      }
      [(HMDMediaGroupParticipantLocalDataStorage *)v7 publishCachedObject];
    }
  }
}

- (BOOL)hasDataToPublishInParticipantData:(id)a3
{
  id v3 = a3;
  id v4 = [v3 destination];
  if (v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    id v6 = [v3 destinationControllerData];
    if (v6)
    {
      BOOL v5 = 1;
    }
    else
    {
      id v7 = [v3 backedUpGroups];
      BOOL v5 = [v7 count] != 0;
    }
  }

  return v5;
}

- (HMMediaDestination)destination
{
  v2 = [(HMDMediaGroupParticipantLocalDataStorage *)self participantData];
  id v3 = [v2 destination];

  return (HMMediaDestination *)v3;
}

- (HMMediaDestinationControllerData)destinationControllerData
{
  v2 = [(HMDMediaGroupParticipantLocalDataStorage *)self participantData];
  id v3 = [v2 destinationControllerData];

  return (HMMediaDestinationControllerData *)v3;
}

- (void)migrateWithExpectedDestinationControllerSupportOptions:(unint64_t)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  BOOL v5 = [(HMDMediaGroupParticipantLocalDataStorage *)self destinationControllerData];
  id v6 = v5;
  if (v5)
  {
    if ([v5 supportedOptions] != a3)
    {
      id v7 = (void *)MEMORY[0x230FBD990]();
      int v8 = self;
      BOOL v9 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        __int16 v10 = HMFGetLogIdentifier();
        id v11 = HMMediaDestinationControllerSupportOptionsAsString();
        int v17 = 138543618;
        int v18 = v10;
        __int16 v19 = 2112;
        __int16 v20 = v11;
        _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Migrating expected destination controller support options: %@", (uint8_t *)&v17, 0x16u);
      }
      [(HMDMediaGroupParticipantLocalDataStorage *)v8 updateDestinationControllerSupportedOptions:a3];
    }
  }
  else
  {
    int v12 = (void *)MEMORY[0x230FBD990]();
    id v13 = self;
    __int16 v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = HMFGetLogIdentifier();
      uint64_t v16 = HMMediaDestinationControllerSupportOptionsAsString();
      int v17 = 138543618;
      int v18 = v15;
      __int16 v19 = 2112;
      __int16 v20 = v16;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, "%{public}@Attempted to migrate with expected support options: %@ without a destination controller", (uint8_t *)&v17, 0x16u);
    }
  }
}

- (id)migratedParticipantData:(id)a3 withDestinationSupportOptions:(unint64_t)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [v6 destination];
  int v8 = v7;
  if (!v7)
  {
    uint64_t v16 = (void *)MEMORY[0x230FBD990]();
    int v17 = self;
    int v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      __int16 v19 = HMFGetLogIdentifier();
      __int16 v20 = HMMediaDestinationSupportOptionsAsString();
      int v22 = 138543618;
      uint64_t v23 = v19;
      __int16 v24 = 2112;
      __int16 v25 = v20;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@Attempted to migrate expected destination support options: %@ without a destination", (uint8_t *)&v22, 0x16u);
    }
    goto LABEL_9;
  }
  if ([v7 supportedOptions] == a4)
  {
LABEL_9:
    id v15 = v6;
    goto LABEL_10;
  }
  BOOL v9 = (void *)MEMORY[0x230FBD990]();
  __int16 v10 = self;
  id v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v12 = HMFGetLogIdentifier();
    id v13 = HMMediaDestinationSupportOptionsAsString();
    int v22 = 138543618;
    uint64_t v23 = v12;
    __int16 v24 = 2112;
    __int16 v25 = v13;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Migrating supported options to: %@", (uint8_t *)&v22, 0x16u);
  }
  __int16 v14 = (void *)[v8 mutableCopy];
  [v14 setSupportedOptions:a4];
  id v15 = (id)[v6 mutableCopy];
  [v15 setDestination:v14];

LABEL_10:
  return v15;
}

- (void)migrateWithExpectedDestinationSupportOptions:(unint64_t)a3
{
  id v6 = [(HMDMediaGroupParticipantLocalDataStorage *)self participantData];
  BOOL v5 = [(HMDMediaGroupParticipantLocalDataStorage *)self migratedParticipantData:v6 withDestinationSupportOptions:a3];
  if (([v6 isEqual:v5] & 1) == 0) {
    [(HMDMediaGroupParticipantLocalDataStorage *)self updateParticipantData:v5];
  }
}

- (id)createDefaultParticipantData
{
  v2 = [HMDMediaGroupsParticipantData alloc];
  id v3 = [(HMDMediaGroupsParticipantData *)v2 initWithDestination:0 destinationControllerData:0 backedUpGroups:MEMORY[0x263EFFA68]];
  return v3;
}

- (id)participantData
{
  v2 = (HMDMediaGroupsParticipantData *)self;
  id v3 = [(HMDMediaGroupParticipantLocalDataStorage *)self protoParticipantData];
  if (v3)
  {
    id v4 = [HMDMediaGroupsParticipantData alloc];
    BOOL v5 = [v3 data];
    v2 = [(HMDMediaGroupsParticipantData *)v4 initWithProtoBufferData:v5];

    if (v2) {
      goto LABEL_5;
    }
    _HMFPreconditionFailure();
  }
  v2 = [(HMDMediaGroupsParticipantData *)v2 createDefaultParticipantData];
LABEL_5:

  return v2;
}

- (id)lastCachedEventParticipantData
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = [(HMDMediaGroupParticipantLocalDataStorage *)self topicName];
  if (v3)
  {
    id v4 = [(HMDMediaGroupParticipantLocalDataStorage *)self eventStoreReadHandle];
    BOOL v5 = [v4 lastEventForTopic:v3];

    if (v5)
    {
      id v6 = [HMDMediaGroupsParticipantData alloc];
      id v7 = [v5 encodedData];
      int v8 = [(HMDMediaGroupsParticipantData *)v6 initWithProtoBufferData:v7];

      if (v8)
      {
        BOOL v9 = v8;
      }
      else
      {
        __int16 v14 = (void *)MEMORY[0x230FBD990]();
        id v15 = self;
        uint64_t v16 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          int v17 = HMFGetLogIdentifier();
          int v18 = [v5 encodedData];
          int v20 = 138543874;
          uint64_t v21 = v17;
          __int16 v22 = 2112;
          uint64_t v23 = v18;
          __int16 v24 = 2112;
          __int16 v25 = v5;
          _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode last cached event participant data: %@ from event: %@", (uint8_t *)&v20, 0x20u);
        }
      }
    }
    else
    {
      int v8 = 0;
    }
  }
  else
  {
    __int16 v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = self;
    int v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = HMFGetLogIdentifier();
      int v20 = 138543362;
      uint64_t v21 = v13;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to get last cached event participant data due to missing topic name", (uint8_t *)&v20, 0xCu);
    }
    int v8 = 0;
  }

  return v8;
}

- (id)protoParticipantData
{
  v2 = [(HMDMediaGroupParticipantLocalDataStorage *)self userDefaults];
  id v3 = [v2 dataForKey:@"HMDMediaDestinationControllerLocalDataStorageHandlerObjectDataKey"];

  if (v3)
  {
    id v4 = (void *)[objc_alloc(MEMORY[0x263F0E500]) initWithData:v3];
    if (v4) {
      goto LABEL_5;
    }
    _HMFPreconditionFailure();
  }
  id v4 = 0;
LABEL_5:

  return v4;
}

- (void)configureWithHome:(id)a3 messageDispatcher:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int v8 = (void *)MEMORY[0x230FBD990]();
  BOOL v9 = self;
  __int16 v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    int v13 = 138543362;
    __int16 v14 = v11;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Configuring media groups participant local storage", (uint8_t *)&v13, 0xCu);
  }
  int v12 = [(HMDMediaGroupParticipantLocalDataStorage *)v9 groupsBackupReceiver];
  [v12 configureWithHome:v6 messageDispatcher:v7];

  [(HMDMediaGroupParticipantLocalDataStorage *)v9 publishCachedObjectIfNeeded];
}

- (HMDMediaGroupParticipantLocalDataStorage)initWithIdentifier:(id)a3 backUpReciever:(id)a4 userDefaults:(id)a5 eventForwarder:(id)a6 eventStoreReadHandle:(id)a7 featuresDataSource:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id obj = a6;
  id v18 = a6;
  id v34 = a7;
  id v19 = a7;
  id v35 = a8;
  id v20 = a8;
  if (!v15)
  {
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  if (!v16)
  {
LABEL_11:
    _HMFPreconditionFailure();
    goto LABEL_12;
  }
  if (!v17)
  {
LABEL_12:
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
  uint64_t v21 = v20;
  if (!v20)
  {
LABEL_15:
    uint64_t v26 = (HMDMediaGroupParticipantLocalDataStorage *)_HMFPreconditionFailure();
    return [(HMDMediaGroupParticipantLocalDataStorage *)v26 initWithIdentifier:v28 backUpReciever:v29 userDefaults:v30 eventForwarder:v31 eventStoreReadHandle:v32];
  }
  v36.receiver = self;
  v36.super_class = (Class)HMDMediaGroupParticipantLocalDataStorage;
  __int16 v22 = [(HMDMediaGroupParticipantLocalDataStorage *)&v36 init];
  if (v22)
  {
    uint64_t v23 = HMFGetOSLogHandle();
    logger = v22->_logger;
    v22->_logger = (OS_os_log *)v23;

    objc_storeStrong((id *)&v22->_identifier, a3);
    objc_storeStrong((id *)&v22->_groupsBackupReceiver, a4);
    objc_storeStrong((id *)&v22->_userDefaults, a5);
    objc_storeStrong((id *)&v22->_eventForwarder, obj);
    objc_storeStrong((id *)&v22->_eventStoreReadHandle, v34);
    objc_storeStrong((id *)&v22->_featuresDataSource, v35);
  }

  return v22;
}

- (HMDMediaGroupParticipantLocalDataStorage)initWithIdentifier:(id)a3 backUpReciever:(id)a4 userDefaults:(id)a5 eventForwarder:(id)a6 eventStoreReadHandle:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = objc_alloc_init(HMDFeaturesDataSource);
  id v18 = [(HMDMediaGroupParticipantLocalDataStorage *)self initWithIdentifier:v16 backUpReciever:v15 userDefaults:v14 eventForwarder:v13 eventStoreReadHandle:v12 featuresDataSource:v17];

  return v18;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t39 != -1) {
    dispatch_once(&logCategory__hmf_once_t39, &__block_literal_global_9870);
  }
  v2 = (void *)logCategory__hmf_once_v40;
  return v2;
}

void __55__HMDMediaGroupParticipantLocalDataStorage_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v40;
  logCategory__hmf_once_v40 = v0;
}

@end