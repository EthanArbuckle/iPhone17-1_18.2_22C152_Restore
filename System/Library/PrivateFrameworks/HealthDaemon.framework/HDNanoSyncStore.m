@interface HDNanoSyncStore
+ (HDNanoSyncStore)nanoSyncStoreWithProfile:(id)a3 device:(id)a4 delegate:(id)a5 tinkerPaired:(BOOL)a6;
+ (id)_observedDeviceProperties;
+ (id)orderedSyncEntitiesForProfile:(id)a3 protocolVersion:(int)a4 companion:(BOOL)a5;
- (BOOL)canRecieveSyncObjectsForEntityClass:(Class)a3;
- (BOOL)enforceSyncEntityOrdering;
- (BOOL)isActive;
- (BOOL)isAltAccount;
- (BOOL)isInvalidated;
- (BOOL)isMaster;
- (BOOL)isRestoreComplete;
- (BOOL)needsSyncOnUnlock;
- (BOOL)resetProvenanceWithError:(id *)a3;
- (BOOL)shouldContinueAfterAnchorValidationError:(id)a3;
- (BOOL)shouldEnforceSequenceOrdering;
- (BOOL)supportsSpeculativeChangesForSyncEntityClass:(Class)a3;
- (BOOL)validatePairingUUIDsWithIncomingMessage:(id)a3;
- (HDNanoSyncRestoreSession)restoreSession;
- (HDNanoSyncStoreDelegate)delegate;
- (HKNanoSyncPairedDeviceInfo)deviceInfo;
- (IDSDevice)device;
- (NSDate)lastInactiveDate;
- (NSSet)obliteratedDatabaseUUIDs;
- (NSString)description;
- (NSString)deviceName;
- (NSString)remoteProductType;
- (NSString)remoteSystemBuildVersion;
- (NSString)sourceBundleIdentifier;
- (NSUUID)healthUUID;
- (NSUUID)nanoRegistryUUID;
- (NSUUID)persistentUUID;
- (id)_initWithIdentityServicesDevice:(void *)a3 nanoRegistryDevice:(void *)a4 pairingEntity:(void *)a5 obliteratedDatabaseUUIDs:(int)a6 protocolVersion:(void *)a7 delegate:(void *)a8 profile:(char)a9 tinkerPairing:;
- (id)beginRestoreSessionWithUUID:(id)a3 timeout:(double)a4 timeoutHandler:(id)a5;
- (id)createRequestWithMessageID:(unsigned __int16)a3;
- (id)databaseIdentifier;
- (id)diagnosticDescription;
- (id)nanoSyncStoreForProtocolVersion:(int)a3;
- (id)orderedSyncEntities;
- (id)pendingRequestContextForUUID:(id)a3;
- (id)profile;
- (id)syncEntityDependenciesForSyncEntity:(Class)a3;
- (int)protocolVersion;
- (int64_t)expectedSequenceNumberForSyncEntityClass:(Class)a3;
- (int64_t)restoreState;
- (int64_t)syncEpoch;
- (int64_t)syncProvenance;
- (int64_t)syncStoreType;
- (void)_notifyIncomingSyncObservers;
- (void)_savePairingEntity;
- (void)_setRestoreState:(uint64_t)a1;
- (void)addIncomingSyncObserverWithTimeout:(double)a3 timeoutHandler:(id)a4 completion:(id)a5;
- (void)addPendingRequestContext:(id)a3 forUUID:(id)a4;
- (void)configureOutgoingResponse:(id)a3;
- (void)dealloc;
- (void)device:(id)a3 propertyDidChange:(id)a4 fromValue:(id)a5;
- (void)didReceiveRequestWithChangeSet:(id)a3;
- (void)finishRestoreSessionWithError:(id)a3;
- (void)invalidate;
- (void)prepareForObliteration;
- (void)removeExpiredIncomingSyncObservers;
- (void)removePendingRequestContextForUUID:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setExpectedSequenceNumber:(int64_t)a3 forSyncEntityClass:(Class)a4;
- (void)setHealthUUID:(id)a3;
- (void)setNeedsSyncOnUnlock:(BOOL)a3;
- (void)setPersistentUUID:(id)a3;
@end

@implementation HDNanoSyncStore

- (BOOL)isActive
{
  return self->_active;
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (HKNanoSyncPairedDeviceInfo)deviceInfo
{
  id v3 = objc_alloc(MEMORY[0x1E4F2B258]);
  v4 = [(HDNanoSyncStore *)self sourceBundleIdentifier];
  v5 = objc_msgSend(v3, "initWithSourceBundleIdentifier:systemBuildVersion:productType:active:restoreComplete:protocolVersion:", v4, self->_remoteSystemBuildVersion, self->_remoteProductType, -[HDNanoSyncStore isActive](self, "isActive"), -[HDNanoSyncStore isRestoreComplete](self, "isRestoreComplete"), self->_protocolVersion);

  return (HKNanoSyncPairedDeviceInfo *)v5;
}

- (NSString)sourceBundleIdentifier
{
  return [(HDNanoPairingEntity *)self->_pairingEntity defaultSourceBundleIdentifier];
}

- (BOOL)isRestoreComplete
{
  return self->_restoreState == 3;
}

- (int64_t)restoreState
{
  return self->_restoreState;
}

- (NSUUID)nanoRegistryUUID
{
  return [(HDNanoPairingEntity *)self->_pairingEntity nanoRegistryUUID];
}

- (NSString)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  if (self) {
    nanoRegistryDevice = self->_nanoRegistryDevice;
  }
  else {
    nanoRegistryDevice = 0;
  }
  v6 = [(NRDevice *)nanoRegistryDevice hd_productType];
  if (self->_active) {
    v7 = "active";
  }
  else {
    v7 = "inactive";
  }
  if ([(HDNanoSyncStore *)self isAltAccount]) {
    v8 = "alt account";
  }
  else {
    v8 = "standard account";
  }
  v9 = [(HDNanoSyncStore *)self nanoRegistryUUID];
  v10 = [v9 UUIDString];
  v11 = [(HDNanoSyncStore *)self device];
  v12 = objc_msgSend(v11, "hd_deviceIdentifier");
  v13 = [v3 stringWithFormat:@"<%@:%p \"%@\" (%s) (%s) registry-id:%@ device-id:%@>", v4, self, v6, v7, v8, v10, v12, 0];

  return (NSString *)v13;
}

- (NSString)deviceName
{
  return (NSString *)[(NRDevice *)self->_nanoRegistryDevice hd_name];
}

- (IDSDevice)device
{
  return self->_identityServicesDevice;
}

- (BOOL)enforceSyncEntityOrdering
{
  return 1;
}

- (id)orderedSyncEntities
{
  orderedSyncEntities = self->_orderedSyncEntities;
  if (!orderedSyncEntities)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    v5 = +[HDNanoSyncStore orderedSyncEntitiesForProfile:WeakRetained protocolVersion:self->_protocolVersion companion:self->_master];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __38__HDNanoSyncStore_orderedSyncEntities__block_invoke;
    v9[3] = &unk_1E63034B8;
    v9[4] = self;
    objc_msgSend(v5, "hk_filter:", v9);
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_orderedSyncEntities;
    self->_orderedSyncEntities = v6;

    orderedSyncEntities = self->_orderedSyncEntities;
  }

  return orderedSyncEntities;
}

- (id)syncEntityDependenciesForSyncEntity:(Class)a3
{
  return (id)[(objc_class *)a3 syncEntityDependenciesForSyncProtocolVersion:self->_protocolVersion];
}

- (int)protocolVersion
{
  return self->_protocolVersion;
}

- (int64_t)syncProvenance
{
  return [(HDNanoPairingEntity *)self->_pairingEntity syncProvenance];
}

