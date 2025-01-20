@interface DNDSGlobalConfigurationStore
- (DNDSGlobalConfigurationStore)initWithBackingStore:(id)a3 syncEngine:(id)a4 idsSyncEngine:(id)a5;
- (DNDSGlobalConfigurationStoreDelegate)delegate;
- (id)_createConfigurationFromCKRecord:(id)a3;
- (id)_createConfigurationFromDNDSIDSRecord:(id)a3;
- (id)_lock_existingConfiguration;
- (id)_lock_mutableExistingConfigurationInStore:(id)a3;
- (id)backingStore:(id)a3 migrateDictionaryRepresentation:(id)a4 fromVersionNumber:(unint64_t)a5 toVersionNumber:(unint64_t)a6;
- (id)readRecordWithError:(id *)a3;
- (id)recordIDsForIDSSyncEngine:(id)a3;
- (id)recordIDsForSyncEngine:(id)a3;
- (id)syncEngine:(id)a3 recordTypeForRecordID:(id)a4;
- (int64_t)syncEngine:(id)a3 prepareRecordToSave:(id)a4;
- (int64_t)syncEngine:(id)a3 wantsRecord:(id)a4;
- (unint64_t)_lock_writeRecord:(id)a3 writePartition:(BOOL)a4 error:(id *)a5;
- (unint64_t)writeRecord:(id)a3 error:(id *)a4;
- (unint64_t)writeRecord:(id)a3 writePartition:(BOOL)a4 error:(id *)a5;
- (void)_lock_existingConfiguration;
- (void)_lock_prepareCKRecordToSave:(id)a3;
- (void)_lock_prepareDNDSIDSRecordToSave:(id)a3;
- (void)_lock_purgeData;
- (void)_lock_updateConfigurationWithCKRecord:(id)a3;
- (void)_lock_updateConfigurationWithDNDSIDSRecord:(id)a3;
- (void)_notifyDelegateOfConfigurationChange;
- (void)_populateCKRecord:(id)a3 withGlobalConfiguration:(id)a4;
- (void)_populateDNDSIDSRecord:(id)a3 withGlobalConfiguration:(id)a4;
- (void)_purgeData;
- (void)globalConfigurationSyncManager:(id)a3 didReceiveUpdatedGlobalConfiguration:(id)a4;
- (void)idsSyncEngine:(id)a3 didFetchRecord:(id)a4;
- (void)idsSyncEngine:(id)a3 prepareRecordToSave:(id)a4;
- (void)idsSyncEngine:(id)a3 recordWithIDWasDeleted:(id)a4;
- (void)purgeRecordsForIDSSyncEngine:(id)a3;
- (void)setDelegate:(id)a3;
- (void)syncEngine:(id)a3 didFetchRecord:(id)a4;
- (void)syncEngine:(id)a3 failedToDeleteRecordWithID:(id)a4 error:(id)a5;
- (void)syncEngine:(id)a3 recordWithIDWasDeleted:(id)a4;
- (void)syncEngine:(id)a3 resolveConflictBetweenClientRecord:(id)a4 andServerRecord:(id)a5;
- (void)syncEngine:(id)a3 zoneWithIDWasDeleted:(id)a4 removingRecordIDs:(id)a5;
@end

@implementation DNDSGlobalConfigurationStore

- (DNDSGlobalConfigurationStore)initWithBackingStore:(id)a3 syncEngine:(id)a4 idsSyncEngine:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)DNDSGlobalConfigurationStore;
  v12 = [(DNDSGlobalConfigurationStore *)&v20 init];
  v13 = v12;
  if (v12)
  {
    v12->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v12->_backingStore, a3);
    [(DNDSBackingStore *)v13->_backingStore setDelegate:v13];
    objc_storeStrong((id *)&v13->_syncEngine, a4);
    [(DNDSSyncEngine *)v13->_syncEngine setDataSource:v13 forZoneName:@"DNDSGlobalConfiguration"];
    objc_storeStrong((id *)&v13->_idsSyncEngine, a5);
    [(DNDSIDSSyncEngine *)v13->_idsSyncEngine setDataSource:v13 forZone:@"DNDSGlobalConfiguration"];
    id v19 = 0;
    uint64_t v14 = [v9 readRecordWithError:&v19];
    id v15 = v19;
    configuration = v13->_configuration;
    v13->_configuration = (DNDSGlobalConfiguration *)v14;

    if (v15)
    {
      v17 = DNDSLogGlobalConfiguration;
      if (os_log_type_enabled((os_log_t)DNDSLogGlobalConfiguration, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v22 = v15;
        _os_log_impl(&dword_1D3052000, v17, OS_LOG_TYPE_DEFAULT, "Could not read configuration: %{public}@", buf, 0xCu);
      }
    }
  }
  return v13;
}

- (id)readRecordWithError:(id *)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = [(DNDSBackingStore *)self->_backingStore readRecordWithError:a3];
  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (unint64_t)writeRecord:(id)a3 error:(id *)a4
{
  return [(DNDSGlobalConfigurationStore *)self writeRecord:a3 writePartition:1 error:a4];
}

- (unint64_t)writeRecord:(id)a3 writePartition:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  p_lock = &self->_lock;
  id v9 = a3;
  os_unfair_lock_lock(p_lock);
  unint64_t v10 = [(DNDSGlobalConfigurationStore *)self _lock_writeRecord:v9 writePartition:v6 error:a5];

  os_unfair_lock_unlock(p_lock);
  [(DNDSGlobalConfigurationStore *)self _notifyDelegateOfConfigurationChange];
  return v10;
}

