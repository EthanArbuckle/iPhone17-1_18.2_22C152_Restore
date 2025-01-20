@interface HDCloudSyncStoreRecord
+ (BOOL)hasFutureSchema:(id)a3;
+ (BOOL)isStoreRecord:(id)a3;
+ (BOOL)isStoreRecordID:(id)a3;
+ (BOOL)requiresUnderlyingMessage;
+ (HDCloudSyncStoreRecord)recordWithCKRecord:(id)a3 error:(id *)a4;
+ (id)fieldsForUnprotectedSerialization;
+ (id)recordIDForOwnerIdentifier:(id)a3 storeIdentifier:(id)a4 zoneID:(id)a5;
+ (id)recordIDWithIndividualZoneID:(id)a3;
+ (id)recordType;
- (BOOL)hasActiveSequence;
- (BOOL)hasSequenceWithFutureProtocolVersion;
- (BOOL)isActive;
- (BOOL)isChild;
- (BOOL)isEqual:(id)a3;
- (HDCloudSyncSequenceRecord)sequenceRecord;
- (HDCloudSyncSequenceRecord)tombstoneSequenceRecord;
- (HDCloudSyncShardPredicate)shardPredicate;
- (HDCloudSyncStoreRecord)initWithCKRecord:(id)a3 schemaVersion:(int64_t)a4;
- (HDSyncIdentity)pendingSyncIdentity;
- (HDSyncIdentity)syncIdentity;
- (NSArray)orderedSequenceRecords;
- (NSString)deviceName;
- (NSString)ownerIdentifier;
- (NSString)pendingOwner;
- (NSString)productType;
- (NSString)systemBuildVersion;
- (NSUUID)storeIdentifier;
- (id)_clearSequenceHeaderRecord:(void *)a1;
- (id)activeSequenceHeaderRecord;
- (id)addNewSequenceHeaderRecordWithSyncAnchorMap:(id)a3 includedIdentifiers:(id)a4 includedSyncIdentities:(id)a5 includedChildSyncIdentities:(id)a6;
- (id)addNewTombstoneSequenceHeaderRecordWithIncludedIdentifiers:(id)a3 includedSyncIdentities:(id)a4 includedChildSyncIdentities:(id)a5;
- (id)clearCurrentSequenceHeaderRecord;
- (id)clearOldSequenceHeaderRecord;
- (id)clearPendingSequenceHeaderRecord;
- (id)clearTombstoneSequenceHeaderRecord;
- (id)currentSequenceHeaderRecord;
- (id)initInSyncCircle:(id)a3 ownerIdentifier:(id)a4 storeIdentifier:(id)a5 syncIdentity:(id)a6 isChild:(BOOL)a7 unified:(BOOL)a8;
- (id)initInSyncCircle:(id)a3 ownerIdentifier:(id)a4 storeIdentifier:(id)a5 syncIdentity:(id)a6 isChild:(BOOL)a7 zoneID:(id)a8;
- (id)initWithCKRecord:(uint64_t)a3 schemaVersion:(void *)a4 underlyingStore:;
- (id)oldSequenceHeaderRecord;
- (id)pendingSequenceHeaderRecord;
- (id)printDescription;
- (id)sequenceRecordWithRecordID:(id)a3;
- (id)serializeUnderlyingMessage;
- (id)shortDescription;
- (int)deviceMode;
- (int)requiredProtocolVersion;
- (int)supportedProtocolVersion;
- (int64_t)compare:(id)a3;
- (int64_t)order;
- (unint64_t)hash;
- (void)addSequenceHeaderRecord:(id)a3;
- (void)removeSequenceHeaderRecord:(id)a3;
- (void)repairOwnerIdentifier:(id)a3;
- (void)setActive:(BOOL)a3;
- (void)setDeviceMode:(int)a3;
- (void)setDeviceName:(id)a3;
- (void)setOrder:(int64_t)a3;
- (void)setPendingOwner:(id)a3;
- (void)setPendingSyncIdentity:(id)a3;
- (void)setProductType:(id)a3;
- (void)setRequiredProtocolVersion:(int)a3;
- (void)setShardPredicate:(id)a3;
- (void)setSupportedProtocolVersion:(int)a3;
- (void)setSystemBuildVersion:(id)a3;
@end

@implementation HDCloudSyncStoreRecord

+ (id)recordIDForOwnerIdentifier:(id)a3 storeIdentifier:(id)a4 zoneID:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = (objc_class *)MEMORY[0x1E4F1A2F8];
  id v10 = a5;
  id v11 = [v9 alloc];
  v12 = (objc_class *)NSString;
  id v13 = v7;
  id v14 = v8;
  id v15 = [v12 alloc];
  v16 = [v14 UUIDString];

  v17 = (void *)[v15 initWithFormat:@"%@/%@/Store", v13, v16];
  v18 = (void *)[v11 initWithRecordName:v17 zoneID:v10];

  return v18;
}

+ (id)recordIDWithIndividualZoneID:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F1A2F8];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithRecordName:@"CloudSyncRoot" zoneID:v4];

  return v5;
}

+ (BOOL)isStoreRecord:(id)a3
{
  v3 = [a3 recordType];
  char v4 = [v3 isEqualToString:@"CloudSyncStoreRecord"];

  return v4;
}

+ (BOOL)isStoreRecordID:(id)a3
{
  id v3 = a3;
  char v4 = [v3 recordName];
  char v5 = [v4 isEqualToString:@"CloudSyncRoot"];

  if (v5)
  {
    char v6 = 1;
  }
  else
  {
    id v7 = [v3 recordName];
    id v8 = [v7 componentsSeparatedByString:@"/"];

    if ([v8 count] == 3)
    {
      v9 = [v8 objectAtIndexedSubscript:2];
      char v6 = [v9 isEqualToString:@"Store"];
    }
    else
    {
      char v6 = 0;
    }
  }
  return v6;
}

- (HDCloudSyncStoreRecord)initWithCKRecord:(id)a3 schemaVersion:(int64_t)a4
{
  char v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3C8];
  id v7 = NSStringFromSelector(a2);
  [v5 raise:v6, @"The -%@ method is not available on %@", v7, objc_opt_class() format];

  return 0;
}

- (id)initInSyncCircle:(id)a3 ownerIdentifier:(id)a4 storeIdentifier:(id)a5 syncIdentity:(id)a6 isChild:(BOOL)a7 unified:(BOOL)a8
{
  BOOL v9 = a7;
  id v14 = (void *)MEMORY[0x1E4F1A320];
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  if (a8) {
    objc_msgSend(v14, "hd_unifiedSyncZoneIDForSyncCircleIdentifier:", v18);
  }
  else {
  v19 = objc_msgSend(v14, "hd_individualSyncZoneIDWithSyncCircleIdentifier:storeIdentifier:", v18, v16);
  }
  id v20 = [(HDCloudSyncStoreRecord *)self initInSyncCircle:v18 ownerIdentifier:v17 storeIdentifier:v16 syncIdentity:v15 isChild:v9 zoneID:v19];

  return v20;
}

- (id)initInSyncCircle:(id)a3 ownerIdentifier:(id)a4 storeIdentifier:(id)a5 syncIdentity:(id)a6 isChild:(BOOL)a7 zoneID:(id)a8
{
  BOOL v9 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = v14;
  id v17 = a8;
  self;
  uint64_t v34 = 0;
  int v18 = objc_msgSend(v17, "hd_isUnifiedSyncZoneIDForSyncCircleIdentifier:", &v34);
  v19 = objc_opt_class();
  if (v18) {
    [v19 recordIDForOwnerIdentifier:v15 storeIdentifier:v16 zoneID:v17];
  }
  else {
  id v20 = [v19 recordIDWithIndividualZoneID:v17];
  }

  v21 = (void *)[objc_alloc(MEMORY[0x1E4F1A2D8]) initWithRecordType:@"CloudSyncStoreRecord" recordID:v20];
  unint64_t v22 = (unint64_t)v15;
  id v23 = v16;
  unint64_t v24 = (unint64_t)v13;
  id v25 = v21;
  if (self)
  {
    if (!(v22 | v24))
    {
      v33 = [MEMORY[0x1E4F28B00] currentHandler];
      [v33 handleFailureInMethod:sel_initWithOwnerIdentifier_storeIdentifier_syncIdentity_isChild_pendingOwner_pendingSyncIdentity_active_record_schemaVersion_, self, @"HDCloudSyncStoreRecord.m", 179, @"Invalid parameter not satisfying: %@", @"ownerIdentifier != nil || syncIdentity != nil" object file lineNumber description];
    }
    v26 = objc_alloc_init(HDCloudSyncCodableStore);
    [(HDCloudSyncCodableStore *)v26 setActive:1];
    v27 = (void *)[(id)v22 copy];
    [(HDCloudSyncCodableStore *)v26 setOwnerIdentifier:v27];

    v28 = (void *)[0 copy];
    [(HDCloudSyncCodableStore *)v26 setPendingOwnerIdentifier:v28];

    v29 = [0 codableSyncIdentity];
    [(HDCloudSyncCodableStore *)v26 setPendingSyncIdentity:v29];

    v30 = objc_msgSend(v23, "hk_dataForUUIDBytes");
    [(HDCloudSyncCodableStore *)v26 setStoreIdentifier:v30];

    [(HDCloudSyncCodableStore *)v26 setDeviceMode:1];
    [(HDCloudSyncCodableStore *)v26 setSupportedProtocolVersion:1];
    [(HDCloudSyncCodableStore *)v26 setRequiredProtocolVersion:0];
    v31 = [(id)v24 codableSyncIdentity];
    [(HDCloudSyncCodableStore *)v26 setSyncIdentity:v31];

    [(HDCloudSyncCodableStore *)v26 setIsChild:v9];
    self = -[HDCloudSyncStoreRecord initWithCKRecord:schemaVersion:underlyingStore:](self, v25, 1, v26);
  }
  return self;
}