- (NSUUID)persistentUUID
{
  return [(HDNanoPairingEntity *)self->_pairingEntity persistentUUID];
}

- (NSUUID)healthUUID
{
  return [(HDNanoPairingEntity *)self->_pairingEntity healthDatabaseUUID];
}

- (id)createRequestWithMessageID:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  v5 = [[HDIDSParticipant alloc] initWithDevice:self->_identityServicesDevice];
  v6 = +[HDIDSOutgoingRequest requestWithMessageID:v3 participant:v5];
  if ([(HDNanoSyncStore *)self isMaster]) {
    int v7 = ![(HDNanoSyncStore *)self isActive];
  }
  else {
    int v7 = 0;
  }
  int v8 = [v6 messageID];
  double v9 = 300.0;
  switch(v8)
  {
    case 13:
      double v10 = 0.0;
      break;
    case 7:
      double v10 = 0.0;
      double v9 = 172800.0;
      break;
    case 2:
      if (v7) {
        double v9 = 172800.0;
      }
      else {
        double v9 = 3600.0;
      }
      if (v7) {
        double v10 = 172800.0;
      }
      else {
        double v10 = 7200.0;
      }
      break;
    default:
      double v10 = 600.0;
      break;
  }
  [v6 setForceLocalDelivery:1];
  [v6 setSendTimeout:v9];
  [v6 setResponseTimeout:v10];

  return v6;
}

- (BOOL)isMaster
{
  return self->_master;
}

- (BOOL)validatePairingUUIDsWithIncomingMessage:(id)a3
{
  id v6 = a3;
  int v7 = [v6 decodedPersistentPairingUUID];
  int v8 = [v6 decodedHealthPairingUUID];

  double v9 = [(HDNanoSyncStore *)self persistentUUID];
  if (v7 != v9)
  {
    uint64_t v10 = [(HDNanoSyncStore *)self persistentUUID];
    if (!v10)
    {
      char v11 = 0;
      goto LABEL_13;
    }
    uint64_t v3 = (void *)v10;
    uint64_t v4 = [(HDNanoSyncStore *)self persistentUUID];
    if (![v7 isEqual:v4])
    {
      char v11 = 0;
LABEL_12:

      goto LABEL_13;
    }
  }
  uint64_t v12 = [(HDNanoSyncStore *)self healthUUID];
  if (v8 == (void *)v12)
  {

    char v11 = 1;
  }
  else
  {
    v13 = (void *)v12;
    uint64_t v14 = [(HDNanoSyncStore *)self healthUUID];
    if (v14)
    {
      v15 = (void *)v14;
      v16 = [(HDNanoSyncStore *)self healthUUID];
      char v11 = [v8 isEqual:v16];
    }
    else
    {

      char v11 = 0;
    }
  }
  if (v7 != v9) {
    goto LABEL_12;
  }
LABEL_13:

  return v11;
}

- (void)didReceiveRequestWithChangeSet:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [v4 statusCode];
  id v6 = [v4 decodedSessionUUID];
  int v7 = [v4 decodedSessionStartDate];
  int v8 = [v4 decodedSessionError];

  double v9 = (os_log_t *)MEMORY[0x1E4F29FA8];
  if (v8 && (_HKInitializeLogging(), os_log_t v10 = *v9, os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR)))
  {
    v19 = v10;
    v20 = [v6 UUIDString];
    int v21 = 138543618;
    v22 = v20;
    __int16 v23 = 2114;
    v24 = v8;
    _os_log_error_impl(&dword_1BCB7D000, v19, OS_LOG_TYPE_ERROR, "incoming sync session %{public}@ error: %{public}@", (uint8_t *)&v21, 0x16u);

    if (!v6) {
      goto LABEL_6;
    }
  }
  else if (!v6)
  {
    goto LABEL_6;
  }
  if (!v7 || ([v7 timeIntervalSinceNow], v11 > 3600.0))
  {
LABEL_6:
    _HKInitializeLogging();
    os_log_t v12 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
    {
      v17 = v12;
      v18 = [v6 UUIDString];
      int v21 = 138543618;
      v22 = v18;
      __int16 v23 = 2114;
      v24 = v7;
      _os_log_error_impl(&dword_1BCB7D000, v17, OS_LOG_TYPE_ERROR, "unexpected session UUID (%{public}@) or date (%{public}@) in change set", (uint8_t *)&v21, 0x16u);
    }
    goto LABEL_8;
  }
  lastIncompleteIncomingSyncUUID = self->_lastIncompleteIncomingSyncUUID;
  if (!lastIncompleteIncomingSyncUUID
    || ([(NSUUID *)lastIncompleteIncomingSyncUUID isEqual:v6] & 1) != 0
    || objc_msgSend(v7, "hk_isAfterDate:", self->_lastIncompleteIncomingSyncDate))
  {
    if ((v5 - 2) >= 2)
    {
      if (v5 == 1)
      {
        objc_storeStrong((id *)&self->_lastIncompleteIncomingSyncUUID, v6);
        objc_storeStrong((id *)&self->_lastIncompleteIncomingSyncDate, v7);
      }
      else
      {
        _HKInitializeLogging();
        v16 = *v9;
        if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
        {
          int v21 = 67109120;
          LODWORD(v22) = v5;
          _os_log_error_impl(&dword_1BCB7D000, v16, OS_LOG_TYPE_ERROR, "unexpected change set status code %d", (uint8_t *)&v21, 8u);
        }
      }
    }
    else
    {
      objc_storeStrong((id *)&self->_lastCompleteIncomingSyncDate, v7);
      objc_storeStrong((id *)&self->_lastCompleteIncomingSyncError, v8);
      uint64_t v14 = self->_lastIncompleteIncomingSyncUUID;
      self->_lastIncompleteIncomingSyncUUID = 0;

      lastIncompleteIncomingSyncDate = self->_lastIncompleteIncomingSyncDate;
      self->_lastIncompleteIncomingSyncDate = 0;

      -[HDNanoSyncStore _notifyIncomingSyncObservers]((uint64_t)self);
    }
  }
LABEL_8:
}

- (void)_notifyIncomingSyncObservers
{
  if (a1)
  {
    v2 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v3 = [*(id *)(a1 + 80) dateByAddingTimeInterval:30.0];
    id v4 = *(void **)(a1 + 56);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __47__HDNanoSyncStore__notifyIncomingSyncObservers__block_invoke;
    v7[3] = &unk_1E630CFD8;
    id v8 = v3;
    id v9 = v2;
    id v5 = v2;
    id v6 = v3;
    objc_msgSend(v4, "hk_removeObjectsPassingTest:", v7);
  }
}

- (void)configureOutgoingResponse:(id)a3
{
  id v3 = a3;
  [v3 setForceLocalDelivery:1];
  [v3 setSendTimeout:300.0];
}

+ (id)_observedDeviceProperties
{
  v3[2] = *MEMORY[0x1E4F143B8];
  self;
  uint64_t v0 = *MEMORY[0x1E4F79E08];
  v3[0] = *MEMORY[0x1E4F79E40];
  v3[1] = v0;
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:2];

  return v1;
}

- (BOOL)shouldEnforceSequenceOrdering
{
  return 1;
}

- (int64_t)expectedSequenceNumberForSyncEntityClass:(Class)a3
{
  expectedSequenceNumbers = self->_expectedSequenceNumbers;
  id v4 = NSStringFromClass(a3);
  id v5 = [(NSMutableDictionary *)expectedSequenceNumbers objectForKeyedSubscript:v4];
  int64_t v6 = [v5 integerValue];

  return v6;
}