- (id)backingStore:(id)a3 migrateDictionaryRepresentation:(id)a4 fromVersionNumber:(unint64_t)a5 toVersionNumber:(unint64_t)a6
{
  id v10 = a4;
  id v11 = a3;
  v12 = [(DNDSGlobalConfigurationStore *)self delegate];
  v13 = [v12 backingStore:v11 migrateDictionaryRepresentation:v10 fromVersionNumber:a5 toVersionNumber:a6];

  return v13;
}

- (int64_t)syncEngine:(id)a3 wantsRecord:(id)a4
{
  id v4 = a4;
  v5 = [v4 recordID];
  BOOL v6 = [v5 zoneID];
  v7 = [v6 zoneName];
  int v8 = [v7 isEqualToString:@"DNDSGlobalConfiguration"];

  if (v8)
  {
    id v9 = [v4 objectForKey:@"DNDSGlobalConfigurationMinimumRequiredVersion"];
    uint64_t v10 = [v9 integerValue];
    if (v10 <= [&unk_1F2A5DAC0 integerValue]
      && ([v4 recordType],
          id v11 = objc_claimAutoreleasedReturnValue(),
          int v12 = [v11 isEqualToString:@"DNDSGlobalConfigurationRecord"],
          v11,
          v12))
    {
      v13 = [v4 recordID];
      uint64_t v14 = [v13 recordName];
      unsigned int v15 = [v14 isEqualToString:@"DNDSGlobalConfigurationRecord"];

      int64_t v16 = v15;
    }
    else
    {
      int64_t v16 = 0;
    }
  }
  else
  {
    int64_t v16 = 0;
  }

  return v16;
}

- (void)syncEngine:(id)a3 didFetchRecord:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  BOOL v6 = [v5 recordID];
  v7 = [v6 recordName];

  int v8 = DNDSLogGlobalConfiguration;
  if (os_log_type_enabled((os_log_t)DNDSLogGlobalConfiguration, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v30 = v7;
    _os_log_impl(&dword_1D3052000, v8, OS_LOG_TYPE_DEFAULT, "Fetched record with ID: %@", buf, 0xCu);
  }
  os_unfair_lock_lock(&self->_lock);
  id v9 = [(DNDSGlobalConfigurationStore *)self _lock_existingConfiguration];
  uint64_t v10 = [(DNDSGlobalConfigurationStore *)self _createConfigurationFromCKRecord:v5];
  id v11 = v10;
  if (v10)
  {
    int v12 = [v10 mergeWithGlobalConfiguration:v9];
    v13 = (void *)DNDSLogGlobalConfiguration;
    BOOL v14 = os_log_type_enabled((os_log_t)DNDSLogGlobalConfiguration, OS_LOG_TYPE_DEFAULT);
    if (v12 == v11)
    {
      if (v14)
      {
        uint64_t v23 = v13;
        v24 = [v5 recordID];
        v25 = [v24 recordName];
        *(_DWORD *)buf = 138412290;
        v30 = v25;
        _os_log_impl(&dword_1D3052000, v23, OS_LOG_TYPE_DEFAULT, "Fetched data with ID %@ is current; applying update",
          buf,
          0xCu);
      }
      [(DNDSGlobalConfigurationStore *)self _lock_updateConfigurationWithCKRecord:v5];
      id v19 = [[DNDSIDSRecordID alloc] initWithIdentifier:v7 zone:@"DNDSGlobalConfiguration"];
      idsSyncEngine = self->_idsSyncEngine;
      v28 = v19;
      objc_super v20 = (void *)MEMORY[0x1E4F1C978];
      v21 = &v28;
    }
    else
    {
      if (v14)
      {
        unsigned int v15 = v13;
        int64_t v16 = [v5 recordID];
        v17 = [v16 recordName];
        *(_DWORD *)buf = 138412290;
        v30 = v17;
        _os_log_impl(&dword_1D3052000, v15, OS_LOG_TYPE_DEFAULT, "Fetched data with ID %@ is outdated; ignoring update and resending local data",
          buf,
          0xCu);
      }
      idsSyncEngine = self->_syncEngine;
      id v19 = [v5 recordID];
      v27 = v19;
      objc_super v20 = (void *)MEMORY[0x1E4F1C978];
      v21 = &v27;
    }
    v26 = objc_msgSend(v20, "arrayWithObjects:count:", v21, 1, v27, v28);
    [idsSyncEngine addRecordIDsToSave:v26 recordIDsToDelete:0];
  }
  else
  {
    id v22 = (void *)DNDSLogGlobalConfiguration;
    if (os_log_type_enabled((os_log_t)DNDSLogGlobalConfiguration, OS_LOG_TYPE_ERROR)) {
      -[DNDSGlobalConfigurationStore syncEngine:didFetchRecord:](v22);
    }
  }
  os_unfair_lock_unlock(&self->_lock);
  [(DNDSGlobalConfigurationStore *)self _notifyDelegateOfConfigurationChange];
}

- (void)syncEngine:(id)a3 failedToDeleteRecordWithID:(id)a4 error:(id)a5
{
  id v5 = a5;
  if (os_log_type_enabled((os_log_t)DNDSLogGlobalConfiguration, OS_LOG_TYPE_ERROR)) {
    -[DNDSGlobalConfigurationStore syncEngine:failedToDeleteRecordWithID:error:]();
  }
}

