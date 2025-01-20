@interface DNDSModeConfigurationsStore
- (BOOL)_lock_mergeLocalConfigurationRecord:(id)a3 withRemoteCKRecord:(id)a4 deleteModeOnCorruption:(BOOL)a5;
- (BOOL)_lock_mergeLocalConfigurationRecord:(id)a3 withRemoteConfigurationRecord:(id)a4 modeIdentifier:(id)a5 sourceDeviceIdentifier:(id)a6 sourceFrameworkVersion:(id *)a7 sourceIsCloud:(BOOL)a8 sourceWantsToForce:(BOOL)a9 deleteModeOnCorruption:(BOOL)a10;
- (BOOL)_lock_populateDNDSIDSRecord:(id)a3;
- (DNDSModeConfigurationsStore)initWithBackingStore:(id)a3 syncEngine:(id)a4 idsSyncEngine:(id)a5;
- (DNDSModeConfigurationsStoreDelegate)delegate;
- (NSData)contactHistoryToken;
- (NSNumber)compatibilityVersion;
- (NSSet)monitoredContacts;
- (id)_lock_existingConfigurations;
- (id)_lock_modeConfigurationForCKRecordID:(id)a3;
- (id)_lock_modeConfigurationForDNDSIDSRecordID:(id)a3;
- (id)_lock_modeConfigurationForModeIdentifier:(id)a3;
- (id)_lock_modeIdentifiers;
- (id)_lock_mutableExistingConfigurations;
- (id)_lock_recordIDsForIDSSyncEngine:(id)a3;
- (id)backingStore:(id)a3 migrateDictionaryRepresentation:(id)a4 fromVersionNumber:(unint64_t)a5 toVersionNumber:(unint64_t)a6;
- (id)readRecordWithError:(id *)a3;
- (id)recordIDsForIDSSyncEngine:(id)a3;
- (id)recordIDsForSyncEngine:(id)a3;
- (id)syncEngine:(id)a3 recordTypeForRecordID:(id)a4;
- (int64_t)_lock_populateCKRecord:(id)a3 lastChanceRecord:(id)a4;
- (int64_t)syncEngine:(id)a3 prepareRecordToSave:(id)a4;
- (int64_t)syncEngine:(id)a3 wantsRecord:(id)a4;
- (unint64_t)_lock_writeRecord:(id)a3 writePartition:(BOOL)a4 error:(id *)a5;
- (unint64_t)writeRecord:(id)a3 error:(id *)a4;
- (unint64_t)writeRecord:(id)a3 writePartition:(BOOL)a4 error:(id *)a5;
- (void)_lock_existingConfigurations;
- (void)_lock_modeIdentifiers;
- (void)_lock_purgeData;
- (void)_lock_purgeRecordIDs:(id)a3;
- (void)_lock_removeModeConfigurationWithCKRecordID:(id)a3;
- (void)_lock_removeModeConfigurationWithModeIdentifier:(id)a3;
- (void)_lock_updateModeConfigurationWithConfiguration:(id)a3;
- (void)_notifyDelegateOfAvailableModes;
- (void)_purgeData;
- (void)_purgeRecordIDs:(id)a3;
- (void)cachedBackingStoreDidPurgeCache:(id)a3;
- (void)contactMonitor:(id)a3 didReceiveUpdatedContacts:(id)a4 deletedContactIdentifiers:(id)a5 withContactHistoryToken:(id)a6;
- (void)contactMonitor:(id)a3 didReceiveUpdatedContactsForContactsWithoutIdentifiers:(id)a4;
- (void)idsSyncEngine:(id)a3 didFetchRecord:(id)a4;
- (void)idsSyncEngine:(id)a3 prepareRecordToSave:(id)a4;
- (void)idsSyncEngine:(id)a3 recordWithIDWasDeleted:(id)a4;
- (void)monitoredContacts;
- (void)purgeRecordsForIDSSyncEngine:(id)a3;
- (void)setCompatibilityVersion:(id)a3;
- (void)setContactHistoryToken:(id)a3;
- (void)setDelegate:(id)a3;
- (void)syncEngine:(id)a3 didFetchRecord:(id)a4;
- (void)syncEngine:(id)a3 failedToDeleteRecordWithID:(id)a4 error:(id)a5;
- (void)syncEngine:(id)a3 recordWithIDWasDeleted:(id)a4;
- (void)syncEngine:(id)a3 resolveConflictBetweenClientRecord:(id)a4 andServerRecord:(id)a5;
- (void)syncEngine:(id)a3 zoneWithIDWasDeleted:(id)a4 removingRecordIDs:(id)a5;
@end

@implementation DNDSModeConfigurationsStore

- (id)readRecordWithError:(id *)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = [(DNDSBackingStore *)self->_backingStore readRecordWithError:a3];
  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (DNDSModeConfigurationsStore)initWithBackingStore:(id)a3 syncEngine:(id)a4 idsSyncEngine:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)DNDSModeConfigurationsStore;
  v12 = [(DNDSModeConfigurationsStore *)&v22 init];
  v13 = v12;
  if (v12)
  {
    v12->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v12->_backingStore, a3);
    [(DNDSBackingStore *)v13->_backingStore setDelegate:v13];
    objc_storeStrong((id *)&v13->_syncEngine, a4);
    [(DNDSSyncEngine *)v13->_syncEngine setDataSource:v13 forZoneName:@"DNDSModeConfigurations"];
    objc_storeStrong((id *)&v13->_idsSyncEngine, a5);
    [(DNDSIDSSyncEngine *)v13->_idsSyncEngine setDataSource:v13 forZone:@"DNDSModeConfigurations"];
    v14 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    uint64_t v15 = [v14 dataForKey:@"DNDSModeConfigurationsContactHistoryToken"];
    contactHistoryToken = v13->_contactHistoryToken;
    v13->_contactHistoryToken = (NSData *)v15;

    uint64_t v17 = [MEMORY[0x1E4F1CA80] set];
    ckRecordIDsToForceSave = v13->_ckRecordIDsToForceSave;
    v13->_ckRecordIDsToForceSave = (NSMutableSet *)v17;

    uint64_t v19 = [MEMORY[0x1E4F1CA80] set];
    idsRecordIDsToForceSave = v13->_idsRecordIDsToForceSave;
    v13->_idsRecordIDsToForceSave = (NSMutableSet *)v19;
  }
  return v13;
}

- (unint64_t)writeRecord:(id)a3 error:(id *)a4
{
  return [(DNDSModeConfigurationsStore *)self writeRecord:a3 writePartition:1 error:a4];
}

- (unint64_t)writeRecord:(id)a3 writePartition:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  p_lock = &self->_lock;
  id v9 = a3;
  os_unfair_lock_lock(p_lock);
  unint64_t v10 = [(DNDSModeConfigurationsStore *)self _lock_writeRecord:v9 writePartition:v6 error:a5];

  os_unfair_lock_unlock(p_lock);
  [(DNDSModeConfigurationsStore *)self _notifyDelegateOfAvailableModes];
  return v10;
}

- (id)backingStore:(id)a3 migrateDictionaryRepresentation:(id)a4 fromVersionNumber:(unint64_t)a5 toVersionNumber:(unint64_t)a6
{
  id v10 = a4;
  id v11 = a3;
  v12 = [(DNDSModeConfigurationsStore *)self delegate];
  v13 = [v12 backingStore:v11 migrateDictionaryRepresentation:v10 fromVersionNumber:a5 toVersionNumber:a6];

  return v13;
}

- (void)cachedBackingStoreDidPurgeCache:(id)a3
{
  v4 = DNDSLogModeConfigurations;
  if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1D3052000, v4, OS_LOG_TYPE_DEFAULT, "Backing store was purged", v5, 2u);
  }
  [(DNDSModeConfigurationsStore *)self _notifyDelegateOfAvailableModes];
}

- (int64_t)syncEngine:(id)a3 wantsRecord:(id)a4
{
  id v5 = a4;
  BOOL v6 = [v5 recordID];
  v7 = [v6 zoneID];
  v8 = [v7 zoneName];
  int v9 = [v8 isEqualToString:@"DNDSModeConfigurations"];

  if (v9)
  {
    id v10 = [v5 objectForKey:@"DNDSModeConfigurationsMinimumRequiredVersion"];
    uint64_t v11 = [v10 integerValue];
    v12 = [v5 objectForKey:@"DNDSModeConfigurationsVersion"];
    uint64_t v13 = [v12 integerValue];
    v14 = DNDSModeConfigurationsVersionSupported();
    uint64_t v15 = [v14 integerValue];

    if (os_variant_has_internal_content())
    {
      compatibilityVersion = self->_compatibilityVersion;
      if (compatibilityVersion) {
        uint64_t v15 = [(NSNumber *)compatibilityVersion integerValue];
      }
    }
    if (v11 <= v15)
    {
      if (v13 <= v15)
      {
        v18 = [v5 recordType];
        unsigned int v19 = [v18 isEqualToString:@"DNDSModeConfigurationsRecord"];

        int64_t v17 = v19;
      }
      else
      {
        int64_t v17 = 2;
      }
    }
    else
    {
      int64_t v17 = 0;
    }
  }
  else
  {
    int64_t v17 = 0;
  }

  return v17;
}