- (void)setExpectedSequenceNumber:(int64_t)a3 forSyncEntityClass:(Class)a4
{
  if (!self->_expectedSequenceNumbers)
  {
    int v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    expectedSequenceNumbers = self->_expectedSequenceNumbers;
    self->_expectedSequenceNumbers = v7;
  }
  id v11 = [NSNumber numberWithInteger:a3];
  id v9 = self->_expectedSequenceNumbers;
  os_log_t v10 = NSStringFromClass(a4);
  [(NSMutableDictionary *)v9 setObject:v11 forKeyedSubscript:v10];
}

- (id)_initWithIdentityServicesDevice:(void *)a3 nanoRegistryDevice:(void *)a4 pairingEntity:(void *)a5 obliteratedDatabaseUUIDs:(int)a6 protocolVersion:(void *)a7 delegate:(void *)a8 profile:(char)a9 tinkerPairing:
{
  id v16 = a2;
  id v17 = a3;
  id v18 = a4;
  id v39 = a5;
  id v19 = a7;
  id v20 = a8;
  if (!a1) {
    goto LABEL_11;
  }
  if (v17)
  {
    if (v16) {
      goto LABEL_4;
    }
LABEL_13:
    v36 = [MEMORY[0x1E4F28B00] currentHandler];
    [v36 handleFailureInMethod:sel__initWithIdentityServicesDevice_nanoRegistryDevice_pairingEntity_obliteratedDatabaseUUIDs_protocolVersion_delegate_profile_tinkerPairing_, a1, @"HDNanoSyncStore.m", 115, @"Invalid parameter not satisfying: %@", @"identityServicesDevice != nil" object file lineNumber description];

    if (v18) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
  v35 = [MEMORY[0x1E4F28B00] currentHandler];
  [v35 handleFailureInMethod:sel__initWithIdentityServicesDevice_nanoRegistryDevice_pairingEntity_obliteratedDatabaseUUIDs_protocolVersion_delegate_profile_tinkerPairing_, a1, @"HDNanoSyncStore.m", 114, @"Invalid parameter not satisfying: %@", @"registryDevice != nil" object file lineNumber description];

  if (!v16) {
    goto LABEL_13;
  }
LABEL_4:
  if (v18) {
    goto LABEL_5;
  }
LABEL_14:
  v37 = [MEMORY[0x1E4F28B00] currentHandler];
  [v37 handleFailureInMethod:sel__initWithIdentityServicesDevice_nanoRegistryDevice_pairingEntity_obliteratedDatabaseUUIDs_protocolVersion_delegate_profile_tinkerPairing_, a1, @"HDNanoSyncStore.m", 116, @"Invalid parameter not satisfying: %@", @"pairingEntity != nil" object file lineNumber description];

LABEL_5:
  v40.receiver = a1;
  v40.super_class = (Class)HDNanoSyncStore;
  int v21 = (id *)objc_msgSendSuper2(&v40, sel_init);
  a1 = v21;
  if (v21)
  {
    objc_storeWeak(v21 + 1, v20);
    objc_storeWeak(a1 + 17, v19);
    *((unsigned char *)a1 + 114) = [v19 isMaster];
    uint64_t v22 = objc_msgSend(v17, "hd_systemBuildVersion");
    id v23 = a1[2];
    a1[2] = (id)v22;

    uint64_t v24 = objc_msgSend(v17, "hd_productType");
    id v25 = a1[3];
    a1[3] = (id)v24;

    uint64_t v26 = [v39 copy];
    id v27 = a1[20];
    a1[20] = (id)v26;

    *((_DWORD *)a1 + 12) = a6;
    *((unsigned char *)a1 + 52) = [v16 isActive];
    int v28 = [v18 isRestoreComplete];
    uint64_t v29 = 3;
    if (!v28) {
      uint64_t v29 = 1;
    }
    a1[18] = (id)v29;
    objc_storeStrong(a1 + 16, a3);
    objc_storeStrong(a1 + 4, a4);
    *((unsigned char *)a1 + 112) = a9;
    if ((a9 & 1) == 0)
    {
      id v30 = a1[16];
      v31 = +[HDNanoSyncStore _observedDeviceProperties]();
      [v30 addPropertyObserver:a1 forPropertyChanges:v31];
    }
    objc_storeStrong(a1 + 15, a2);
    uint64_t v32 = [MEMORY[0x1E4F1CA60] dictionary];
    id v33 = a1[5];
    a1[5] = (id)v32;
  }
LABEL_11:

  return a1;
}

- (void)dealloc
{
  if (!self->_invalidated)
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2, self, @"HDNanoSyncStore.m", 166, @"Invalid parameter not satisfying: %@", @"_invalidated" object file lineNumber description];
  }
  v5.receiver = self;
  v5.super_class = (Class)HDNanoSyncStore;
  [(HDNanoSyncStore *)&v5 dealloc];
}