- (void)syncEngine:(id)a3 resolveConflictBetweenClientRecord:(id)a4 andServerRecord:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int v12 = [(DNDSGlobalConfigurationStore *)self _createConfigurationFromCKRecord:v10];
  if (v12)
  {
    v13 = [(DNDSGlobalConfigurationStore *)self _createConfigurationFromCKRecord:v9];
    BOOL v14 = [v12 mergeWithGlobalConfiguration:v13];
    unsigned int v15 = (void *)DNDSLogGlobalConfiguration;
    BOOL v16 = os_log_type_enabled((os_log_t)DNDSLogGlobalConfiguration, OS_LOG_TYPE_DEFAULT);
    if (v14 == v12)
    {
      id v28 = v8;
      if (v16)
      {
        uint64_t v23 = v15;
        v24 = [v10 recordID];
        v25 = [v24 recordName];
        *(_DWORD *)buf = 138412290;
        v32 = v25;
        _os_log_impl(&dword_1D3052000, v23, OS_LOG_TYPE_DEFAULT, "Resolved conflict records with ID %@; using remote data",
          buf,
          0xCu);
      }
      [(DNDSGlobalConfigurationStore *)self _lock_updateConfigurationWithCKRecord:v10];
      objc_super v20 = [[DNDSIDSRecordID alloc] initWithIdentifier:@"DNDSGlobalConfigurationRecord" zone:@"DNDSGlobalConfiguration"];
      idsSyncEngine = self->_idsSyncEngine;
      v30 = v20;
      v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1];
      [(DNDSIDSSyncEngine *)idsSyncEngine addRecordIDsToSave:v21 recordIDsToDelete:0];
      id v8 = v28;
    }
    else
    {
      if (v16)
      {
        id v27 = v8;
        v17 = v15;
        v18 = [v10 recordID];
        id v19 = [v18 recordName];
        *(_DWORD *)buf = 138412290;
        v32 = v19;
        _os_log_impl(&dword_1D3052000, v17, OS_LOG_TYPE_DEFAULT, "Resolved conflict between records with ID %@; using local data",
          buf,
          0xCu);

        id v8 = v27;
      }
      objc_super v20 = [v9 recordID];
      v29 = v20;
      v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
      [v8 addRecordIDsToSave:v21 recordIDsToDelete:0];
    }

    os_unfair_lock_unlock(&self->_lock);
    if (v14 == v12) {
      [(DNDSGlobalConfigurationStore *)self _notifyDelegateOfConfigurationChange];
    }
  }
  else
  {
    id v22 = (void *)DNDSLogGlobalConfiguration;
    if (os_log_type_enabled((os_log_t)DNDSLogGlobalConfiguration, OS_LOG_TYPE_ERROR)) {
      -[DNDSGlobalConfigurationStore syncEngine:resolveConflictBetweenClientRecord:andServerRecord:](v22);
    }
    os_unfair_lock_unlock(p_lock);
  }
}

- (int64_t)syncEngine:(id)a3 prepareRecordToSave:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  BOOL v6 = (void *)DNDSLogGlobalConfiguration;
  if (os_log_type_enabled((os_log_t)DNDSLogGlobalConfiguration, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    id v8 = [v5 recordID];
    id v9 = [v8 recordName];
    int v11 = 138412290;
    int v12 = v9;
    _os_log_impl(&dword_1D3052000, v7, OS_LOG_TYPE_DEFAULT, "Preparing to save record %@", (uint8_t *)&v11, 0xCu);
  }
  os_unfair_lock_lock(&self->_lock);
  [(DNDSGlobalConfigurationStore *)self _lock_prepareCKRecordToSave:v5];
  os_unfair_lock_unlock(&self->_lock);

  return 1;
}

- (void)syncEngine:(id)a3 recordWithIDWasDeleted:(id)a4
{
  id v4 = DNDSLogGlobalConfiguration;
  if (os_log_type_enabled((os_log_t)DNDSLogGlobalConfiguration, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1D3052000, v4, OS_LOG_TYPE_DEFAULT, "Global configuration was deleted", v5, 2u);
  }
}

- (id)syncEngine:(id)a3 recordTypeForRecordID:(id)a4
{
  return @"DNDSGlobalConfigurationRecord";
}

- (void)syncEngine:(id)a3 zoneWithIDWasDeleted:(id)a4 removingRecordIDs:(id)a5
{
  BOOL v6 = DNDSLogGlobalConfiguration;
  if (os_log_type_enabled((os_log_t)DNDSLogGlobalConfiguration, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1D3052000, v6, OS_LOG_TYPE_DEFAULT, "Removing all records because zone was deleted", v7, 2u);
  }
  [(DNDSGlobalConfigurationStore *)self _purgeData];
}

- (id)recordIDsForSyncEngine:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F1A310]) initWithZoneName:@"DNDSGlobalConfiguration"];
  id v4 = objc_alloc(MEMORY[0x1E4F1A2F8]);
  id v5 = [v3 zoneID];
  BOOL v6 = (void *)[v4 initWithRecordName:@"DNDSGlobalConfigurationRecord" zoneID:v5];

  v9[0] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];

  return v7;
}