- (BOOL)_lock_mergeLocalConfigurationRecord:(id)a3 withRemoteConfigurationRecord:(id)a4 modeIdentifier:(id)a5 sourceDeviceIdentifier:(id)a6 sourceFrameworkVersion:(id *)a7 sourceIsCloud:(BOOL)a8 sourceWantsToForce:(BOOL)a9 deleteModeOnCorruption:(BOOL)a10
{
  BOOL v10 = a8;
  uint64_t v135 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  v18 = a5;
  id v19 = a6;
  v20 = v19;
  if (v17)
  {
    BOOL v118 = v10;
    id v119 = v19;
    id v21 = [MEMORY[0x1E4F5F658] modeConfigurationForRecord:v17];
    objc_super v22 = [MEMORY[0x1E4F5F658] modeConfigurationForRecord:v16];
    [v22 log:DNDSLogModeConfigurations withMessage:@"Local configuration"];
    [v21 log:DNDSLogModeConfigurations withMessage:@"Remote configuration"];
    id v23 = objc_alloc_init(MEMORY[0x1E4F5F5D0]);
    [v23 diffObject:v22 againstObject:v21 withDescription:@"modeConfiguration"];
    if ([v23 hasDifferences]) {
      [v23 log:DNDSLogModeConfigurations withPrefix:v18];
    }

    if ([v22 isEqual:v21])
    {
      v24 = DNDSLogModeConfigurations;
      if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)&buf[4] = v18;
        _os_log_impl(&dword_1D3052000, v24, OS_LOG_TYPE_DEFAULT, "Record for %{public}@ does not contain configuration changes.", buf, 0xCu);
      }

      BOOL v25 = 0;
      goto LABEL_79;
    }
    if (v22)
    {
      id v38 = [v22 mergeWithRemoteModeConfiguration:v21];
    }
    else
    {
      id v38 = v21;
    }
    id v116 = v16;
    id v117 = v38;
    if (a9)
    {
      if (v21) {
        [v21 lastModifiedByVersion];
      }
      if (v22) {
        [v22 lastModifiedByVersion];
      }
      long long v120 = 0uLL;
      v39 = +[DNDSDevice currentDevice];
      v40 = v39;
      if (v39) {
        [v39 frameworkVersion];
      }
      else {
        long long v120 = 0uLL;
      }

      v57 = (void *)DNDSLogModeConfigurations;
      BOOL v58 = os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_DEFAULT);
      if (v117 == v21)
      {
        if (v58)
        {
          *(_OWORD *)buf = *(_OWORD *)&a7->var0;
          *(void *)&buf[16] = a7->var2;
          v66 = v57;
          DNDStringFromOperatingSystemVersion();
          os_log_t loga = v18;
          v68 = v67 = self;
          *(_OWORD *)buf = v120;
          *(void *)&buf[16] = 0;
          DNDStringFromOperatingSystemVersion();
          v69 = (DNDSIDSRecordID *)objc_claimAutoreleasedReturnValue();
          memset(buf, 0, sizeof(buf));
          v70 = DNDStringFromOperatingSystemVersion();
          memset(buf, 0, sizeof(buf));
          v71 = DNDStringFromOperatingSystemVersion();
          *(_DWORD *)buf = 138413314;
          *(void *)&buf[4] = v119;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v68;
          *(_WORD *)&buf[22] = 2114;
          v130 = v69;
          __int16 v131 = 2114;
          v132 = v70;
          __int16 v133 = 2114;
          v134 = v71;
          _os_log_impl(&dword_1D3052000, v66, OS_LOG_TYPE_DEFAULT, "Remote device is forcing a write that we agree with. device: %@; sourceFrameworkVersion: %{public}@; current"
            "FrameworkVersion: %{public}@; remoteRecordVersion: %{public}@; localRecordVersion: %{public}@;",
            buf,
            0x34u);

          self = v67;
          v18 = loga;
        }
LABEL_64:
        v80 = DNDSLogModeConfigurations;
        if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          *(void *)&buf[4] = v18;
          _os_log_impl(&dword_1D3052000, v80, OS_LOG_TYPE_DEFAULT, "Fetched data with ID %{public}@ is current; applying update",
            buf,
            0xCu);
        }
        [(DNDSModeConfigurationsStore *)self _lock_updateModeConfigurationWithConfiguration:v17];
        v81 = [v21 lastModifiedByDeviceID];
        if (!v81)
        {
          uint64_t v82 = [v21 rawResolvedCompatibilityVersion];
          if (v82 == [v21 resolvedCompatibilityVersion]) {
            goto LABEL_75;
          }
          v83 = [v21 lastModified];
          v81 = [v83 dateByAddingTimeInterval:60.0];

          v84 = (void *)DNDSLogModeConfigurations;
          if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_DEFAULT))
          {
            v85 = v84;
            [v21 rawResolvedCompatibilityVersion];
            v86 = DNDCompatibilityVersionToString();
            [v21 resolvedCompatibilityVersion];
            v87 = DNDCompatibilityVersionToString();
            [v21 lastModified];
            v88 = self;
            v89 = (DNDSIDSRecordID *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            *(void *)&buf[4] = v86;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v87;
            *(_WORD *)&buf[22] = 2114;
            v130 = v89;
            __int16 v131 = 2114;
            v132 = v81;
            _os_log_impl(&dword_1D3052000, v85, OS_LOG_TYPE_DEFAULT, "Remote configuration is from a device that has a different version resolution. Updating resolvedCompatibilityVersion from %{public}@ to %{public}@ and bumping lastModified from %{public}@ to %{public}@ and resyncing.", buf, 0x2Au);

            self = v88;
          }
          v90 = (void *)[v21 mutableCopy];
          [v90 setLastModified:v81];
          v91 = [v90 makeRecord];
          [(DNDSModeConfigurationsStore *)self _lock_updateModeConfigurationWithConfiguration:v91];

          v113 = self;
          if (v118)
          {
            v92 = (DNDSIDSRecordID *)[objc_alloc(MEMORY[0x1E4F1A310]) initWithZoneName:@"DNDSModeConfigurations"];
            id v93 = objc_alloc(MEMORY[0x1E4F1A2F8]);
            [(DNDSIDSRecordID *)v92 zoneID];
            id v94 = v17;
            v95 = v18;
            v97 = v96 = self;
            v98 = (void *)[v93 initWithRecordName:v95 zoneID:v97];

            syncEngine = v96->_syncEngine;
            v18 = v95;
            id v17 = v94;
            v128 = v98;
            v99 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v128 count:1];
            [(DNDSSyncEngine *)syncEngine addRecordIDsToSave:v99 recordIDsToDelete:0];
          }
          else
          {
            [(DNDSModeConfigurationsStore *)self _lock_updateModeConfigurationWithConfiguration:v17];
            v92 = [[DNDSIDSRecordID alloc] initWithIdentifier:v18 zone:@"DNDSModeConfigurations"];
            idsSyncEngine = self->_idsSyncEngine;
            v127 = v92;
            v98 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v127 count:1];
            [(DNDSIDSSyncEngine *)idsSyncEngine addRecordIDsToSave:v98 recordIDsToDelete:0];
          }

          self = v113;
        }

LABEL_75:
        if (v118)
        {
          v42 = [[DNDSIDSRecordID alloc] initWithIdentifier:v18 zone:@"DNDSModeConfigurations"];
          v101 = self->_idsSyncEngine;
          v126 = v42;
          BOOL v25 = 1;
          v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v126 count:1];
          [(DNDSIDSSyncEngine *)v101 addRecordIDsToSave:v43 recordIDsToDelete:0];
        }
        else
        {
          v42 = (DNDSIDSRecordID *)[objc_alloc(MEMORY[0x1E4F1A310]) initWithZoneName:@"DNDSModeConfigurations"];
          id v102 = objc_alloc(MEMORY[0x1E4F1A2F8]);
          [(DNDSIDSRecordID *)v42 zoneID];
          v104 = v103 = self;
          v43 = (void *)[v102 initWithRecordName:v18 zoneID:v104];

          v105 = v103->_syncEngine;
          v125 = v43;
          BOOL v25 = 1;
          v106 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v125 count:1];
          [(DNDSSyncEngine *)v105 addRecordIDsToSave:v106 recordIDsToDelete:0];
        }
LABEL_78:

        id v16 = v116;
LABEL_79:
        v20 = v119;
        goto LABEL_80;
      }
      if (v58)
      {
        *(_OWORD *)buf = *(_OWORD *)&a7->var0;
        *(void *)&buf[16] = a7->var2;
        log = v57;
        v109 = DNDStringFromOperatingSystemVersion();
        *(_OWORD *)buf = v120;
        *(void *)&buf[16] = 0;
        DNDStringFromOperatingSystemVersion();
        v108 = (DNDSIDSRecordID *)objc_claimAutoreleasedReturnValue();
        memset(buf, 0, sizeof(buf));
        v59 = DNDStringFromOperatingSystemVersion();
        memset(buf, 0, sizeof(buf));
        DNDStringFromOperatingSystemVersion();
        id v114 = v17;
        v60 = v18;
        v62 = v61 = self;
        *(_DWORD *)buf = 138413314;
        *(void *)&buf[4] = v119;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v109;
        *(_WORD *)&buf[22] = 2114;
        v130 = v108;
        __int16 v131 = 2114;
        v132 = v59;
        __int16 v133 = 2114;
        v134 = v62;
        _os_log_impl(&dword_1D3052000, log, OS_LOG_TYPE_DEFAULT, "Remote device is forcing a write that we disagree with. device: %@; sourceFrameworkVersion: %{public}@; curren"
          "tFrameworkVersion: %{public}@; remoteRecordVersion: %{public}@; localRecordVersion: %{public}@;",
          buf,
          0x34u);

        self = v61;
        v18 = v60;
        id v17 = v114;
      }
      *(_OWORD *)buf = v120;
      *(void *)&buf[16] = 0;
      uint64_t v63 = DNDOperatingSystemVersionCompare();
      if (v63)
      {
        if (v63 == -1)
        {
          v64 = DNDSLogModeConfigurations;
          if (!os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_64;
          }
          *(_WORD *)buf = 0;
          v65 = "Accepting forced write because the remote framework revision is newer than the current version.";
LABEL_63:
          _os_log_impl(&dword_1D3052000, v64, OS_LOG_TYPE_DEFAULT, v65, buf, 2u);
          goto LABEL_64;
        }
        v78 = DNDSLogModeConfigurations;
        if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v79 = "Rejecting forced write because the remote framework revision is older than the current version.";
LABEL_60:
          _os_log_impl(&dword_1D3052000, v78, OS_LOG_TYPE_DEFAULT, v79, buf, 2u);
        }
      }
      else
      {
        id v72 = v17;
        v73 = v18;
        v74 = self;
        v75 = +[DNDSDevice currentDevice];
        v76 = [v75 identifier];
        uint64_t v77 = [v76 compare:v119 options:769];

        if (v77 == 1)
        {
          v78 = DNDSLogModeConfigurations;
          self = v74;
          v18 = v73;
          id v17 = v72;
          if (!os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_28;
          }
          *(_WORD *)buf = 0;
          v79 = "Accepting forced write because the remote framework revision is the same as the current version but lost"
                " the tie-breaker.";
          goto LABEL_60;
        }
        self = v74;
        if (!v77)
        {
          v64 = DNDSLogModeConfigurations;
          v18 = v73;
          id v17 = v72;
          if (!os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_64;
          }
          *(_WORD *)buf = 0;
          v65 = "Accepting forced write because it came from this device.";
          goto LABEL_63;
        }
        v18 = v73;
        id v17 = v72;
        if (v77 == -1)
        {
          v64 = DNDSLogModeConfigurations;
          if (!os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_64;
          }
          *(_WORD *)buf = 0;
          v65 = "Accepting forced write because the remote framework revision is the same as the current version and won "
                "the tie-breaker.";
          goto LABEL_63;
        }
      }
    }
    else if (v38 == v21)
    {
      goto LABEL_64;
    }