+ (HDNanoSyncStore)nanoSyncStoreWithProfile:(id)a3 device:(id)a4 delegate:(id)a5 tinkerPaired:(BOOL)a6
{
  uint64_t v132 = *MEMORY[0x1E4F143B8];
  if (!a6)
  {
    id v8 = a3;
    id v9 = a4;
    id v10 = a5;
    uint64_t v22 = self;
    if (v9)
    {
      if (v10) {
        goto LABEL_10;
      }
    }
    else
    {
      v102 = [MEMORY[0x1E4F28B00] currentHandler];
      [v102 handleFailureInMethod:sel__nanoSyncStoreWithProfile_device_delegate_, v22, @"HDNanoSyncStore.m", 230, @"Invalid parameter not satisfying: %@", @"identityServicesDevice != nil" object file lineNumber description];

      if (v10) {
        goto LABEL_10;
      }
    }
    v103 = [MEMORY[0x1E4F28B00] currentHandler];
    [v103 handleFailureInMethod:sel__nanoSyncStoreWithProfile_device_delegate_, v22, @"HDNanoSyncStore.m", 231, @"Invalid parameter not satisfying: %@", @"delegate != nil" object file lineNumber description];

LABEL_10:
    os_log_t v12 = [v8 daemon];
    id v23 = [v12 nanoPairedDeviceRegistry];
    uint64_t v14 = objc_msgSend(v23, "hd_deviceForIDSDevice:", v9);

    if (!v14)
    {
      _HKInitializeLogging();
      v44 = (void *)*MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
      {
        v41 = v44;
        objc_msgSend(v9, "hd_shortDescription");
        v42 = (id *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v129 = v42;
        v43 = "unable to find NanoRegistry device for IDS device %{public}@";
        goto LABEL_29;
      }
LABEL_33:
      id v18 = 0;
      goto LABEL_108;
    }
    uint64_t v24 = [v14 valueForProperty:*MEMORY[0x1E4F79DB0]];
    char v25 = [v24 BOOLValue];

    if ((v25 & 1) == 0)
    {
      _HKInitializeLogging();
      v45 = (void *)*MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
      {
        v41 = v45;
        objc_msgSend(v9, "hd_shortDescription");
        v42 = (id *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v129 = v42;
        _os_log_impl(&dword_1BCB7D000, v41, OS_LOG_TYPE_DEFAULT, "NanoRegistry device for IDS device %{public}@ is not paired", buf, 0xCu);
        goto LABEL_32;
      }
      goto LABEL_33;
    }
    uint64_t v26 = objc_msgSend(v14, "hd_pairingID");
    if (!v26)
    {
      _HKInitializeLogging();
      v47 = (void *)*MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
      {
        v92 = v47;
        objc_msgSend(v14, "hd_shortDescription");
        v93 = (id *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v129 = v93;
        _os_log_error_impl(&dword_1BCB7D000, v92, OS_LOG_TYPE_ERROR, "missing pairing ID for NanoRegistry device %{public}@", buf, 0xCu);
      }
      id v18 = 0;
      goto LABEL_107;
    }
    int v27 = [v10 isMaster];
    int v28 = objc_msgSend(v14, "hd_systemBuildVersion");
    if (v27)
    {
      int v29 = [MEMORY[0x1E4F2B860] nanoSyncProtocolVersionForWatchSystemBuildVersion:v28];
      if (v29 >= 6)
      {
        int v111 = v29;
        v115 = v28;
        id v30 = [v12 healthDomainAccessorWithPairedDevice:v14];
        uint64_t v31 = [v30 stringForKey:@"LastRegistryUUID"];
        uint64_t v32 = v26;
        id v33 = (void *)v31;
        v120 = v32;
        v34 = [v32 UUIDString];
        v116 = v33;
        v122 = v34;
        if (v33)
        {
          v35 = v34;
          if (![v34 isEqualToString:v33])
          {
            v124 = 0;
            id v39 = 0;
            if (v35 == v33) {
              goto LABEL_51;
            }
            goto LABEL_47;
          }
        }
        v36 = [v30 stringForKey:@"PersistentPairingUUID"];
        if (v36)
        {
          uint64_t v37 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v36];
          if (v37)
          {
LABEL_22:
            v124 = [v30 stringForKey:@"DeviceSourceIdentifier"];

            id v39 = (void *)v37;
            if (v122 == v33) {
              goto LABEL_48;
            }
            if (!v33)
            {
LABEL_50:
              [v30 setObject:v122 forKey:@"LastRegistryUUID"];
              if (v39)
              {
LABEL_52:
                v53 = v39;
                v54 = [v30 synchronize];
                if (v54)
                {
                  _HKInitializeLogging();
                  v55 = (void *)*MEMORY[0x1E4F29FA8];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
                  {
                    v98 = v55;
                    v99 = (id *)objc_opt_class();
                    *(_DWORD *)buf = 138543618;
                    v129 = v99;
                    __int16 v130 = 2114;
                    uint64_t v131 = (uint64_t)v54;
                    v114 = v99;
                    _os_log_error_impl(&dword_1BCB7D000, v98, OS_LOG_TYPE_ERROR, "failed to synchronize %{public}@: %{public}@", buf, 0x16u);
                  }
                  v124 = 0;
                  v53 = 0;
                }

                id v39 = v53;
                id v33 = v116;
                goto LABEL_57;
              }
LABEL_51:
              id v50 = v120;
              uint64_t v51 = [MEMORY[0x1E4F2B560] _generateIdentifierForAppleDeviceWithUUID:v50];

              v52 = [v50 UUIDString];
              [v30 setObject:v52 forKey:@"PersistentPairingUUID"];

              id v39 = v50;
              [v30 setObject:v51 forKey:@"DeviceSourceIdentifier"];
              v124 = (void *)v51;
              goto LABEL_52;
            }
LABEL_47:
            if (![v122 isEqualToString:v33]) {
              goto LABEL_50;
            }
LABEL_48:
            if (v39)
            {
LABEL_57:
              v56 = [v30 stringArrayForKey:@"ObliteratedDatabaseUUIDs"];
              v112 = objc_msgSend(v56, "hk_map:", &__block_literal_global_231);

              uint64_t v26 = v120;
LABEL_58:
              v123 = [v8 database];
              id v127 = 0;
              v57 = +[HDNanoPairingEntity nanoPairingEntityWithRegistryUUID:v26 profile:v8 error:&v127];
              id v58 = v127;
              if (v57) {
                int v59 = v27;
              }
              else {
                int v59 = 0;
              }
              v113 = v39;
              if (!v39 || !v59)
              {
                id v117 = v58;
LABEL_97:
                if (v57)
                {
                  v86 = [HDNanoSyncStore alloc];
                  if (v112) {
                    v87 = v112;
                  }
                  else {
                    v87 = (void *)MEMORY[0x1E4F1CBF0];
                  }
                  v88 = [MEMORY[0x1E4F1CAD0] setWithArray:v87];
                  v89 = -[HDNanoSyncStore _initWithIdentityServicesDevice:nanoRegistryDevice:pairingEntity:obliteratedDatabaseUUIDs:protocolVersion:delegate:profile:tinkerPairing:]((id *)&v86->super.isa, v9, v14, v57, v88, v111, v10, v8, 0);
                }
                else
                {
                  _HKInitializeLogging();
                  v90 = (void *)*MEMORY[0x1E4F29FA8];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
                  {
                    v96 = v90;
                    objc_msgSend(v9, "hd_shortDescription");
                    v97 = (id *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138543618;
                    v129 = v97;
                    __int16 v130 = 2114;
                    uint64_t v131 = (uint64_t)v117;
                    _os_log_error_impl(&dword_1BCB7D000, v96, OS_LOG_TYPE_ERROR, "failed to create sync store for IDS device %{public}@: %{public}@", buf, 0x16u);
                  }
                  v89 = 0;
                }
                id v18 = v89;

                int v28 = v115;
LABEL_106:

LABEL_107:
                goto LABEL_108;
              }
              v107 = v58;
              uint64_t v60 = [v57 persistentUUID];
              v121 = v26;
              if ((void *)v60 == v39)
              {
              }
              else
              {
                v61 = (void *)v60;
                v62 = [v57 persistentUUID];
                char v63 = [v62 isEqual:v39];

                if ((v63 & 1) == 0)
                {
                  [v57 setPersistentUUID:v39];
                  [v57 setRestoreComplete:0];
                  int v64 = 1;
                  goto LABEL_69;
                }
              }
              int v64 = 0;
LABEL_69:
              v65 = [v57 defaultSourceBundleIdentifier];
              if (v65 == v124)
              {

                goto LABEL_76;
              }
              v66 = v65;
              if (v124)
              {
                [v57 defaultSourceBundleIdentifier];
                v67 = int v118 = v64;
                char v68 = [v67 isEqualToString:v124];

                int v64 = v118;
                if (v68)
                {
LABEL_76:
                  v69 = objc_msgSend(v9, "hd_deviceIdentifier");
                  v70 = [v57 deviceIdentifier];
                  v110 = v69;
                  if (v70 == v69)
                  {

                    goto LABEL_83;
                  }
                  v71 = v70;
                  if (v69)
                  {
                    [v57 deviceIdentifier];
                    v72 = int v119 = v64;
                    char v73 = [v72 isEqualToString:v69];

                    int v64 = v119;
                    if (v73)
                    {
LABEL_83:
                      v74 = [v57 healthDatabaseUUID];

                      if (v74)
                      {
                        if (!v64)
                        {
                          id v117 = v107;
LABEL_89:
                          v77 = [v8 sourceManager];
                          objc_msgSend(v14, "hd_name");
                          v78 = (id *)objc_claimAutoreleasedReturnValue();
                          uint64_t v79 = objc_msgSend(v14, "hd_productType");
                          v80 = (void *)v79;
                          if (!v78 || !v79)
                          {
                            uint64_t v108 = v79;
                            _HKInitializeLogging();
                            v81 = *MEMORY[0x1E4F29FA8];
                            BOOL v82 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR);
                            v80 = (void *)v108;
                            if (v82)
                            {
                              *(_DWORD *)buf = 138543618;
                              v129 = v78;
                              __int16 v130 = 2114;
                              uint64_t v131 = v108;
                              _os_log_error_impl(&dword_1BCB7D000, v81, OS_LOG_TYPE_ERROR, "unexpectedly nil NRDevice properties: name=\"%{public}@\", productType=\"%{public}@\"", buf, 0x16u);
                              v80 = (void *)v108;
                            }
                          }
                          id v125 = 0;
                          v83 = v39;
                          v84 = v80;
                          v85 = [v77 sourceForAppleDeviceWithUUID:v83 identifier:v124 name:v78 productType:v80 createIfNecessary:1 error:&v125];
                          id v109 = v125;
                          if (!v85)
                          {
                            _HKInitializeLogging();
                            v105 = (void *)*MEMORY[0x1E4F29FA8];
                            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
                            {
                              v106 = v105;
                              objc_msgSend(v14, "hd_shortDescription");
                              v104 = (id *)objc_claimAutoreleasedReturnValue();
                              *(_DWORD *)buf = 138543618;
                              v129 = v104;
                              __int16 v130 = 2114;
                              uint64_t v131 = (uint64_t)v109;
                              _os_log_error_impl(&dword_1BCB7D000, v106, OS_LOG_TYPE_ERROR, "failed to get source for paired device %{public}@: %{public}@", buf, 0x16u);
                            }
                          }

                          uint64_t v26 = v121;
                          goto LABEL_97;
                        }
                      }
                      else
                      {
                        v75 = [MEMORY[0x1E4F29128] UUID];
                        [v57 setHealthDatabaseUUID:v75];
                      }
                      id v126 = v107;
                      char v76 = [v57 saveWithHealthDatabase:v123 error:&v126];
                      id v117 = v126;

                      if ((v76 & 1) == 0)
                      {

                        v57 = 0;
                      }
                      goto LABEL_89;
                    }
                  }
                  else
                  {
                  }
                  [v57 setDeviceIdentifier:v110];
                  int v64 = 1;
                  goto LABEL_83;
                }
              }
              else
              {
              }
              [v57 setDefaultSourceBundleIdentifier:v124];
              int v64 = 1;
              goto LABEL_76;
            }
            goto LABEL_51;
          }
          _HKInitializeLogging();
          v38 = *MEMORY[0x1E4F29FA8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v129 = (id *)v36;
            _os_log_error_impl(&dword_1BCB7D000, v38, OS_LOG_TYPE_ERROR, "invalid persistent pairing UUID string \"%{public}@\" in NPS", buf, 0xCu);
          }
        }
        uint64_t v37 = 0;
        goto LABEL_22;
      }
    }
    else
    {
      int v48 = [MEMORY[0x1E4F2B860] nanoSyncProtocolVersionForCompanionSystemBuildVersion:v28];
      if (v48 > 7)
      {
        int v111 = v48;
        v115 = v28;
        v112 = 0;
        v124 = 0;
        id v39 = 0;
        goto LABEL_58;
      }
    }
    _HKInitializeLogging();
    v49 = (void *)*MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      v94 = v49;
      objc_msgSend(v9, "hd_shortDescription");
      v95 = (id *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v129 = v95;
      __int16 v130 = 2114;
      uint64_t v131 = (uint64_t)v28;
      _os_log_error_impl(&dword_1BCB7D000, v94, OS_LOG_TYPE_ERROR, "IDS device %{public}@ has unsupported system build version %{public}@", buf, 0x16u);
    }
    id v18 = 0;
    goto LABEL_106;
  }
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = self;
  if (v9)
  {
    if (v10) {
      goto LABEL_4;
    }
  }
  else
  {
    v100 = [MEMORY[0x1E4F28B00] currentHandler];
    [v100 handleFailureInMethod:sel__tinkerNanoSyncStoreWithProfile_device_delegate_, v11, @"HDNanoSyncStore.m", 189, @"Invalid parameter not satisfying: %@", @"idsDevice != nil" object file lineNumber description];

    if (v10) {
      goto LABEL_4;
    }
  }
  v101 = [MEMORY[0x1E4F28B00] currentHandler];
  [v101 handleFailureInMethod:sel__tinkerNanoSyncStoreWithProfile_device_delegate_, v11, @"HDNanoSyncStore.m", 190, @"Invalid parameter not satisfying: %@", @"delegate != nil" object file lineNumber description];

LABEL_4:
  os_log_t v12 = [v8 daemon];
  v13 = [v12 nanoPairedDeviceRegistry];
  uint64_t v14 = objc_msgSend(v13, "hd_deviceForIDSDevice:", v9);

  if (!v14)
  {
    _HKInitializeLogging();
    objc_super v40 = (void *)*MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      v41 = v40;
      objc_msgSend(v9, "hd_shortDescription");
      v42 = (id *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v129 = v42;
      v43 = "Unable to find NanoRegistry device for IDS device %{public}@ (#t0)";
LABEL_29:
      _os_log_error_impl(&dword_1BCB7D000, v41, OS_LOG_TYPE_ERROR, v43, buf, 0xCu);
LABEL_32:

      goto LABEL_33;
    }
    goto LABEL_33;
  }
  v15 = objc_msgSend(v14, "hd_pairingID");
  id v127 = 0;
  id v16 = +[HDNanoPairingEntity nanoPairingEntityWithRegistryUUID:v15 profile:v8 error:&v127];
  id v17 = (id *)v127;

  if (v16)
  {
    id v18 = -[HDNanoSyncStore _initWithIdentityServicesDevice:nanoRegistryDevice:pairingEntity:obliteratedDatabaseUUIDs:protocolVersion:delegate:profile:tinkerPairing:]((id *)[HDNanoSyncStore alloc], v9, v14, v16, 0, 16, v10, v8, 1);
    _HKInitializeLogging();
    id v19 = (void *)*MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      id v20 = v19;
      int v21 = objc_msgSend(v9, "hd_shortDescription");
      *(_DWORD *)buf = 138543618;
      v129 = v18;
      __int16 v130 = 2114;
      uint64_t v131 = (uint64_t)v21;
      _os_log_impl(&dword_1BCB7D000, v20, OS_LOG_TYPE_DEFAULT, "Created sync store %{public}@ for IDS device %{public}@ (#t0)", buf, 0x16u);
    }
  }
  else
  {
    _HKInitializeLogging();
    v46 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v129 = v17;
      _os_log_error_impl(&dword_1BCB7D000, v46, OS_LOG_TYPE_ERROR, "Unable to create entity for pairing %{public}@ (#t0)", buf, 0xCu);
    }
    id v18 = 0;
  }

LABEL_108:

  return (HDNanoSyncStore *)v18;
}

