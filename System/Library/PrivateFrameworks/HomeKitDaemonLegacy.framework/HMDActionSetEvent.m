@interface HMDActionSetEvent
- (BOOL)shouldTriggerMicroLocationLocalizationScanForLogEventObserver:(id)a3;
- (BOOL)shouldTriggerMicroLocationRecordingScanForLogEventObserver:(id)a3;
- (HMDActionSetEvent)initWithActionSet:(id)a3 source:(unint64_t)a4 numAccessories:(unsigned int)a5 bundleId:(id)a6 transactionId:(id)a7;
- (HMDHome)home;
- (NSArray)accessoryUUIDs;
- (NSArray)accessoryUniqueIdentifiers;
- (NSString)actionSetName;
- (NSString)actionSetType;
- (NSString)bundleId;
- (NSString)clientMetricIdentifier;
- (NSString)homeName;
- (NSString)serializedIdentifier;
- (NSUUID)actionSetUUID;
- (NSUUID)actionSetUniqueIdentifier;
- (NSUUID)transactionId;
- (id)biomeEventsRepresentationForLogObserver:(id)a3;
- (id)microLocationMetadataForLogEventObserver:(id)a3;
- (unint64_t)microLocationScanTriggerTypeForLogEventObserver:(id)a3;
- (unint64_t)triggerSource;
- (unsigned)numAccessoriesInHome;
- (unsigned)numAccessoriesModified;
- (unsigned)numNonEmptyScenesInHome;
@end

@implementation HMDActionSetEvent

- (id)biomeEventsRepresentationForLogObserver:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMDActionSetEvent *)self home];
  v6 = v5;
  if (v5)
  {
    v42 = v5;
    id v43 = v4;
    if (self)
    {
      v7 = (objc_class *)MEMORY[0x1E4F28C18];
      id v8 = v5;
      id v9 = [v7 alloc];
      v10 = [(HMMDatedHomeLogEvent *)self startDate];
      v11 = [(HMMDatedHomeLogEvent *)self endDate];
      v12 = (void *)[v9 initWithStartDate:v10 endDate:v11];

      id v13 = objc_alloc(MEMORY[0x1E4F50370]);
      v14 = [v8 spiClientIdentifier];
      v15 = [v14 UUIDString];
      uint64_t v16 = [v8 atHomeLevel];

      BOOL v17 = (v16 & 0xFFFFFFFFFFFFFFFELL) == 2;
      unint64_t v18 = [(HMDActionSetEvent *)self triggerSource];
      if (v18 > 9) {
        v19 = @"Unknown";
      }
      else {
        v19 = off_1E6A07FB8[v18];
      }
      v25 = v19;
      v26 = [(HMDActionSetEvent *)self bundleId];
      v27 = [(HMDActionSetEvent *)self clientMetricIdentifier];
      if (v27)
      {
        v28 = (void *)[v13 initWithDateInterval:v12 homeUniqueIdentifier:v15 homeOccupancy:v17 source:v25 clientName:v26 eventCorrelationIdentifier:v27];
      }
      else
      {
        [MEMORY[0x1E4F29128] UUID];
        v41 = v14;
        v30 = v29 = v12;
        v31 = [v30 UUIDString];
        v28 = (void *)[v13 initWithDateInterval:v29 homeUniqueIdentifier:v15 homeOccupancy:v17 source:v25 clientName:v26 eventCorrelationIdentifier:v31];

        v12 = v29;
        v14 = v41;
      }
    }
    else
    {
      v28 = 0;
    }
    id v32 = objc_alloc(MEMORY[0x1E4F50360]);
    v33 = [(HMDActionSetEvent *)self actionSetUniqueIdentifier];
    v34 = [v33 UUIDString];
    v35 = [(HMDActionSetEvent *)self actionSetType];
    v36 = [(HMDActionSetEvent *)self accessoryUniqueIdentifiers];
    v37 = [(HMDActionSetEvent *)self actionSetName];
    v6 = v42;
    v38 = [v42 name];
    v39 = (void *)[v32 initWithBase:v28 actionSetUniqueIdentifier:v34 actionSetType:v35 associatedAccessoryUniqueIdentifiers:v36 actionSetName:v37 homeName:v38];
    v44 = v39;
    v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v44 count:1];

    id v4 = v43;
  }
  else
  {
    v20 = (void *)MEMORY[0x1D9452090]();
    v21 = self;
    v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v46 = v23;
      _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_ERROR, "%{public}@Unable to log action set event metadata to biome, no home", buf, 0xCu);
    }
    v24 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v24;
}