LABEL_28:
    v112 = self;
    v41 = DNDSLogModeConfigurations;
    if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v18;
      _os_log_impl(&dword_1D3052000, v41, OS_LOG_TYPE_DEFAULT, "Fetched data with ID %{public}@ is outdated; ignoring update and resending local data",
        buf,
        0xCu);
    }
    v42 = [v21 lastModified];
    v43 = [v22 lastModified];
    v44 = [v21 lastModifiedByDeviceID];
    if (!v44)
    {
      v44 = [v43 laterDate:v42];
      if (v42 == v44)
      {
        uint64_t v45 = [v21 rawResolvedCompatibilityVersion];
        uint64_t v46 = *MEMORY[0x1E4F5F510];

        if (v45 > v46)
        {
LABEL_37:
          if (v118)
          {
            v50 = (DNDSIDSRecordID *)[objc_alloc(MEMORY[0x1E4F1A310]) initWithZoneName:@"DNDSModeConfigurations"];
            id v51 = objc_alloc(MEMORY[0x1E4F1A2F8]);
            v52 = [(DNDSIDSRecordID *)v50 zoneID];
            v53 = (void *)[v51 initWithRecordName:v18 zoneID:v52];

            [(NSMutableSet *)v112->_ckRecordIDsToForceSave addObject:v53];
            v54 = v112->_syncEngine;
            v124 = v53;
            v55 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v124 count:1];
            [(DNDSSyncEngine *)v54 addRecordIDsToSave:v55 recordIDsToDelete:0];
          }
          else
          {
            v50 = [[DNDSIDSRecordID alloc] initWithIdentifier:v18 zone:@"DNDSModeConfigurations"];
            [(NSMutableSet *)v112->_idsRecordIDsToForceSave addObject:v50];
            v56 = v112->_idsSyncEngine;
            v123 = v50;
            v53 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v123 count:1];
            [(DNDSIDSSyncEngine *)v56 addRecordIDsToSave:v53 recordIDsToDelete:0];
          }

          BOOL v25 = 0;
          goto LABEL_78;
        }
        v44 = [(DNDSIDSRecordID *)v42 dateByAddingTimeInterval:60.0];
        v47 = DNDSLogModeConfigurations;
        if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543874;
          *(void *)&buf[4] = v43;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v44;
          *(_WORD *)&buf[22] = 2114;
          v130 = v42;
          _os_log_error_impl(&dword_1D3052000, v47, OS_LOG_TYPE_ERROR, "Remote configuration is from a device that doesn't agree with this resolution. Bumping lastModified from %{public}@ to %{public}@ to overcome remote lastModified of %{public}@ and resyncing.", buf, 0x20u);
        }
        v48 = (void *)[v22 mutableCopy];
        [v48 setLastModified:v44];
        v49 = [v48 makeRecord];
        [(DNDSModeConfigurationsStore *)v112 _lock_updateModeConfigurationWithConfiguration:v49];
      }
    }

    goto LABEL_37;
  }
  BOOL v26 = os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_ERROR);
  if (a10)
  {
    v27 = self;
    v28 = v20;
    if (v26) {
      -[DNDSModeConfigurationsStore _lock_mergeLocalConfigurationRecord:withRemoteConfigurationRecord:modeIdentifier:sourceDeviceIdentifier:sourceFrameworkVersion:sourceIsCloud:sourceWantsToForce:deleteModeOnCorruption:]();
    }
    v29 = (void *)[objc_alloc(MEMORY[0x1E4F1A310]) initWithZoneName:@"DNDSModeConfigurations"];
    id v30 = objc_alloc(MEMORY[0x1E4F1A2F8]);
    v31 = [v29 zoneID];
    v32 = (void *)[v30 initWithRecordName:v18 zoneID:v31];

    v33 = self->_syncEngine;
    v122 = v32;
    v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v122 count:1];
    [(DNDSSyncEngine *)v33 addRecordIDsToSave:0 recordIDsToDelete:v34];

    v35 = self->_idsSyncEngine;
    v36 = [[DNDSIDSRecordID alloc] initWithIdentifier:v18 zone:@"DNDSModeConfigurations"];
    v121 = v36;
    v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v121 count:1];
    [(DNDSIDSSyncEngine *)v35 addRecordIDsToSave:0 recordIDsToDelete:v37];

    BOOL v25 = v16 != 0;
    if (v16) {
      [(DNDSModeConfigurationsStore *)v27 _lock_removeModeConfigurationWithModeIdentifier:v18];
    }

    v20 = v28;
    id v17 = 0;
  }
  else
  {
    if (v26) {
      -[DNDSModeConfigurationsStore _lock_mergeLocalConfigurationRecord:withRemoteConfigurationRecord:modeIdentifier:sourceDeviceIdentifier:sourceFrameworkVersion:sourceIsCloud:sourceWantsToForce:deleteModeOnCorruption:]();
    }
    BOOL v25 = 0;
  }
LABEL_80:

  return v25;
}

- (BOOL)_lock_mergeLocalConfigurationRecord:(id)a3 withRemoteCKRecord:(id)a4 deleteModeOnCorruption:(BOOL)a5
{
  HIDWORD(v34) = a5;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 recordID];
  int v9 = [v8 recordName];

  BOOL v10 = [v7 encryptedValues];
  uint64_t v11 = [v10 objectForKey:@"DNDSModeConfigurationsRecordForceUpdate"];

  int v12 = [v11 BOOLValue];
  uint64_t v13 = [v7 encryptedValues];
  uint64_t v14 = [v13 objectForKey:@"DNDSModeConfigurationsSourceDeviceIdentifier"];

  uint64_t v15 = [v7 encryptedValues];
  uint64_t v16 = [v15 objectForKey:@"DNDSModeConfigurationsSourceFrameworkVersion"];

  long long v36 = 0uLL;
  uint64_t v37 = 0;
  DNDOperatingSystemVersionFromString();
  id v17 = [v7 encryptedValues];
  v18 = [v17 objectForKey:@"DNDSModeConfigurationsLastModified"];

  uint64_t v19 = DNDSLogModeConfigurations;
  BOOL v20 = os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_DEFAULT);
  if (v14 | v16)
  {
    if (v20)
    {
      id v21 = @"NO";
      *(_DWORD *)buf = 138544130;
      *(void *)&buf[4] = v9;
      if (v12) {
        id v21 = @"YES";
      }
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v14;
      *(_WORD *)&buf[22] = 2112;
      uint64_t v39 = v16;
      __int16 v40 = 2114;
      v41 = v21;
      objc_super v22 = "Fetched record with ID: %{public}@ from device %@ / %@ (force: %{public}@).";
      id v23 = v19;
      uint32_t v24 = 42;
      goto LABEL_8;
    }
  }
  else if (v20)
  {
    *(_DWORD *)buf = 138543362;
    *(void *)&buf[4] = v9;
    objc_super v22 = "Fetched record with ID: %{public}@ from legacy device.";
    id v23 = v19;
    uint32_t v24 = 12;
LABEL_8:
    _os_log_impl(&dword_1D3052000, v23, OS_LOG_TYPE_DEFAULT, v22, buf, v24);
  }
  id v25 = +[DNDSModeConfigurationRecord newWithCKRecord:v7 currentRecord:v6];
  BOOL v26 = v25;
  if (!v18) {
    goto LABEL_13;
  }
  v27 = [v25 lastModified];
  [v27 timeIntervalSinceDate:v18];
  double v29 = v28;

  double v30 = -v29;
  if (v29 >= 0.0) {
    double v30 = v29;
  }
  if (v30 > 1.0)
  {
LABEL_13:

    long long v36 = *MEMORY[0x1E4F5F540];
    uint64_t v37 = *(void *)(MEMORY[0x1E4F5F540] + 16);
    v31 = DNDSLogModeConfigurations;
    if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D3052000, v31, OS_LOG_TYPE_DEFAULT, "Record has source info set but the mdate doesn't match. Ignoring source and treating as legacy.", buf, 2u);
    }
    uint64_t v14 = 0;
    LOBYTE(v12) = 0;
  }
  *(_OWORD *)buf = v36;
  *(void *)&buf[16] = v37;
  BYTE1(v34) = BYTE4(v34);
  LOBYTE(v34) = v12;
  BOOL v32 = -[DNDSModeConfigurationsStore _lock_mergeLocalConfigurationRecord:withRemoteConfigurationRecord:modeIdentifier:sourceDeviceIdentifier:sourceFrameworkVersion:sourceIsCloud:sourceWantsToForce:deleteModeOnCorruption:](self, "_lock_mergeLocalConfigurationRecord:withRemoteConfigurationRecord:modeIdentifier:sourceDeviceIdentifier:sourceFrameworkVersion:sourceIsCloud:sourceWantsToForce:deleteModeOnCorruption:", v6, v26, v9, v14, buf, 1, v34);

  return v32;
}

- (void)syncEngine:(id)a3 didFetchRecord:(id)a4
{
  id v5 = a4;
  id v6 = [v5 recordID];
  id v10 = [v6 recordName];

  os_unfair_lock_lock(&self->_lock);
  id v7 = [(DNDSModeConfigurationsStore *)self _lock_existingConfigurations];
  v8 = [v7 modeConfigurationForModeIdentifier:v10];
  BOOL v9 = [(DNDSModeConfigurationsStore *)self _lock_mergeLocalConfigurationRecord:v8 withRemoteCKRecord:v5 deleteModeOnCorruption:1];

  os_unfair_lock_unlock(&self->_lock);
  if (v9) {
    [(DNDSModeConfigurationsStore *)self _notifyDelegateOfAvailableModes];
  }
}

- (void)syncEngine:(id)a3 failedToDeleteRecordWithID:(id)a4 error:(id)a5
{
  id v6 = a5;
  id v7 = (void *)DNDSLogModeConfigurations;
  if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_ERROR)) {
    -[DNDSModeConfigurationsStore syncEngine:failedToDeleteRecordWithID:error:](v7, a4, (uint64_t)v6);
  }
}

- (void)syncEngine:(id)a3 resolveConflictBetweenClientRecord:(id)a4 andServerRecord:(id)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  id v8 = a4;
  BOOL v9 = [v7 recordID];
  id v10 = [v9 recordName];

  os_unfair_lock_lock(&self->_lock);
  uint64_t v11 = DNDSLogModeConfigurations;
  if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138543362;
    id v17 = v10;
    _os_log_impl(&dword_1D3052000, v11, OS_LOG_TYPE_DEFAULT, "Encountered conflict while saving configuration: %{public}@", (uint8_t *)&v16, 0xCu);
  }
  int v12 = [(DNDSModeConfigurationsStore *)self _lock_modeConfigurationForModeIdentifier:v10];
  id v13 = +[DNDSModeConfigurationRecord newWithCKRecord:v8 currentRecord:v12];

  if (([v12 isEqual:v13] & 1) == 0)
  {
    uint64_t v14 = DNDSLogModeConfigurations;
    if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_1D3052000, v14, OS_LOG_TYPE_DEFAULT, "Server version of the record from this device is out of date.", (uint8_t *)&v16, 2u);
    }
  }
  BOOL v15 = [(DNDSModeConfigurationsStore *)self _lock_mergeLocalConfigurationRecord:v12 withRemoteCKRecord:v7 deleteModeOnCorruption:0];
  os_unfair_lock_unlock(&self->_lock);
  if (v15) {
    [(DNDSModeConfigurationsStore *)self _notifyDelegateOfAvailableModes];
  }
}

