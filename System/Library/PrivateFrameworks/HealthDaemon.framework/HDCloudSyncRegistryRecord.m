@interface HDCloudSyncRegistryRecord
+ (BOOL)hasFutureSchema:(id)a3;
+ (BOOL)isRegistryRecord:(id)a3;
+ (BOOL)isRegistryRecordID:(id)a3;
+ (BOOL)requiresUnderlyingMessage;
+ (id)recordIDWithZoneID:(id)a3;
+ (id)recordType;
+ (id)sharedProfileIdentifierForOwnerProfileIdentifier:(id)a3;
- (BOOL)deleted;
- (HDCloudSyncCodableProfileIdentifier)_codableProfileIdentifierWithProfileIdentifier:(uint64_t)a1;
- (HDCloudSyncRegistryRecord)initWithCKRecord:(id)a3 schemaVersion:(int64_t)a4;
- (HKProfileIdentifier)ownerProfileIdentifier;
- (HKProfileIdentifier)sharedProfileIdentifier;
- (NSArray)childHeaderRecordIDs;
- (NSDate)displayNameModificationDate;
- (NSSet)disabledOwnerIdentifiers;
- (NSSet)disabledSyncIdentities;
- (NSSet)ownerIdentifiers;
- (NSSet)syncIdentities;
- (NSString)displayFirstName;
- (NSString)displayLastName;
- (id)_profileIdentifierWithCodableProfileIdentifier:(uint64_t)a1;
- (id)initInZone:(id)a3 ownerProfileIdentifier:(id)a4;
- (id)initInZone:(id)a3 ownerProfileIdentifier:(id)a4 sharedProfileIdentifier:(id)a5;
- (id)printDescription;
- (id)serializeUnderlyingMessage;
- (id)storeIdentifiersForOwnerIdentifier:(id)a3;
- (id)storeIdentifiersForSyncIdentity:(id)a3;
- (void)addStoreIdentifier:(id)a3 ownerIdentifier:(id)a4 syncIdentity:(id)a5;
- (void)removeStoreIdentifier:(id)a3 ownerIdentifier:(id)a4 syncIdentity:(id)a5;
- (void)setDeleted:(BOOL)a3;
- (void)setDisabledOwnerIdentifiers:(id)a3;
- (void)setDisabledSyncIdentities:(id)a3;
- (void)setDisplayFirstName:(id)a3;
- (void)setDisplayLastName:(id)a3;
- (void)setDisplayNameModificationDate:(id)a3;
- (void)setOwnerProfileIdentifier:(id)a3;
- (void)setSharedProfileIdentifier:(id)a3;
@end

@implementation HDCloudSyncRegistryRecord

+ (BOOL)requiresUnderlyingMessage
{
  return 1;
}

+ (id)recordType
{
  return @"CloudSyncRegistryRecord";
}

+ (BOOL)hasFutureSchema:(id)a3
{
  v3 = [a3 objectForKeyedSubscript:@"Version"];
  v4 = v3;
  BOOL v5 = v3 && [v3 integerValue] > 1;

  return v5;
}

+ (id)recordIDWithZoneID:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F1A2F8];
  id v4 = a3;
  BOOL v5 = (void *)[[v3 alloc] initWithRecordName:@"CloudSyncRegistry" zoneID:v4];

  return v5;
}

+ (BOOL)isRegistryRecord:(id)a3
{
  v3 = [a3 recordType];
  char v4 = [v3 isEqualToString:@"CloudSyncRegistryRecord"];

  return v4;
}

+ (BOOL)isRegistryRecordID:(id)a3
{
  v3 = [a3 recordName];
  char v4 = [v3 isEqualToString:@"CloudSyncRegistry"];

  return v4;
}

+ (id)sharedProfileIdentifierForOwnerProfileIdentifier:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 type];
  switch(v5)
  {
    case 1:
      goto LABEL_5;
    case 2:
    case 4:
      _HKInitializeLogging();
      v6 = (void *)*MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_FAULT))
      {
        v7 = v6;
        [v4 type];
        v8 = HKStringFromProfileType();
        int v12 = 138412290;
        v13 = v8;
        _os_log_fault_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_FAULT, "Owner profile identifier of unexpected type %@", (uint8_t *)&v12, 0xCu);
      }
      goto LABEL_5;
    case 3:
      id v3 = v4;
      goto LABEL_6;
    default:
      if (v5 == 100)
      {
LABEL_5:
        v9 = (void *)MEMORY[0x1E4F2B358];
        v10 = [MEMORY[0x1E4F29128] UUID];
        id v3 = [v9 _profileWithUUID:v10 type:3];
      }