- (id)initWithCKRecord:(uint64_t)a3 schemaVersion:(void *)a4 underlyingStore:
{
  id v7 = a2;
  id v8 = a4;
  if (a1)
  {
    v18.receiver = a1;
    v18.super_class = (Class)HDCloudSyncStoreRecord;
    BOOL v9 = (id *)objc_msgSendSuper2(&v18, sel_initWithCKRecord_schemaVersion_, v7, a3);
    id v10 = v9;
    if (v9)
    {
      objc_storeStrong(v9 + 3, a4);
      id v11 = [v10[3] ownerIdentifier];
      objc_msgSend(v7, "hd_setValue:ifChangedForKey:", v11, @"OwnerIdentifier");

      uint64_t v12 = [v10[3] pendingOwnerIdentifier];
      id v13 = (void *)v12;
      if (v12) {
        id v14 = (__CFString *)v12;
      }
      else {
        id v14 = &stru_1F1728D60;
      }
      objc_msgSend(v7, "hd_setValue:ifChangedForKey:", v14, @"PendingOwner");

      id v15 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v10[3], "active"));
      objc_msgSend(v7, "hd_setValue:ifChangedForKey:", v15, @"Active");

      id v16 = [v10[3] storeIdentifier];
      objc_msgSend(v7, "hd_setValue:ifChangedForKey:", v16, @"StoreIdentifier");
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (HDCloudSyncSequenceRecord)sequenceRecord
{
  id v3 = [(HDCloudSyncStoreRecord *)self activeSequenceHeaderRecord];
  char v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(HDCloudSyncStoreRecord *)self currentSequenceHeaderRecord];
  }
  uint64_t v6 = v5;

  return (HDCloudSyncSequenceRecord *)v6;
}

- (NSArray)orderedSequenceRecords
{
  id v3 = self->_tombstoneSequenceRecord;
  char v4 = [(HDCloudSyncStoreRecord *)self sequenceRecord];
  slotASequenceHeaderRecord = self->_slotASequenceHeaderRecord;
  if (slotASequenceHeaderRecord == v4) {
    slotASequenceHeaderRecord = self->_slotBSequenceHeaderRecord;
  }
  uint64_t v6 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v7 = slotASequenceHeaderRecord;
  id v8 = objc_alloc_init(v6);
  objc_msgSend(v8, "hk_addNonNilObject:", v3);
  objc_msgSend(v8, "hk_addNonNilObject:", v4);
  objc_msgSend(v8, "hk_addNonNilObject:", v7);

  return (NSArray *)v8;
}

- (id)currentSequenceHeaderRecord
{
  p_slotASequenceHeaderRecord = &self->_slotASequenceHeaderRecord;
  slotASequenceHeaderRecord = self->_slotASequenceHeaderRecord;
  p_slotBSequenceHeaderRecord = &self->_slotBSequenceHeaderRecord;
  slotBSequenceHeaderRecord = self->_slotBSequenceHeaderRecord;
  if (slotASequenceHeaderRecord)
  {
    if (slotBSequenceHeaderRecord)
    {
      uint64_t v7 = [(HDCloudSyncSequenceRecord *)slotASequenceHeaderRecord baselineEpoch];
      if (v7 <= [(HDCloudSyncSequenceRecord *)*p_slotBSequenceHeaderRecord baselineEpoch]) {
        id v8 = p_slotBSequenceHeaderRecord;
      }
      else {
        id v8 = p_slotASequenceHeaderRecord;
      }
      slotBSequenceHeaderRecord = *v8;
    }
    else
    {
      slotBSequenceHeaderRecord = slotASequenceHeaderRecord;
    }
  }
  else if (!slotBSequenceHeaderRecord)
  {
    BOOL v9 = 0;
    goto LABEL_11;
  }
  BOOL v9 = slotBSequenceHeaderRecord;
LABEL_11:

  return v9;
}

- (id)clearCurrentSequenceHeaderRecord
{
  id v3 = [(HDCloudSyncStoreRecord *)self currentSequenceHeaderRecord];
  char v4 = -[HDCloudSyncStoreRecord _clearSequenceHeaderRecord:](self, v3);

  return v4;
}

- (id)_clearSequenceHeaderRecord:(void *)a1
{
  id v3 = a2;
  char v4 = v3;
  id v5 = 0;
  if (a1 && v3)
  {
    uint64_t v6 = a1 + 4;
    if ((id)a1[4] == v3 || (uint64_t v6 = a1 + 5, (id)a1[5] == v3) || (uint64_t v6 = a1 + 6, (id)a1[6] == v3))
    {
      *uint64_t v6 = 0;

      uint64_t v7 = [v4 record];
      id v5 = [v7 recordID];
    }
    else
    {
      id v5 = 0;
    }
  }

  return v5;
}

- (id)oldSequenceHeaderRecord
{
  id v3 = [(HDCloudSyncStoreRecord *)self currentSequenceHeaderRecord];
  char v4 = v3;
  if (!v3) {
    goto LABEL_4;
  }
  slotBSequenceHeaderRecord = self->_slotBSequenceHeaderRecord;
  if (v3 != self->_slotASequenceHeaderRecord)
  {
    if (v3 != slotBSequenceHeaderRecord)
    {
LABEL_4:
      uint64_t v6 = 0;
      goto LABEL_7;
    }
    slotBSequenceHeaderRecord = self->_slotASequenceHeaderRecord;
  }
  uint64_t v6 = slotBSequenceHeaderRecord;
LABEL_7:

  return v6;
}

- (id)clearOldSequenceHeaderRecord
{
  id v3 = [(HDCloudSyncStoreRecord *)self oldSequenceHeaderRecord];
  char v4 = -[HDCloudSyncStoreRecord _clearSequenceHeaderRecord:](self, v3);

  return v4;
}

- (id)activeSequenceHeaderRecord
{
  id v3 = [(HDCloudSyncStoreRecord *)self currentSequenceHeaderRecord];
  BOOL v4 = [(HDCloudSyncSequenceRecord *)v3 isActive];
  id v5 = v3;
  if (v4) {
    goto LABEL_7;
  }
  if (v3 == self->_slotASequenceHeaderRecord
    && (p_slotBSequenceHeaderRecord = &self->_slotBSequenceHeaderRecord,
        [(HDCloudSyncSequenceRecord *)self->_slotBSequenceHeaderRecord isActive])
    || v3 == self->_slotBSequenceHeaderRecord
    && (p_slotBSequenceHeaderRecord = &self->_slotASequenceHeaderRecord,
        [(HDCloudSyncSequenceRecord *)self->_slotASequenceHeaderRecord isActive]))
  {
    id v5 = *p_slotBSequenceHeaderRecord;
LABEL_7:
    uint64_t v7 = v5;
    goto LABEL_9;
  }
  uint64_t v7 = 0;
LABEL_9:

  return v7;
}