- (void)idsSyncEngine:(id)a3 prepareRecordToSave:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  BOOL v6 = (void *)DNDSLogGlobalConfiguration;
  if (os_log_type_enabled((os_log_t)DNDSLogGlobalConfiguration, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    id v8 = [v5 recordID];
    id v9 = [v8 identifier];
    int v10 = 138412290;
    int v11 = v9;
    _os_log_impl(&dword_1D3052000, v7, OS_LOG_TYPE_DEFAULT, "Preparing to save record for IDS sync engine: %@", (uint8_t *)&v10, 0xCu);
  }
  os_unfair_lock_lock(&self->_lock);
  [(DNDSGlobalConfigurationStore *)self _lock_prepareDNDSIDSRecordToSave:v5];
  os_unfair_lock_unlock(&self->_lock);
}

- (void)idsSyncEngine:(id)a3 didFetchRecord:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  BOOL v6 = [v5 recordID];
  v7 = [v6 identifier];

  id v8 = DNDSLogGlobalConfiguration;
  if (os_log_type_enabled((os_log_t)DNDSLogGlobalConfiguration, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v26 = v7;
    _os_log_impl(&dword_1D3052000, v8, OS_LOG_TYPE_DEFAULT, "Fetched record from IDS sync engine with ID: %@", buf, 0xCu);
  }
  os_unfair_lock_lock(&self->_lock);
  id v9 = [(DNDSGlobalConfigurationStore *)self _lock_existingConfiguration];
  int v10 = [(DNDSGlobalConfigurationStore *)self _createConfigurationFromDNDSIDSRecord:v5];
  int v11 = v10;
  if (v10)
  {
    uint64_t v12 = [v10 mergeWithGlobalConfiguration:v9];
    uint64_t v13 = DNDSLogGlobalConfiguration;
    BOOL v14 = os_log_type_enabled((os_log_t)DNDSLogGlobalConfiguration, OS_LOG_TYPE_DEFAULT);
    if (v12 == v11)
    {
      id v22 = v12;
      if (v14)
      {
        *(_DWORD *)buf = 138412290;
        v26 = v7;
        _os_log_impl(&dword_1D3052000, v13, OS_LOG_TYPE_DEFAULT, "Fetched data with ID %@ is current; applying update",
          buf,
          0xCu);
      }
      [(DNDSGlobalConfigurationStore *)self _lock_updateConfigurationWithDNDSIDSRecord:v5];
      unsigned int v15 = (DNDSIDSRecordID *)[objc_alloc(MEMORY[0x1E4F1A310]) initWithZoneName:@"DNDSGlobalConfiguration"];
      id v18 = objc_alloc(MEMORY[0x1E4F1A2F8]);
      id v19 = [(DNDSIDSRecordID *)v15 zoneID];
      v17 = (void *)[v18 initWithRecordName:v7 zoneID:v19];

      syncEngine = self->_syncEngine;
      v24 = v17;
      v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
      [(DNDSSyncEngine *)syncEngine addRecordIDsToSave:v21 recordIDsToDelete:0];

      uint64_t v12 = v22;
    }
    else
    {
      if (v14)
      {
        *(_DWORD *)buf = 138543362;
        v26 = v7;
        _os_log_impl(&dword_1D3052000, v13, OS_LOG_TYPE_DEFAULT, "Fetched data with ID %{public}@ is outdated; ignoring update and resending local data",
          buf,
          0xCu);
      }
      unsigned int v15 = [[DNDSIDSRecordID alloc] initWithIdentifier:v7 zone:@"DNDSGlobalConfiguration"];
      idsSyncEngine = self->_idsSyncEngine;
      uint64_t v23 = v15;
      v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
      [(DNDSIDSSyncEngine *)idsSyncEngine addRecordIDsToSave:v17 recordIDsToDelete:0];
    }
  }
  else if (os_log_type_enabled((os_log_t)DNDSLogGlobalConfiguration, OS_LOG_TYPE_ERROR))
  {
    -[DNDSGlobalConfigurationStore idsSyncEngine:didFetchRecord:]();
  }
  os_unfair_lock_unlock(&self->_lock);
  [(DNDSGlobalConfigurationStore *)self _notifyDelegateOfConfigurationChange];
}

- (void)idsSyncEngine:(id)a3 recordWithIDWasDeleted:(id)a4
{
  id v4 = DNDSLogGlobalConfiguration;
  if (os_log_type_enabled((os_log_t)DNDSLogGlobalConfiguration, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1D3052000, v4, OS_LOG_TYPE_DEFAULT, "Global configuration was deleted", v5, 2u);
  }
}

- (id)recordIDsForIDSSyncEngine:(id)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v3 = [[DNDSIDSRecordID alloc] initWithIdentifier:@"DNDSGlobalConfigurationRecord" zone:@"DNDSGlobalConfiguration"];
  v6[0] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];

  return v4;
}