LABEL_6:

      return v3;
  }
}

- (id)initInZone:(id)a3 ownerProfileIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(id)objc_opt_class() sharedProfileIdentifierForOwnerProfileIdentifier:v6];
  id v9 = [(HDCloudSyncRegistryRecord *)self initInZone:v7 ownerProfileIdentifier:v6 sharedProfileIdentifier:v8];

  return v9;
}

- (id)initInZone:(id)a3 ownerProfileIdentifier:(id)a4 sharedProfileIdentifier:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  v11 = [(id)objc_opt_class() recordIDWithZoneID:v10];

  int v12 = (void *)[objc_alloc(MEMORY[0x1E4F1A2D8]) initWithRecordType:@"CloudSyncRegistryRecord" recordID:v11];
  v13 = [(HDCloudSyncRegistryRecord *)self initWithCKRecord:v12 schemaVersion:1];
  uint64_t v14 = v13;
  if (v13)
  {
    [(HDCloudSyncRegistryRecord *)v13 setOwnerProfileIdentifier:v8];
    [(HDCloudSyncRegistryRecord *)v14 setSharedProfileIdentifier:v9];
  }

  return v14;
}

- (HDCloudSyncRegistryRecord)initWithCKRecord:(id)a3 schemaVersion:(int64_t)a4
{
  v15.receiver = self;
  v15.super_class = (Class)HDCloudSyncRegistryRecord;
  id v4 = [(HDCloudSyncRecord *)&v15 initWithCKRecord:a3 schemaVersion:a4];
  uint64_t v5 = v4;
  if (!v4) {
    goto LABEL_9;
  }
  id v6 = [(HDCloudSyncRecord *)v4 underlyingMessage];
  if (!v6)
  {
    v11 = objc_alloc_init(HDCloudSyncCodableRegistry);
    underlyingRegistry = v5->_underlyingRegistry;
    v5->_underlyingRegistry = v11;

    goto LABEL_8;
  }
  id v7 = [[HDCloudSyncCodableRegistry alloc] initWithData:v6];
  id v8 = v5->_underlyingRegistry;
  v5->_underlyingRegistry = v7;

  if (v5->_underlyingRegistry)
  {
LABEL_8:

LABEL_9:
    id v10 = v5;
    goto LABEL_10;
  }
  _HKInitializeLogging();
  id v9 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_FAULT))
  {
    v14[0] = 0;
    _os_log_fault_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_FAULT, "Failed to decode underlying registry.", (uint8_t *)v14, 2u);
  }

  id v10 = 0;
LABEL_10:

  return v10;
}

- (BOOL)deleted
{
  return [(HDCloudSyncCodableRegistry *)self->_underlyingRegistry deleted];
}

- (void)setDeleted:(BOOL)a3
{
}

- (NSString)displayFirstName
{
  return [(HDCloudSyncCodableRegistry *)self->_underlyingRegistry displayFirstName];
}

- (void)setDisplayFirstName:(id)a3
{
}

- (NSString)displayLastName
{
  return [(HDCloudSyncCodableRegistry *)self->_underlyingRegistry displayLastName];
}

- (void)setDisplayLastName:(id)a3
{
}

- (NSDate)displayNameModificationDate
{
  if ([(HDCloudSyncCodableRegistry *)self->_underlyingRegistry hasDisplayNameModificationDate])
  {
    id v3 = (void *)MEMORY[0x1E4F1C9C8];
    [(HDCloudSyncCodableRegistry *)self->_underlyingRegistry displayNameModificationDate];
    id v4 = objc_msgSend(v3, "dateWithTimeIntervalSinceReferenceDate:");
  }
  else
  {
    id v4 = 0;
  }

  return (NSDate *)v4;
}

- (void)setDisplayNameModificationDate:(id)a3
{
  if (a3)
  {
    [a3 timeIntervalSinceReferenceDate];
    underlyingRegistry = self->_underlyingRegistry;
    -[HDCloudSyncCodableRegistry setDisplayNameModificationDate:](underlyingRegistry, "setDisplayNameModificationDate:");
  }
  else
  {
    uint64_t v5 = self->_underlyingRegistry;
    -[HDCloudSyncCodableRegistry setHasDisplayNameModificationDate:](v5, "setHasDisplayNameModificationDate:");
  }
}