- (int64_t)syncEngine:(id)a3 prepareRecordToSave:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v6 recordID];
  BOOL v9 = [v8 recordName];

  id v10 = DNDSLogModeConfigurations;
  if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v31 = v9;
    _os_log_impl(&dword_1D3052000, v10, OS_LOG_TYPE_DEFAULT, "Preparing to save record %{public}@", buf, 0xCu);
  }
  uint64_t v11 = [v6 recordID];
  int v12 = [v7 lastChanceRecordForRecordID:v11];

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int64_t v14 = [(DNDSModeConfigurationsStore *)self _lock_populateCKRecord:v6 lastChanceRecord:v12];
  ckRecordIDsToForceSave = self->_ckRecordIDsToForceSave;
  int v16 = [v6 recordID];
  uint64_t v17 = [(NSMutableSet *)ckRecordIDsToForceSave containsObject:v16];

  uint64_t v18 = self->_ckRecordIDsToForceSave;
  uint64_t v19 = [v6 recordID];
  [(NSMutableSet *)v18 removeObject:v19];

  BOOL v20 = [v6 encryptedValues];
  id v21 = [NSNumber numberWithBool:v17];
  [v20 setObject:v21 forKey:@"DNDSModeConfigurationsRecordForceUpdate"];

  objc_super v22 = [v6 encryptedValues];
  id v23 = +[DNDSDevice currentDevice];
  uint32_t v24 = v23;
  if (v23) {
    [v23 frameworkVersion];
  }
  id v25 = DNDStringFromOperatingSystemVersion();
  [v22 setObject:v25 forKey:@"DNDSModeConfigurationsSourceFrameworkVersion"];

  BOOL v26 = [v6 encryptedValues];
  v27 = +[DNDSDevice currentDevice];
  double v28 = [v27 identifier];
  [v26 setObject:v28 forKey:@"DNDSModeConfigurationsSourceDeviceIdentifier"];

  os_unfair_lock_unlock(p_lock);
  return v14;
}

- (void)syncEngine:(id)a3 recordWithIDWasDeleted:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = [v5 recordName];
  id v7 = DNDSLogModeConfigurations;
  if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v13 = v6;
    _os_log_impl(&dword_1D3052000, v7, OS_LOG_TYPE_DEFAULT, "Server removed record %{public}@", buf, 0xCu);
  }
  os_unfair_lock_lock(&self->_lock);
  [(DNDSModeConfigurationsStore *)self _lock_removeModeConfigurationWithCKRecordID:v5];

  id v8 = [[DNDSIDSRecordID alloc] initWithIdentifier:v6 zone:@"DNDSModeConfigurations"];
  idsSyncEngine = self->_idsSyncEngine;
  uint64_t v11 = v8;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1];
  [(DNDSIDSSyncEngine *)idsSyncEngine addRecordIDsToSave:0 recordIDsToDelete:v10];

  os_unfair_lock_unlock(&self->_lock);
  [(DNDSModeConfigurationsStore *)self _notifyDelegateOfAvailableModes];
}

- (id)syncEngine:(id)a3 recordTypeForRecordID:(id)a4
{
  return @"DNDSModeConfigurationsRecord";
}

- (void)syncEngine:(id)a3 zoneWithIDWasDeleted:(id)a4 removingRecordIDs:(id)a5
{
  id v6 = a5;
  id v7 = DNDSLogModeConfigurations;
  if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_1D3052000, v7, OS_LOG_TYPE_DEFAULT, "Removing all records because zone was deleted", v8, 2u);
  }
  [(DNDSModeConfigurationsStore *)self _purgeRecordIDs:v6];
}

- (id)recordIDsForSyncEngine:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", a3);
  os_unfair_lock_lock(&self->_lock);
  id v5 = [(DNDSModeConfigurationsStore *)self _lock_modeIdentifiers];
  os_unfair_lock_unlock(&self->_lock);
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F1A310]) initWithZoneName:@"DNDSModeConfigurations"];
  id v7 = [v6 zoneID];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        id v14 = objc_alloc(MEMORY[0x1E4F1A2F8]);
        BOOL v15 = objc_msgSend(v14, "initWithRecordName:zoneID:", v13, v7, (void)v20);
        [v4 addObject:v15];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v26 count:16];
    }
    while (v10);
  }

  int v16 = (void *)DNDSLogModeConfigurations;
  if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = v16;
    uint64_t v18 = [v4 count];
    *(_DWORD *)buf = 134349056;
    uint64_t v25 = v18;
    _os_log_impl(&dword_1D3052000, v17, OS_LOG_TYPE_DEFAULT, "Fetched %{public}llu record IDs for the sync engine", buf, 0xCu);
  }
  return v4;
}

- (void)idsSyncEngine:(id)a3 prepareRecordToSave:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = [v5 recordID];
  id v7 = [v6 identifier];

  id v8 = DNDSLogModeConfigurations;
  if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    long long v22 = v7;
    _os_log_impl(&dword_1D3052000, v8, OS_LOG_TYPE_DEFAULT, "Preparing to save record for IDS sync engine: %{public}@", buf, 0xCu);
  }
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(DNDSModeConfigurationsStore *)self _lock_populateDNDSIDSRecord:v5];
  idsRecordIDsToForceSave = self->_idsRecordIDsToForceSave;
  uint64_t v11 = [v5 recordID];
  uint64_t v12 = [(NSMutableSet *)idsRecordIDsToForceSave containsObject:v11];

  uint64_t v13 = self->_idsRecordIDsToForceSave;
  id v14 = [v5 recordID];
  [(NSMutableSet *)v13 removeObject:v14];

  BOOL v15 = [NSNumber numberWithBool:v12];
  [v5 setObject:v15 forKey:@"DNDSModeConfigurationsRecordForceUpdate"];

  int v16 = +[DNDSDevice currentDevice];
  uint64_t v17 = v16;
  if (v16) {
    [v16 frameworkVersion];
  }
  uint64_t v18 = DNDStringFromOperatingSystemVersion();
  [v5 setObject:v18 forKey:@"DNDSModeConfigurationsSourceFrameworkVersion"];

  uint64_t v19 = +[DNDSDevice currentDevice];
  long long v20 = [v19 identifier];
  [v5 setObject:v20 forKey:@"DNDSModeConfigurationsSourceDeviceIdentifier"];

  os_unfair_lock_unlock(p_lock);
}

- (void)idsSyncEngine:(id)a3 didFetchRecord:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = [v5 recordID];
  id v7 = [v6 identifier];

  id v8 = DNDSLogModeConfigurations;
  if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = v7;
    _os_log_impl(&dword_1D3052000, v8, OS_LOG_TYPE_DEFAULT, "Fetched record from IDS sync engine with ID: %{public}@", buf, 0xCu);
  }
  os_unfair_lock_lock(&self->_lock);
  uint64_t v9 = [(DNDSModeConfigurationsStore *)self _lock_modeConfigurationForModeIdentifier:v7];
  id v10 = +[DNDSModeConfigurationRecord newWithDNDSIDSRecord:v5 currentRecord:v9];
  uint64_t v11 = [v5 objectForKey:@"DNDSModeConfigurationsRecordForceUpdate"];
  int v12 = [v11 BOOLValue];
  uint64_t v13 = [v5 objectForKey:@"DNDSModeConfigurationsSourceDeviceIdentifier"];
  id v14 = [v5 objectForKey:@"DNDSModeConfigurationsSourceFrameworkVersion"];
  long long v25 = 0uLL;
  uint64_t v26 = 0;
  DNDOperatingSystemVersionFromString();
  BOOL v15 = [v5 objectForKey:@"DNDSModeConfigurationsLastModified"];

  if (!v15) {
    goto LABEL_7;
  }
  int v16 = [v10 lastModified];
  [v16 timeIntervalSinceDate:v15];
  double v18 = v17;

  double v19 = -v18;
  if (v18 >= 0.0) {
    double v19 = v18;
  }
  if (v19 <= 1.0)
  {
    long long v22 = DNDSLogModeConfigurations;
    if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v23 = @"NO";
      *(_DWORD *)buf = 138544130;
      *(void *)&uint8_t buf[4] = v7;
      if (v12) {
        uint64_t v23 = @"YES";
      }
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v13;
      *(_WORD *)&buf[22] = 2112;
      double v28 = v14;
      __int16 v29 = 2114;
      double v30 = v23;
      _os_log_impl(&dword_1D3052000, v22, OS_LOG_TYPE_DEFAULT, "Fetched record with ID: %{public}@ from device %@ / %@ (force: %{public}@).", buf, 0x2Au);
    }
  }
  else
  {
LABEL_7:

    long long v25 = *MEMORY[0x1E4F5F540];
    uint64_t v26 = *(void *)(MEMORY[0x1E4F5F540] + 16);
    long long v20 = DNDSLogModeConfigurations;
    if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v7;
      _os_log_impl(&dword_1D3052000, v20, OS_LOG_TYPE_DEFAULT, "Fetched record with ID: %{public}@ from legacy device.", buf, 0xCu);
    }
    uint64_t v13 = 0;
    LOBYTE(v12) = 0;
  }
  *(_OWORD *)buf = v25;
  *(void *)&buf[16] = v26;
  BYTE1(v24) = 1;
  LOBYTE(v24) = v12;
  BOOL v21 = -[DNDSModeConfigurationsStore _lock_mergeLocalConfigurationRecord:withRemoteConfigurationRecord:modeIdentifier:sourceDeviceIdentifier:sourceFrameworkVersion:sourceIsCloud:sourceWantsToForce:deleteModeOnCorruption:](self, "_lock_mergeLocalConfigurationRecord:withRemoteConfigurationRecord:modeIdentifier:sourceDeviceIdentifier:sourceFrameworkVersion:sourceIsCloud:sourceWantsToForce:deleteModeOnCorruption:", v9, v10, v7, v13, buf, 0, v24);
  os_unfair_lock_unlock(&self->_lock);
  if (v21) {
    [(DNDSModeConfigurationsStore *)self _notifyDelegateOfAvailableModes];
  }
}