- (void)purgeRecordsForIDSSyncEngine:(id)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v5 = DNDSLogModeConfigurations;
  if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D3052000, v5, OS_LOG_TYPE_DEFAULT, "Purging data for IDS sync engine", buf, 2u);
  }
  BOOL v6 = objc_alloc_init(DNDSMutableGlobalConfiguration);
  [(DNDSMutableGlobalConfiguration *)v6 setAutomaticallyGenerated:1];
  v7 = DNDSLogGlobalConfiguration;
  if (os_log_type_enabled((os_log_t)DNDSLogGlobalConfiguration, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v11 = 0;
    _os_log_impl(&dword_1D3052000, v7, OS_LOG_TYPE_DEFAULT, "Replacing record with default global configuration", v11, 2u);
  }
  backingStore = self->_backingStore;
  id v10 = 0;
  [(DNDSBackingStore *)backingStore writeRecord:v6 error:&v10];
  id v9 = v10;
  if (v9 && os_log_type_enabled((os_log_t)DNDSLogGlobalConfiguration, OS_LOG_TYPE_ERROR)) {
    -[DNDSModeConfigurationsStore purgeRecordsForIDSSyncEngine:]();
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)globalConfigurationSyncManager:(id)a3 didReceiveUpdatedGlobalConfiguration:(id)a4
{
  id v5 = a4;
  os_unfair_lock_lock(&self->_lock);
  BOOL v6 = [(DNDSGlobalConfigurationStore *)self _lock_existingConfiguration];
  id v7 = [v5 mergeWithGlobalConfiguration:v6];
  id v8 = DNDSLogGlobalConfiguration;
  if (v7 == v5)
  {
    if (os_log_type_enabled((os_log_t)DNDSLogGlobalConfiguration, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D3052000, v8, OS_LOG_TYPE_DEFAULT, "Updating global configuration", buf, 2u);
    }
    backingStore = self->_backingStore;
    uint64_t v10 = 0;
    [(DNDSBackingStore *)backingStore writeRecord:v5 error:&v10];
  }
  else if (os_log_type_enabled((os_log_t)DNDSLogGlobalConfiguration, OS_LOG_TYPE_ERROR))
  {
    -[DNDSGlobalConfigurationStore globalConfigurationSyncManager:didReceiveUpdatedGlobalConfiguration:]();
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (id)_createConfigurationFromDNDSIDSRecord:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKey:@"DNDSGlobalConfigurationRecordData"];
  if (v4)
  {
    id v11 = 0;
    id v5 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v4 options:0 error:&v11];
    id v6 = v11;
    if (v6)
    {
      if (os_log_type_enabled((os_log_t)DNDSLogGlobalConfiguration, OS_LOG_TYPE_ERROR)) {
        -[DNDSGlobalConfigurationStore _createConfigurationFromDNDSIDSRecord:]();
      }
      id v7 = 0;
    }
    else
    {
      id v9 = [[DNDSBackingStoreDictionaryContext alloc] initWithDestination:1 partitionType:1 redactSensitiveData:0 contactProvider:0 applicationIdentifierMapper:0];
      id v7 = +[DNDSGlobalConfiguration newWithDictionaryRepresentation:v5 context:v9];
    }
  }
  else
  {
    id v8 = (void *)DNDSLogGlobalConfiguration;
    if (os_log_type_enabled((os_log_t)DNDSLogGlobalConfiguration, OS_LOG_TYPE_ERROR)) {
      -[DNDSGlobalConfigurationStore _createConfigurationFromDNDSIDSRecord:](v8);
    }
    id v7 = 0;
  }

  return v7;
}

- (id)_createConfigurationFromCKRecord:(id)a3
{
  id v3 = a3;
  id v4 = [v3 encryptedValues];
  id v5 = [v4 objectForKey:@"DNDSGlobalConfigurationRecordEncryptedData"];

  if (v5)
  {
    id v12 = 0;
    id v6 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v5 options:0 error:&v12];
    id v7 = v12;
    if (v7)
    {
      if (os_log_type_enabled((os_log_t)DNDSLogGlobalConfiguration, OS_LOG_TYPE_ERROR)) {
        -[DNDSGlobalConfigurationStore _createConfigurationFromCKRecord:]();
      }
      id v8 = 0;
    }
    else
    {
      uint64_t v10 = [[DNDSBackingStoreDictionaryContext alloc] initWithDestination:1 partitionType:1 redactSensitiveData:0 contactProvider:0 applicationIdentifierMapper:0];
      id v8 = +[DNDSGlobalConfiguration newWithDictionaryRepresentation:v6 context:v10];
    }
  }
  else
  {
    id v9 = (void *)DNDSLogGlobalConfiguration;
    if (os_log_type_enabled((os_log_t)DNDSLogGlobalConfiguration, OS_LOG_TYPE_ERROR)) {
      -[DNDSGlobalConfigurationStore _createConfigurationFromCKRecord:](v9);
    }
    id v8 = 0;
  }

  return v8;
}

- (id)_lock_mutableExistingConfigurationInStore:(id)a3
{
  id v3 = [(DNDSGlobalConfigurationStore *)self _lock_existingConfiguration];
  id v4 = (void *)[v3 mutableCopy];

  return v4;
}

- (id)_lock_existingConfiguration
{
  os_unfair_lock_assert_owner(&self->_lock);
  backingStore = self->_backingStore;
  id v7 = 0;
  id v4 = [(DNDSBackingStore *)backingStore readRecordWithError:&v7];
  id v5 = v7;
  if (v5 && os_log_type_enabled((os_log_t)DNDSLogGlobalConfiguration, OS_LOG_TYPE_ERROR)) {
    -[DNDSGlobalConfigurationStore _lock_existingConfiguration]();
  }

  return v4;
}