- (id)_profileIdentifierWithCodableProfileIdentifier:(uint64_t)a1
{
  v2 = 0;
  if (a1 && a2)
  {
    id v3 = (void *)MEMORY[0x1E4F29128];
    id v4 = a2;
    uint64_t v5 = [v4 identifier];
    id v6 = objc_msgSend(v3, "hk_UUIDWithData:", v5);

    uint64_t v7 = [v4 type];
    if (v6 && [MEMORY[0x1E4F2B358] isValidProfileType:v7])
    {
      v2 = [MEMORY[0x1E4F2B358] _profileWithUUID:v6 type:v7];
    }
    else
    {
      v2 = 0;
    }
  }

  return v2;
}

- (HDCloudSyncCodableProfileIdentifier)_codableProfileIdentifierWithProfileIdentifier:(uint64_t)a1
{
  if (a1)
  {
    id v2 = a2;
    id v3 = objc_alloc_init(HDCloudSyncCodableProfileIdentifier);
    -[HDCloudSyncCodableProfileIdentifier setType:](v3, "setType:", [v2 type]);
    id v4 = [v2 identifier];

    uint64_t v5 = objc_msgSend(v4, "hk_dataForUUIDBytes");
    [(HDCloudSyncCodableProfileIdentifier *)v3 setIdentifier:v5];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (HKProfileIdentifier)ownerProfileIdentifier
{
  id v3 = [(HDCloudSyncCodableRegistry *)self->_underlyingRegistry ownerProfileIdentifier];
  id v4 = -[HDCloudSyncRegistryRecord _profileIdentifierWithCodableProfileIdentifier:]((uint64_t)self, v3);

  return (HKProfileIdentifier *)v4;
}

- (void)setOwnerProfileIdentifier:(id)a3
{
  id v5 = a3;
  id v8 = v5;
  if (!v5)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"HDCloudSyncRegistryRecord.m", 212, @"Invalid parameter not satisfying: %@", @"profileIdentifier != nil" object file lineNumber description];

    id v5 = 0;
  }
  id v6 = -[HDCloudSyncRegistryRecord _codableProfileIdentifierWithProfileIdentifier:]((uint64_t)self, v5);
  [(HDCloudSyncCodableRegistry *)self->_underlyingRegistry setOwnerProfileIdentifier:v6];
}

- (HKProfileIdentifier)sharedProfileIdentifier
{
  id v3 = [(HDCloudSyncCodableRegistry *)self->_underlyingRegistry sharedProfileIdentifier];
  id v4 = -[HDCloudSyncRegistryRecord _profileIdentifierWithCodableProfileIdentifier:]((uint64_t)self, v3);

  return (HKProfileIdentifier *)v4;
}

- (void)setSharedProfileIdentifier:(id)a3
{
  id v5 = a3;
  id v8 = v5;
  if (!v5)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"HDCloudSyncRegistryRecord.m", 224, @"Invalid parameter not satisfying: %@", @"profileIdentifier != nil" object file lineNumber description];

    id v5 = 0;
  }
  id v6 = -[HDCloudSyncRegistryRecord _codableProfileIdentifierWithProfileIdentifier:]((uint64_t)self, v5);
  [(HDCloudSyncCodableRegistry *)self->_underlyingRegistry setSharedProfileIdentifier:v6];
}

- (id)serializeUnderlyingMessage
{
  return (id)[(HDCloudSyncCodableRegistry *)self->_underlyingRegistry data];
}

- (NSSet)disabledOwnerIdentifiers
{
  id v2 = (void *)MEMORY[0x1E4F1CAD0];
  id v3 = [(HDCloudSyncCodableRegistry *)self->_underlyingRegistry disabledOwnerIdentifiers];
  id v4 = [v2 setWithArray:v3];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [MEMORY[0x1E4F1CAD0] set];
  }
  uint64_t v7 = v6;

  return (NSSet *)v7;
}

- (void)setDisabledOwnerIdentifiers:(id)a3
{
  id v5 = [a3 allObjects];
  id v4 = (void *)[v5 mutableCopy];
  [(HDCloudSyncCodableRegistry *)self->_underlyingRegistry setDisabledOwnerIdentifiers:v4];
}

- (NSSet)disabledSyncIdentities
{
  id v3 = [(HDCloudSyncCodableRegistry *)self->_underlyingRegistry disabledSyncIdentities];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    id v5 = [(HDCloudSyncCodableRegistry *)self->_underlyingRegistry disabledSyncIdentities];
    id v6 = objc_msgSend(v5, "hk_mapToSet:", &__block_literal_global_225);
  }
  else
  {
    id v6 = [MEMORY[0x1E4F1CAD0] set];
  }

  return (NSSet *)v6;
}