- (id)pendingSequenceHeaderRecord
{
  id v3 = [(HDCloudSyncStoreRecord *)self currentSequenceHeaderRecord];
  BOOL v4 = v3;
  if (!v3)
  {
LABEL_7:
    id v8 = 0;
    goto LABEL_10;
  }
  BOOL v5 = [(HDCloudSyncSequenceRecord *)v3 isActive];
  uint64_t v6 = v4;
  if (v5)
  {
    if (v4 != self->_slotASequenceHeaderRecord
      || (p_slotASequenceHeaderRecord = &self->_slotBSequenceHeaderRecord,
          [(HDCloudSyncSequenceRecord *)self->_slotBSequenceHeaderRecord isActive]))
    {
      if (v4 != self->_slotBSequenceHeaderRecord) {
        goto LABEL_7;
      }
      p_slotASequenceHeaderRecord = &self->_slotASequenceHeaderRecord;
      if ([(HDCloudSyncSequenceRecord *)self->_slotASequenceHeaderRecord isActive]) {
        goto LABEL_7;
      }
    }
    uint64_t v6 = *p_slotASequenceHeaderRecord;
  }
  id v8 = v6;
LABEL_10:

  return v8;
}

- (id)clearPendingSequenceHeaderRecord
{
  id v3 = [(HDCloudSyncStoreRecord *)self pendingSequenceHeaderRecord];
  BOOL v4 = -[HDCloudSyncStoreRecord _clearSequenceHeaderRecord:](self, v3);

  return v4;
}

- (id)clearTombstoneSequenceHeaderRecord
{
  id v3 = [(HDCloudSyncRecord *)self->_tombstoneSequenceRecord record];
  BOOL v4 = [v3 recordID];

  tombstoneSequenceRecord = self->_tombstoneSequenceRecord;
  self->_tombstoneSequenceRecord = 0;

  return v4;
}

- (id)addNewSequenceHeaderRecordWithSyncAnchorMap:(id)a3 includedIdentifiers:(id)a4 includedSyncIdentities:(id)a5 includedChildSyncIdentities:(id)a6
{
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v15 = [(HDCloudSyncStoreRecord *)self currentSequenceHeaderRecord];
  id v16 = v15;
  if (v15)
  {
    if ([v15 slot] == 1) {
      uint64_t v17 = 2;
    }
    else {
      uint64_t v17 = 1;
    }
    id v18 = -[HDCloudSyncSequenceRecord initForSequenceSlot:syncAnchorMap:changeIndex:baselineEpoch:includedIdentifiers:includedSyncIdentities:includedChildSyncIdentities:storeRecord:]([HDCloudSyncSequenceRecord alloc], "initForSequenceSlot:syncAnchorMap:changeIndex:baselineEpoch:includedIdentifiers:includedSyncIdentities:includedChildSyncIdentities:storeRecord:", v17, v14, [v16 changeIndex], objc_msgSend(v16, "baselineEpoch") + 1, v13, v12, v11, self);

    if ([v18 slot] != 1)
    {
      uint64_t v19 = 40;
      goto LABEL_9;
    }
  }
  else
  {
    id v18 = [[HDCloudSyncSequenceRecord alloc] initForSequenceSlot:1 syncAnchorMap:v14 changeIndex:0 baselineEpoch:0 includedIdentifiers:v13 includedSyncIdentities:v12 includedChildSyncIdentities:v11 storeRecord:self];
  }
  uint64_t v19 = 32;
LABEL_9:
  id v20 = (objc_class *)v18;
  v21 = *(Class *)((char *)&self->super.super.isa + v19);
  *(Class *)((char *)&self->super.super.isa + v19) = v20;

  id v26 = 0;
  char v22 = [(objc_class *)v20 validateWithError:&v26];
  id v23 = v26;
  if ((v22 & 1) == 0)
  {
    id v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"HDCloudSyncStoreRecord.m", 371, @"Failed to validate sequence record after creation: %@", v23 object file lineNumber description];
  }

  return v20;
}

- (id)addNewTombstoneSequenceHeaderRecordWithIncludedIdentifiers:(id)a3 includedSyncIdentities:(id)a4 includedChildSyncIdentities:(id)a5
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [HDCloudSyncSequenceRecord alloc];
  id v13 = objc_alloc_init(HDSyncAnchorMap);
  id v14 = [(HDCloudSyncSequenceRecord *)v12 initForSequenceSlot:3 syncAnchorMap:v13 changeIndex:0 baselineEpoch:-100 includedIdentifiers:v11 includedSyncIdentities:v10 includedChildSyncIdentities:v9 storeRecord:self];

  tombstoneSequenceRecord = self->_tombstoneSequenceRecord;
  self->_tombstoneSequenceRecord = v14;

  [(HDCloudSyncSequenceRecord *)self->_tombstoneSequenceRecord setActive:1];
  id v16 = self->_tombstoneSequenceRecord;
  id v21 = 0;
  LOBYTE(v11) = [(HDCloudSyncRecord *)v16 validateWithError:&v21];
  id v17 = v21;
  if ((v11 & 1) == 0)
  {
    id v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"HDCloudSyncStoreRecord.m", 390, @"Failed to validate sequence record after creation: %@", v17 object file lineNumber description];
  }
  id v18 = self->_tombstoneSequenceRecord;

  return v18;
}

- (void)addSequenceHeaderRecord:(id)a3
{
  id v6 = a3;
  unsigned int v5 = [v6 slot] - 1;
  if (v5 <= 2) {
    objc_storeStrong((id *)((char *)&self->super.super.isa + *off_1E62FD508[v5]), a3);
  }
}

- (void)removeSequenceHeaderRecord:(id)a3
{
  id v10 = (HDCloudSyncSequenceRecord *)a3;
  int v5 = [(HDCloudSyncSequenceRecord *)v10 slot];
  switch(v5)
  {
    case 3:
      p_tombstoneSequenceRecord = &self->_tombstoneSequenceRecord;
      uint64_t v7 = v10;
      if (self->_tombstoneSequenceRecord != v10)
      {
        id v8 = [MEMORY[0x1E4F28B00] currentHandler];
        [v8 handleFailureInMethod:a2, self, @"HDCloudSyncStoreRecord.m", 421, @"Invalid parameter not satisfying: %@", @"_tombstoneSequenceRecord == record" object file lineNumber description];
        goto LABEL_15;
      }
      break;
    case 2:
      p_tombstoneSequenceRecord = &self->_slotBSequenceHeaderRecord;
      uint64_t v7 = v10;
      if (self->_slotBSequenceHeaderRecord != v10)
      {
        id v8 = [MEMORY[0x1E4F28B00] currentHandler];
        [v8 handleFailureInMethod:a2, self, @"HDCloudSyncStoreRecord.m", 417, @"Invalid parameter not satisfying: %@", @"_slotBSequenceHeaderRecord == record" object file lineNumber description];
        goto LABEL_15;
      }
      break;
    case 1:
      p_tombstoneSequenceRecord = &self->_slotASequenceHeaderRecord;
      uint64_t v7 = v10;
      if (self->_slotASequenceHeaderRecord != v10)
      {
        id v8 = [MEMORY[0x1E4F28B00] currentHandler];
        [v8 handleFailureInMethod:a2, self, @"HDCloudSyncStoreRecord.m", 413, @"Invalid parameter not satisfying: %@", @"_slotASequenceHeaderRecord == record" object file lineNumber description];
LABEL_15:

        id v9 = *p_tombstoneSequenceRecord;
        goto LABEL_10;
      }
      break;
    default:
      goto LABEL_11;
  }
  id v9 = v7;
LABEL_10:
  *p_tombstoneSequenceRecord = 0;

LABEL_11:
}

- (BOOL)hasActiveSequence
{
  if ([(HDCloudSyncSequenceRecord *)self->_slotASequenceHeaderRecord isActive]) {
    return 1;
  }
  slotBSequenceHeaderRecord = self->_slotBSequenceHeaderRecord;

  return [(HDCloudSyncSequenceRecord *)slotBSequenceHeaderRecord isActive];
}

- (BOOL)hasSequenceWithFutureProtocolVersion
{
  return [(HDCloudSyncSequenceRecord *)self->_slotASequenceHeaderRecord protocolVersion] > 16
      || [(HDCloudSyncSequenceRecord *)self->_slotBSequenceHeaderRecord protocolVersion] > 16;
}

- (id)sequenceRecordWithRecordID:(id)a3
{
  id v4 = a3;
  p_slotASequenceHeaderRecord = &self->_slotASequenceHeaderRecord;
  id v6 = [(HDCloudSyncRecord *)self->_slotASequenceHeaderRecord record];
  uint64_t v7 = [v6 recordID];
  char v8 = [v7 isEqual:v4];

  if (v8) {
    goto LABEL_4;
  }
  p_slotASequenceHeaderRecord = &self->_slotBSequenceHeaderRecord;
  id v9 = [(HDCloudSyncRecord *)self->_slotBSequenceHeaderRecord record];
  id v10 = [v9 recordID];
  char v11 = [v10 isEqual:v4];

  if (v11) {
    goto LABEL_4;
  }
  p_slotASequenceHeaderRecord = &self->_tombstoneSequenceRecord;
  id v12 = [(HDCloudSyncRecord *)self->_tombstoneSequenceRecord record];
  id v13 = [v12 recordID];
  int v14 = [v13 isEqual:v4];

  if (v14) {
LABEL_4:
  }
    id v15 = *p_slotASequenceHeaderRecord;
  else {
    id v15 = 0;
  }

  return v15;
}