id __61__HDNanoSyncStore__nanoSyncStoreWithProfile_device_delegate___block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x1E4F29128];
  id v3 = a2;
  id v4 = (void *)[[v2 alloc] initWithUUIDString:v3];

  return v4;
}

- (id)nanoSyncStoreForProtocolVersion:(int)a3
{
  objc_super v5 = [HDNanoSyncStore alloc];
  identityServicesDevice = self->_identityServicesDevice;
  nanoRegistryDevice = self->_nanoRegistryDevice;
  pairingEntity = self->_pairingEntity;
  obliteratedDatabaseUUIDs = self->_obliteratedDatabaseUUIDs;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v11 = objc_loadWeakRetained((id *)&self->_profile);
  os_log_t v12 = -[HDNanoSyncStore _initWithIdentityServicesDevice:nanoRegistryDevice:pairingEntity:obliteratedDatabaseUUIDs:protocolVersion:delegate:profile:tinkerPairing:]((id *)&v5->super.isa, identityServicesDevice, nanoRegistryDevice, pairingEntity, obliteratedDatabaseUUIDs, a3, WeakRetained, v11, self->_isTinkerPairing);

  return v12;
}

- (void)invalidate
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    objc_storeWeak((id *)&self->_delegate, 0);
    nanoRegistryDevice = self->_nanoRegistryDevice;
    objc_super v5 = +[HDNanoSyncStore _observedDeviceProperties]();
    [(NRDevice *)nanoRegistryDevice removePropertyObserver:self forPropertyChanges:v5];

    if (self->_restoreSession)
    {
      int64_t v6 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 100, @"Canceled by invalidation");
      [(HDNanoSyncStore *)self finishRestoreSessionWithError:v6];

      restoreSession = self->_restoreSession;
      self->_restoreSession = 0;
    }
    if ([(NSMutableArray *)self->_incomingSyncObserverTimers count])
    {
      id v8 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v9 = objc_opt_class();
      id v10 = [(HDNanoSyncStore *)self nanoRegistryUUID];
      id v11 = objc_msgSend(v8, "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", v9, a2, @"Sync store for device with pairingID \"%@\" was invalidated"", v10);

      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      os_log_t v12 = self->_incomingSyncObserverTimers;
      uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v19;
        do
        {
          uint64_t v16 = 0;
          do
          {
            if (*(void *)v19 != v15) {
              objc_enumerationMutation(v12);
            }
            [*(id *)(*((void *)&v18 + 1) + 8 * v16++) invalidateAndInvokeCompletionWithError:v11];
          }
          while (v14 != v16);
          uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
        }
        while (v14);
      }

      incomingSyncObserverTimers = self->_incomingSyncObserverTimers;
      self->_incomingSyncObserverTimers = 0;
    }
  }
}