- (unint64_t)microLocationScanTriggerTypeForLogEventObserver:(id)a3
{
  return 2;
}

- (BOOL)shouldTriggerMicroLocationRecordingScanForLogEventObserver:(id)a3
{
  unsigned int v4 = [(HMDActionSetEvent *)self numAccessoriesInHome];
  unsigned int v5 = [(HMDActionSetEvent *)self numNonEmptyScenesInHome];
  unint64_t v6 = [(HMDActionSetEvent *)self triggerSource];
  if (v5 + (unint64_t)v4 > 3) {
    return (v6 < 7) & (0x67u >> v6);
  }
  else {
    return 0;
  }
}

- (BOOL)shouldTriggerMicroLocationLocalizationScanForLogEventObserver:(id)a3
{
  unsigned int v4 = [(HMDActionSetEvent *)self numAccessoriesInHome];
  unsigned int v5 = [(HMDActionSetEvent *)self numNonEmptyScenesInHome];
  unint64_t v6 = [(HMDActionSetEvent *)self triggerSource];
  if (v5 + (unint64_t)v4 > 3) {
    return (v6 < 7) & (0x67u >> v6);
  }
  else {
    return 0;
  }
}

- (id)microLocationMetadataForLogEventObserver:(id)a3
{
  unsigned int v4 = (void *)MEMORY[0x1E4F77EF0];
  unsigned int v5 = [(HMDActionSetEvent *)self actionSetUniqueIdentifier];
  unint64_t v6 = [v5 UUIDString];
  v7 = [(HMDActionSetEvent *)self actionSetName];
  id v8 = [(HMDActionSetEvent *)self actionSetType];
  id v9 = [(HMDActionSetEvent *)self bundleId];
  unint64_t v10 = [(HMDActionSetEvent *)self triggerSource];
  if (v10 > 9) {
    v11 = @"Unknown";
  }
  else {
    v11 = off_1E6A07FB8[v10];
  }
  if (v9) {
    v12 = v9;
  }
  else {
    v12 = @"Unknown";
  }
  id v13 = v11;
  v14 = [(HMDActionSetEvent *)self homeName];
  v15 = [v4 metadataForHomekitActionSetEventWithUUID:v6 name:v7 type:v8 clientName:v12 source:v13 homeName:v14];

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryUniqueIdentifiers, 0);
  objc_storeStrong((id *)&self->_accessoryUUIDs, 0);
  objc_storeStrong((id *)&self->_homeName, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_actionSetType, 0);
  objc_storeStrong((id *)&self->_actionSetName, 0);
  objc_storeStrong((id *)&self->_serializedIdentifier, 0);
  objc_storeStrong((id *)&self->_clientMetricIdentifier, 0);
  objc_storeStrong((id *)&self->_transactionId, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_actionSetUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_actionSetUUID, 0);
}

- (NSArray)accessoryUniqueIdentifiers
{
  return self->_accessoryUniqueIdentifiers;
}

- (NSArray)accessoryUUIDs
{
  return self->_accessoryUUIDs;
}

- (NSString)homeName
{
  return (NSString *)objc_getProperty(self, a2, 168, 1);
}

- (HMDHome)home
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  return (HMDHome *)WeakRetained;
}

- (NSString)actionSetType
{
  return self->_actionSetType;
}

- (NSString)actionSetName
{
  return self->_actionSetName;
}

- (NSString)serializedIdentifier
{
  return self->_serializedIdentifier;
}

- (unsigned)numNonEmptyScenesInHome
{
  return self->_numNonEmptyScenesInHome;
}

- (unsigned)numAccessoriesInHome
{
  return self->_numAccessoriesInHome;
}

- (unsigned)numAccessoriesModified
{
  return self->_numAccessoriesModified;
}

- (NSString)clientMetricIdentifier
{
  return self->_clientMetricIdentifier;
}