- (NSUUID)storeIdentifier
{
  v2 = (void *)MEMORY[0x1E4F29128];
  id v3 = [(HDCloudSyncCodableStore *)self->_underlyingStore storeIdentifier];
  id v4 = objc_msgSend(v2, "hk_UUIDWithData:", v3);

  return (NSUUID *)v4;
}

- (NSString)ownerIdentifier
{
  return [(HDCloudSyncCodableStore *)self->_underlyingStore ownerIdentifier];
}

- (HDSyncIdentity)syncIdentity
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ([(HDCloudSyncCodableStore *)self->_underlyingStore hasSyncIdentity])
  {
    id v3 = [(HDCloudSyncCodableStore *)self->_underlyingStore syncIdentity];
    id v8 = 0;
    id v4 = +[HDSyncIdentity syncIdentityWithCodable:v3 error:&v8];
    id v5 = v8;

    if (!v4)
    {
      _HKInitializeLogging();
      id v6 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v10 = self;
        _os_log_fault_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_FAULT, "Failed to decode underlying sync identity for record %@.", buf, 0xCu);
      }
    }
  }
  else
  {
    id v4 = 0;
  }

  return (HDSyncIdentity *)v4;
}

- (void)repairOwnerIdentifier:(id)a3
{
  underlyingStore = self->_underlyingStore;
  id v6 = a3;
  uint64_t v7 = [(HDCloudSyncCodableStore *)underlyingStore ownerIdentifier];

  if (v7)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"HDCloudSyncStoreRecord.m", 483, @"Invalid parameter not satisfying: %@", @"_underlyingStore.ownerIdentifier == nil" object file lineNumber description];
  }
  [(HDCloudSyncCodableStore *)self->_underlyingStore setOwnerIdentifier:v6];
  id v9 = [(HDCloudSyncRecord *)self record];
  [v9 setObject:v6 forKeyedSubscript:@"OwnerIdentifier"];
}

- (NSString)pendingOwner
{
  id v3 = [(HDCloudSyncCodableStore *)self->_underlyingStore pendingOwnerIdentifier];
  char v4 = [v3 isEqualToString:&stru_1F1728D60];

  if (v4)
  {
    id v5 = 0;
  }
  else
  {
    id v5 = [(HDCloudSyncCodableStore *)self->_underlyingStore pendingOwnerIdentifier];
  }

  return (NSString *)v5;
}

- (void)setPendingOwner:(id)a3
{
  id v4 = a3;
  id v5 = [(HDCloudSyncCodableStore *)self->_underlyingStore pendingOwnerIdentifier];
  id v6 = v4;
  id v12 = v6;
  if (v5 != v6 && (!v6 || ([v5 isEqual:v6] & 1) == 0)) {
    [(HDCloudSyncCodableStore *)self->_underlyingStore setPendingOwnerIdentifier:v12];
  }

  uint64_t v7 = [(HDCloudSyncRecord *)self record];
  id v8 = [v7 objectForKeyedSubscript:@"PendingOwner"];

  if (!v12)
  {
    id v10 = &stru_1F1728D60;
    if (v8 == &stru_1F1728D60) {
      goto LABEL_12;
    }
LABEL_10:
    if ([(__CFString *)v8 isEqual:v10]) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  uint64_t v9 = [v12 copy];
  id v10 = v8;
  if (v8 == (__CFString *)v9) {
    goto LABEL_12;
  }
  id v10 = (__CFString *)v9;
  if (v9) {
    goto LABEL_10;
  }
LABEL_11:
  uint64_t v11 = [(HDCloudSyncRecord *)self record];
  [v11 setObject:v10 forKeyedSubscript:@"PendingOwner"];

LABEL_12:
}

- (HDSyncIdentity)pendingSyncIdentity
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ([(HDCloudSyncCodableStore *)self->_underlyingStore hasPendingSyncIdentity])
  {
    id v3 = [(HDCloudSyncCodableStore *)self->_underlyingStore pendingSyncIdentity];
    id v8 = 0;
    id v4 = +[HDSyncIdentity syncIdentityWithCodable:v3 error:&v8];
    id v5 = v8;

    if (!v4)
    {
      _HKInitializeLogging();
      id v6 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v10 = self;
        _os_log_fault_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_FAULT, "Failed to decode underlying pending sync identity for record %@.", buf, 0xCu);
      }
    }
  }
  else
  {
    id v4 = 0;
  }

  return (HDSyncIdentity *)v4;
}

- (void)setPendingSyncIdentity:(id)a3
{
  underlyingStore = self->_underlyingStore;
  id v5 = a3;
  id v7 = [(HDCloudSyncCodableStore *)underlyingStore pendingSyncIdentity];
  id v6 = [v5 codableSyncIdentity];

  if (v7 != v6 && (!v6 || ([v7 isEqual:v6] & 1) == 0)) {
    [(HDCloudSyncCodableStore *)self->_underlyingStore setPendingSyncIdentity:v6];
  }
}

- (int64_t)order
{
  return [(HDCloudSyncCodableStore *)self->_underlyingStore order];
}

- (void)setOrder:(int64_t)a3
{
}

- (BOOL)isActive
{
  return [(HDCloudSyncCodableStore *)self->_underlyingStore active];
}

- (void)setActive:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(HDCloudSyncCodableStore *)self->_underlyingStore active] != a3)
  {
    [(HDCloudSyncCodableStore *)self->_underlyingStore setActive:v3];
    id v6 = [NSNumber numberWithBool:v3];
    id v5 = [(HDCloudSyncRecord *)self record];
    [v5 setObject:v6 forKeyedSubscript:@"Active"];
  }
}

- (BOOL)isChild
{
  BOOL v3 = [(HDCloudSyncCodableStore *)self->_underlyingStore hasIsChild];
  if (v3)
  {
    underlyingStore = self->_underlyingStore;
    LOBYTE(v3) = [(HDCloudSyncCodableStore *)underlyingStore isChild];
  }
  return v3;
}

- (NSString)productType
{
  return [(HDCloudSyncCodableStore *)self->_underlyingStore productType];
}