- (void)prepareForObliteration
{
  id v3 = [(HDNanoPairingEntity *)self->_pairingEntity healthDatabaseUUID];
  if (v3)
  {
    os_log_t v12 = v3;
    id v4 = [(NSSet *)self->_obliteratedDatabaseUUIDs setByAddingObject:v3];
    obliteratedDatabaseUUIDs = self->_obliteratedDatabaseUUIDs;
    self->_obliteratedDatabaseUUIDs = v4;

    int64_t v6 = [(NSSet *)self->_obliteratedDatabaseUUIDs allObjects];
    int v7 = objc_msgSend(v6, "hk_map:", &__block_literal_global_344);

    id v8 = [(HDNanoSyncStore *)self profile];
    uint64_t v9 = [v8 daemon];
    id v10 = [v9 healthDomainAccessorWithPairedDevice:self->_nanoRegistryDevice];

    if (v7) {
      [v10 setObject:v7 forKey:@"ObliteratedDatabaseUUIDs"];
    }
    else {
      [v10 removeObjectForKey:@"ObliteratedDatabaseUUIDs"];
    }
    id v11 = (id)[v10 synchronize];

    id v3 = v12;
  }
}

uint64_t __41__HDNanoSyncStore_prepareForObliteration__block_invoke(uint64_t a1, void *a2)
{
  return [a2 UUIDString];
}

- (id)profile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);

  return WeakRetained;
}

- (NSString)remoteSystemBuildVersion
{
  return self->_remoteSystemBuildVersion;
}

- (NSString)remoteProductType
{
  return self->_remoteProductType;
}

- (NSDate)lastInactiveDate
{
  return (NSDate *)[(NRDevice *)self->_nanoRegistryDevice hd_lastInactiveDate];
}

- (int64_t)syncStoreType
{
  return 1;
}

- (BOOL)isAltAccount
{
  return [(NRDevice *)self->_nanoRegistryDevice hd_isAltAccount];
}

- (void)setHealthUUID:(id)a3
{
  id v9 = a3;
  id v4 = [(HDNanoPairingEntity *)self->_pairingEntity healthDatabaseUUID];
  if (v4 == v9)
  {

LABEL_8:
    id v8 = v9;
    goto LABEL_9;
  }
  objc_super v5 = v4;
  if (!v9)
  {

    goto LABEL_7;
  }
  int64_t v6 = [(HDNanoPairingEntity *)self->_pairingEntity healthDatabaseUUID];
  char v7 = [v6 isEqual:v9];

  id v8 = v9;
  if ((v7 & 1) == 0)
  {
LABEL_7:
    [(HDNanoPairingEntity *)self->_pairingEntity setHealthDatabaseUUID:v9];
    -[HDNanoSyncStore _savePairingEntity]((uint64_t)self);
    goto LABEL_8;
  }
LABEL_9:
}

- (void)_savePairingEntity
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v2 = *(void **)(a1 + 32);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    id v4 = [WeakRetained database];
    id v9 = 0;
    char v5 = [v2 saveWithHealthDatabase:v4 error:&v9];
    id v6 = v9;

    if ((v5 & 1) == 0)
    {
      _HKInitializeLogging();
      char v7 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
      {
        uint64_t v8 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        uint64_t v11 = v8;
        __int16 v12 = 2114;
        id v13 = v6;
        _os_log_error_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_ERROR, "failed to save pairing entity %{public}@: %{public}@", buf, 0x16u);
      }
    }
  }
}

- (void)setPersistentUUID:(id)a3
{
  id v9 = a3;
  id v4 = [(HDNanoPairingEntity *)self->_pairingEntity persistentUUID];
  if (v4 == v9)
  {

LABEL_8:
    uint64_t v8 = v9;
    goto LABEL_9;
  }
  char v5 = v4;
  if (!v9)
  {

    goto LABEL_7;
  }
  id v6 = [(HDNanoPairingEntity *)self->_pairingEntity persistentUUID];
  char v7 = [v6 isEqual:v9];

  uint64_t v8 = v9;
  if ((v7 & 1) == 0)
  {
LABEL_7:
    [(HDNanoPairingEntity *)self->_pairingEntity setPersistentUUID:v9];
    -[HDNanoSyncStore _savePairingEntity]((uint64_t)self);
    goto LABEL_8;
  }
LABEL_9:
}

- (id)beginRestoreSessionWithUUID:(id)a3 timeout:(double)a4 timeoutHandler:(id)a5
{
  id v9 = a5;
  id v10 = (void *)MEMORY[0x1E4F28C58];
  id v11 = a3;
  __int16 v12 = objc_msgSend(v10, "hk_error:description:", 100, @"Canceled by new restore session");
  [(HDNanoSyncStore *)self finishRestoreSessionWithError:v12];

  id v13 = [[HDNanoSyncRestoreSession alloc] initWithSyncStore:self sessionUUID:v11];
  restoreSession = self->_restoreSession;
  self->_restoreSession = v13;

  if (a4 > 0.0)
  {
    if (!v9)
    {
      id v17 = [MEMORY[0x1E4F28B00] currentHandler];
      [v17 handleFailureInMethod:a2, self, @"HDNanoSyncStore.m", 608, @"Invalid parameter not satisfying: %@", @"timeoutHandler != NULL" object file lineNumber description];
    }
    [(HDNanoSyncRestoreSession *)self->_restoreSession scheduleTimeoutWithInterval:v9 handler:a4];
  }
  -[HDNanoSyncStore _setRestoreState:]((uint64_t)self, 2);
  uint64_t v15 = self->_restoreSession;

  return v15;
}

- (void)_setRestoreState:(uint64_t)a1
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a1 && *(void *)(a1 + 144) != a2)
  {
    _HKInitializeLogging();
    id v4 = (void *)*MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 144);
      if (v5 == 2) {
        id v6 = @"In Progress";
      }
      else {
        id v6 = @"Incomplete";
      }
      if (v5 == 3) {
        char v7 = @"Complete";
      }
      else {
        char v7 = v6;
      }
      uint64_t v8 = v7;
      if (a2 == 2) {
        id v9 = @"In Progress";
      }
      else {
        id v9 = @"Incomplete";
      }
      if (a2 == 3) {
        id v9 = @"Complete";
      }
      id v10 = v9;
      *(_DWORD *)id v13 = 138543874;
      *(void *)&v13[4] = a1;
      *(_WORD *)&v13[12] = 2112;
      *(void *)&v13[14] = v8;
      *(_WORD *)&v13[22] = 2112;
      uint64_t v14 = v10;
      id v11 = v4;
      _os_log_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_DEFAULT, "store %{public}@ transitioning from %@ to %@", v13, 0x20u);
    }
    *(void *)(a1 + 144) = a2;
    if ((a2 == 3) != objc_msgSend(*(id *)(a1 + 32), "isRestoreComplete", *(_OWORD *)v13, *(void *)&v13[16], v14))
    {
      [*(id *)(a1 + 32) setRestoreComplete:a2 == 3];
      -[HDNanoSyncStore _savePairingEntity](a1);
    }
    __int16 v12 = [(id)a1 delegate];
    [v12 nanoSyncStore:a1 restoreStateDidChange:a2];
  }
}

