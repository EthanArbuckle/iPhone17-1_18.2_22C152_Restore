@interface HMDMediaGroupsLocalDataStorage
+ (id)logCategory;
- (HMDMediaGroupsAggregatorBackupSender)backupDataSender;
- (HMDMediaGroupsLocalDataStorage)initWithIdentifier:(id)a3 backupSender:(id)a4;
- (HMDMediaGroupsLocalDataStorageDataSource)dataSource;
- (NSArray)groups;
- (NSUUID)identifier;
- (id)allParticipantAccessoryUUIDs;
- (id)associatedGroupIdentifierForParticipantAccessoryUUID:(id)a3;
- (id)associatedGroupsWithGroupIdentifier:(id)a3;
- (id)backupGroupsForParticipantAccessoryUUID:(id)a3;
- (id)groupWithIdentifier:(id)a3;
- (id)logIdentifier;
- (id)nullSentinelUUID;
- (id)receiverForParticipantAccessoryUUID:(id)a3;
- (id)routerForParticipantAccessoryUUID:(id)a3;
- (void)addBackedUpGroup:(id)a3;
- (void)addBackedUpGroups:(id)a3;
- (void)backupData;
- (void)clearCachedData;
- (void)clearCachedDataForParticipantAccessoryUUID:(id)a3;
- (void)removeAssociatedGroupIdentifierForParticipantAccessoryUUID:(id)a3;
- (void)removeGroupWithIdentifier:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setParticipantAccessoryUUID:(id)a3 associatedGroupIdentifier:(id)a4;
- (void)unsetParticipantAccessoryUUIDsWithAssociatedGroupIdentifier:(id)a3;
- (void)updateGroup:(id)a3;
- (void)updateGroup:(id)a3 participantAccessoryUUIDs:(id)a4;
- (void)updateUsingParticipantAccessoryUUID:(id)a3 associatedGroupIdentifier:(id)a4 backedUpGroupData:(id)a5;
@end

@implementation HMDMediaGroupsLocalDataStorage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backupDataSender, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_participantAccessoryUUIDToAssociatedGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_groups, 0);
}

- (HMDMediaGroupsAggregatorBackupSender)backupDataSender
{
  return (HMDMediaGroupsAggregatorBackupSender *)objc_getProperty(self, a2, 48, 1);
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDataSource:(id)a3
{
}

- (HMDMediaGroupsLocalDataStorageDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (HMDMediaGroupsLocalDataStorageDataSource *)WeakRetained;
}

- (id)logIdentifier
{
  v2 = [(HMDMediaGroupsLocalDataStorage *)self identifier];
  v3 = [v2 UUIDString];

  return v3;
}

- (id)receiverForParticipantAccessoryUUID:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HMDMediaGroupsLocalDataStorage *)self dataSource];
  v6 = v5;
  if (v5)
  {
    v7 = [v5 receiverForParticipantAccessoryUUID:v4 mediaGroupsLocalDataStorage:self];
  }
  else
  {
    v8 = (void *)MEMORY[0x230FBD990]();
    v9 = self;
    v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = HMFGetLogIdentifier();
      int v13 = 138543618;
      v14 = v11;
      __int16 v15 = 2112;
      id v16 = v4;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Failed to get receiver for participant accessory UUID: %@ due to no data source", (uint8_t *)&v13, 0x16u);
    }
    v7 = 0;
  }

  return v7;
}

- (id)routerForParticipantAccessoryUUID:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HMDMediaGroupsLocalDataStorage *)self dataSource];
  v6 = v5;
  if (v5)
  {
    v7 = [v5 routerForParticipantAccessoryUUID:v4 mediaGroupsLocalDataStorage:self];
  }
  else
  {
    v8 = (void *)MEMORY[0x230FBD990]();
    v9 = self;
    v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = HMFGetLogIdentifier();
      int v13 = 138543618;
      v14 = v11;
      __int16 v15 = 2112;
      id v16 = v4;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Failed to get router for participant accessory UUID: %@ due to no data source", (uint8_t *)&v13, 0x16u);
    }
    v7 = 0;
  }

  return v7;
}