- (void)setProductType:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"HDCloudSyncStoreRecord.m", 571, @"Invalid parameter not satisfying: %@", @"productType != nil" object file lineNumber description];
  }
  id v6 = [(HDCloudSyncCodableStore *)self->_underlyingStore productType];
  id v7 = v5;
  id v8 = v7;
  if (v5 && v6 != v7)
  {
    if ([v6 isEqual:v7]) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  if (v6 != v7) {
LABEL_8:
  }
    [(HDCloudSyncCodableStore *)self->_underlyingStore setProductType:v8];
LABEL_9:

  uint64_t v9 = [(HDCloudSyncRecord *)self record];
  id v10 = [v9 objectForKeyedSubscript:@"ProductType"];

  id v11 = v8;
  id v14 = v11;
  if (!v5 || v10 == v11)
  {
    if (v10 == v11) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  if (([v10 isEqual:v11] & 1) == 0)
  {
LABEL_14:
    id v12 = [(HDCloudSyncRecord *)self record];
    [v12 setObject:v14 forKeyedSubscript:@"ProductType"];
  }
LABEL_15:
}

- (NSString)systemBuildVersion
{
  return [(HDCloudSyncCodableStore *)self->_underlyingStore systemBuildVersion];
}

- (void)setSystemBuildVersion:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"HDCloudSyncStoreRecord.m", 584, @"Invalid parameter not satisfying: %@", @"systemBuildVersion != nil" object file lineNumber description];
  }
  id v6 = [(HDCloudSyncCodableStore *)self->_underlyingStore systemBuildVersion];
  id v7 = v5;
  id v8 = v7;
  if (v5 && v6 != v7)
  {
    if ([v6 isEqual:v7]) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  if (v6 != v7) {
LABEL_8:
  }
    [(HDCloudSyncCodableStore *)self->_underlyingStore setSystemBuildVersion:v8];
LABEL_9:

  uint64_t v9 = [(HDCloudSyncRecord *)self record];
  id v10 = [v9 objectForKeyedSubscript:@"SystemBuildVersion"];

  id v11 = v8;
  id v14 = v11;
  if (!v5 || v10 == v11)
  {
    if (v10 == v11) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  if (([v10 isEqual:v11] & 1) == 0)
  {
LABEL_14:
    id v12 = [(HDCloudSyncRecord *)self record];
    [v12 setObject:v14 forKeyedSubscript:@"SystemBuildVersion"];
  }
LABEL_15:
}

- (NSString)deviceName
{
  return [(HDCloudSyncCodableStore *)self->_underlyingStore deviceName];
}

- (void)setDeviceName:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"HDCloudSyncStoreRecord.m", 597, @"Invalid parameter not satisfying: %@", @"deviceName != nil" object file lineNumber description];
  }
  id v6 = [(HDCloudSyncCodableStore *)self->_underlyingStore deviceName];
  id v7 = v5;
  id v8 = v7;
  if (v5 && v6 != v7)
  {
    if ([v6 isEqual:v7]) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  if (v6 != v7) {
LABEL_8:
  }
    [(HDCloudSyncCodableStore *)self->_underlyingStore setDeviceName:v8];
LABEL_9:

  uint64_t v9 = [(HDCloudSyncRecord *)self record];
  id v10 = [v9 objectForKeyedSubscript:@"DeviceName"];

  id v11 = v8;
  id v14 = v11;
  if (!v5 || v10 == v11)
  {
    if (v10 == v11) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  if (([v10 isEqual:v11] & 1) == 0)
  {
LABEL_14:
    id v12 = [(HDCloudSyncRecord *)self record];
    [v12 setObject:v14 forKeyedSubscript:@"DeviceName"];
  }
LABEL_15:
}

- (int)deviceMode
{
  return [(HDCloudSyncCodableStore *)self->_underlyingStore deviceMode];
}

- (void)setDeviceMode:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ([(HDCloudSyncCodableStore *)self->_underlyingStore deviceMode] != a3) {
    [(HDCloudSyncCodableStore *)self->_underlyingStore setDeviceMode:v3];
  }
  id v5 = [(HDCloudSyncRecord *)self record];
  id v8 = [v5 objectForKeyedSubscript:@"DeviceMode"];

  id v6 = [NSNumber numberWithInt:v3];
  if (v8 != v6 && (!v6 || ([v8 isEqual:v6] & 1) == 0))
  {
    id v7 = [(HDCloudSyncRecord *)self record];
    [v7 setObject:v6 forKeyedSubscript:@"DeviceMode"];
  }
}

- (int)supportedProtocolVersion
{
  return [(HDCloudSyncCodableStore *)self->_underlyingStore supportedProtocolVersion];
}

- (void)setSupportedProtocolVersion:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ([(HDCloudSyncCodableStore *)self->_underlyingStore supportedProtocolVersion] != a3) {
    [(HDCloudSyncCodableStore *)self->_underlyingStore setSupportedProtocolVersion:v3];
  }
  id v5 = [(HDCloudSyncRecord *)self record];
  id v8 = [v5 objectForKeyedSubscript:@"SupportedProtocolVersion"];

  id v6 = [NSNumber numberWithInt:v3];
  if (v8 != v6 && (!v6 || ([v8 isEqual:v6] & 1) == 0))
  {
    id v7 = [(HDCloudSyncRecord *)self record];
    [v7 setObject:v6 forKeyedSubscript:@"SupportedProtocolVersion"];
  }
}

- (int)requiredProtocolVersion
{
  return [(HDCloudSyncCodableStore *)self->_underlyingStore requiredProtocolVersion];
}

- (void)setRequiredProtocolVersion:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ([(HDCloudSyncCodableStore *)self->_underlyingStore requiredProtocolVersion] != a3) {
    [(HDCloudSyncCodableStore *)self->_underlyingStore setRequiredProtocolVersion:v3];
  }
  id v5 = [(HDCloudSyncRecord *)self record];
  id v8 = [v5 objectForKeyedSubscript:@"RequiredProtocolVersion"];

  id v6 = [NSNumber numberWithInt:v3];
  if (v8 != v6 && (!v6 || ([v8 isEqual:v6] & 1) == 0))
  {
    id v7 = [(HDCloudSyncRecord *)self record];
    [v7 setObject:v6 forKeyedSubscript:@"RequiredProtocolVersion"];
  }
}