- (void)finishRestoreSessionWithError:(id)a3
{
  restoreSession = self->_restoreSession;
  if (restoreSession)
  {
    [(HDNanoSyncRestoreSession *)restoreSession finishWithError:a3];
    id v6 = self->_restoreSession;
    self->_restoreSession = 0;
  }
  if (a3) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = 3;
  }

  -[HDNanoSyncStore _setRestoreState:]((uint64_t)self, v7);
}

- (BOOL)resetProvenanceWithError:(id *)a3
{
  p_pairingEntity = &self->_pairingEntity;
  pairingEntity = self->_pairingEntity;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  uint64_t v7 = [(HDNanoPairingEntity *)pairingEntity resetProvenanceForProfile:WeakRetained error:a3];

  if (v7) {
    objc_storeStrong((id *)p_pairingEntity, v7);
  }

  return v7 != 0;
}

- (void)addPendingRequestContext:(id)a3 forUUID:(id)a4
{
}

- (id)pendingRequestContextForUUID:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_pendingRequestContexts objectForKeyedSubscript:a3];
}

- (void)removePendingRequestContextForUUID:(id)a3
{
}

- (void)addIncomingSyncObserverWithTimeout:(double)a3 timeoutHandler:(id)a4 completion:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  if (!self->_incomingSyncObserverTimers)
  {
    id v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    incomingSyncObserverTimers = self->_incomingSyncObserverTimers;
    self->_incomingSyncObserverTimers = v10;
  }
  __int16 v12 = (void *)[objc_alloc(MEMORY[0x1E4F2B8E0]) initWithCompletion:v9];
  [(NSMutableArray *)self->_incomingSyncObserverTimers addObject:v12];
  [v12 startWithTimeoutInterval:v8 handler:a3];
  _HKInitializeLogging();
  id v13 = (void *)*MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEBUG))
  {
    uint64_t v14 = v13;
    uint64_t v15 = [v12 startDate];
    int v16 = 134218498;
    id v17 = v12;
    __int16 v18 = 2048;
    double v19 = a3;
    __int16 v20 = 2112;
    long long v21 = v15;
    _os_log_debug_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_DEBUG, "added incoming sync observer %p with %.2f timeout at %@", (uint8_t *)&v16, 0x20u);
  }
  -[HDNanoSyncStore _notifyIncomingSyncObservers]((uint64_t)self);
}

uint64_t __47__HDNanoSyncStore__notifyIncomingSyncObservers__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 startDate];
  uint64_t v5 = objc_msgSend(v4, "hk_isBeforeDate:", *(void *)(a1 + 32));

  if (v5)
  {
    [v3 invalidateAndInvokeCompletionWithError:0];
    _HKInitializeLogging();
    id v6 = (void *)*MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEBUG))
    {
      id v8 = *(void **)(a1 + 40);
      id v9 = v6;
      id v10 = [v3 startDate];
      [v8 timeIntervalSinceDate:v10];
      int v12 = 134218240;
      id v13 = v3;
      __int16 v14 = 2048;
      uint64_t v15 = v11;
      _os_log_debug_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_DEBUG, "notified sync observer %p after %.3f seconds", (uint8_t *)&v12, 0x16u);
    }
  }

  return v5;
}

- (void)removeExpiredIncomingSyncObservers
{
  if ([(NSMutableArray *)self->_incomingSyncObserverTimers count])
  {
    id v3 = [MEMORY[0x1E4F1C9C8] date];
    id v4 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 103, @"Sync request timed out");
    incomingSyncObserverTimers = self->_incomingSyncObserverTimers;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __53__HDNanoSyncStore_removeExpiredIncomingSyncObservers__block_invoke;
    v8[3] = &unk_1E630CFD8;
    id v9 = v4;
    id v10 = v3;
    id v6 = v3;
    id v7 = v4;
    [(NSMutableArray *)incomingSyncObserverTimers hk_removeObjectsPassingTest:v8];
  }
}

uint64_t __53__HDNanoSyncStore_removeExpiredIncomingSyncObservers__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 isExpired];
  if (v4)
  {
    [v3 invalidateAndInvokeCompletionWithError:*(void *)(a1 + 32)];
    _HKInitializeLogging();
    uint64_t v5 = (void *)*MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEBUG))
    {
      id v7 = *(void **)(a1 + 40);
      id v8 = v5;
      id v9 = [v3 startDate];
      [v7 timeIntervalSinceDate:v9];
      int v11 = 134218240;
      id v12 = v3;
      __int16 v13 = 2048;
      uint64_t v14 = v10;
      _os_log_debug_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_DEBUG, "removed expired sync observer %p after %.3f seconds", (uint8_t *)&v11, 0x16u);
    }
  }

  return v4;
}

- (int64_t)syncEpoch
{
  return 0;
}

- (id)databaseIdentifier
{
  return 0;
}

uint64_t __38__HDNanoSyncStore_orderedSyncEntities__block_invoke(uint64_t a1, void *a2)
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 1;
  }
  uint64_t v4 = *(void *)(a1 + 32);

  return [a2 supportsSyncStore:v4];
}

- (BOOL)canRecieveSyncObjectsForEntityClass:(Class)a3
{
  return 1;
}

+ (id)orderedSyncEntitiesForProfile:(id)a3 protocolVersion:(int)a4 companion:(BOOL)a5
{
  v16[6] = *MEMORY[0x1E4F143B8];
  if (a5) {
    int v5 = 6;
  }
  else {
    int v5 = 8;
  }
  if (v5 <= a4)
  {
    if (a5) {
      uint64_t v8 = 1;
    }
    else {
      uint64_t v8 = 2;
    }
    id v9 = [a3 syncEngine];
    uint64_t v10 = [v9 allOrderedSyncEntities];

    v16[0] = objc_opt_class();
    v16[1] = objc_opt_class();
    v16[2] = objc_opt_class();
    v16[3] = objc_opt_class();
    v16[4] = objc_opt_class();
    v16[5] = objc_opt_class();
    int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:6];
    id v12 = [v10 arrayByExcludingObjectsInArray:v11];

    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __75__HDNanoSyncStore_orderedSyncEntitiesForProfile_protocolVersion_companion___block_invoke;
    v14[3] = &__block_descriptor_44_e8_B16__0_8l;
    v14[4] = v8;
    int v15 = a4;
    id v6 = objc_msgSend(v12, "hk_filter:", v14);
  }
  else
  {
    id v6 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v6;
}

BOOL __75__HDNanoSyncStore_orderedSyncEntitiesForProfile_protocolVersion_companion___block_invoke(uint64_t a1, void *a2)
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 1;
  }
  uint64_t v4 = *(void *)(a1 + 32);
  return ([a2 supportedNanoSyncDirectionsForProtocolVersion:*(unsigned int *)(a1 + 40)] & v4) != 0;
}