id __51__HDCloudSyncRegistryRecord_disabledSyncIdentities__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v7 = 0;
  id v2 = +[HDSyncIdentity syncIdentityWithCodable:a2 error:&v7];
  id v3 = v7;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    _HKInitializeLogging();
    id v5 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v9 = v3;
      _os_log_fault_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_FAULT, "Failed to decode codableIdentity with error: %{public}@", buf, 0xCu);
    }
  }

  return v2;
}

- (void)setDisabledSyncIdentities:(id)a3
{
  id v6 = [a3 allObjects];
  id v4 = objc_msgSend(v6, "hk_map:", &__block_literal_global_304_0);
  id v5 = (void *)[v4 mutableCopy];
  [(HDCloudSyncCodableRegistry *)self->_underlyingRegistry setDisabledSyncIdentities:v5];
}

uint64_t __55__HDCloudSyncRegistryRecord_setDisabledSyncIdentities___block_invoke(uint64_t a1, void *a2)
{
  return [a2 codableSyncIdentity];
}

- (NSSet)ownerIdentifiers
{
  id v3 = [(HDCloudSyncCodableRegistry *)self->_underlyingRegistry stores];

  if (v3)
  {
    id v4 = [(HDCloudSyncCodableRegistry *)self->_underlyingRegistry stores];
    id v5 = objc_msgSend(v4, "hk_mapToSet:", &__block_literal_global_307_4);
  }
  else
  {
    id v5 = [MEMORY[0x1E4F1CAD0] set];
  }

  return (NSSet *)v5;
}

uint64_t __45__HDCloudSyncRegistryRecord_ownerIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  return [a2 ownerIdentifier];
}

- (NSSet)syncIdentities
{
  id v3 = [(HDCloudSyncCodableRegistry *)self->_underlyingRegistry stores];

  if (v3)
  {
    id v4 = [(HDCloudSyncCodableRegistry *)self->_underlyingRegistry stores];
    id v5 = objc_msgSend(v4, "hk_mapToSet:", &__block_literal_global_309_1);
  }
  else
  {
    id v5 = [MEMORY[0x1E4F1CAD0] set];
  }

  return (NSSet *)v5;
}

id __43__HDCloudSyncRegistryRecord_syncIdentities__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if ([v2 hasSyncIdentity])
  {
    id v3 = [v2 syncIdentity];
    id v8 = 0;
    id v4 = +[HDSyncIdentity syncIdentityWithCodable:v3 error:&v8];
    id v5 = v8;

    if (!v4)
    {
      _HKInitializeLogging();
      id v6 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v10 = v5;
        _os_log_fault_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_FAULT, "Failed to decode codableIdentity with error: %{public}@", buf, 0xCu);
      }
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (NSArray)childHeaderRecordIDs
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v22 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = [(HDCloudSyncCodableRegistry *)self->_underlyingRegistry stores];
  uint64_t v23 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v23)
  {
    uint64_t v20 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v25 != v20) {
          objc_enumerationMutation(obj);
        }
        id v3 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        id v4 = [v3 ownerIdentifier];
        id v5 = objc_alloc(MEMORY[0x1E4F29128]);
        id v6 = [v3 storeIdentifier];
        id v7 = (void *)[v5 initWithUUIDString:v6];
        id v8 = [(HDCloudSyncRecord *)self recordID];
        id v9 = [v8 zoneID];
        id v10 = +[HDCloudSyncStoreRecord recordIDForOwnerIdentifier:v4 storeIdentifier:v7 zoneID:v9];
        [v22 addObject:v10];

        uint64_t v11 = [v3 ownerIdentifier];
        id v12 = objc_alloc(MEMORY[0x1E4F29128]);
        v13 = [v3 storeIdentifier];
        uint64_t v14 = (void *)[v12 initWithUUIDString:v13];
        objc_super v15 = [(HDCloudSyncRecord *)self recordID];
        v16 = [v15 zoneID];
        v17 = +[HDCloudSyncSequenceRecord recordIDsForOwnerIdentifier:v11 storeIdentifier:v14 zoneID:v16];
        [v22 addObjectsFromArray:v17];
      }
      uint64_t v23 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v23);
  }

  return (NSArray *)v22;
}

- (id)storeIdentifiersForOwnerIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(HDCloudSyncCodableRegistry *)self->_underlyingRegistry stores];

  if (v5)
  {
    id v6 = [(HDCloudSyncCodableRegistry *)self->_underlyingRegistry stores];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __64__HDCloudSyncRegistryRecord_storeIdentifiersForOwnerIdentifier___block_invoke;
    v9[3] = &unk_1E630C320;
    id v10 = v4;
    id v7 = objc_msgSend(v6, "hk_mapToSet:", v9);
  }
  else
  {
    id v7 = [MEMORY[0x1E4F1CAD0] set];
  }

  return v7;
}