- (NSUUID)transactionId
{
  return self->_transactionId;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (NSUUID)actionSetUniqueIdentifier
{
  return self->_actionSetUniqueIdentifier;
}

- (NSUUID)actionSetUUID
{
  return self->_actionSetUUID;
}

- (unint64_t)triggerSource
{
  return self->_triggerSource;
}

- (HMDActionSetEvent)initWithActionSet:(id)a3 source:(unint64_t)a4 numAccessories:(unsigned int)a5 bundleId:(id)a6 transactionId:(id)a7
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  v15 = [v12 home];
  uint64_t v16 = [v15 uuid];
  v55.receiver = self;
  v55.super_class = (Class)HMDActionSetEvent;
  BOOL v17 = [(HMMDatedHomeLogEvent *)&v55 initWithHomeUUID:v16];

  if (v17)
  {
    unint64_t v18 = [v12 home];
    v19 = [MEMORY[0x1E4F653F0] currentActivity];
    uint64_t v20 = [v19 clientMetricIdentifier];
    clientMetricIdentifier = v17->_clientMetricIdentifier;
    v17->_clientMetricIdentifier = (NSString *)v20;

    v22 = [v12 uuid];
    uint64_t v23 = [v22 copy];
    actionSetUUID = v17->_actionSetUUID;
    v17->_actionSetUUID = (NSUUID *)v23;

    v25 = [v12 spiClientIdentifier];
    uint64_t v26 = [v25 copy];
    actionSetUniqueIdentifier = v17->_actionSetUniqueIdentifier;
    v17->_actionSetUniqueIdentifier = (NSUUID *)v26;

    v17->_numAccessoriesModified = a5;
    v28 = [v18 accessories];
    v17->_numAccessoriesInHome = [v28 count];

    v29 = [v18 actionSets];
    v30 = (void *)[v29 copy];

    v31 = objc_msgSend(v30, "na_filter:", &__block_literal_global_83354);
    v17->_numNonEmptyScenesInHome = [v31 count];

    v17->_triggerSource = a4;
    uint64_t v32 = [v13 copy];
    bundleId = v17->_bundleId;
    v17->_bundleId = (NSString *)v32;

    uint64_t v34 = [v14 copy];
    transactionId = v17->_transactionId;
    v17->_transactionId = (NSUUID *)v34;

    v36 = [v12 serializedIdentifier];
    uint64_t v37 = [v36 copy];
    serializedIdentifier = v17->_serializedIdentifier;
    v17->_serializedIdentifier = (NSString *)v37;

    v39 = [v12 name];
    uint64_t v40 = [v39 copy];
    actionSetName = v17->_actionSetName;
    v17->_actionSetName = (NSString *)v40;

    v42 = [v12 type];
    uint64_t v43 = [v42 copy];
    actionSetType = v17->_actionSetType;
    v17->_actionSetType = (NSString *)v43;

    objc_storeWeak((id *)&v17->_home, v18);
    v45 = [v18 name];
    uint64_t v46 = [v45 copy];
    homeName = v17->_homeName;
    v17->_homeName = (NSString *)v46;

    v48 = [v12 associatedAccessories];
    uint64_t v49 = objc_msgSend(v48, "na_map:", &__block_literal_global_3_83355);
    accessoryUUIDs = v17->_accessoryUUIDs;
    v17->_accessoryUUIDs = (NSArray *)v49;

    v51 = [v12 associatedAccessories];
    uint64_t v52 = objc_msgSend(v51, "na_map:", &__block_literal_global_5_83356);
    accessoryUniqueIdentifiers = v17->_accessoryUniqueIdentifiers;
    v17->_accessoryUniqueIdentifiers = (NSArray *)v52;
  }
  return v17;
}

id __84__HMDActionSetEvent_initWithActionSet_source_numAccessories_bundleId_transactionId___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = [a2 spiClientIdentifier];
  v3 = [v2 UUIDString];

  return v3;
}

id __84__HMDActionSetEvent_initWithActionSet_source_numAccessories_bundleId_transactionId___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 uuid];
  v3 = [v2 UUIDString];

  return v3;
}

BOOL __84__HMDActionSetEvent_initWithActionSet_source_numAccessories_bundleId_transactionId___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 actions];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

@end