- (void)_populateDNDSIDSRecord:(id)a3 withGlobalConfiguration:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [[DNDSBackingStoreDictionaryContext alloc] initWithDestination:0 partitionType:1 redactSensitiveData:0 contactProvider:0 applicationIdentifierMapper:0];
  id v8 = [v6 dictionaryRepresentationWithContext:v7];
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v8])
  {
    id v9 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v8 options:0 error:0];
    [v5 setObject:v9 forKey:@"DNDSGlobalConfigurationRecordData"];
    [v5 setObject:&unk_1F2A5DAC0 forKey:@"DNDSGlobalConfigurationVersion"];
    [v5 setObject:&unk_1F2A5DAC0 forKey:@"DNDSGlobalConfigurationMinimumRequiredVersion"];
  }
  else
  {
    uint64_t v10 = (void *)DNDSLogGlobalConfiguration;
    if (os_log_type_enabled((os_log_t)DNDSLogGlobalConfiguration, OS_LOG_TYPE_ERROR)) {
      -[DNDSGlobalConfigurationStore _populateDNDSIDSRecord:withGlobalConfiguration:](v10);
    }
    if (os_log_type_enabled((os_log_t)DNDSLogGlobalConfiguration, OS_LOG_TYPE_ERROR)) {
      -[DNDSGlobalConfigurationStore _populateDNDSIDSRecord:withGlobalConfiguration:]();
    }
    if (os_log_type_enabled((os_log_t)DNDSLogGlobalConfiguration, OS_LOG_TYPE_ERROR)) {
      -[DNDSGlobalConfigurationStore _populateDNDSIDSRecord:withGlobalConfiguration:]();
    }
  }
}

- (void)_populateCKRecord:(id)a3 withGlobalConfiguration:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [[DNDSBackingStoreDictionaryContext alloc] initWithDestination:0 partitionType:1 redactSensitiveData:0 contactProvider:0 applicationIdentifierMapper:0];
  id v8 = [v6 dictionaryRepresentationWithContext:v7];
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v8])
  {
    id v9 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v8 options:0 error:0];
    uint64_t v10 = [v5 encryptedValues];
    [v10 setObject:v9 forKey:@"DNDSGlobalConfigurationRecordEncryptedData"];

    [v5 setObject:&unk_1F2A5DAC0 forKeyedSubscript:@"DNDSGlobalConfigurationVersion"];
    [v5 setObject:&unk_1F2A5DAC0 forKeyedSubscript:@"DNDSGlobalConfigurationMinimumRequiredVersion"];
  }
  else
  {
    id v11 = (void *)DNDSLogGlobalConfiguration;
    if (os_log_type_enabled((os_log_t)DNDSLogGlobalConfiguration, OS_LOG_TYPE_ERROR)) {
      -[DNDSGlobalConfigurationStore _populateCKRecord:withGlobalConfiguration:](v11);
    }
    if (os_log_type_enabled((os_log_t)DNDSLogGlobalConfiguration, OS_LOG_TYPE_ERROR)) {
      -[DNDSGlobalConfigurationStore _populateDNDSIDSRecord:withGlobalConfiguration:]();
    }
    if (os_log_type_enabled((os_log_t)DNDSLogGlobalConfiguration, OS_LOG_TYPE_ERROR)) {
      -[DNDSGlobalConfigurationStore _populateDNDSIDSRecord:withGlobalConfiguration:]();
    }
  }
}

- (void)_lock_prepareDNDSIDSRecordToSave:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  backingStore = self->_backingStore;
  id v8 = 0;
  id v6 = [(DNDSBackingStore *)backingStore readRecordWithError:&v8];
  id v7 = v8;
  if (v7)
  {
    if (os_log_type_enabled((os_log_t)DNDSLogGlobalConfiguration, OS_LOG_TYPE_ERROR)) {
      -[DNDSGlobalConfigurationStore _lock_prepareDNDSIDSRecordToSave:]();
    }
  }
  else
  {
    [(DNDSGlobalConfigurationStore *)self _populateDNDSIDSRecord:v4 withGlobalConfiguration:v6];
  }
}

- (void)_lock_prepareCKRecordToSave:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  backingStore = self->_backingStore;
  id v8 = 0;
  id v6 = [(DNDSBackingStore *)backingStore readRecordWithError:&v8];
  id v7 = v8;
  if (v7)
  {
    if (os_log_type_enabled((os_log_t)DNDSLogGlobalConfiguration, OS_LOG_TYPE_ERROR)) {
      -[DNDSGlobalConfigurationStore _lock_prepareDNDSIDSRecordToSave:]();
    }
  }
  else
  {
    [(DNDSGlobalConfigurationStore *)self _populateCKRecord:v4 withGlobalConfiguration:v6];
  }
}

- (void)_notifyDelegateOfConfigurationChange
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  backingStore = self->_backingStore;
  id v14 = 0;
  id v6 = [(DNDSBackingStore *)backingStore readRecordWithError:&v14];
  id v7 = v14;
  id v8 = (void *)[(DNDSGlobalConfiguration *)self->_configuration copy];
  objc_storeStrong((id *)&self->_configuration, v6);
  if (v7 && os_log_type_enabled((os_log_t)DNDSLogGlobalConfiguration, OS_LOG_TYPE_ERROR)) {
    -[DNDSGlobalConfigurationStore _lock_prepareDNDSIDSRecordToSave:]();
  }
  os_unfair_lock_unlock(p_lock);
  uint64_t v9 = [v6 preventAutoReply];
  if (v9 != [v8 preventAutoReply])
  {
    uint64_t v10 = (void *)DNDSLogModeConfigurations;
    if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = v10;
      uint64_t v12 = [v6 preventAutoReply];
      uint64_t v13 = "prevent";
      if (!v12) {
        uint64_t v13 = "allow";
      }
      *(_DWORD *)buf = 136446210;
      BOOL v16 = v13;
      _os_log_impl(&dword_1D3052000, v11, OS_LOG_TYPE_DEFAULT, "Notifying delegate of prevent-auto-reply change: %{public}s", buf, 0xCu);
    }
    objc_msgSend(WeakRetained, "globalConfigurationStore:didUpdatePreventAutoReplySetting:", self, DNDResolvedPreventAutoReplySetting(objc_msgSend(v6, "preventAutoReply")) == 2);
  }
}