- (void)idsSyncEngine:(id)a3 recordWithIDWasDeleted:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = objc_msgSend(a4, "identifier", a3);
  id v6 = DNDSLogModeConfigurations;
  if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v14 = v5;
    _os_log_impl(&dword_1D3052000, v6, OS_LOG_TYPE_DEFAULT, "IDS sync engine removed record %{public}@", buf, 0xCu);
  }
  os_unfair_lock_lock(&self->_lock);
  [(DNDSModeConfigurationsStore *)self _lock_removeModeConfigurationWithModeIdentifier:v5];
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F1A310]) initWithZoneName:@"DNDSModeConfigurations"];
  id v8 = [v7 zoneID];
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F1A2F8]) initWithRecordName:v5 zoneID:v8];
  syncEngine = self->_syncEngine;
  int v12 = v9;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];
  [(DNDSSyncEngine *)syncEngine addRecordIDsToSave:0 recordIDsToDelete:v11];

  os_unfair_lock_unlock(&self->_lock);
  [(DNDSModeConfigurationsStore *)self _notifyDelegateOfAvailableModes];
}

- (id)recordIDsForIDSSyncEngine:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  id v6 = [(DNDSModeConfigurationsStore *)self _lock_recordIDsForIDSSyncEngine:v5];

  os_unfair_lock_unlock(p_lock);
  return v6;
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
  id v6 = [MEMORY[0x1E4F5F658] defaultModeConfiguration];
  id v7 = [v6 makeRecord];
  id v8 = objc_alloc_init(DNDSMutableModeConfigurationsRecord);
  uint64_t v9 = [v6 mode];
  id v10 = [v9 modeIdentifier];
  [(DNDSMutableModeConfigurationsRecord *)v8 setModeConfiguration:v7 forModeIdentifier:v10];

  uint64_t v11 = DNDSLogModeConfigurations;
  if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v15 = 0;
    _os_log_impl(&dword_1D3052000, v11, OS_LOG_TYPE_DEFAULT, "Replacing records with default mode configuration", v15, 2u);
  }
  backingStore = self->_backingStore;
  id v14 = 0;
  [(DNDSBackingStore *)backingStore writeRecord:v8 writePartition:1 error:&v14];
  id v13 = v14;
  if (v13 && os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_ERROR)) {
    -[DNDSModeConfigurationsStore purgeRecordsForIDSSyncEngine:]();
  }
  os_unfair_lock_unlock(p_lock);
  [(DNDSModeConfigurationsStore *)self _notifyDelegateOfAvailableModes];
}

- (NSData)contactHistoryToken
{
  return self->_contactHistoryToken;
}

- (NSSet)monitoredContacts
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA80] set];
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  backingStore = self->_backingStore;
  id v46 = 0;
  id v6 = [(DNDSBackingStore *)backingStore readRecordWithError:&v46];
  id v7 = v46;
  if (v7)
  {
    if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_ERROR)) {
      -[DNDSModeConfigurationsStore monitoredContacts]();
    }
  }
  else
  {
    uint64_t v31 = v6;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    obuint64_t j = [v6 modeConfigurations];
    uint64_t v8 = [obj countByEnumeratingWithState:&v42 objects:v49 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v33 = *(void *)v43;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v43 != v33) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void **)(*((void *)&v42 + 1) + 8 * i);
          int v12 = [v11 secureConfiguration];
          id v13 = [v12 senderConfiguration];
          id v14 = [v13 allowedContacts];

          long long v40 = 0u;
          long long v41 = 0u;
          long long v38 = 0u;
          long long v39 = 0u;
          id v15 = v14;
          uint64_t v16 = [v15 countByEnumeratingWithState:&v38 objects:v48 count:16];
          if (v16)
          {
            uint64_t v17 = v16;
            uint64_t v18 = *(void *)v39;
            do
            {
              for (uint64_t j = 0; j != v17; ++j)
              {
                if (*(void *)v39 != v18) {
                  objc_enumerationMutation(v15);
                }
                long long v20 = [MEMORY[0x1E4F5F5C0] contactForRecord:*(void *)(*((void *)&v38 + 1) + 8 * j)];
                [v3 addObject:v20];
              }
              uint64_t v17 = [v15 countByEnumeratingWithState:&v38 objects:v48 count:16];
            }
            while (v17);
          }

          BOOL v21 = [v11 secureConfiguration];
          long long v22 = [v21 senderConfiguration];
          uint64_t v23 = [v22 deniedContacts];

          long long v36 = 0u;
          long long v37 = 0u;
          long long v34 = 0u;
          long long v35 = 0u;
          id v24 = v23;
          uint64_t v25 = [v24 countByEnumeratingWithState:&v34 objects:v47 count:16];
          if (v25)
          {
            uint64_t v26 = v25;
            uint64_t v27 = *(void *)v35;
            do
            {
              for (uint64_t k = 0; k != v26; ++k)
              {
                if (*(void *)v35 != v27) {
                  objc_enumerationMutation(v24);
                }
                __int16 v29 = [MEMORY[0x1E4F5F5C0] contactForRecord:*(void *)(*((void *)&v34 + 1) + 8 * k)];
                [v3 addObject:v29];
              }
              uint64_t v26 = [v24 countByEnumeratingWithState:&v34 objects:v47 count:16];
            }
            while (v26);
          }
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v42 objects:v49 count:16];
      }
      while (v9);
    }

    id v6 = v31;
    id v7 = 0;
  }
  os_unfair_lock_unlock(p_lock);

  return (NSSet *)v3;
}

- (void)contactMonitor:(id)a3 didReceiveUpdatedContactsForContactsWithoutIdentifiers:(id)a4
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if ([v5 count])
  {
    p_locuint64_t k = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    id v7 = DNDSLogModeConfigurations;
    if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138477827;
      id v78 = v5;
      _os_log_impl(&dword_1D3052000, v7, OS_LOG_TYPE_DEFAULT, "Received updated identifierless contacts: %{private}@", buf, 0xCu);
    }
    uint64_t v50 = [(DNDSModeConfigurationsStore *)self _lock_mutableExistingConfigurations];
    [v50 modeConfigurations];
    long long v70 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v53 = [obj countByEnumeratingWithState:&v70 objects:v76 count:16];
    if (!v53) {
      goto LABEL_37;
    }
    v47 = self;
    v48 = &self->_lock;
    char v49 = 0;
    uint64_t v52 = *(void *)v71;
    unint64_t v8 = 0x1E4F1C000uLL;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v71 != v52) {
          objc_enumerationMutation(obj);
        }
        uint64_t v57 = v9;
        id v10 = *(void **)(*((void *)&v70 + 1) + 8 * v9);
        v56 = objc_msgSend(v10, "mutableCopy", v47, v48);
        uint64_t v11 = [v56 secureConfiguration];
        int v12 = (void *)[v11 mutableCopy];

        v55 = v12;
        id v13 = [v12 senderConfiguration];
        v54 = (void *)[v13 mutableCopy];

        v61 = [*(id *)(v8 + 2688) set];
        BOOL v58 = v10;
        id v14 = [v10 secureConfiguration];
        id v15 = [v14 senderConfiguration];
        uint64_t v16 = [v15 allowedContacts];

        long long v68 = 0u;
        long long v69 = 0u;
        long long v66 = 0u;
        long long v67 = 0u;
        id v60 = v16;
        uint64_t v17 = [v60 countByEnumeratingWithState:&v66 objects:v75 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          char v19 = 0;
          uint64_t v20 = *(void *)v67;
          do
          {
            for (uint64_t i = 0; i != v18; ++i)
            {
              if (*(void *)v67 != v20) {
                objc_enumerationMutation(v60);
              }
              id v22 = *(id *)(*((void *)&v66 + 1) + 8 * i);
              uint64_t v23 = [MEMORY[0x1E4F5F5C0] contactForRecord:v22];
              id v24 = [v5 objectForKeyedSubscript:v23];
              uint64_t v25 = v24;
              if (v24)
              {
                uint64_t v26 = [v24 makeRecord];

                char v19 = 1;
                id v22 = (id)v26;
              }
              [v61 addObject:v22];
            }
            uint64_t v18 = [v60 countByEnumeratingWithState:&v66 objects:v75 count:16];
          }
          while (v18);
        }
        else
        {
          char v19 = 0;
        }

        uint64_t v27 = [*(id *)(v8 + 2688) set];
        double v28 = [v58 secureConfiguration];
        __int16 v29 = [v28 senderConfiguration];
        double v30 = [v29 deniedContacts];

        long long v64 = 0u;
        long long v65 = 0u;
        long long v62 = 0u;
        long long v63 = 0u;
        id v59 = v30;
        uint64_t v31 = [v59 countByEnumeratingWithState:&v62 objects:v74 count:16];
        if (v31)
        {
          uint64_t v32 = v31;
          uint64_t v33 = *(void *)v63;
          do
          {
            for (uint64_t j = 0; j != v32; ++j)
            {
              if (*(void *)v63 != v33) {
                objc_enumerationMutation(v59);
              }
              id v35 = *(id *)(*((void *)&v62 + 1) + 8 * j);
              long long v36 = [MEMORY[0x1E4F5F5C0] contactForRecord:v35];
              long long v37 = [v5 objectForKeyedSubscript:v36];
              long long v38 = v37;
              if (v37)
              {
                uint64_t v39 = [v37 makeRecord];

                char v19 = 1;
                id v35 = (id)v39;
              }
              [v27 addObject:v35];
            }
            uint64_t v32 = [v59 countByEnumeratingWithState:&v62 objects:v74 count:16];
          }
          while (v32);
        }

        if (v19)
        {
          long long v40 = (void *)DNDSLogModeConfigurations;
          if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_DEFAULT))
          {
            long long v41 = v40;
            long long v42 = [v58 mode];
            long long v43 = [v42 modeIdentifier];
            *(_DWORD *)buf = 138543362;
            id v78 = v43;
            _os_log_impl(&dword_1D3052000, v41, OS_LOG_TYPE_DEFAULT, "Detected matching contact in configuration: %{public}@", buf, 0xCu);
          }
          [v54 setAllowedContacts:v61];
          [v54 setDeniedContacts:v27];
          [v55 setSenderConfiguration:v54];
          [v56 setSecureConfiguration:v55];
          long long v44 = [v56 mode];
          long long v45 = [v44 modeIdentifier];
          [v50 setModeConfiguration:v56 forModeIdentifier:v45];

          char v49 = 1;
        }

        uint64_t v9 = v57 + 1;
        unint64_t v8 = 0x1E4F1C000;
      }
      while (v57 + 1 != v53);
      uint64_t v53 = [obj countByEnumeratingWithState:&v70 objects:v76 count:16];
    }
    while (v53);
    p_locuint64_t k = v48;
    if (v49)
    {
      [v50 log:DNDSLogModeConfigurations withMessage:@"Writing updated configurations"];
      [(DNDSModeConfigurationsStore *)v47 _lock_writeRecord:v50 writePartition:1 error:0];
      os_unfair_lock_unlock(v48);
      [(DNDSModeConfigurationsStore *)v47 _notifyDelegateOfAvailableModes];
    }
    else
    {
LABEL_37:
      id v46 = DNDSLogModeConfigurations;
      if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D3052000, v46, OS_LOG_TYPE_DEFAULT, "Did not encounter any matching configurations", buf, 2u);
      }
      os_unfair_lock_unlock(p_lock);
    }
  }
}