- (void)removeGroupWithIdentifier:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)MEMORY[0x230FBD990]();
  v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    int v9 = 138543618;
    v10 = v8;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Remove group with identifier: %@", (uint8_t *)&v9, 0x16u);
  }
  [(HMDMediaGroupsLocalDataStorage *)v6 unsetParticipantAccessoryUUIDsWithAssociatedGroupIdentifier:v4];
  os_unfair_lock_lock_with_options();
  [(NSMutableDictionary *)v6->_groups removeObjectForKey:v4];
  os_unfair_lock_unlock(&v6->_lock);
}

- (void)updateGroup:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)MEMORY[0x230FBD990]();
  v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    int v12 = 138543618;
    uint64_t v13 = v8;
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Update group: %@", (uint8_t *)&v12, 0x16u);
  }
  p_lock = &v6->_lock;
  os_unfair_lock_lock_with_options();
  groups = v6->_groups;
  __int16 v11 = [v4 identifier];
  [(NSMutableDictionary *)groups setObject:v4 forKey:v11];

  os_unfair_lock_unlock(p_lock);
}

- (void)addBackedUpGroup:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  groups = self->_groups;
  v6 = [v4 identifier];
  v7 = [(NSMutableDictionary *)groups objectForKey:v6];

  if (v7)
  {
    os_unfair_lock_unlock(&self->_lock);
    int v8 = [v7 isEqual:v4];
    int v9 = (void *)MEMORY[0x230FBD990]();
    v10 = self;
    __int16 v11 = HMFGetOSLogHandle();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
    if (v8)
    {
      if (v12)
      {
        uint64_t v13 = HMFGetLogIdentifier();
        int v19 = 138543618;
        v20 = v13;
        __int16 v21 = 2112;
        id v22 = v4;
        _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Already added backed up group: %@", (uint8_t *)&v19, 0x16u);
      }
    }
    else if (v12)
    {
      v18 = HMFGetLogIdentifier();
      int v19 = 138543874;
      v20 = v18;
      __int16 v21 = 2112;
      id v22 = v4;
      __int16 v23 = 2112;
      v24 = v7;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Dropping backed up group: %@ existing group: %@", (uint8_t *)&v19, 0x20u);
    }
  }
  else
  {
    __int16 v14 = self->_groups;
    id v15 = [v4 identifier];
    [(NSMutableDictionary *)v14 setObject:v4 forKey:v15];

    os_unfair_lock_unlock(&self->_lock);
    int v9 = (void *)MEMORY[0x230FBD990]();
    uint64_t v16 = self;
    __int16 v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v17 = HMFGetLogIdentifier();
      int v19 = 138543618;
      v20 = v17;
      __int16 v21 = 2112;
      id v22 = v4;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Added backed up group: %@", (uint8_t *)&v19, 0x16u);
    }
  }
}

- (void)addBackedUpGroups:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __52__HMDMediaGroupsLocalDataStorage_addBackedUpGroups___block_invoke;
  v3[3] = &unk_264A1E490;
  v3[4] = self;
  objc_msgSend(a3, "na_each:", v3);
}

uint64_t __52__HMDMediaGroupsLocalDataStorage_addBackedUpGroups___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addBackedUpGroup:a2];
}

- (id)groupWithIdentifier:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v6 = [(NSMutableDictionary *)self->_groups objectForKey:v4];
  os_unfair_lock_unlock(p_lock);

  return v6;
}