- (HDCloudSyncShardPredicate)shardPredicate
{
  if ([(HDCloudSyncCodableStore *)self->_underlyingStore hasShardPredicate])
  {
    uint64_t v3 = [HDCloudSyncShardPredicate alloc];
    id v4 = [(HDCloudSyncCodableStore *)self->_underlyingStore shardPredicate];
    id v5 = [(HDCloudSyncShardPredicate *)v3 initWithCodableShardPredicate:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)setShardPredicate:(id)a3
{
  id v10 = [a3 codablePredicate];
  id v4 = [(HDCloudSyncCodableStore *)self->_underlyingStore shardPredicate];
  if (v10 == v4)
  {

LABEL_8:
    uint64_t v9 = v10;
    goto LABEL_9;
  }
  uint64_t v5 = [(HDCloudSyncCodableStore *)self->_underlyingStore shardPredicate];
  if (!v5)
  {

    goto LABEL_7;
  }
  id v6 = (void *)v5;
  id v7 = [(HDCloudSyncCodableStore *)self->_underlyingStore shardPredicate];
  char v8 = [v10 isEqual:v7];

  uint64_t v9 = v10;
  if ((v8 & 1) == 0)
  {
LABEL_7:
    [(HDCloudSyncCodableStore *)self->_underlyingStore setShardPredicate:v10];
    goto LABEL_8;
  }
LABEL_9:
}

+ (BOOL)hasFutureSchema:(id)a3
{
  uint64_t v3 = [a3 objectForKeyedSubscript:@"Version"];
  id v4 = v3;
  BOOL v5 = v3 && [v3 integerValue] > 1;

  return v5;
}

+ (HDCloudSyncStoreRecord)recordWithCKRecord:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [v6 recordType];
  char v8 = [v7 isEqualToString:@"CloudSyncStoreRecord"];

  if (v8)
  {
    uint64_t v9 = objc_msgSend(v6, "hd_requiredValueForKey:type:error:", @"Version", objc_opt_class(), a4);
    if (!v9)
    {
      id v15 = 0;
LABEL_79:

      goto LABEL_80;
    }
    id v67 = 0;
    id v10 = objc_msgSend(v6, "hd_optionalEncryptedValueForKey:type:error:", @"UnderlyingMessage", objc_opt_class(), &v67);
    id v11 = v67;
    id v12 = v11;
    if (v10) {
      BOOL v13 = 1;
    }
    else {
      BOOL v13 = v11 == 0;
    }
    if (!v13)
    {
      if (a4)
      {
        id v15 = 0;
        *a4 = v11;
      }
      else
      {
        _HKLogDroppedError();
        id v15 = 0;
      }
      goto LABEL_78;
    }
    if (v10)
    {
      id v14 = [[HDCloudSyncCodableStore alloc] initWithData:v10];
      if (v14)
      {
        id v15 = -[HDCloudSyncStoreRecord initWithCKRecord:schemaVersion:underlyingStore:]([HDCloudSyncStoreRecord alloc], v6, [v9 integerValue], v14);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 3, @"Underlying message present but does not decode.");
        id v15 = 0;
      }

      goto LABEL_78;
    }
    id v20 = objc_alloc_init(HDCloudSyncCodableStore);
    id v21 = objc_msgSend(v6, "hd_requiredValueForKey:type:error:", @"OwnerIdentifier", objc_opt_class(), a4);
    [(HDCloudSyncCodableStore *)v20 setOwnerIdentifier:v21];

    v60 = v20;
    char v22 = [(HDCloudSyncCodableStore *)v20 ownerIdentifier];

    if (!v22)
    {
      id v15 = 0;
      id v25 = v20;
LABEL_77:

LABEL_78:
      goto LABEL_79;
    }
    id v23 = objc_msgSend(v6, "hd_requiredValueForKey:type:error:", @"StoreIdentifier", objc_opt_class(), a4);
    if (!v23)
    {
      id v15 = 0;
      id v25 = v20;
LABEL_76:

      goto LABEL_77;
    }
    unint64_t v24 = objc_msgSend(MEMORY[0x1E4F29128], "hk_UUIDWithData:", v23);
    if (!v24)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), a2, @"record has invalid owner UUID data '%@'"", v23);
      id v33 = (id)objc_claimAutoreleasedReturnValue();
      id v32 = v33;
      if (v33)
      {
        if (a4)
        {
          id v32 = v33;
          id v15 = 0;
          *a4 = v32;
        }
        else
        {
          _HKLogDroppedError();
          id v15 = 0;
        }
        v29 = v32;
      }
      else
      {
        v29 = 0;
        id v15 = 0;
      }
      goto LABEL_73;
    }
    id v25 = v60;
    [(HDCloudSyncCodableStore *)v60 setStoreIdentifier:v23];
    id v26 = objc_msgSend(v6, "hd_requiredValueForKey:type:error:", @"PendingOwner", objc_opt_class(), a4);
    [(HDCloudSyncCodableStore *)v60 setPendingOwnerIdentifier:v26];

    v27 = [(HDCloudSyncCodableStore *)v60 pendingOwnerIdentifier];

    if (!v27)
    {
      id v15 = 0;
LABEL_75:

      goto LABEL_76;
    }
    v28 = objc_msgSend(v6, "hd_requiredValueForKey:type:error:", @"Active", objc_opt_class(), a4);
    v29 = v28;
    if (!v28)
    {
      id v15 = 0;
LABEL_74:

      goto LABEL_75;
    }
    -[HDCloudSyncCodableStore setActive:](v60, "setActive:", [v28 BOOLValue]);
    id v66 = 0;
    v30 = objc_msgSend(v6, "hd_optionalValueForKey:type:error:", @"SupportedProtocolVersion", objc_opt_class(), &v66);
    id v31 = v66;
    id v32 = v31;
    v59 = v30;
    if (!v30 && v31)
    {
      if (a4)
      {
        id v32 = v31;
        id v15 = 0;
        *a4 = v32;
      }
      else
      {
        _HKLogDroppedError();
        id v15 = 0;
      }
      goto LABEL_72;
    }
    if (v30) {
      uint64_t v34 = [v30 integerValue];
    }
    else {
      uint64_t v34 = 0;
    }
    [(HDCloudSyncCodableStore *)v60 setSupportedProtocolVersion:v34];
    id v65 = v32;
    v58 = objc_msgSend(v6, "hd_optionalValueForKey:type:error:", @"RequiredProtocolVersion", objc_opt_class(), &v65);
    id v35 = v65;

    v36 = v58;
    if (!v58 && v35)
    {
      if (a4)
      {
        id v37 = v35;
        id v15 = 0;
        *a4 = v37;
        id v38 = v37;
      }
      else
      {
        _HKLogDroppedError();
        id v38 = v35;
        id v15 = 0;
      }
      goto LABEL_71;
    }
    v56 = v29;
    v57 = v24;
    if (v58) {
      uint64_t v39 = [v58 integerValue];
    }
    else {
      uint64_t v39 = 0;
    }
    [(HDCloudSyncCodableStore *)v60 setRequiredProtocolVersion:v39];
    id v64 = v35;
    v40 = objc_msgSend(v6, "hd_optionalValueForKey:type:error:", @"SystemBuildVersion", objc_opt_class(), &v64);
    id v41 = v64;

    [(HDCloudSyncCodableStore *)v60 setSystemBuildVersion:v40];
    v42 = [(HDCloudSyncCodableStore *)v60 systemBuildVersion];

    if (v42 || !v41)
    {
      id v63 = v41;
      v44 = objc_msgSend(v6, "hd_optionalValueForKey:type:error:", @"ProductType", objc_opt_class(), &v63);
      id v45 = v63;

      [(HDCloudSyncCodableStore *)v60 setProductType:v44];
      v46 = [(HDCloudSyncCodableStore *)v60 productType];

      if (!v46 && v45)
      {
        if (!a4)
        {
          _HKLogDroppedError();
          id v38 = v45;
          id v15 = 0;
          goto LABEL_70;
        }
        v43 = v45;
        goto LABEL_61;
      }
      id v62 = v45;
      v48 = objc_msgSend(v6, "hd_optionalValueForKey:type:error:", @"DeviceName", objc_opt_class(), &v62);
      id v41 = v62;

      [(HDCloudSyncCodableStore *)v60 setDeviceName:v48];
      v49 = [(HDCloudSyncCodableStore *)v60 deviceName];

      if (v49 || !v41)
      {
        id v61 = v41;
        v50 = objc_msgSend(v6, "hd_optionalValueForKey:type:error:", @"DeviceMode", objc_opt_class(), &v61);
        id v51 = v61;

        v54 = v50;
        id v55 = v51;
        if (v50 || !v51)
        {
          if (v50) {
            uint64_t v53 = [v50 integerValue];
          }
          else {
            uint64_t v53 = 1;
          }
          [(HDCloudSyncCodableStore *)v60 setDeviceMode:v53];
          id v15 = -[HDCloudSyncStoreRecord initWithCKRecord:schemaVersion:underlyingStore:]([HDCloudSyncStoreRecord alloc], v6, [v9 integerValue], v60);
        }
        else if (a4)
        {
          id v15 = 0;
          *a4 = v51;
        }
        else
        {
          _HKLogDroppedError();
          id v15 = 0;
        }
        v29 = v56;
        v36 = v58;

        unint64_t v24 = v57;
        id v38 = v55;
        goto LABEL_71;
      }
    }
    if (!a4)
    {
      _HKLogDroppedError();
      id v15 = 0;
      id v38 = v41;
      goto LABEL_70;
    }
    v43 = v41;
LABEL_61:
    id v47 = v43;
    id v15 = 0;
    *a4 = v47;
    id v38 = v47;
LABEL_70:
    v29 = v56;
    v36 = v58;
LABEL_71:

    id v32 = v38;
LABEL_72:

LABEL_73:
    id v25 = v60;
    goto LABEL_74;
  }
  id v16 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v17 = objc_opt_class();
  id v18 = [v6 recordType];
  objc_msgSend(v16, "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", v17, a2, @"record has type (%@), but expected (%@)", v18, @"CloudSyncStoreRecord"");
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    if (a4) {
      *a4 = v19;
    }
    else {
      _HKLogDroppedError();
    }
  }

  id v15 = 0;
LABEL_80:

  return (HDCloudSyncStoreRecord *)v15;
}

+ (BOOL)requiresUnderlyingMessage
{
  return 0;
}

+ (id)recordType
{
  return @"CloudSyncStoreRecord";
}

- (id)serializeUnderlyingMessage
{
  return (id)[(HDCloudSyncCodableStore *)self->_underlyingStore data];
}