- (unint64_t)_lock_writeRecord:(id)a3 writePartition:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  v35[1] = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  id v9 = a3;
  os_unfair_lock_assert_owner(p_lock);
  uint64_t v10 = (void *)[v9 mutableCopy];

  id v11 = [(DNDSBackingStore *)self->_backingStore readRecordWithError:a5];
  if ([v10 isEqual:v11])
  {
    unint64_t v12 = 1;
  }
  else
  {
    uint64_t v13 = [MEMORY[0x1E4F1C9C8] date];
    id v14 = [v10 lastModified];
    unsigned int v15 = [v14 earlierDate:v13];

    if (v15 == v13)
    {
      BOOL v16 = [MEMORY[0x1E4F1C9C8] distantPast];
      [v10 setLastModified:v16];
    }
    else
    {
      [v10 setLastModified:v13];
    }
    uint64_t v17 = [[DNDSIDSRecordID alloc] initWithIdentifier:@"DNDSGlobalConfigurationRecord" zone:@"DNDSGlobalConfiguration"];
    idsSyncEngine = self->_idsSyncEngine;
    v35[0] = v17;
    id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:1];
    [(DNDSIDSSyncEngine *)idsSyncEngine addRecordIDsToSave:v19 recordIDsToDelete:0];

    unint64_t v12 = [(DNDSBackingStore *)self->_backingStore writeRecord:v10 writePartition:v6 error:a5];
    if (a5)
    {
      if (*a5)
      {
        objc_super v20 = DNDSLogGlobalConfiguration;
        if (os_log_type_enabled((os_log_t)DNDSLogGlobalConfiguration, OS_LOG_TYPE_ERROR)) {
          -[DNDSModeConfigurationsStore _lock_writeRecord:writePartition:error:]((uint64_t)a5, v20, v21, v22, v23, v24, v25, v26);
        }
      }
    }
    uint64_t v27 = (void *)[objc_alloc(MEMORY[0x1E4F1A310]) initWithZoneName:@"DNDSGlobalConfiguration"];
    id v28 = objc_alloc(MEMORY[0x1E4F1A2F8]);
    v29 = [v27 zoneID];
    v30 = (void *)[v28 initWithRecordName:@"DNDSGlobalConfigurationRecord" zoneID:v29];

    syncEngine = self->_syncEngine;
    v34 = v30;
    v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1];
    [(DNDSSyncEngine *)syncEngine addRecordIDsToSave:v32 recordIDsToDelete:0];
  }
  return v12;
}

- (void)_lock_updateConfigurationWithDNDSIDSRecord:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_assert_owner(p_lock);
  BOOL v6 = [(DNDSGlobalConfigurationStore *)self _createConfigurationFromDNDSIDSRecord:v5];

  backingStore = self->_backingStore;
  id v9 = 0;
  [(DNDSBackingStore *)backingStore writeRecord:v6 error:&v9];
  id v8 = v9;
  if (v8 && os_log_type_enabled((os_log_t)DNDSLogGlobalConfiguration, OS_LOG_TYPE_ERROR)) {
    -[DNDSGlobalConfigurationStore _lock_updateConfigurationWithDNDSIDSRecord:]();
  }
}

- (void)_lock_updateConfigurationWithCKRecord:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_assert_owner(p_lock);
  BOOL v6 = [(DNDSGlobalConfigurationStore *)self _createConfigurationFromCKRecord:v5];

  backingStore = self->_backingStore;
  id v9 = 0;
  [(DNDSBackingStore *)backingStore writeRecord:v6 error:&v9];
  id v8 = v9;
  if (v8 && os_log_type_enabled((os_log_t)DNDSLogGlobalConfiguration, OS_LOG_TYPE_ERROR)) {
    -[DNDSGlobalConfigurationStore _lock_updateConfigurationWithDNDSIDSRecord:]();
  }
}

- (void)_lock_purgeData
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(DNDSMutableGlobalConfiguration);
  [(DNDSMutableGlobalConfiguration *)v3 setAutomaticallyGenerated:1];
  id v4 = DNDSLogGlobalConfiguration;
  if (os_log_type_enabled((os_log_t)DNDSLogGlobalConfiguration, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D3052000, v4, OS_LOG_TYPE_DEFAULT, "Replacing record with default global configuration", buf, 2u);
  }
  backingStore = self->_backingStore;
  id v9 = 0;
  [(DNDSBackingStore *)backingStore writeRecord:v3 error:&v9];
  id v6 = v9;
  id v7 = [[DNDSIDSRecordID alloc] initWithIdentifier:@"DNDSGlobalConfigurationRecord" zone:@"DNDSGlobalConfiguration"];
  v11[0] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];

  [(DNDSIDSSyncEngine *)self->_idsSyncEngine addRecordIDsToSave:v8 recordIDsToDelete:0];
  if (v6 && os_log_type_enabled((os_log_t)DNDSLogGlobalConfiguration, OS_LOG_TYPE_ERROR)) {
    -[DNDSModeConfigurationsStore purgeRecordsForIDSSyncEngine:]();
  }
}

- (void)_purgeData
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(DNDSGlobalConfigurationStore *)self _lock_purgeData];
  os_unfair_lock_unlock(p_lock);
  [(DNDSGlobalConfigurationStore *)self _notifyDelegateOfConfigurationChange];
}

- (DNDSGlobalConfigurationStoreDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DNDSGlobalConfigurationStoreDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_idsSyncEngine, 0);
  objc_storeStrong((id *)&self->_syncEngine, 0);
  objc_storeStrong((id *)&self->_backingStore, 0);
}

- (void)syncEngine:(void *)a1 didFetchRecord:.cold.1(void *a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = a1;
  id v3 = [(id)OUTLINED_FUNCTION_5_1() recordID];
  id v4 = [v3 recordName];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_3(&dword_1D3052000, v1, v5, "Fetched data with ID %@ could not be reconstructed into a configuration; ignoring update",
    v6);
}

- (void)syncEngine:failedToDeleteRecordWithID:error:.cold.1()
{
  OUTLINED_FUNCTION_3_1();
  id v2 = v1;
  id v3 = [(id)OUTLINED_FUNCTION_2_1() recordName];
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_4_0(&dword_1D3052000, v4, v5, "Failed to delete record %@: %@", v6, v7, v8, v9, v10);
}

- (void)syncEngine:(void *)a1 resolveConflictBetweenClientRecord:andServerRecord:.cold.1(void *a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = a1;
  id v3 = [(id)OUTLINED_FUNCTION_5_1() recordID];
  uint64_t v4 = [v3 recordName];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_3(&dword_1D3052000, v1, v5, "Could not resolve conflict as remote configuration is nil; keeping local data with ID %@",
    v6);
}

- (void)idsSyncEngine:didFetchRecord:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1D3052000, v0, v1, "Fetched data with ID %@ could not be reconstructed into a configuration; ignoring update",
    v2,
    v3,
    v4,
    v5,
    v6);
}

- (void)globalConfigurationSyncManager:didReceiveUpdatedGlobalConfiguration:.cold.1()
{
  OUTLINED_FUNCTION_3_1();
  id v3 = v2;
  [(id)OUTLINED_FUNCTION_2_1() lastModified];
  objc_claimAutoreleasedReturnValue();
  uint8_t v10 = [(id)OUTLINED_FUNCTION_5_1() lastModified];
  OUTLINED_FUNCTION_4_0(&dword_1D3052000, v4, v5, "Ignoring incoming configuration with date %@ as it is older than existing configuration with date %@", v6, v7, v8, v9, 2u);
}

- (void)_createConfigurationFromDNDSIDSRecord:(void *)a1 .cold.1(void *a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = a1;
  id v3 = [(id)OUTLINED_FUNCTION_5_1() recordID];
  uint64_t v4 = [v3 identifier];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_3(&dword_1D3052000, v1, v5, "Record data is nil in record data %@", v6);
}

- (void)_createConfigurationFromDNDSIDSRecord:.cold.2()
{
  OUTLINED_FUNCTION_3_1();
  id v2 = v1;
  id v3 = [(id)OUTLINED_FUNCTION_2_1() recordID];
  uint64_t v4 = [v3 identifier];
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_4_0(&dword_1D3052000, v5, v6, "Failed to decode record data %@: %@", v7, v8, v9, v10, v11);
}

- (void)_createConfigurationFromCKRecord:(void *)a1 .cold.1(void *a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = a1;
  id v3 = [(id)OUTLINED_FUNCTION_5_1() recordID];
  uint64_t v4 = [v3 recordName];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_3(&dword_1D3052000, v1, v5, "Record data is nil in record data %@", v6);
}

- (void)_createConfigurationFromCKRecord:.cold.2()
{
  OUTLINED_FUNCTION_3_1();
  id v2 = v1;
  id v3 = [(id)OUTLINED_FUNCTION_2_1() recordID];
  uint64_t v4 = [v3 recordName];
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_4_0(&dword_1D3052000, v5, v6, "Failed to decode record data %@: %@", v7, v8, v9, v10, v11);
}

- (void)_lock_existingConfiguration
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1D3052000, v0, v1, "Failed to fetch existing configuration: %@", v2, v3, v4, v5, v6);
}

- (void)_populateDNDSIDSRecord:withGlobalConfiguration:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1D3052000, v0, v1, "Dictionary: %{private}@", v2, v3, v4, v5, v6);
}

- (void)_populateDNDSIDSRecord:withGlobalConfiguration:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1D3052000, v0, v1, "Configuration: %{private}@", v2, v3, v4, v5, v6);
}

- (void)_populateDNDSIDSRecord:(void *)a1 withGlobalConfiguration:.cold.3(void *a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = a1;
  uint64_t v3 = [(id)OUTLINED_FUNCTION_5_1() recordID];
  uint64_t v4 = [v3 identifier];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_3(&dword_1D3052000, v1, v5, "Record %@ is not valid JSON", v6);
}

- (void)_populateCKRecord:(void *)a1 withGlobalConfiguration:.cold.3(void *a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = a1;
  uint64_t v3 = [(id)OUTLINED_FUNCTION_5_1() recordID];
  uint64_t v4 = [v3 recordName];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_3(&dword_1D3052000, v1, v5, "Record %@ is not valid JSON", v6);
}

- (void)_lock_prepareDNDSIDSRecordToSave:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1D3052000, v0, v1, "Could not read configuration: %@", v2, v3, v4, v5, v6);
}

- (void)_lock_updateConfigurationWithDNDSIDSRecord:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1D3052000, v0, v1, "Error writing fetched configurations: %@", v2, v3, v4, v5, v6);
}

@end