- (NSArray)groups
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = [(NSMutableDictionary *)self->_groups allValues];
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (void)setParticipantAccessoryUUID:(id)a3 associatedGroupIdentifier:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int v8 = (void *)MEMORY[0x230FBD990]();
  int v9 = self;
  v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    __int16 v11 = HMFGetLogIdentifier();
    int v14 = 138543874;
    id v15 = v11;
    __int16 v16 = 2112;
    id v17 = v6;
    __int16 v18 = 2112;
    id v19 = v7;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Setting participant accessory uuid: %@ associated group identifier: %@", (uint8_t *)&v14, 0x20u);
  }
  os_unfair_lock_lock_with_options();
  participantAccessoryUUIDToAssociatedGroupIdentifier = v9->_participantAccessoryUUIDToAssociatedGroupIdentifier;
  uint64_t v13 = v7;
  if (!v7)
  {
    uint64_t v13 = [(HMDMediaGroupsLocalDataStorage *)v9 nullSentinelUUID];
  }
  [(NSMutableDictionary *)participantAccessoryUUIDToAssociatedGroupIdentifier setObject:v13 forKey:v6];
  if (!v7) {

  }
  os_unfair_lock_unlock(&v9->_lock);
}

- (id)nullSentinelUUID
{
  v2 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"00000000-0000-0000-0000-000000000000"];
  return v2;
}

- (void)unsetParticipantAccessoryUUIDsWithAssociatedGroupIdentifier:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    int v14 = v8;
    __int16 v15 = 2112;
    id v16 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Unsetting participant accessory uuids with associated group identifier: %@", buf, 0x16u);
  }
  os_unfair_lock_lock_with_options();
  int v9 = [(NSMutableDictionary *)v6->_participantAccessoryUUIDToAssociatedGroupIdentifier allKeys];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __94__HMDMediaGroupsLocalDataStorage_unsetParticipantAccessoryUUIDsWithAssociatedGroupIdentifier___block_invoke;
  v11[3] = &unk_264A1E448;
  v11[4] = v6;
  id v10 = v4;
  id v12 = v10;
  objc_msgSend(v9, "na_each:", v11);

  os_unfair_lock_unlock(&v6->_lock);
}

void __94__HMDMediaGroupsLocalDataStorage_unsetParticipantAccessoryUUIDsWithAssociatedGroupIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  v3 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "objectForKey:");
  if (objc_msgSend(v3, "hmf_isEqualToUUID:", *(void *)(a1 + 40)))
  {
    id v4 = *(void **)(a1 + 32);
    v5 = (void *)v4[3];
    id v6 = [v4 nullSentinelUUID];
    [v5 setObject:v6 forKey:v7];
  }
}

- (id)associatedGroupIdentifierForParticipantAccessoryUUID:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v6 = [(NSMutableDictionary *)self->_participantAccessoryUUIDToAssociatedGroupIdentifier objectForKey:v4];
  id v7 = [(HMDMediaGroupsLocalDataStorage *)self nullSentinelUUID];
  if (objc_msgSend(v6, "hmf_isEqualToUUID:", v7)) {
    int v8 = 0;
  }
  else {
    int v8 = v6;
  }
  id v9 = v8;

  os_unfair_lock_unlock(p_lock);
  return v9;
}

- (void)removeAssociatedGroupIdentifierForParticipantAccessoryUUID:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  [(NSMutableDictionary *)self->_participantAccessoryUUIDToAssociatedGroupIdentifier removeObjectForKey:v4];
  os_unfair_lock_unlock(&self->_lock);
}

- (id)allParticipantAccessoryUUIDs
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = [(NSMutableDictionary *)self->_participantAccessoryUUIDToAssociatedGroupIdentifier allKeys];
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)clearCachedDataForParticipantAccessoryUUID:(id)a3
{
  id v4 = a3;
  [(HMDMediaGroupsLocalDataStorage *)self removeAssociatedGroupIdentifierForParticipantAccessoryUUID:v4];
  id v5 = [(HMDMediaGroupsLocalDataStorage *)self backupDataSender];
  [v5 clearCachedDataForParticipantAccessoryUUID:v4];
}