- (void)contactMonitor:(id)a3 didReceiveUpdatedContacts:(id)a4 deletedContactIdentifiers:(id)a5 withContactHistoryToken:(id)a6
{
  uint64_t v122 = *MEMORY[0x1E4F143B8];
  id v91 = a4;
  id v72 = a5;
  long long v70 = self;
  id v71 = a6;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v9 = DNDSLogModeConfigurations;
  if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    id v121 = v91;
    _os_log_impl(&dword_1D3052000, v9, OS_LOG_TYPE_DEFAULT, "Received updated contacts: %{private}@", buf, 0xCu);
  }
  id v10 = DNDSLogModeConfigurations;
  if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    id v121 = v72;
    _os_log_impl(&dword_1D3052000, v10, OS_LOG_TYPE_DEFAULT, "Received deleted contact identifiers: %{private}@", buf, 0xCu);
  }
  uint64_t v11 = (NSData *)objc_msgSend(v71, "copy", &self->_lock);
  contactHistoryToken = self->_contactHistoryToken;
  self->_contactHistoryToken = v11;

  id v13 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v13 setObject:self->_contactHistoryToken forKey:@"DNDSModeConfigurationsContactHistoryToken"];

  if (![v91 count] && !objc_msgSend(v72, "count")) {
    goto LABEL_70;
  }
  id v14 = [MEMORY[0x1E4F1CAD0] setWithArray:v72];
  v74 = [(DNDSModeConfigurationsStore *)self _lock_mutableExistingConfigurations];
  [v74 modeConfigurations];
  long long v111 = 0u;
  long long v112 = 0u;
  long long v113 = 0u;
  long long v114 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v77 = [obj countByEnumeratingWithState:&v111 objects:v119 count:16];
  if (!v77) {
    goto LABEL_67;
  }
  char v73 = 0;
  uint64_t v76 = *(void *)v112;
  v88 = v14;
  do
  {
    uint64_t v15 = 0;
    do
    {
      if (*(void *)v112 != v76) {
        objc_enumerationMutation(obj);
      }
      uint64_t v81 = v15;
      uint64_t v16 = *(void **)(*((void *)&v111 + 1) + 8 * v15);
      v80 = (void *)[v16 mutableCopy];
      uint64_t v17 = [v80 secureConfiguration];
      uint64_t v18 = (void *)[v17 mutableCopy];

      uint64_t v79 = v18;
      char v19 = [v18 senderConfiguration];
      id v78 = (void *)[v19 mutableCopy];

      v92 = [MEMORY[0x1E4F1CA80] set];
      uint64_t v82 = v16;
      uint64_t v20 = [v16 secureConfiguration];
      BOOL v21 = [v20 senderConfiguration];
      id v22 = [v21 allowedContacts];

      long long v109 = 0u;
      long long v110 = 0u;
      long long v107 = 0u;
      long long v108 = 0u;
      id v87 = v22;
      uint64_t v23 = [v87 countByEnumeratingWithState:&v107 objects:v118 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        int v25 = 0;
        id v26 = *(id *)v108;
        id v85 = *(id *)v108;
        do
        {
          uint64_t v27 = 0;
          uint64_t v93 = v24;
          do
          {
            if (*(id *)v108 != v26) {
              objc_enumerationMutation(v87);
            }
            id v28 = *(id *)(*((void *)&v107 + 1) + 8 * v27);
            __int16 v29 = [v28 contactIdentifier];
            int v30 = [v14 containsObject:v29];

            if (v30)
            {
              uint64_t v31 = (void *)[v28 mutableCopy];
              [v31 setContactIdentifier:0];
              int v25 = 1;
              id v32 = v28;
              id v28 = v31;
            }
            else
            {
              long long v105 = 0u;
              long long v106 = 0u;
              long long v103 = 0u;
              long long v104 = 0u;
              id v32 = v91;
              uint64_t v33 = [v32 countByEnumeratingWithState:&v103 objects:v117 count:16];
              if (v33)
              {
                uint64_t v34 = v33;
                int v89 = v25;
                uint64_t v35 = *(void *)v104;
                do
                {
                  for (uint64_t i = 0; i != v34; ++i)
                  {
                    if (*(void *)v104 != v35) {
                      objc_enumerationMutation(v32);
                    }
                    long long v37 = *(void **)(*((void *)&v103 + 1) + 8 * i);
                    long long v38 = [v28 contactIdentifier];
                    uint64_t v39 = [v37 contactIdentifier];
                    if ([v38 isEqualToString:v39])
                    {
                      char v40 = [v28 isEqual:v37];

                      if ((v40 & 1) == 0)
                      {
                        uint64_t v41 = [v37 makeRecord];

                        int v25 = 1;
                        id v28 = (id)v41;
                        id v14 = v88;
                        goto LABEL_31;
                      }
                    }
                    else
                    {
                    }
                  }
                  uint64_t v34 = [v32 countByEnumeratingWithState:&v103 objects:v117 count:16];
                }
                while (v34);
                id v14 = v88;
                int v25 = v89;
LABEL_31:
                id v26 = v85;
                uint64_t v24 = v93;
              }
            }

            [v92 addObject:v28];
            ++v27;
          }
          while (v27 != v24);
          uint64_t v24 = [v87 countByEnumeratingWithState:&v107 objects:v118 count:16];
        }
        while (v24);
      }
      else
      {
        int v25 = 0;
      }

      long long v42 = [MEMORY[0x1E4F1CA80] set];
      long long v43 = [v82 secureConfiguration];
      long long v44 = [v43 senderConfiguration];
      long long v45 = [v44 deniedContacts];

      long long v101 = 0u;
      long long v102 = 0u;
      long long v99 = 0u;
      long long v100 = 0u;
      id v86 = v45;
      v83 = v42;
      uint64_t v94 = [v86 countByEnumeratingWithState:&v99 objects:v116 count:16];
      if (v94)
      {
        uint64_t v46 = *(void *)v100;
        uint64_t v84 = *(void *)v100;
        do
        {
          for (uint64_t j = 0; j != v94; ++j)
          {
            if (*(void *)v100 != v46) {
              objc_enumerationMutation(v86);
            }
            id v48 = *(id *)(*((void *)&v99 + 1) + 8 * j);
            char v49 = [v48 contactIdentifier];
            int v50 = [v14 containsObject:v49];

            if (v50)
            {
              id v51 = (void *)[v48 mutableCopy];
              [v51 setContactIdentifier:0];
              int v25 = 1;
              id v52 = v48;
              id v48 = v51;
            }
            else
            {
              long long v97 = 0u;
              long long v98 = 0u;
              long long v95 = 0u;
              long long v96 = 0u;
              id v52 = v91;
              uint64_t v53 = [v52 countByEnumeratingWithState:&v95 objects:v115 count:16];
              if (v53)
              {
                uint64_t v54 = v53;
                int v90 = v25;
                uint64_t v55 = *(void *)v96;
                do
                {
                  for (uint64_t k = 0; k != v54; ++k)
                  {
                    if (*(void *)v96 != v55) {
                      objc_enumerationMutation(v52);
                    }
                    uint64_t v57 = *(void **)(*((void *)&v95 + 1) + 8 * k);
                    BOOL v58 = [v48 contactIdentifier];
                    id v59 = [v57 contactIdentifier];
                    if ([v58 isEqualToString:v59])
                    {
                      char v60 = [v48 isEqual:v57];

                      if ((v60 & 1) == 0)
                      {
                        uint64_t v61 = [v57 makeRecord];

                        int v25 = 1;
                        id v48 = (id)v61;
                        id v14 = v88;
                        goto LABEL_55;
                      }
                    }
                    else
                    {
                    }
                  }
                  uint64_t v54 = [v52 countByEnumeratingWithState:&v95 objects:v115 count:16];
                }
                while (v54);
                id v14 = v88;
                int v25 = v90;
LABEL_55:
                long long v42 = v83;
              }
              uint64_t v46 = v84;
            }

            [v42 addObject:v48];
          }
          uint64_t v94 = [v86 countByEnumeratingWithState:&v99 objects:v116 count:16];
        }
        while (v94);
      }

      if (v25)
      {
        long long v62 = (void *)DNDSLogModeConfigurations;
        if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_DEFAULT))
        {
          long long v63 = v62;
          long long v64 = [v82 mode];
          long long v65 = [v64 modeIdentifier];
          *(_DWORD *)buf = 138543362;
          id v121 = v65;
          _os_log_impl(&dword_1D3052000, v63, OS_LOG_TYPE_DEFAULT, "Detected matching contact in configuration: %{public}@", buf, 0xCu);
        }
        [v78 setAllowedContacts:v92];
        [v78 setDeniedContacts:v83];
        [v79 setSenderConfiguration:v78];
        [v80 setSecureConfiguration:v79];
        long long v66 = [v80 mode];
        long long v67 = [v66 modeIdentifier];
        [v74 setModeConfiguration:v80 forModeIdentifier:v67];

        char v73 = 1;
      }

      uint64_t v15 = v81 + 1;
    }
    while (v81 + 1 != v77);
    uint64_t v77 = [obj countByEnumeratingWithState:&v111 objects:v119 count:16];
  }
  while (v77);
  if ((v73 & 1) == 0)
  {
LABEL_67:
    long long v68 = DNDSLogModeConfigurations;
    if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D3052000, v68, OS_LOG_TYPE_DEFAULT, "Did not encounter any matching configurations", buf, 2u);
    }

LABEL_70:
    os_unfair_lock_unlock(lock);
    goto LABEL_71;
  }
  [v74 log:DNDSLogModeConfigurations withMessage:@"Writing updated configurations"];
  [(DNDSModeConfigurationsStore *)v70 _lock_writeRecord:v74 writePartition:1 error:0];

  os_unfair_lock_unlock(lock);
  [(DNDSModeConfigurationsStore *)v70 _notifyDelegateOfAvailableModes];
LABEL_71:
}

- (id)_lock_mutableExistingConfigurations
{
  v2 = [(DNDSModeConfigurationsStore *)self _lock_existingConfigurations];
  v3 = (void *)[v2 mutableCopy];

  return v3;
}