+ (id)fieldsForUnprotectedSerialization
{
  v37[10] = *MEMORY[0x1E4F143B8];
  v26.receiver = a1;
  v26.super_class = (Class)&OBJC_METACLASS___HDCloudSyncStoreRecord;
  id v21 = objc_msgSendSuper2(&v26, sel_fieldsForUnprotectedSerialization);
  uint64_t v36 = objc_opt_class();
  id v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v36 count:1];
  unint64_t v24 = +[HDCloudSyncSerializedField fieldForKey:@"OwnerIdentifier" classes:v25 encrypted:0];
  v37[0] = v24;
  uint64_t v35 = objc_opt_class();
  id v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:1];
  char v22 = +[HDCloudSyncSerializedField fieldForKey:@"StoreIdentifier" classes:v23 encrypted:0];
  v37[1] = v22;
  uint64_t v34 = objc_opt_class();
  id v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1];
  id v19 = +[HDCloudSyncSerializedField fieldForKey:@"PendingOwner" classes:v20 encrypted:0];
  v37[2] = v19;
  uint64_t v33 = objc_opt_class();
  id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
  uint64_t v17 = +[HDCloudSyncSerializedField fieldForKey:@"Active" classes:v18 encrypted:0];
  v37[3] = v17;
  uint64_t v32 = objc_opt_class();
  id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];
  id v15 = +[HDCloudSyncSerializedField fieldForKey:@"SupportedProtocolVersion" classes:v16 encrypted:0];
  v37[4] = v15;
  uint64_t v31 = objc_opt_class();
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
  BOOL v13 = +[HDCloudSyncSerializedField fieldForKey:@"RequiredProtocolVersion" classes:v14 encrypted:0];
  v37[5] = v13;
  uint64_t v30 = objc_opt_class();
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1];
  v2 = +[HDCloudSyncSerializedField fieldForKey:@"SystemBuildVersion" classes:v12 encrypted:0];
  v37[6] = v2;
  uint64_t v29 = objc_opt_class();
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
  id v4 = +[HDCloudSyncSerializedField fieldForKey:@"ProductType" classes:v3 encrypted:0];
  v37[7] = v4;
  v28[0] = objc_opt_class();
  v28[1] = objc_opt_class();
  BOOL v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
  id v6 = +[HDCloudSyncSerializedField fieldForKey:@"DeviceName" classes:v5 encrypted:0];
  v37[8] = v6;
  uint64_t v27 = objc_opt_class();
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];
  char v8 = +[HDCloudSyncSerializedField fieldForKey:@"DeviceMode" classes:v7 encrypted:0];
  v37[9] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:10];
  id v10 = [v21 arrayByAddingObjectsFromArray:v9];

  return v10;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HDCloudSyncStoreRecord *)self order];
  if (v5 >= [v4 order])
  {
    uint64_t v7 = [(HDCloudSyncStoreRecord *)self order];
    if (v7 > [v4 order])
    {
      int64_t v6 = 1;
      goto LABEL_14;
    }
    char v8 = [(HDCloudSyncStoreRecord *)self shardPredicate];
    uint64_t v9 = [v4 shardPredicate];
    id v10 = (void *)v9;
    if (v8)
    {
      if (!v9) {
        goto LABEL_11;
      }
      int64_t v6 = [v8 compare:v9];
      if (v6)
      {
LABEL_13:

        goto LABEL_14;
      }
    }
    id v11 = [(HDCloudSyncRecord *)self record];
    id v12 = [v11 modificationDate];
    BOOL v13 = [v4 record];
    id v14 = [v13 modificationDate];
    char v15 = objc_msgSend(v12, "hk_isBeforeDate:", v14);

    if (v15)
    {
      int64_t v6 = 1;
      goto LABEL_13;
    }
    id v16 = [(HDCloudSyncRecord *)self record];
    uint64_t v17 = [v16 modificationDate];
    id v18 = [v4 record];
    id v19 = [v18 modificationDate];
    char v20 = objc_msgSend(v17, "hk_isAfterDate:", v19);

    if ((v20 & 1) == 0)
    {
      id v21 = [(HDCloudSyncStoreRecord *)self storeIdentifier];
      char v22 = [v21 UUIDString];
      id v23 = [(HDCloudSyncStoreRecord *)self storeIdentifier];
      unint64_t v24 = [v23 UUIDString];
      int64_t v6 = [v22 compare:v24];

      goto LABEL_13;
    }
LABEL_11:
    int64_t v6 = -1;
    goto LABEL_13;
  }
  int64_t v6 = -1;
LABEL_14:

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HDCloudSyncStoreRecord *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(HDCloudSyncCodableStore *)self->_underlyingStore isEqual:v4->_underlyingStore];
  }

  return v5;
}

- (unint64_t)hash
{
  return [(HDCloudSyncCodableStore *)self->_underlyingStore hash];
}

- (id)printDescription
{
  uint64_t v3 = NSString;
  if ([(HDCloudSyncCodableStore *)self->_underlyingStore active]) {
    id v4 = @"ACTIVE";
  }
  else {
    id v4 = @"Inactive";
  }
  v70 = [(HDCloudSyncStoreRecord *)self systemBuildVersion];
  v69 = [(HDCloudSyncStoreRecord *)self productType];
  uint64_t v5 = [(HDCloudSyncStoreRecord *)self deviceMode];
  id v55 = v4;
  v56 = v3;
  if (v5 == 1)
  {
    int64_t v6 = @"Basic";
    goto LABEL_8;
  }
  if (v5 == 2)
  {
    int64_t v6 = @"Satellite";
LABEL_8:
    id v64 = v6;
    goto LABEL_10;
  }
  id v64 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v5);
LABEL_10:
  uint64_t v7 = [(HDCloudSyncRecord *)self record];
  v68 = [v7 modificationDate];
  id v67 = [(HDCloudSyncStoreRecord *)self storeIdentifier];
  id v66 = [(HDCloudSyncCodableStore *)self->_underlyingStore ownerIdentifier];
  id v65 = [(HDCloudSyncStoreRecord *)self syncIdentity];
  BOOL v8 = [(HDCloudSyncStoreRecord *)self isChild];
  uint64_t v9 = @"NO";
  if (v8) {
    uint64_t v9 = @"YES";
  }
  id v51 = v9;
  uint64_t v10 = [(HDCloudSyncCodableStore *)self->_underlyingStore pendingOwnerIdentifier];
  id v11 = (void *)v10;
  if (v10) {
    id v12 = (__CFString *)v10;
  }
  else {
    id v12 = @"---";
  }
  v50 = v12;
  uint64_t v13 = [(HDCloudSyncCodableStore *)self->_underlyingStore pendingSyncIdentity];
  v57 = (void *)v13;
  if (v13) {
    id v14 = (__CFString *)v13;
  }
  else {
    id v14 = @"---";
  }
  uint64_t v15 = [(HDCloudSyncStoreRecord *)self supportedProtocolVersion];
  if (!v15)
  {
    id v16 = @"Tigris";
    goto LABEL_22;
  }
  if (v15 == 1)
  {
    id v16 = @"Yukon";
LABEL_22:
    id v63 = v16;
    goto LABEL_24;
  }
  id v63 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v15);
LABEL_24:
  uint64_t v17 = [(HDCloudSyncStoreRecord *)self requiredProtocolVersion];
  v49 = v14;
  if (!v17)
  {
    id v18 = @"Tigris";
    goto LABEL_28;
  }
  if (v17 == 1)
  {
    id v18 = @"Yukon";
LABEL_28:
    id v62 = v18;
    goto LABEL_30;
  }
  id v62 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v17);
LABEL_30:
  v54 = [(HDCloudSyncStoreRecord *)self shardPredicate];
  uint64_t v19 = [v54 description];
  char v20 = @"--";
  uint64_t v53 = (void *)v19;
  if (v19) {
    char v20 = (__CFString *)v19;
  }
  id v47 = v20;
  uint64_t v21 = [(HDCloudSyncStoreRecord *)self currentSequenceHeaderRecord];
  if (v21)
  {
    v46 = [(HDCloudSyncStoreRecord *)self currentSequenceHeaderRecord];
    uint64_t v22 = [v46 slot];
    if ((v22 - 1) >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v22);
      id v61 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v61 = off_1E62FD520[(int)v22 - 1];
    }
  }
  else
  {
    id v61 = &stru_1F1728D60;
  }
  v48 = [(HDCloudSyncStoreRecord *)self oldSequenceHeaderRecord];
  if (v48)
  {
    id v45 = [(HDCloudSyncStoreRecord *)self oldSequenceHeaderRecord];
    uint64_t v23 = [v45 slot];
    if ((v23 - 1) >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v23);
      v60 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v60 = off_1E62FD520[(int)v23 - 1];
    }
  }
  else
  {
    v60 = &stru_1F1728D60;
  }
  unint64_t v24 = [(HDCloudSyncStoreRecord *)self activeSequenceHeaderRecord];
  if (v24)
  {
    v44 = [(HDCloudSyncStoreRecord *)self activeSequenceHeaderRecord];
    uint64_t v25 = [v44 slot];
    if ((v25 - 1) >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v25);
      v59 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v59 = off_1E62FD520[(int)v25 - 1];
    }
  }
  else
  {
    v59 = &stru_1F1728D60;
  }
  v52 = (void *)v21;
  slotASequenceHeaderRecord = self->_slotASequenceHeaderRecord;
  if (slotASequenceHeaderRecord)
  {
    uint64_t v27 = NSString;
    v43 = [(HDCloudSyncSequenceRecord *)self->_slotASequenceHeaderRecord description];
    v42 = objc_msgSend(v43, "hk_stringIndentedBy:prefix:", 2, &stru_1F1728D60);
    v58 = [v27 stringWithFormat:@"\n%@", v42];
  }
  else
  {
    v58 = @"  --";
  }
  slotBSequenceHeaderRecord = self->_slotBSequenceHeaderRecord;
  if (slotBSequenceHeaderRecord)
  {
    uint64_t v29 = NSString;
    id v41 = [(HDCloudSyncSequenceRecord *)self->_slotBSequenceHeaderRecord description];
    v40 = objc_msgSend(v41, "hk_stringIndentedBy:prefix:", 2, &stru_1F1728D60);
    uint64_t v30 = [v29 stringWithFormat:@"\n%@", v40];
  }
  else
  {
    uint64_t v30 = @"  --";
  }
  tombstoneSequenceRecord = self->_tombstoneSequenceRecord;
  if (tombstoneSequenceRecord)
  {
    uint64_t v32 = NSString;
    uint64_t v33 = [(HDCloudSyncSequenceRecord *)tombstoneSequenceRecord description];
    objc_msgSend(v33, "hk_stringIndentedBy:prefix:", 2, &stru_1F1728D60);
    uint64_t v34 = v11;
    v36 = uint64_t v35 = v7;
    id v37 = [v32 stringWithFormat:@"\n%@", v36];
    objc_msgSend(v56, "stringWithFormat:", @"+ %@, %@ on %@, Mode: %@, Modified: %@\n| Store: %@ | Owner: %@ | Sync Identity: %@ | isChild: %@\n| Pending Owner: %@ | Pending Identity: %@\n| Cloud Sync Version: %@ - %@\n| Shard: %@\n| Sequence Headers: Current(%@) Old(%@) Active(%@)\n| Slot A:%@\n| Slot B:%@\n| Tombstones:%@\n+--------------------------------------------------", v55, v70, v69, v64, v68, v67, v66, v65, v51, v50, v49, v63, v62, v47, v61, v60,
      v59,
      v58,
      v30,
    id v38 = v37);

    uint64_t v7 = v35;
    id v11 = v34;
  }
  else
  {
    objc_msgSend(v56, "stringWithFormat:", @"+ %@, %@ on %@, Mode: %@, Modified: %@\n| Store: %@ | Owner: %@ | Sync Identity: %@ | isChild: %@\n| Pending Owner: %@ | Pending Identity: %@\n| Cloud Sync Version: %@ - %@\n| Shard: %@\n| Sequence Headers: Current(%@) Old(%@) Active(%@)\n| Slot A:%@\n| Slot B:%@\n| Tombstones:%@\n+--------------------------------------------------", v55, v70, v69, v64, v68, v67, v66, v65, v51, v50, v49, v63, v62, v47, v61, v60,
      v59,
      v58,
      v30,
    id v38 = @"  --");
  }
  if (slotBSequenceHeaderRecord)
  {
  }
  if (slotASequenceHeaderRecord)
  {
  }
  if (v24)
  {
  }
  if (v48)
  {
  }
  if (v52)
  {
  }

  return v38;
}