- (void)clearCachedData
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = [MEMORY[0x263EFF9A0] dictionary];
  groups = self->_groups;
  self->_groups = v4;

  id v6 = [MEMORY[0x263EFF9A0] dictionary];
  participantAccessoryUUIDToAssociatedGroupIdentifier = self->_participantAccessoryUUIDToAssociatedGroupIdentifier;
  self->_participantAccessoryUUIDToAssociatedGroupIdentifier = v6;

  os_unfair_lock_unlock(p_lock);
  id v8 = [(HMDMediaGroupsLocalDataStorage *)self backupDataSender];
  [v8 clearCachedData];
}

- (id)associatedGroupsWithGroupIdentifier:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDMediaGroupsLocalDataStorage *)self groups];
  id v6 = (void *)[v5 mutableCopy];

  id v7 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  if (v4)
  {
    uint64_t v8 = MEMORY[0x263EF8330];
    while (1)
    {
      v17[0] = v8;
      v17[1] = 3221225472;
      v17[2] = __70__HMDMediaGroupsLocalDataStorage_associatedGroupsWithGroupIdentifier___block_invoke;
      v17[3] = &unk_264A21C50;
      id v9 = v4;
      id v18 = v9;
      uint64_t v10 = objc_msgSend(v6, "na_firstObjectPassingTest:", v17);
      if (!v10) {
        break;
      }
      __int16 v11 = (void *)v10;
      [v6 removeObject:v10];
      [v7 addObject:v11];
      id v4 = [v11 associatedGroupIdentifier];

      if (!v4) {
        goto LABEL_9;
      }
    }
    id v12 = (void *)MEMORY[0x230FBD990]();
    uint64_t v13 = self;
    int v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      __int16 v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v20 = v15;
      __int16 v21 = 2112;
      id v22 = v9;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to find associated group with identifier: %@", buf, 0x16u);
    }
  }
LABEL_9:

  return v7;
}

uint64_t __70__HMDMediaGroupsLocalDataStorage_associatedGroupsWithGroupIdentifier___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  v3 = [a2 identifier];
  uint64_t v4 = objc_msgSend(v2, "hmf_isEqualToUUID:", v3);

  return v4;
}

- (id)backupGroupsForParticipantAccessoryUUID:(id)a3
{
  uint64_t v4 = [(HMDMediaGroupsLocalDataStorage *)self associatedGroupIdentifierForParticipantAccessoryUUID:a3];
  if (v4)
  {
    id v5 = [(HMDMediaGroupsLocalDataStorage *)self associatedGroupsWithGroupIdentifier:v4];
  }
  else
  {
    id v5 = (void *)MEMORY[0x263EFFA68];
  }
  id v6 = objc_msgSend(v5, "na_map:", &__block_literal_global_99147);

  return v6;
}

uint64_t __74__HMDMediaGroupsLocalDataStorage_backupGroupsForParticipantAccessoryUUID___block_invoke(uint64_t a1, void *a2)
{
  return [a2 encodeToProtoBufferData];
}

- (void)backupData
{
  v3 = [(HMDMediaGroupsLocalDataStorage *)self allParticipantAccessoryUUIDs];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __44__HMDMediaGroupsLocalDataStorage_backupData__block_invoke;
  v4[3] = &unk_264A27F00;
  v4[4] = self;
  objc_msgSend(v3, "na_each:", v4);
}

void __44__HMDMediaGroupsLocalDataStorage_backupData__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 backupDataSender];
  [v4 sendBackupToParticipantAccessoryUUID:v3];
}