- (id)_lock_existingConfigurations
{
  os_unfair_lock_assert_owner(&self->_lock);
  backingStore = self->_backingStore;
  id v7 = 0;
  v4 = [(DNDSBackingStore *)backingStore readRecordWithError:&v7];
  id v5 = v7;
  if (v5 && os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_ERROR)) {
    -[DNDSModeConfigurationsStore _lock_existingConfigurations]();
  }

  return v4;
}

- (BOOL)_lock_populateDNDSIDSRecord:(id)a3
{
  p_locuint64_t k = &self->_lock;
  id v5 = a3;
  os_unfair_lock_assert_owner(p_lock);
  id v6 = [v5 recordID];
  id v7 = [(DNDSModeConfigurationsStore *)self _lock_modeConfigurationForDNDSIDSRecordID:v6];

  unint64_t v8 = [v7 lastModified];
  [v5 setObject:v8 forKey:@"DNDSModeConfigurationsLastModified"];

  LOBYTE(v8) = [v7 populateDNDSIDSRecord:v5];
  return (char)v8;
}

- (int64_t)_lock_populateCKRecord:(id)a3 lastChanceRecord:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_assert_owner(&self->_lock);
  unint64_t v8 = [v6 recordID];
  uint64_t v9 = [(DNDSModeConfigurationsStore *)self _lock_modeConfigurationForCKRecordID:v8];

  id v10 = [v6 encryptedValues];
  uint64_t v11 = [v9 lastModified];
  [v10 setObject:v11 forKey:@"DNDSModeConfigurationsLastModified"];

  if ([v9 wasLastModifiedByThisDevice])
  {
    int v12 = (void *)[v9 mutableCopy];
    id v13 = +[DNDSDevice currentDevice];
    id v14 = [v13 identifier];
    [v12 setLastModifiedByDeviceID:v14];

    uint64_t v15 = [v12 copy];
    uint64_t v9 = (void *)v15;
  }
  int64_t v16 = [v9 populateCKRecord:v6 lastChanceRecord:v7];

  return v16;
}

- (id)_lock_modeConfigurationForDNDSIDSRecordID:(id)a3
{
  v4 = [a3 identifier];
  id v5 = [(DNDSModeConfigurationsStore *)self _lock_modeConfigurationForModeIdentifier:v4];

  return v5;
}

- (id)_lock_modeConfigurationForCKRecordID:(id)a3
{
  v4 = [a3 recordName];
  id v5 = [(DNDSModeConfigurationsStore *)self _lock_modeConfigurationForModeIdentifier:v4];

  return v5;
}

- (id)_lock_modeConfigurationForModeIdentifier:(id)a3
{
  p_locuint64_t k = &self->_lock;
  id v5 = a3;
  os_unfair_lock_assert_owner(p_lock);
  id v6 = [(DNDSModeConfigurationsStore *)self _lock_existingConfigurations];
  id v7 = [v6 modeConfigurationForModeIdentifier:v5];

  return v7;
}

- (void)_lock_removeModeConfigurationWithCKRecordID:(id)a3
{
  id v4 = [a3 recordName];
  [(DNDSModeConfigurationsStore *)self _lock_removeModeConfigurationWithModeIdentifier:v4];
}

- (void)_lock_removeModeConfigurationWithModeIdentifier:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  id v5 = [(DNDSModeConfigurationsStore *)self _lock_mutableExistingConfigurations];
  [v5 setModeConfiguration:0 forModeIdentifier:v4];
  backingStore = self->_backingStore;
  id v8 = 0;
  [(DNDSBackingStore *)backingStore writeRecord:v5 writePartition:1 error:&v8];
  id v7 = v8;
  if (v7 && os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_ERROR)) {
    -[DNDSModeConfigurationsStore _lock_removeModeConfigurationWithModeIdentifier:]();
  }
}

- (void)_lock_updateModeConfigurationWithConfiguration:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  id v5 = (void *)DNDSLogModeConfigurations;
  if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    id v7 = [v4 mode];
    id v8 = [v7 modeIdentifier];
    *(_DWORD *)buf = 138543362;
    int64_t v16 = v8;
    _os_log_impl(&dword_1D3052000, v6, OS_LOG_TYPE_DEFAULT, "Writing updated configuration with identifier: %{public}@", buf, 0xCu);
  }
  [v4 log:DNDSLogModeConfigurations withMessage:@"Configuration"];
  uint64_t v9 = [(DNDSModeConfigurationsStore *)self _lock_mutableExistingConfigurations];
  id v10 = [v4 mode];
  uint64_t v11 = [v10 modeIdentifier];
  [v9 setModeConfiguration:v4 forModeIdentifier:v11];

  backingStore = self->_backingStore;
  id v14 = 0;
  [(DNDSBackingStore *)backingStore writeRecord:v9 writePartition:1 error:&v14];
  id v13 = v14;
  if (v13 && os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_ERROR)) {
    -[DNDSModeConfigurationsStore _lock_updateModeConfigurationWithConfiguration:]();
  }
}

- (unint64_t)_lock_writeRecord:(id)a3 writePartition:(BOOL)a4 error:(id *)a5
{
  BOOL v53 = a4;
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v7 = (void *)[a3 mutableCopy];
  char v60 = self;
  uint64_t v55 = a5;
  uint64_t v8 = [(DNDSBackingStore *)self->_backingStore readRecordWithError:a5];
  [v7 log:DNDSLogModeConfigurations withMessage:@"Writing configurations"];
  v56 = (void *)v8;
  BOOL v58 = v7;
  uint64_t v54 = (void *)[objc_alloc(MEMORY[0x1E4F1A310]) initWithZoneName:@"DNDSModeConfigurations"];
  uint64_t v9 = [[DNDSModeConfigurationsRecordDiff alloc] initWithOriginalModeConfigurations:v8 updatedModeConfigurations:v7 zone:v54];
  id v10 = (void *)DNDSLogModeConfigurations;
  if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = v10;
    int v12 = [(DNDSModeConfigurationsRecordDiff *)v9 modifiedIDs];
    *(_DWORD *)buf = 138543362;
    v74 = v12;
    _os_log_impl(&dword_1D3052000, v11, OS_LOG_TYPE_DEFAULT, "Merge diff modified: %{public}@", buf, 0xCu);
  }
  id v13 = (void *)DNDSLogModeConfigurations;
  if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = v13;
    uint64_t v15 = [(DNDSModeConfigurationsRecordDiff *)v9 removedIDs];
    *(_DWORD *)buf = 138543362;
    v74 = v15;
    _os_log_impl(&dword_1D3052000, v14, OS_LOG_TYPE_DEFAULT, "Merge diff deleted: %{public}@", buf, 0xCu);
  }
  int64_t v16 = [MEMORY[0x1E4F1C9C8] date];
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  uint64_t v57 = v9;
  obuint64_t j = [(DNDSModeConfigurationsRecordDiff *)v9 modifiedIDs];
  uint64_t v17 = [obj countByEnumeratingWithState:&v65 objects:v72 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v66;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v66 != v19) {
          objc_enumerationMutation(obj);
        }
        BOOL v21 = [*(id *)(*((void *)&v65 + 1) + 8 * i) recordName];
        id v22 = [v58 modeConfigurationForModeIdentifier:v21];
        uint64_t v23 = (void *)[v22 mutableCopy];

        uint64_t v24 = [v23 lastModified];
        int v25 = [v24 earlierDate:v16];

        if (v25 == v16)
        {
          id v26 = [MEMORY[0x1E4F1C9C8] distantPast];
          [v23 setLastModified:v26];
        }
        else
        {
          [v23 setLastModified:v16];
        }
        uint64_t v27 = [v23 mode];
        id v28 = [v27 modeIdentifier];
        [v58 setModeConfiguration:v23 forModeIdentifier:v28];

        __int16 v29 = [[DNDSIDSRecordID alloc] initWithIdentifier:v21 zone:@"DNDSModeConfigurations"];
        idsSyncEngine = v60->_idsSyncEngine;
        id v71 = v29;
        uint64_t v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v71 count:1];
        [(DNDSIDSSyncEngine *)idsSyncEngine addRecordIDsToSave:v31 recordIDsToDelete:0];
      }
      uint64_t v18 = [obj countByEnumeratingWithState:&v65 objects:v72 count:16];
    }
    while (v18);
  }

  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id v32 = [(DNDSModeConfigurationsRecordDiff *)v57 removedIDs];
  uint64_t v33 = [v32 countByEnumeratingWithState:&v61 objects:v70 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v62;
    do
    {
      for (uint64_t j = 0; j != v34; ++j)
      {
        if (*(void *)v62 != v35) {
          objc_enumerationMutation(v32);
        }
        long long v37 = [*(id *)(*((void *)&v61 + 1) + 8 * j) recordName];
        long long v38 = [[DNDSIDSRecordID alloc] initWithIdentifier:v37 zone:@"DNDSModeConfigurations"];
        uint64_t v39 = v60->_idsSyncEngine;
        long long v69 = v38;
        char v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v69 count:1];
        [(DNDSIDSSyncEngine *)v39 addRecordIDsToSave:0 recordIDsToDelete:v40];
      }
      uint64_t v34 = [v32 countByEnumeratingWithState:&v61 objects:v70 count:16];
    }
    while (v34);
  }

  unint64_t v41 = [(DNDSBackingStore *)v60->_backingStore writeRecord:v58 writePartition:v53 error:v55];
  if (v55)
  {
    if (*v55)
    {
      long long v42 = DNDSLogModeConfigurations;
      if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_ERROR)) {
        -[DNDSModeConfigurationsStore _lock_writeRecord:writePartition:error:]((uint64_t)v55, v42, v43, v44, v45, v46, v47, v48);
      }
    }
  }
  syncEngine = v60->_syncEngine;
  int v50 = [(DNDSModeConfigurationsRecordDiff *)v57 modifiedIDs];
  id v51 = [(DNDSModeConfigurationsRecordDiff *)v57 removedIDs];
  [(DNDSSyncEngine *)syncEngine addRecordIDsToSave:v50 recordIDsToDelete:v51];

  return v41;
}

- (void)_lock_purgeRecordIDs:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  id v5 = DNDSLogModeConfigurations;
  if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v30 = v4;
    _os_log_impl(&dword_1D3052000, v5, OS_LOG_TYPE_DEFAULT, "Purging record IDs: %{public}@", buf, 0xCu);
  }
  id v6 = [(DNDSModeConfigurationsStore *)self _lock_mutableExistingConfigurations];
  id v7 = [MEMORY[0x1E4F5F658] defaultModeConfiguration];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v8 = v4;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v25;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = [*(id *)(*((void *)&v24 + 1) + 8 * v12) recordName];
        id v14 = [v7 mode];
        uint64_t v15 = [v14 modeIdentifier];
        int v16 = [v13 isEqualToString:v15];

        if (v16)
        {
          uint64_t v17 = [v7 makeRecord];
          uint64_t v18 = [v7 mode];
          uint64_t v19 = [v18 modeIdentifier];
          [v6 setModeConfiguration:v17 forModeIdentifier:v19];
        }
        else
        {
          [v6 setModeConfiguration:0 forModeIdentifier:v13];
        }

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v10);
  }

  uint64_t v20 = *(void **)(v22 + 8);
  id v23 = 0;
  [v20 writeRecord:v6 writePartition:1 error:&v23];
  id v21 = v23;
  if (v21 && os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_ERROR)) {
    -[DNDSModeConfigurationsStore _lock_purgeRecordIDs:]();
  }
}