- (BOOL)supportsSpeculativeChangesForSyncEntityClass:(Class)a3
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }

  return [(objc_class *)a3 supportsSpeculativeNanoSyncChanges];
}

- (BOOL)shouldContinueAfterAnchorValidationError:(id)a3
{
  return 0;
}

- (void)device:(id)a3 propertyDidChange:(id)a4 fromValue:(id)a5
{
  id v10 = a3;
  id v7 = a4;
  if ([v7 isEqualToString:*MEMORY[0x1E4F79E40]])
  {
    uint64_t v8 = [(HDNanoSyncStore *)self delegate];
    id v9 = objc_msgSend(v10, "hd_systemBuildVersion");
    [v8 nanoSyncStore:self remoteSystemBuildVersionDidChange:v9];
  }
  else
  {
    if (![v7 isEqualToString:*MEMORY[0x1E4F79E08]]) {
      goto LABEL_6;
    }
    uint64_t v8 = [(HDNanoSyncStore *)self delegate];
    id v9 = objc_msgSend(v10, "hd_name");
    [v8 nanoSyncStore:self deviceNameDidChange:v9];
  }

LABEL_6:
}

- (id)diagnosticDescription
{
  id v3 = [MEMORY[0x1E4F28E78] string];
  [v3 appendFormat:@"%@:%p {", objc_opt_class(), self];
  if (self) {
    nanoRegistryDevice = self->_nanoRegistryDevice;
  }
  else {
    nanoRegistryDevice = 0;
  }
  int v5 = nanoRegistryDevice;
  id v6 = [(NRDevice *)v5 hd_productType];
  [v3 appendFormat:@"\n\tDevice:(%@)", v6];

  if ([(HDNanoSyncStore *)self isMaster])
  {
    id v7 = [(NRDevice *)v5 hd_lastActiveDate];
    uint64_t v8 = [(NRDevice *)v5 hd_lastInactiveDate];
    if ([(HDNanoSyncStore *)self isActive])
    {
      id v9 = HKDiagnosticStringFromDate();
      id v10 = HKDiagnosticStringFromDate();
      [v3 appendFormat:@"\n\tLast Inactive: %@ - %@", v9, v10];
    }
    else
    {
      id v9 = HKDiagnosticStringFromDate();
      id v10 = HKDiagnosticStringFromDate();
      [v3 appendFormat:@"\n\tLast Active: %@ - %@", v9, v10];
    }
  }
  int v11 = [(IDSDevice *)self->_identityServicesDevice hd_deviceIdentifier];
  [v3 appendFormat:@"\n\tIDS Device ID: %@", v11];

  id v12 = [(HDNanoSyncStore *)self nanoRegistryUUID];
  uint64_t v13 = [v12 UUIDString];
  uint64_t v14 = (void *)v13;
  int v15 = @"<none>";
  if (v13) {
    uint64_t v16 = (__CFString *)v13;
  }
  else {
    uint64_t v16 = @"<none>";
  }
  [v3 appendFormat:@"\n\tRegistry UUID: %@", v16];

  id v17 = [(HDNanoSyncStore *)self persistentUUID];
  uint64_t v18 = [v17 UUIDString];
  double v19 = (void *)v18;
  if (v18) {
    __int16 v20 = (__CFString *)v18;
  }
  else {
    __int16 v20 = @"<none>";
  }
  [v3 appendFormat:@"\n\tPersistent UUID: %@", v20];

  if ([(HDNanoSyncStore *)self isMaster])
  {
    uint64_t v21 = [(HDNanoSyncStore *)self sourceBundleIdentifier];
    uint64_t v22 = (void *)v21;
    if (v21) {
      uint64_t v23 = (__CFString *)v21;
    }
    else {
      uint64_t v23 = @"<none>";
    }
    [v3 appendFormat:@"\n\tSource identifier: %@", v23];
  }
  uint64_t v24 = [(HDNanoSyncStore *)self remoteSystemBuildVersion];
  char v25 = (void *)v24;
  if (v24) {
    int v15 = (__CFString *)v24;
  }
  uint64_t v26 = objc_msgSend(NSNumber, "numberWithInt:", -[HDNanoSyncStore protocolVersion](self, "protocolVersion"));
  [v3 appendFormat:@"\n\tSystem build: %@ (protocol vers %@)", v15, v26];

  int64_t restoreState = self->_restoreState;
  int v28 = @"Incomplete";
  if (restoreState == 2) {
    int v28 = @"In Progress";
  }
  if (restoreState == 3) {
    int v29 = @"Complete";
  }
  else {
    int v29 = v28;
  }
  [v3 appendFormat:@"\n\tRestore state: %@", v29];
  restoreSession = self->_restoreSession;
  if (restoreSession)
  {
    if ([(HDNanoSyncRestoreSession *)restoreSession isFinished]) {
      uint64_t v31 = "finished";
    }
    else {
      uint64_t v31 = "unfinished";
    }
    uint64_t v32 = [(HDNanoSyncRestoreSession *)self->_restoreSession sessionUUID];
    id v33 = [v32 UUIDString];
    [v3 appendFormat:@"\n\tRestore %s, id:\"%@\"", v31, v33];
  }
  if (self->_lastCompleteIncomingSyncDate)
  {
    if (self->_lastCompleteIncomingSyncError)
    {
      v34 = [NSString stringWithFormat:@" (error: %@)", self->_lastCompleteIncomingSyncError];
    }
    else
    {
      v34 = &stru_1F1728D60;
    }
    v35 = HKDiagnosticStringFromDate();
    [v3 appendFormat:@"\n\tLast complete sync began %@%@", v35, v34];
  }
  if (self->_lastIncompleteIncomingSyncDate)
  {
    v36 = HKDiagnosticStringFromDate();
    [v3 appendFormat:@"\n\tLast incomplete sync began %@", v36];
  }
  if ([(HDNanoSyncStore *)self needsSyncOnUnlock]) {
    [v3 appendFormat:@"\n\tNeeds sync on unlock: YES"];
  }
  [v3 appendString:@"\n}"];

  return v3;
}

- (HDNanoSyncStoreDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HDNanoSyncStoreDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (HDNanoSyncRestoreSession)restoreSession
{
  return self->_restoreSession;
}

- (NSSet)obliteratedDatabaseUUIDs
{
  return self->_obliteratedDatabaseUUIDs;
}

- (BOOL)needsSyncOnUnlock
{
  return self->_needsSyncOnUnlock;
}

- (void)setNeedsSyncOnUnlock:(BOOL)a3
{
  self->_needsSyncOnUnlock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_obliteratedDatabaseUUIDs, 0);
  objc_storeStrong((id *)&self->_restoreSession, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_nanoRegistryDevice, 0);
  objc_storeStrong((id *)&self->_identityServicesDevice, 0);
  objc_storeStrong((id *)&self->_orderedSyncEntities, 0);
  objc_storeStrong((id *)&self->_expectedSequenceNumbers, 0);
  objc_storeStrong((id *)&self->_lastCompleteIncomingSyncError, 0);
  objc_storeStrong((id *)&self->_lastCompleteIncomingSyncDate, 0);
  objc_storeStrong((id *)&self->_lastIncompleteIncomingSyncDate, 0);
  objc_storeStrong((id *)&self->_lastIncompleteIncomingSyncUUID, 0);
  objc_storeStrong((id *)&self->_incomingSyncObserverTimers, 0);
  objc_storeStrong((id *)&self->_pendingRequestContexts, 0);
  objc_storeStrong((id *)&self->_pairingEntity, 0);
  objc_storeStrong((id *)&self->_remoteProductType, 0);
  objc_storeStrong((id *)&self->_remoteSystemBuildVersion, 0);

  objc_destroyWeak((id *)&self->_profile);
}

@end