id __64__HDCloudSyncRegistryRecord_storeIdentifiersForOwnerIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 ownerIdentifier];
  LODWORD(a1) = [v4 isEqualToString:*(void *)(a1 + 32)];

  if (a1)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F29128]);
    id v6 = [v3 storeIdentifier];
    id v7 = (void *)[v5 initWithUUIDString:v6];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)storeIdentifiersForSyncIdentity:(id)a3
{
  id v4 = a3;
  id v5 = [(HDCloudSyncCodableRegistry *)self->_underlyingRegistry stores];

  if (v5)
  {
    id v6 = [(HDCloudSyncCodableRegistry *)self->_underlyingRegistry stores];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __61__HDCloudSyncRegistryRecord_storeIdentifiersForSyncIdentity___block_invoke;
    v9[3] = &unk_1E630C320;
    id v10 = v4;
    id v7 = objc_msgSend(v6, "hk_mapToSet:", v9);
  }
  else
  {
    id v7 = [MEMORY[0x1E4F1CAD0] set];
  }

  return v7;
}

id __61__HDCloudSyncRegistryRecord_storeIdentifiersForSyncIdentity___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 syncIdentity];
  id v5 = [*(id *)(a1 + 32) codableSyncIdentity];
  int v6 = [v4 isEqual:v5];

  if (v6)
  {
    id v7 = objc_alloc(MEMORY[0x1E4F29128]);
    id v8 = [v3 storeIdentifier];
    id v9 = (void *)[v7 initWithUUIDString:v8];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (void)addStoreIdentifier:(id)a3 ownerIdentifier:(id)a4 syncIdentity:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v13 = objc_alloc_init(HDCloudSyncCodableRegisteredStore);
  [(HDCloudSyncCodableRegisteredStore *)v13 setOwnerIdentifier:v9];

  uint64_t v11 = [v10 UUIDString];

  [(HDCloudSyncCodableRegisteredStore *)v13 setStoreIdentifier:v11];
  id v12 = [v8 codableSyncIdentity];

  [(HDCloudSyncCodableRegisteredStore *)v13 setSyncIdentity:v12];
  [(HDCloudSyncCodableRegistry *)self->_underlyingRegistry addStores:v13];
}

- (void)removeStoreIdentifier:(id)a3 ownerIdentifier:(id)a4 syncIdentity:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [a3 UUIDString];
  uint64_t v11 = [(HDCloudSyncCodableRegistry *)self->_underlyingRegistry stores];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __80__HDCloudSyncRegistryRecord_removeStoreIdentifier_ownerIdentifier_syncIdentity___block_invoke;
  v15[3] = &unk_1E630C348;
  id v16 = v9;
  id v17 = v10;
  id v18 = v8;
  id v12 = v8;
  id v13 = v10;
  id v14 = v9;
  objc_msgSend(v11, "hk_removeObjectsPassingTest:", v15);
}

uint64_t __80__HDCloudSyncRegistryRecord_removeStoreIdentifier_ownerIdentifier_syncIdentity___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 syncIdentity];

  if (v4)
  {
    id v5 = [v3 syncIdentity];
    int v6 = [*(id *)(a1 + 32) codableSyncIdentity];
    if ([v5 isEqual:v6])
    {
      id v7 = [v3 storeIdentifier];
      uint64_t v8 = [v7 isEqualToString:*(void *)(a1 + 40)];
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
  else
  {
    id v5 = [v3 ownerIdentifier];
    if (![v5 isEqualToString:*(void *)(a1 + 48)])
    {
      uint64_t v8 = 0;
      goto LABEL_9;
    }
    int v6 = [v3 storeIdentifier];
    uint64_t v8 = [v6 isEqualToString:*(void *)(a1 + 40)];
  }

LABEL_9:
  return v8;
}

- (id)printDescription
{
  id v3 = NSString;
  id v4 = [(HDCloudSyncRegistryRecord *)self disabledOwnerIdentifiers];
  id v5 = [v4 allObjects];
  int v6 = [v5 componentsJoinedByString:@", "];
  id v7 = [(HDCloudSyncRegistryRecord *)self disabledSyncIdentities];
  uint64_t v8 = [v7 allObjects];
  id v9 = [v8 componentsJoinedByString:@", "];
  id v10 = [v3 stringWithFormat:@"+ Disabled Owners: %@\n| Disabled Sync Identities: %@\n+--------------------------------------------------", v6, v9];

  return v10;
}

- (void).cxx_destruct
{
}

@end