- (void)_lock_purgeData
{
  v40[1] = *MEMORY[0x1E4F143B8];
  os_unfair_lock_assert_owner(&self->_lock);
  v3 = DNDSLogModeConfigurations;
  if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D3052000, v3, OS_LOG_TYPE_DEFAULT, "Purging data", buf, 2u);
  }
  id v4 = [MEMORY[0x1E4F5F658] defaultModeConfiguration];
  uint64_t v31 = self;
  id v5 = [(DNDSModeConfigurationsStore *)self _lock_recordIDsForIDSSyncEngine:self->_idsSyncEngine];
  id v6 = [DNDSIDSRecordID alloc];
  id v7 = [v4 mode];
  id v8 = [v7 modeIdentifier];
  uint64_t v9 = [(DNDSIDSRecordID *)v6 initWithIdentifier:v8 zone:@"DNDSModeConfigurations"];
  v40[0] = v9;
  uint64_t v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:1];

  id v32 = [MEMORY[0x1E4F1CA48] array];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v10 = v5;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v35 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        int v16 = objc_msgSend(v15, "identifier", v29);
        uint64_t v17 = [v4 mode];
        uint64_t v18 = [v17 modeIdentifier];
        char v19 = [v16 isEqualToString:v18];

        if ((v19 & 1) == 0) {
          [v32 addObject:v15];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v34 objects:v39 count:16];
    }
    while (v12);
  }

  uint64_t v20 = [v4 makeRecord];
  id v21 = objc_alloc_init(DNDSMutableModeConfigurationsRecord);
  uint64_t v22 = [v4 mode];
  id v23 = [v22 modeIdentifier];
  [(DNDSMutableModeConfigurationsRecord *)v21 setModeConfiguration:v20 forModeIdentifier:v23];

  long long v24 = DNDSLogModeConfigurations;
  if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D3052000, v24, OS_LOG_TYPE_DEFAULT, "Replacing records with default mode configuration", buf, 2u);
  }
  backingStore = v31->_backingStore;
  id v33 = 0;
  -[DNDSBackingStore writeRecord:writePartition:error:](backingStore, "writeRecord:writePartition:error:", v21, 1, &v33, v29);
  id v26 = v33;
  [(DNDSIDSSyncEngine *)v31->_idsSyncEngine addRecordIDsToSave:v30 recordIDsToDelete:v32];
  if (v26 && os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_ERROR)) {
    -[DNDSModeConfigurationsStore purgeRecordsForIDSSyncEngine:]();
  }
  contactHistoryToken = v31->_contactHistoryToken;
  v31->_contactHistoryToken = 0;

  id v28 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v28 removeObjectForKey:@"DNDSModeConfigurationsContactHistoryToken"];
}

- (id)_lock_modeIdentifiers
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_assert_owner(&self->_lock);
  v3 = [MEMORY[0x1E4F1CA48] array];
  backingStore = self->_backingStore;
  id v22 = 0;
  id v5 = [(DNDSBackingStore *)backingStore readRecordWithError:&v22];
  id v6 = v22;
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_ERROR)) {
      -[DNDSModeConfigurationsStore _lock_modeIdentifiers]();
    }
  }
  else
  {
    id v7 = [v5 modeConfigurations];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v25 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = [*(id *)(*((void *)&v18 + 1) + 8 * i) mode];
          uint64_t v13 = [v12 modeIdentifier];

          [v3 addObject:v13];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v25 count:16];
      }
      while (v9);
    }
  }
  id v14 = (void *)DNDSLogModeConfigurations;
  if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = v14;
    uint64_t v16 = [v3 count];
    *(_DWORD *)buf = 134349056;
    uint64_t v24 = v16;
    _os_log_impl(&dword_1D3052000, v15, OS_LOG_TYPE_DEFAULT, "Fetched %{public}llu mode identifiers", buf, 0xCu);
  }
  return v3;
}

- (id)_lock_recordIDsForIDSSyncEngine:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_assert_owner(&self->_lock);
  id v4 = [MEMORY[0x1E4F1CA48] array];
  id v5 = [(DNDSModeConfigurationsStore *)self _lock_modeIdentifiers];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [[DNDSIDSRecordID alloc] initWithIdentifier:*(void *)(*((void *)&v15 + 1) + 8 * i) zone:@"DNDSModeConfigurations"];
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v21 count:16];
    }
    while (v7);
  }
  uint64_t v11 = (void *)DNDSLogModeConfigurations;
  if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = v11;
    uint64_t v13 = [v4 count];
    *(_DWORD *)buf = 134349056;
    uint64_t v20 = v13;
    _os_log_impl(&dword_1D3052000, v12, OS_LOG_TYPE_DEFAULT, "Fetched %{public}llu record IDs for the IDS sync engine", buf, 0xCu);
  }
  return v4;
}

- (void)_notifyDelegateOfAvailableModes
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v4 = [(DNDSModeConfigurationsStore *)self _lock_existingConfigurations];
  id v5 = [MEMORY[0x1E4F1CA48] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v6 = [v4 modeConfigurations];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = [*(id *)(*((void *)&v15 + 1) + 8 * i) mode];
        uint64_t v12 = [MEMORY[0x1E4F5F5F8] modeForRecord:v11];
        if (([v12 isPlaceholder] & 1) == 0) {
          [v5 addObject:v12];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v21 count:16];
    }
    while (v8);
  }

  os_unfair_lock_unlock(p_lock);
  uint64_t v13 = DNDSLogModeConfigurations;
  if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v20 = v5;
    _os_log_impl(&dword_1D3052000, v13, OS_LOG_TYPE_DEFAULT, "Notifying delegate of available modes: %{public}@", buf, 0xCu);
  }
  [WeakRetained modeConfigurationStore:self didUpdateAvailableModes:v5];
}

- (void)_purgeData
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(DNDSModeConfigurationsStore *)self _lock_purgeData];
  os_unfair_lock_unlock(p_lock);
  [(DNDSModeConfigurationsStore *)self _notifyDelegateOfAvailableModes];
}

- (void)_purgeRecordIDs:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  [(DNDSModeConfigurationsStore *)self _lock_purgeRecordIDs:v4];
  id v5 = [MEMORY[0x1E4F1CA48] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v12 = [DNDSIDSRecordID alloc];
        uint64_t v13 = [v11 recordName];
        id v14 = [(DNDSIDSRecordID *)v12 initWithIdentifier:v13 zone:@"DNDSModeConfigurations"];

        [v5 addObject:v14];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  [(DNDSIDSSyncEngine *)self->_idsSyncEngine addRecordIDsToSave:0 recordIDsToDelete:v5];
  os_unfair_lock_unlock(&self->_lock);
  [(DNDSModeConfigurationsStore *)self _notifyDelegateOfAvailableModes];
}

- (DNDSModeConfigurationsStoreDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DNDSModeConfigurationsStoreDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setContactHistoryToken:(id)a3
{
}

- (NSNumber)compatibilityVersion
{
  return self->_compatibilityVersion;
}

- (void)setCompatibilityVersion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compatibilityVersion, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_idsRecordIDsToForceSave, 0);
  objc_storeStrong((id *)&self->_ckRecordIDsToForceSave, 0);
  objc_storeStrong((id *)&self->_contactHistoryToken, 0);
  objc_storeStrong((id *)&self->_idsSyncEngine, 0);
  objc_storeStrong((id *)&self->_syncEngine, 0);
  objc_storeStrong((id *)&self->_contactMonitor, 0);
  objc_storeStrong((id *)&self->_backingStore, 0);
}

- (void)_lock_mergeLocalConfigurationRecord:withRemoteConfigurationRecord:modeIdentifier:sourceDeviceIdentifier:sourceFrameworkVersion:sourceIsCloud:sourceWantsToForce:deleteModeOnCorruption:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1D3052000, v0, v1, "Fetched data with ID %{public}@ could not be reconstructed into a configuration; deleting local configuration",
    v2,
    v3,
    v4,
    v5,
    v6);
}

- (void)_lock_mergeLocalConfigurationRecord:withRemoteConfigurationRecord:modeIdentifier:sourceDeviceIdentifier:sourceFrameworkVersion:sourceIsCloud:sourceWantsToForce:deleteModeOnCorruption:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1D3052000, v0, v1, "Fetched data with ID %{public}@ could not be reconstructed into a configuration; ignoring update",
    v2,
    v3,
    v4,
    v5,
    v6);
}

- (void)syncEngine:(void *)a1 failedToDeleteRecordWithID:(void *)a2 error:(uint64_t)a3 .cold.1(void *a1, void *a2, uint64_t a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = a1;
  uint8_t v6 = [a2 recordName];
  OUTLINED_FUNCTION_2_2();
  uint64_t v8 = a3;
  _os_log_error_impl(&dword_1D3052000, v5, OS_LOG_TYPE_ERROR, "Failed to delete record %{public}@: %{public}@", v7, 0x16u);
}

- (void)purgeRecordsForIDSSyncEngine:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1D3052000, v0, v1, "Error deleting records: %{public}@", v2, v3, v4, v5, v6);
}

- (void)monitoredContacts
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1D3052000, v0, v1, "Could not read current configuration for monitored contacts: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_lock_existingConfigurations
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1D3052000, v0, v1, "Failed to fetch existing configurations: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_lock_removeModeConfigurationWithModeIdentifier:.cold.1()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_2();
  uint64_t v3 = v0;
  _os_log_error_impl(&dword_1D3052000, v1, OS_LOG_TYPE_ERROR, "Failed to remove record %{public}@: %{public}@", v2, 0x16u);
}

- (void)_lock_updateModeConfigurationWithConfiguration:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1D3052000, v0, v1, "Error writing fetched configurations: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_lock_writeRecord:(uint64_t)a3 writePartition:(uint64_t)a4 error:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_lock_purgeRecordIDs:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1D3052000, v0, v1, "Error purging record IDs: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_lock_modeIdentifiers
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1D3052000, v0, v1, "Could not read records to extract mode identifiers: %{public}@", v2, v3, v4, v5, v6);
}

@end