- (void)updateGroup:(id)a3 participantAccessoryUUIDs:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x230FBD990]();
  id v9 = self;
  uint64_t v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    __int16 v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    __int16 v21 = v11;
    __int16 v22 = 2112;
    id v23 = v6;
    __int16 v24 = 2112;
    id v25 = v7;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Updating using group: %@ participant accessory uuids: %@", buf, 0x20u);
  }
  id v12 = [v6 identifier];
  [(HMDMediaGroupsLocalDataStorage *)v9 unsetParticipantAccessoryUUIDsWithAssociatedGroupIdentifier:v12];

  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  id v16 = __72__HMDMediaGroupsLocalDataStorage_updateGroup_participantAccessoryUUIDs___block_invoke;
  uint64_t v17 = &unk_264A1E448;
  id v18 = v9;
  id v19 = v6;
  id v13 = v6;
  objc_msgSend(v7, "na_each:", &v14);
  -[HMDMediaGroupsLocalDataStorage updateGroup:](v9, "updateGroup:", v13, v14, v15, v16, v17, v18);
}

void __72__HMDMediaGroupsLocalDataStorage_updateGroup_participantAccessoryUUIDs___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  id v4 = a2;
  id v5 = [v3 identifier];
  [v2 setParticipantAccessoryUUID:v4 associatedGroupIdentifier:v5];
}

- (void)updateUsingParticipantAccessoryUUID:(id)a3 associatedGroupIdentifier:(id)a4 backedUpGroupData:(id)a5
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __int16 v11 = (void *)MEMORY[0x230FBD990]();
  id v12 = self;
  id v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint64_t v14 = HMFGetLogIdentifier();
    uint64_t v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
    int v23 = 138544130;
    __int16 v24 = v14;
    __int16 v25 = 2112;
    id v26 = v8;
    __int16 v27 = 2112;
    id v28 = v9;
    __int16 v29 = 2112;
    v30 = v15;
    _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Updating using participant accessory uuid: %@ associated group identifier: %@ backup data count: %@", (uint8_t *)&v23, 0x2Au);
  }
  id v16 = [MEMORY[0x263F0E4D8] groupsWithProtoBufferData:v10];
  uint64_t v17 = [v16 count];
  if (v17 == [v10 count])
  {
    [(HMDMediaGroupsLocalDataStorage *)v12 setParticipantAccessoryUUID:v8 associatedGroupIdentifier:v9];
    [(HMDMediaGroupsLocalDataStorage *)v12 addBackedUpGroups:v16];
  }
  else
  {
    id v18 = (void *)MEMORY[0x230FBD990]();
    id v19 = v12;
    uint64_t v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      __int16 v21 = HMFGetLogIdentifier();
      __int16 v22 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
      int v23 = 138543874;
      __int16 v24 = v21;
      __int16 v25 = 2112;
      id v26 = v22;
      __int16 v27 = 2112;
      id v28 = v16;
      _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_INFO, "%{public}@Failed to decode all encoded groups of count: %@ decoded groups: %@", (uint8_t *)&v23, 0x20u);
    }
  }
}

- (HMDMediaGroupsLocalDataStorage)initWithIdentifier:(id)a3 backupSender:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HMDMediaGroupsLocalDataStorage;
  id v9 = [(HMDMediaGroupsLocalDataStorage *)&v16 init];
  id v10 = v9;
  if (v9)
  {
    v9->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v9->_identifier, a3);
    objc_storeStrong((id *)&v10->_backupDataSender, a4);
    uint64_t v11 = [MEMORY[0x263EFF9A0] dictionary];
    groups = v10->_groups;
    v10->_groups = (NSMutableDictionary *)v11;

    uint64_t v13 = [MEMORY[0x263EFF9A0] dictionary];
    participantAccessoryUUIDToAssociatedGroupIdentifier = v10->_participantAccessoryUUIDToAssociatedGroupIdentifier;
    v10->_participantAccessoryUUIDToAssociatedGroupIdentifier = (NSMutableDictionary *)v13;
  }
  return v10;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t24_99162 != -1) {
    dispatch_once(&logCategory__hmf_once_t24_99162, &__block_literal_global_11_99163);
  }
  v2 = (void *)logCategory__hmf_once_v25_99164;
  return v2;
}

void __45__HMDMediaGroupsLocalDataStorage_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v25_99164;
  logCategory__hmf_once_v25_99164 = v0;
}

@end