- (id)shortDescription
{
  uint64_t v3 = [(HDCloudSyncCodableStore *)self->_underlyingStore syncIdentity];
  v60[0] = 0;
  v58 = +[HDSyncIdentity syncIdentityWithCodable:v3 error:v60];
  id v4 = v60[0];

  uint64_t v5 = [(HDCloudSyncCodableStore *)self->_underlyingStore pendingSyncIdentity];
  id v59 = v4;
  uint64_t v6 = +[HDSyncIdentity syncIdentityWithCodable:v5 error:&v59];
  id v7 = v59;

  BOOL v8 = NSString;
  if ([(HDCloudSyncCodableStore *)self->_underlyingStore active]) {
    uint64_t v9 = @"ACTIVE";
  }
  else {
    uint64_t v9 = @"Inactive";
  }
  uint64_t v10 = [(HDCloudSyncRecord *)self record];
  v57 = [v10 modificationDate];
  v56 = [(HDCloudSyncStoreRecord *)self systemBuildVersion];
  id v55 = [(HDCloudSyncStoreRecord *)self productType];
  uint64_t v11 = [(HDCloudSyncStoreRecord *)self deviceMode];
  if (v11 == 1)
  {
    id v12 = @"Basic";
    goto LABEL_8;
  }
  if (v11 == 2)
  {
    id v12 = @"Satellite";
LABEL_8:
    v52 = v12;
    goto LABEL_10;
  }
  v52 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v11);
LABEL_10:
  uint64_t v13 = [(HDCloudSyncStoreRecord *)self supportedProtocolVersion];
  if (!v13)
  {
    id v14 = @"Tigris";
    goto LABEL_14;
  }
  if (v13 == 1)
  {
    id v14 = @"Yukon";
LABEL_14:
    id v51 = v14;
    goto LABEL_16;
  }
  id v51 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v13);
LABEL_16:
  uint64_t v15 = [(HDCloudSyncStoreRecord *)self requiredProtocolVersion];
  v49 = v7;
  id v47 = v10;
  id v45 = v9;
  v46 = v8;
  if (!v15)
  {
    id v16 = @"Tigris";
    goto LABEL_20;
  }
  if (v15 == 1)
  {
    id v16 = @"Yukon";
LABEL_20:
    v50 = v16;
    goto LABEL_22;
  }
  v50 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v15);
LABEL_22:
  v54 = [(HDCloudSyncStoreRecord *)self storeIdentifier];
  uint64_t v53 = [(HDCloudSyncCodableStore *)self->_underlyingStore ownerIdentifier];
  uint64_t v17 = [(HDCloudSyncCodableStore *)self->_underlyingStore pendingOwnerIdentifier];
  id v18 = (void *)v17;
  if (v17) {
    uint64_t v19 = (__CFString *)v17;
  }
  else {
    uint64_t v19 = @"---";
  }
  v43 = v19;
  BOOL v20 = [(HDCloudSyncCodableStore *)self->_underlyingStore isChild];
  uint64_t v21 = @"NO";
  if (v20) {
    uint64_t v21 = @"YES";
  }
  v42 = v21;
  v48 = (void *)v6;
  if (v6) {
    uint64_t v22 = (__CFString *)v6;
  }
  else {
    uint64_t v22 = @"---";
  }
  id v41 = v22;
  v44 = [(HDCloudSyncStoreRecord *)self shardPredicate];
  uint64_t v23 = [v44 description];
  unint64_t v24 = (void *)v23;
  uint64_t v25 = @"--";
  if (v23) {
    uint64_t v25 = (__CFString *)v23;
  }
  v40 = v25;
  objc_super v26 = [(HDCloudSyncStoreRecord *)self currentSequenceHeaderRecord];
  if (v26)
  {
    uint64_t v39 = [(HDCloudSyncStoreRecord *)self currentSequenceHeaderRecord];
    uint64_t v27 = [v39 slot];
    if ((v27 - 1) >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v27);
      v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v28 = off_1E62FD520[(int)v27 - 1];
    }
  }
  else
  {
    v28 = &stru_1F1728D60;
  }
  uint64_t v29 = [(HDCloudSyncStoreRecord *)self oldSequenceHeaderRecord];
  if (v29)
  {
    id v38 = [(HDCloudSyncStoreRecord *)self oldSequenceHeaderRecord];
    uint64_t v30 = [v38 slot];
    if ((v30 - 1) >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v30);
      uint64_t v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v31 = off_1E62FD520[(int)v30 - 1];
    }
  }
  else
  {
    uint64_t v31 = &stru_1F1728D60;
  }
  uint64_t v32 = [(HDCloudSyncStoreRecord *)self activeSequenceHeaderRecord];
  if (v32)
  {
    uint64_t v33 = [(HDCloudSyncStoreRecord *)self activeSequenceHeaderRecord];
    uint64_t v34 = [v33 slot];
    if ((v34 - 1) >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v34);
      uint64_t v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v35 = off_1E62FD520[(int)v34 - 1];
    }
    objc_msgSend(v46, "stringWithFormat:", @"+ (%@, %@) %@ on %@, Mode: %@, Version: %@ - %@\n| Store: %@ | Owner: %@ | Pending: %@\n| isChild: %@ | SyncIdentity: %@ | PendingSyncIdentity: %@\n| Shard: %@\n| Sequence Headers: Current(%@) Old(%@) Active(%@)\n+--------------------------------------------------", v45, v57, v56, v55, v52, v51, v50, v54, v53, v43, v42, v58, v41, v40, v28, v31,
    uint64_t v36 = v35);
  }
  else
  {
    objc_msgSend(v46, "stringWithFormat:", @"+ (%@, %@) %@ on %@, Mode: %@, Version: %@ - %@\n| Store: %@ | Owner: %@ | Pending: %@\n| isChild: %@ | SyncIdentity: %@ | PendingSyncIdentity: %@\n| Shard: %@\n| Sequence Headers: Current(%@) Old(%@) Active(%@)\n+--------------------------------------------------", v45, v57, v56, v55, v52, v51, v50, v54, v53, v43, v42, v58, v41, v40, v28, v31,
    uint64_t v36 = &stru_1F1728D60);
  }

  if (v29)
  {
  }
  if (v26)
  {
  }

  return v36;
}

- (HDCloudSyncSequenceRecord)tombstoneSequenceRecord
{
  return self->_tombstoneSequenceRecord;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tombstoneSequenceRecord, 0);
  objc_storeStrong((id *)&self->_slotBSequenceHeaderRecord, 0);
  objc_storeStrong((id *)&self->_slotASequenceHeaderRecord, 0);

  objc_storeStrong((id *)&self->_underlyingStore, 0);
}

@end