@interface HDCloudSyncSequenceRecord
+ (BOOL)hasFutureSchema:(id)a3;
+ (BOOL)isSequenceRecord:(id)a3;
+ (BOOL)requiresUnderlyingMessage;
+ (HDCloudSyncSequenceRecord)recordWithCKRecord:(id)a3 error:(id *)a4;
+ (id)_recordIDWithIndividualZoneID:(int)a3 sequenceSlot:;
+ (id)_recordIDWithOwnerIdentifier:(void *)a3 storeIdentifier:(void *)a4 zoneID:(int)a5 sequenceSlot:;
+ (id)fieldsForUnprotectedSerialization;
+ (id)recordIDsForOwnerIdentifier:(id)a3 storeIdentifier:(id)a4 zoneID:(id)a5;
+ (id)recordIDsWithIndividualZoneID:(id)a3;
+ (id)recordType;
+ (void)_recordNameForSequenceSlot:(uint64_t)a1;
- (BOOL)isActive;
- (BOOL)isEqual:(id)a3;
- (CKRecordID)firstUnfrozenChangeRecord;
- (HDCloudSyncSequenceRecord)initWithCKRecord:(id)a3 schemaVersion:(int64_t)a4;
- (HDSyncAnchorMap)frozenSyncAnchorMap;
- (HDSyncAnchorMap)syncAnchorMap;
- (NSSet)includedChildSyncIdentities;
- (NSSet)includedIdentifiers;
- (NSSet)includedSyncIdentities;
- (NSUUID)storeIdentifier;
- (id)initForSequenceSlot:(int)a3 syncAnchorMap:(id)a4 changeIndex:(unint64_t)a5 baselineEpoch:(int64_t)a6 includedIdentifiers:(id)a7 includedSyncIdentities:(id)a8 includedChildSyncIdentities:(id)a9 storeRecord:(id)a10;
- (id)initWithCKRecord:(uint64_t)a3 schemaVersion:(void *)a4 underlyingSequence:;
- (id)printDescription;
- (id)serializeUnderlyingMessage;
- (int)protocolVersion;
- (int)slot;
- (int64_t)baselineEpoch;
- (int64_t)changeIndex;
- (int64_t)childRecordCount;
- (unint64_t)hash;
- (void)_unitTest_setChildRecordCount:(unint64_t)a3;
- (void)decrementChildRecordCount:(unint64_t)a3;
- (void)incrementChangeIndex;
- (void)incrementChildRecordCount;
- (void)replaceSyncAnchorMapWithSyncAnchorMap:(id)a3;
- (void)resetChangeIndex:(unint64_t)a3;
- (void)setActive:(BOOL)a3;
- (void)setFirstUnfrozenChangeRecord:(id)a3;
- (void)setIncludedChildSyncIdentities:(id)a3;
- (void)setProtocolVersion:(int)a3;
- (void)updateFrozenSyncAnchorMapWithSyncAnchorMap:(id)a3;
- (void)updateSyncAnchorMapWithSyncAnchorMap:(id)a3;
@end

@implementation HDCloudSyncSequenceRecord

+ (id)_recordIDWithOwnerIdentifier:(void *)a3 storeIdentifier:(void *)a4 zoneID:(int)a5 sequenceSlot:
{
  id v8 = a4;
  id v9 = a3;
  id v10 = a2;
  uint64_t v11 = self;
  v12 = NSString;
  v13 = [v9 UUIDString];

  v14 = +[HDCloudSyncSequenceRecord _recordNameForSequenceSlot:](v11, a5);
  v15 = [v12 stringWithFormat:@"%@/%@/%@", v10, v13, v14];

  v16 = (void *)[objc_alloc(MEMORY[0x1E4F1A2F8]) initWithRecordName:v15 zoneID:v8];

  return v16;
}

+ (id)_recordIDWithIndividualZoneID:(int)a3 sequenceSlot:
{
  id v4 = a2;
  uint64_t v5 = self;
  v6 = +[HDCloudSyncSequenceRecord _recordNameForSequenceSlot:](v5, a3);
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F1A2F8]) initWithRecordName:v6 zoneID:v4];

  return v7;
}

- (HDCloudSyncSequenceRecord)initWithCKRecord:(id)a3 schemaVersion:(int64_t)a4
{
  uint64_t v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3C8];
  v7 = NSStringFromSelector(a2);
  [v5 raise:v6, @"The -%@ method is not available on %@", v7, objc_opt_class() format];

  return 0;
}

- (id)initForSequenceSlot:(int)a3 syncAnchorMap:(id)a4 changeIndex:(unint64_t)a5 baselineEpoch:(int64_t)a6 includedIdentifiers:(id)a7 includedSyncIdentities:(id)a8 includedChildSyncIdentities:(id)a9 storeRecord:(id)a10
{
  uint64_t v13 = *(void *)&a3;
  id v14 = a10;
  id v59 = a9;
  id v15 = a8;
  id v16 = a7;
  id v17 = a4;
  id v18 = v14;
  self;
  v19 = [v18 recordID];
  v20 = [v19 zoneID];

  uint64_t v64 = 0;
  if (objc_msgSend(v20, "hd_isUnifiedSyncZoneIDForSyncCircleIdentifier:", &v64))
  {
    v21 = [v18 ownerIdentifier];
    v22 = [v18 storeIdentifier];
    uint64_t v23 = v13;
    uint64_t v24 = +[HDCloudSyncSequenceRecord _recordIDWithOwnerIdentifier:storeIdentifier:zoneID:sequenceSlot:]((uint64_t)HDCloudSyncSequenceRecord, v21, v22, v20, v13);
  }
  else
  {
    v21 = [v18 record];
    v22 = [v21 recordID];
    v25 = [v22 zoneID];
    uint64_t v26 = v13;
    v27 = v25;
    uint64_t v23 = v26;
    uint64_t v24 = +[HDCloudSyncSequenceRecord _recordIDWithIndividualZoneID:sequenceSlot:]((uint64_t)HDCloudSyncSequenceRecord, v25, v26);
  }
  v28 = (void *)[objc_alloc(MEMORY[0x1E4F1A2D8]) initWithRecordType:@"CloudSyncSequenceRecord" recordID:v24];
  v29 = [v18 record];

  v30 = [v29 recordID];
  id v31 = v17;
  id v32 = v16;
  id v33 = v15;
  id v34 = v59;
  id v35 = v30;
  id v36 = v28;
  v62 = (void *)v24;
  if (!self)
  {
    v51 = 0;
    goto LABEL_12;
  }
  uint64_t v37 = v23;
  if (!v32)
  {
    v53 = [MEMORY[0x1E4F28B00] currentHandler];
    [v53 handleFailureInMethod:sel_initForSequenceSlot_syncAnchorMap_active_changeIndex_childRecordCount_baselineEpoch_includedIdentifiers_includedSyncIdentities_includedChildSyncIdentities_protocolVersion_storeRecordID_record_schemaVersion_, self, @"HDCloudSyncSequenceRecord.m", 142, @"Invalid parameter not satisfying: %@", @"includedIdentifiers" object file lineNumber description];

    uint64_t v37 = v23;
    if (v35) {
      goto LABEL_7;
    }
LABEL_14:
    [MEMORY[0x1E4F28B00] currentHandler];
    v54 = unsigned int v61 = v37;
    [v54 handleFailureInMethod:sel_initForSequenceSlot_syncAnchorMap_active_changeIndex_childRecordCount_baselineEpoch_includedIdentifiers_includedSyncIdentities_includedChildSyncIdentities_protocolVersion_storeRecordID_record_schemaVersion_, self, @"HDCloudSyncSequenceRecord.m", 143, @"Invalid parameter not satisfying: %@", @"storeRecordID" object file lineNumber description];

    uint64_t v37 = v61;
    goto LABEL_7;
  }
  if (!v35) {
    goto LABEL_14;
  }
LABEL_7:
  v60 = v29;
  if (!v36)
  {
    [MEMORY[0x1E4F28B00] currentHandler];
    v56 = uint64_t v55 = v37;
    [v56 handleFailureInMethod:sel_initForSequenceSlot_syncAnchorMap_active_changeIndex_childRecordCount_baselineEpoch_includedIdentifiers_includedSyncIdentities_includedChildSyncIdentities_protocolVersion_storeRecordID_record_schemaVersion_, self, @"HDCloudSyncSequenceRecord.m", 144, @"Invalid parameter not satisfying: %@", @"record" object file lineNumber description];

    uint64_t v37 = v55;
  }
  v38 = objc_alloc_init(HDCloudSyncCodableSequence);
  [(HDCloudSyncCodableSequence *)v38 setSlot:v37];
  [(HDCloudSyncCodableSequence *)v38 setActive:0];
  [(HDCloudSyncCodableSequence *)v38 setChangeIndex:a5];
  [(HDCloudSyncCodableSequence *)v38 setChildRecordCount:0];
  [(HDCloudSyncCodableSequence *)v38 setEpoch:a6];
  [(HDCloudSyncCodableSequence *)v38 setProtocolVersion:16];
  v39 = [v31 codableSyncAnchorRangeMap];
  [(HDCloudSyncCodableSequence *)v38 setAnchorMap:v39];

  v40 = [v32 allObjects];
  v41 = objc_msgSend(v40, "hk_map:", &__block_literal_global_66);
  v42 = (void *)[v41 mutableCopy];
  [(HDCloudSyncCodableSequence *)v38 setIncludedStoreIdentifiers:v42];

  v43 = [v33 allObjects];
  v44 = objc_msgSend(v43, "hk_map:", &__block_literal_global_347);
  v45 = (void *)[v44 mutableCopy];
  [(HDCloudSyncCodableSequence *)v38 setIncludedSyncIdentities:v45];

  v46 = [v34 allObjects];
  v47 = objc_msgSend(v46, "hk_map:", &__block_literal_global_349);
  v48 = (void *)[v47 mutableCopy];
  [(HDCloudSyncCodableSequence *)v38 setIncludedChildSyncIdentities:v48];

  v49 = -[HDCloudSyncSequenceRecord initWithCKRecord:schemaVersion:underlyingSequence:](self, v36, 1, v38);
  if (v49)
  {
    v50 = (void *)[objc_alloc(MEMORY[0x1E4F1A348]) initWithRecordID:v35 action:1];
    [v36 setObject:v50 forKeyedSubscript:@"StoreRecord"];
  }
  v51 = v49;

  v29 = v60;
LABEL_12:

  return v51;
}

uint64_t __235__HDCloudSyncSequenceRecord_initForSequenceSlot_syncAnchorMap_active_changeIndex_childRecordCount_baselineEpoch_includedIdentifiers_includedSyncIdentities_includedChildSyncIdentities_protocolVersion_storeRecordID_record_schemaVersion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hk_dataForUUIDBytes");
}

uint64_t __235__HDCloudSyncSequenceRecord_initForSequenceSlot_syncAnchorMap_active_changeIndex_childRecordCount_baselineEpoch_includedIdentifiers_includedSyncIdentities_includedChildSyncIdentities_protocolVersion_storeRecordID_record_schemaVersion___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 codableSyncIdentity];
}

uint64_t __235__HDCloudSyncSequenceRecord_initForSequenceSlot_syncAnchorMap_active_changeIndex_childRecordCount_baselineEpoch_includedIdentifiers_includedSyncIdentities_includedChildSyncIdentities_protocolVersion_storeRecordID_record_schemaVersion___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 codableSyncIdentity];
}

- (id)initWithCKRecord:(uint64_t)a3 schemaVersion:(void *)a4 underlyingSequence:
{
  v73[7] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  if (!a1)
  {
    id v10 = 0;
    goto LABEL_24;
  }
  v67.receiver = a1;
  v67.super_class = (Class)HDCloudSyncSequenceRecord;
  id v9 = (id *)objc_msgSendSuper2(&v67, sel_initWithCKRecord_schemaVersion_, v7, a3);
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong(v9 + 3, a4);
    uint64_t v11 = [v7 recordID];
    v12 = [v11 zoneID];
    id v66 = 0;
    int v13 = objc_msgSend(v12, "hd_isUnifiedSyncZoneIDForSyncCircleIdentifier:", &v66);
    id v14 = v66;

    id v15 = [v7 recordID];
    id v16 = v15;
    if (v13)
    {
      id v17 = [v15 recordName];
      id v18 = [v17 componentsSeparatedByString:@"/"];

      if ([v18 count] != 3)
      {
        v54 = v10;
        id v10 = 0;
LABEL_23:

        goto LABEL_24;
      }
      id v19 = objc_alloc(MEMORY[0x1E4F29128]);
      v20 = [v18 objectAtIndexedSubscript:1];
      uint64_t v21 = [v19 initWithUUIDString:v20];
      id v22 = v10[4];
      v10[4] = (id)v21;

      id v23 = 0;
      id v56 = v14;
    }
    else
    {
      uint64_t v24 = [v15 zoneID];
      id v64 = v14;
      id v65 = 0;
      int v25 = objc_msgSend(v24, "hd_isIndividualSyncZoneIDForStoreIdentifier:syncCircleIdentifier:", &v65, &v64);
      id v23 = v65;
      id v56 = v64;

      if (!v25)
      {
LABEL_9:
        id v60 = v8;
        id v61 = v23;
        id v62 = v7;
        v27 = objc_msgSend(v10[3], "includedStoreIdentifiers", v56);

        if (!v27)
        {
          id v28 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          [v10[3] setIncludedStoreIdentifiers:v28];
        }
        v72[0] = @"Slot";
        v58 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v10[3], "slot"));
        v73[0] = v58;
        v72[1] = @"Active";
        v29 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v10[3], "active"));
        v73[1] = v29;
        v72[2] = @"ChangeIndex";
        v30 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v10[3], "changeIndex"));
        v73[2] = v30;
        v72[3] = @"ChildRecordCount";
        id v31 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v10[3], "childRecordCount"));
        v73[3] = v31;
        v72[4] = @"BaselineEpoch";
        id v32 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v10[3], "epoch"));
        v73[4] = v32;
        v72[5] = @"ProtocolVersion";
        id v33 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v10[3], "protocolVersion"));
        v73[5] = v33;
        v72[6] = @"IncludedIdentifiers";
        id v34 = [v10[3] includedStoreIdentifiers];
        id v35 = (void *)[v34 copy];
        v73[6] = v35;
        id v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v73 forKeys:v72 count:7];
        int v59 = objc_msgSend(v7, "hd_setValuesIfChanged:", v36);

        uint64_t v37 = [v7 encryptedValues];
        id v18 = [v37 objectForKeyedSubscript:@"EntityAnchorMap"];

        if (v18)
        {
          uint64_t v63 = 0;
          v38 = objc_msgSend(MEMORY[0x1E4F28DC0], "hk_unarchivedObjectOfClass:forKey:data:error:", objc_opt_class(), @"EntityAnchorMap", v18, &v63);
        }
        else
        {
          v38 = 0;
        }
        id v8 = v60;
        v39 = [v10[3] anchorMap];
        v40 = +[HDSyncAnchorMap syncAnchorMapWithCodableSyncAnchorRangeMap:v39];
        char v41 = [v38 isEqual:v40];

        int v42 = v59;
        if ((v41 & 1) == 0)
        {
          v43 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
          v44 = [v10 syncAnchorMap];
          [v43 encodeObject:v44 forKey:@"EntityAnchorMap"];

          v45 = [v43 encodedData];
          int v42 = objc_msgSend(v7, "hd_setEncryptedValue:ifChangedForKey:", v45, @"EntityAnchorMap") | v59;
        }
        id v14 = v61;
        if (([v10 unsaved] & 1) == 0 && v42)
        {
          _HKInitializeLogging();
          v46 = (void *)*MEMORY[0x1E4F29FA8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
          {
            v47 = v46;
            v48 = [v10 recordID];
            v49 = [v7 changedKeys];
            v50 = [v7 encryptedValueStore];
            v51 = [v50 changedKeys];
            v52 = [v49 arrayByAddingObjectsFromArray:v51];
            v53 = [v52 componentsJoinedByString:@", "];
            *(_DWORD *)buf = 138543618;
            v69 = v48;
            __int16 v70 = 2114;
            v71 = v53;
            _os_log_impl(&dword_1BCB7D000, v47, OS_LOG_TYPE_DEFAULT, "%{public}@: Repaired during init (updated keys: %{public}@)", buf, 0x16u);

            id v14 = v61;
            id v8 = v60;

            id v7 = v62;
          }
          [v10 setRepaired:1];
        }

        v54 = v57;
        goto LABEL_23;
      }
      uint64_t v26 = [v23 copy];
      id v18 = v10[4];
      v10[4] = (id)v26;
    }

    goto LABEL_9;
  }
LABEL_24:

  return v10;
}

+ (void)_recordNameForSequenceSlot:(uint64_t)a1
{
  uint64_t v3 = self;
  if ((a2 - 1) >= 3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", sel__recordNameForSequenceSlot_, v4, @"HDCloudSyncSequenceRecord.m", 244, @"Invalid sequence record slot identifier %ld", a2);
  }
}

+ (id)recordIDsWithIndividualZoneID:(id)a3
{
  v10[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = +[HDCloudSyncSequenceRecord _recordIDWithIndividualZoneID:sequenceSlot:]((uint64_t)a1, v4, 1);
  v10[0] = v5;
  uint64_t v6 = +[HDCloudSyncSequenceRecord _recordIDWithIndividualZoneID:sequenceSlot:]((uint64_t)a1, v4, 2);
  v10[1] = v6;
  id v7 = +[HDCloudSyncSequenceRecord _recordIDWithIndividualZoneID:sequenceSlot:]((uint64_t)a1, v4, 3);

  v10[2] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:3];

  return v8;
}

+ (id)recordIDsForOwnerIdentifier:(id)a3 storeIdentifier:(id)a4 zoneID:(id)a5
{
  v16[3] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = +[HDCloudSyncSequenceRecord _recordIDWithOwnerIdentifier:storeIdentifier:zoneID:sequenceSlot:]((uint64_t)a1, v10, v9, v8, 1);
  v16[0] = v11;
  v12 = +[HDCloudSyncSequenceRecord _recordIDWithOwnerIdentifier:storeIdentifier:zoneID:sequenceSlot:]((uint64_t)a1, v10, v9, v8, 2);
  v16[1] = v12;
  int v13 = +[HDCloudSyncSequenceRecord _recordIDWithOwnerIdentifier:storeIdentifier:zoneID:sequenceSlot:]((uint64_t)a1, v10, v9, v8, 3);

  v16[2] = v13;
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:3];

  return v14;
}

+ (BOOL)isSequenceRecord:(id)a3
{
  uint64_t v3 = [a3 recordType];
  char v4 = [v3 isEqualToString:@"CloudSyncSequenceRecord"];

  return v4;
}

+ (BOOL)requiresUnderlyingMessage
{
  return 0;
}

+ (id)recordType
{
  return @"CloudSyncSequenceRecord";
}

+ (BOOL)hasFutureSchema:(id)a3
{
  uint64_t v3 = [a3 objectForKeyedSubscript:@"Version"];
  char v4 = v3;
  BOOL v5 = v3 && [v3 integerValue] > 1;

  return v5;
}

+ (HDCloudSyncSequenceRecord)recordWithCKRecord:(id)a3 error:(id *)a4
{
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = [v7 recordType];
  char v9 = [v8 isEqualToString:@"CloudSyncSequenceRecord"];

  if (v9)
  {
    id v10 = objc_msgSend(v7, "hd_requiredValueForKey:type:error:", @"Version", objc_opt_class(), a4);
    if (!v10)
    {
      id v16 = 0;
LABEL_100:

      goto LABEL_101;
    }
    uint64_t v11 = objc_msgSend(v7, "hd_requiredValueForKey:type:error:", @"StoreRecord", objc_opt_class(), a4);
    v12 = v11;
    if (v11)
    {
      if ([v11 referenceAction] == 1)
      {
        id v89 = 0;
        int v13 = objc_msgSend(v7, "hd_optionalEncryptedValueForKey:type:error:", @"UnderlyingMessage", objc_opt_class(), &v89);
        id v14 = v89;
        id v15 = v14;
        if (!v13 && v14)
        {
          if (a4)
          {
            id v16 = 0;
            *a4 = v14;
          }
          else
          {
            _HKLogDroppedError();
            id v16 = 0;
          }
          goto LABEL_98;
        }
        if (v13)
        {
          id v22 = [[HDCloudSyncCodableSequence alloc] initWithData:v13];
          if (v22)
          {
            id v16 = -[HDCloudSyncSequenceRecord initWithCKRecord:schemaVersion:underlyingSequence:]([HDCloudSyncSequenceRecord alloc], v7, [v10 integerValue], v22);
LABEL_97:

LABEL_98:
            goto LABEL_99;
          }
          objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 3, @"Underlying message present but does not decode.");
LABEL_55:
          id v16 = 0;
          goto LABEL_97;
        }
        objc_msgSend(v7, "hd_requiredValueForKey:type:error:", @"Slot", objc_opt_class(), a4);
        id v23 = (HDCloudSyncCodableSequence *)objc_claimAutoreleasedReturnValue();
        id v22 = v23;
        if (!v23) {
          goto LABEL_55;
        }
        if ([(HDCloudSyncCodableSequence *)v23 integerValue] == 1
          || [(HDCloudSyncCodableSequence *)v22 integerValue] == 2
          || [(HDCloudSyncCodableSequence *)v22 integerValue] == 3)
        {
          v82 = v15;
          id v80 = [v7 recordID];
          uint64_t v24 = [v80 recordName];
          int v25 = v22;
          uint64_t v26 = (void *)v24;
          v83 = v25;
          v27 = +[HDCloudSyncSequenceRecord _recordNameForSequenceSlot:]((uint64_t)a1, [(HDCloudSyncCodableSequence *)v25 integerValue]);
          char v28 = [v26 hasSuffix:v27];

          if ((v28 & 1) == 0)
          {
            v58 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v59 = objc_opt_class();
            uint64_t v60 = [(HDCloudSyncCodableSequence *)v83 integerValue];
            id v61 = [v7 recordID];
            id v81 = [v61 recordName];
            objc_msgSend(v58, "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", v59, a2, @"sequence slot (%ld) does not match the record name (%@)"", v60, v81);
            id v62 = (id)objc_claimAutoreleasedReturnValue();
            int v13 = 0;
            id v15 = v82;
            if (v62)
            {
              if (a4) {
                *a4 = v62;
              }
              else {
                _HKLogDroppedError();
              }
            }

            id v16 = 0;
            id v22 = v83;
            goto LABEL_94;
          }
          objc_msgSend(v7, "hd_requiredValueForKey:type:error:", @"Active", objc_opt_class(), a4);
          v79 = id v15 = v82;
          if (v79)
          {
            objc_msgSend(v7, "hd_requiredValueForKey:type:error:", @"ChangeIndex", objc_opt_class(), a4);
            id v29 = (id)objc_claimAutoreleasedReturnValue();
            id v22 = v83;
            if (!v29)
            {
              id v16 = 0;
              id v61 = v79;
              int v13 = 0;
              goto LABEL_95;
            }
            id v81 = v29;
            v30 = objc_msgSend(v7, "hd_requiredValueForKey:type:error:", @"BaselineEpoch", objc_opt_class(), a4);
            if (!v30)
            {
              id v16 = 0;
              id v61 = v79;
              int v13 = 0;
              goto LABEL_93;
            }
            id v74 = v30;
            id v31 = objc_msgSend(v7, "hd_requiredValueForKey:type:error:", @"ChildRecordCount", objc_opt_class(), a4);
            if (!v31)
            {
              id v16 = 0;
              id v61 = v79;
              int v13 = 0;
              goto LABEL_92;
            }
            id v73 = v31;
            id v32 = objc_msgSend(v7, "hd_requiredValueForKey:type:error:", @"ProtocolVersion", objc_opt_class(), a4);
            if (!v32)
            {
              id v16 = 0;
              id v61 = v79;
              int v13 = 0;
              goto LABEL_91;
            }
            id v72 = v32;
            id v33 = objc_msgSend(v7, "hd_requiredValueForKey:type:error:", @"IncludedIdentifiers", objc_opt_class(), a4);
            if (!v33)
            {
              id v16 = 0;
              id v61 = v79;
              int v13 = 0;
              goto LABEL_90;
            }
            id v34 = v33;
            v78 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v33, "count"));
            long long v85 = 0u;
            long long v86 = 0u;
            long long v87 = 0u;
            long long v88 = 0u;
            id v71 = v34;
            id obj = v34;
            uint64_t v35 = [obj countByEnumeratingWithState:&v85 objects:v93 count:16];
            if (!v35) {
              goto LABEL_45;
            }
            uint64_t v36 = v35;
            uint64_t v76 = *(void *)v86;
LABEL_38:
            uint64_t v37 = 0;
            while (1)
            {
              if (*(void *)v86 != v76) {
                objc_enumerationMutation(obj);
              }
              objc_opt_class();
              uint64_t v38 = HKSafeObject();
              if (!v38) {
                goto LABEL_73;
              }
              v39 = (void *)v38;
              uint64_t v40 = objc_msgSend(MEMORY[0x1E4F29128], "hk_UUIDWithData:", v38);
              if (!v40) {
                break;
              }
              char v41 = (void *)v40;
              [v78 addObject:v40];

              if (v36 == ++v37)
              {
                uint64_t v36 = [obj countByEnumeratingWithState:&v85 objects:v93 count:16];
                if (v36) {
                  goto LABEL_38;
                }
LABEL_45:

                objc_msgSend(v7, "hd_requiredEncryptedValueForKey:type:error:", @"EntityAnchorMap", objc_opt_class(), a4);
                id obj = (id)objc_claimAutoreleasedReturnValue();
                if (obj)
                {
                  v77 = objc_msgSend(MEMORY[0x1E4F28DC0], "hk_unarchivedObjectOfClass:forKey:data:error:", objc_opt_class(), @"EntityAnchorMap", obj, a4);
                  if (!v77) {
                    goto LABEL_77;
                  }
                  int v42 = [v7 encryptedValues];
                  v43 = [v42 objectForKeyedSubscript:@"FrozenAnchorMap"];

                  if (v43)
                  {
                    v44 = objc_msgSend(v7, "hd_requiredEncryptedValueForKey:type:error:", @"FrozenAnchorMap", objc_opt_class(), a4);
                    v45 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v44 error:a4];

                    if (!v45) {
                      goto LABEL_77;
                    }
                  }
                  v46 = [v7 objectForKeyedSubscript:@"FirstUnfrozenChange"];

                  if (!v46
                    || (objc_msgSend(v7, "hd_requiredValueForKey:type:error:", @"FirstUnfrozenChange", objc_opt_class(), a4), v47 = objc_claimAutoreleasedReturnValue(), v47, v47))
                  {
                    v48 = objc_alloc_init(HDCloudSyncCodableSequence);
                    [(HDCloudSyncCodableSequence *)v48 setSlot:[(HDCloudSyncCodableSequence *)v83 integerValue]];
                    -[HDCloudSyncCodableSequence setActive:](v48, "setActive:", [v79 BOOLValue]);
                    -[HDCloudSyncCodableSequence setChangeIndex:](v48, "setChangeIndex:", [v81 longLongValue]);
                    -[HDCloudSyncCodableSequence setChildRecordCount:](v48, "setChildRecordCount:", [v73 longLongValue]);
                    -[HDCloudSyncCodableSequence setEpoch:](v48, "setEpoch:", [v74 longLongValue]);
                    -[HDCloudSyncCodableSequence setProtocolVersion:](v48, "setProtocolVersion:", [v72 integerValue]);
                    v49 = [v77 codableSyncAnchorRangeMap];
                    [(HDCloudSyncCodableSequence *)v48 setAnchorMap:v49];

                    v50 = [v78 allObjects];
                    v51 = objc_msgSend(v50, "hk_map:", &__block_literal_global_402);
                    v52 = (void *)[v51 mutableCopy];
                    [(HDCloudSyncCodableSequence *)v48 setIncludedStoreIdentifiers:v52];

                    v53 = [v7 encryptedValues];
                    v54 = [v53 objectForKeyedSubscript:@"FrozenAnchorMap"];

                    if (v54)
                    {
                      id v84 = 0;
                      uint64_t v55 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v54 error:&v84];
                      id v56 = v84;
                      if (v55)
                      {
                        v57 = [v55 codableSyncAnchorRangeMap];
                        [(HDCloudSyncCodableSequence *)v48 setFrozenAnchorMap:v57];
                      }
                      else
                      {
                        _HKInitializeLogging();
                        uint64_t v63 = *MEMORY[0x1E4F29FA8];
                        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
                        {
                          *(_DWORD *)buf = 138543362;
                          id v92 = v56;
                          _os_log_error_impl(&dword_1BCB7D000, v63, OS_LOG_TYPE_ERROR, "Failed to decode frozen anchor map: %{public}@", buf, 0xCu);
                        }
                      }
                    }
                    id v64 = [v7 objectForKeyedSubscript:@"FirstUnfrozenChange"];
                    objc_opt_class();
                    __int16 v70 = v64;
                    if (objc_opt_isKindOfClass())
                    {
                      id v65 = [v64 recordID];
                      id v66 = [v65 recordName];
                      v90 = v66;
                      objc_super v67 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v90 count:1];
                      v68 = (void *)[v67 mutableCopy];
                      [(HDCloudSyncCodableSequence *)v48 setUnfrozenChangeRecordNames:v68];
                    }
                    id v16 = -[HDCloudSyncSequenceRecord initWithCKRecord:schemaVersion:underlyingSequence:]([HDCloudSyncSequenceRecord alloc], v7, [v10 integerValue], v48);

LABEL_87:
                  }
                  else
                  {
LABEL_77:
                    id v16 = 0;
                  }
                  id v61 = v79;
                  int v13 = 0;
                  id v15 = v82;
                  id v22 = v83;
                }
                else
                {
LABEL_73:
                  id v16 = 0;
                  id v61 = v79;
                  int v13 = 0;
                  id v15 = v82;
                  id v22 = v83;
                }

                id v33 = v71;
LABEL_90:

                id v32 = v72;
LABEL_91:

                id v31 = v73;
LABEL_92:

                v30 = v74;
LABEL_93:

LABEL_94:
                id v29 = v81;
                goto LABEL_95;
              }
            }
            v77 = v39;
            objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), a2, @"record has invalid owner UUID data '%@'"", v39);
            v54 = (HDCloudSyncCodableSequence *)(id)objc_claimAutoreleasedReturnValue();
            if (v54)
            {
              if (a4)
              {
                id v16 = 0;
                *a4 = v54;
LABEL_80:
                v48 = v54;
                goto LABEL_87;
              }
              _HKLogDroppedError();
            }
            id v16 = 0;
            goto LABEL_80;
          }
          id v61 = 0;
          id v16 = 0;
          int v13 = 0;
          id v22 = v83;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), a2, @"record identity (%ld) is not a valid HDCloudSyncSequenceRecordIdentity value", -[HDCloudSyncCodableSequence integerValue](v22, "integerValue""));
          id v29 = (id)objc_claimAutoreleasedReturnValue();
          if (v29)
          {
            if (a4)
            {
              id v29 = v29;
              id v16 = 0;
              *a4 = v29;
              id v61 = v29;
              goto LABEL_95;
            }
            id v61 = v29;
            _HKLogDroppedError();
            id v29 = v61;
          }
          else
          {
            id v61 = 0;
          }
          id v16 = 0;
LABEL_95:
        }
        goto LABEL_97;
      }
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), a2, @"record reference to parent does not have correct reference action"");
      id v21 = (id)objc_claimAutoreleasedReturnValue();
      if (v21)
      {
        if (a4) {
          *a4 = v21;
        }
        else {
          _HKLogDroppedError();
        }
      }
    }
    id v16 = 0;
LABEL_99:

    goto LABEL_100;
  }
  id v17 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v18 = objc_opt_class();
  id v19 = [v7 recordType];
  objc_msgSend(v17, "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", v18, a2, @"record has type (%@), but expected (%@)", v19, @"CloudSyncSequenceRecord"");
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    if (a4) {
      *a4 = v20;
    }
    else {
      _HKLogDroppedError();
    }
  }

  id v16 = 0;
LABEL_101:

  return (HDCloudSyncSequenceRecord *)v16;
}

uint64_t __54__HDCloudSyncSequenceRecord_recordWithCKRecord_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hk_dataForUUIDBytes");
}

- (id)serializeUnderlyingMessage
{
  return (id)[(HDCloudSyncCodableSequence *)self->_underlyingSequence data];
}

+ (id)fieldsForUnprotectedSerialization
{
  v40[11] = *MEMORY[0x1E4F143B8];
  v28.receiver = a1;
  v28.super_class = (Class)&OBJC_METACLASS___HDCloudSyncSequenceRecord;
  id v23 = objc_msgSendSuper2(&v28, sel_fieldsForUnprotectedSerialization);
  uint64_t v39 = objc_opt_class();
  v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v39 count:1];
  uint64_t v26 = +[HDCloudSyncSerializedField fieldForKey:@"StoreRecord" classes:v27 encrypted:0];
  v40[0] = v26;
  uint64_t v38 = objc_opt_class();
  int v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v38 count:1];
  uint64_t v24 = +[HDCloudSyncSerializedField fieldForKey:@"Slot" classes:v25 encrypted:0];
  v40[1] = v24;
  uint64_t v37 = objc_opt_class();
  id v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v37 count:1];
  id v21 = +[HDCloudSyncSerializedField fieldForKey:@"Active" classes:v22 encrypted:0];
  v40[2] = v21;
  uint64_t v36 = objc_opt_class();
  id v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v36 count:1];
  id v19 = +[HDCloudSyncSerializedField fieldForKey:@"BaselineEpoch" classes:v20 encrypted:0];
  v40[3] = v19;
  uint64_t v35 = objc_opt_class();
  uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:1];
  id v17 = +[HDCloudSyncSerializedField fieldForKey:@"EntityAnchorMap" classes:v18 encrypted:1];
  v40[4] = v17;
  uint64_t v34 = objc_opt_class();
  id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1];
  id v15 = +[HDCloudSyncSerializedField fieldForKey:@"FrozenAnchorMap" classes:v16 encrypted:1];
  v40[5] = v15;
  uint64_t v33 = objc_opt_class();
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
  int v13 = +[HDCloudSyncSerializedField fieldForKey:@"ChangeIndex" classes:v14 encrypted:0];
  v40[6] = v13;
  uint64_t v32 = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];
  uint64_t v3 = +[HDCloudSyncSerializedField fieldForKey:@"ChildRecordCount" classes:v2 encrypted:0];
  v40[7] = v3;
  uint64_t v31 = objc_opt_class();
  char v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
  BOOL v5 = +[HDCloudSyncSerializedField fieldForKey:@"ProtocolVersion" classes:v4 encrypted:0];
  v40[8] = v5;
  v30[0] = objc_opt_class();
  v30[1] = objc_opt_class();
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:2];
  id v7 = +[HDCloudSyncSerializedField fieldForKey:@"IncludedIdentifiers" classes:v6 encrypted:0];
  v40[9] = v7;
  uint64_t v29 = objc_opt_class();
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
  char v9 = +[HDCloudSyncSerializedField fieldForKey:@"FirstUnfrozenChange" classes:v8 encrypted:0];
  v40[10] = v9;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:11];
  id v12 = [v23 arrayByAddingObjectsFromArray:v10];

  return v12;
}

- (BOOL)isActive
{
  return [(HDCloudSyncCodableSequence *)self->_underlyingSequence active];
}

- (void)setActive:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(HDCloudSyncCodableSequence *)self->_underlyingSequence active] != a3)
  {
    [(HDCloudSyncCodableSequence *)self->_underlyingSequence setActive:v3];
    id v6 = [NSNumber numberWithBool:v3];
    BOOL v5 = [(HDCloudSyncRecord *)self record];
    [v5 setObject:v6 forKeyedSubscript:@"Active"];
  }
}

- (int)protocolVersion
{
  return [(HDCloudSyncCodableSequence *)self->_underlyingSequence protocolVersion];
}

- (void)setProtocolVersion:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  [(HDCloudSyncCodableSequence *)self->_underlyingSequence setProtocolVersion:a3];
  id v6 = [NSNumber numberWithInt:v3];
  BOOL v5 = [(HDCloudSyncRecord *)self record];
  [v5 setObject:v6 forKeyedSubscript:@"ProtocolVersion"];
}

- (int)slot
{
  return [(HDCloudSyncCodableSequence *)self->_underlyingSequence slot];
}

- (int64_t)changeIndex
{
  return [(HDCloudSyncCodableSequence *)self->_underlyingSequence changeIndex];
}

- (void)incrementChangeIndex
{
  [(HDCloudSyncCodableSequence *)self->_underlyingSequence setChangeIndex:[(HDCloudSyncCodableSequence *)self->_underlyingSequence changeIndex] + 1];
  uint64_t v3 = objc_msgSend(NSNumber, "numberWithLongLong:", -[HDCloudSyncCodableSequence changeIndex](self->_underlyingSequence, "changeIndex"));
  char v4 = [(HDCloudSyncRecord *)self record];
  [v4 setObject:v3 forKeyedSubscript:@"ChangeIndex"];

  [(HDCloudSyncSequenceRecord *)self setProtocolVersion:16];
}

- (void)resetChangeIndex:(unint64_t)a3
{
  [(HDCloudSyncCodableSequence *)self->_underlyingSequence setChangeIndex:a3];
  char v4 = objc_msgSend(NSNumber, "numberWithLongLong:", -[HDCloudSyncCodableSequence changeIndex](self->_underlyingSequence, "changeIndex"));
  BOOL v5 = [(HDCloudSyncRecord *)self record];
  [v5 setObject:v4 forKeyedSubscript:@"ChangeIndex"];

  [(HDCloudSyncSequenceRecord *)self setProtocolVersion:16];
}

- (int64_t)baselineEpoch
{
  return [(HDCloudSyncCodableSequence *)self->_underlyingSequence epoch];
}

- (int64_t)childRecordCount
{
  return [(HDCloudSyncCodableSequence *)self->_underlyingSequence childRecordCount];
}

- (void)incrementChildRecordCount
{
  [(HDCloudSyncCodableSequence *)self->_underlyingSequence setChildRecordCount:[(HDCloudSyncCodableSequence *)self->_underlyingSequence childRecordCount] + 1];
  objc_msgSend(NSNumber, "numberWithLongLong:", -[HDCloudSyncCodableSequence childRecordCount](self->_underlyingSequence, "childRecordCount"));
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [(HDCloudSyncRecord *)self record];
  [v3 setObject:v4 forKeyedSubscript:@"ChildRecordCount"];
}

- (void)decrementChildRecordCount:(unint64_t)a3
{
  int64_t v5 = [(HDCloudSyncCodableSequence *)self->_underlyingSequence childRecordCount];
  [(HDCloudSyncCodableSequence *)self->_underlyingSequence setChildRecordCount:(v5 - a3) & ~((uint64_t)(v5 - a3) >> 63)];
  objc_msgSend(NSNumber, "numberWithLongLong:", -[HDCloudSyncCodableSequence childRecordCount](self->_underlyingSequence, "childRecordCount"));
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = [(HDCloudSyncRecord *)self record];
  [v6 setObject:v7 forKeyedSubscript:@"ChildRecordCount"];
}

- (NSSet)includedIdentifiers
{
  uint64_t v3 = [(HDCloudSyncCodableSequence *)self->_underlyingSequence includedStoreIdentifiers];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    int64_t v5 = [(HDCloudSyncCodableSequence *)self->_underlyingSequence includedStoreIdentifiers];
    id v6 = objc_msgSend(v5, "hk_mapToSet:", &__block_literal_global_410);
  }
  else
  {
    id v6 = [MEMORY[0x1E4F1CAD0] set];
  }

  return (NSSet *)v6;
}

uint64_t __48__HDCloudSyncSequenceRecord_includedIdentifiers__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E4F29128], "hk_UUIDWithData:", a2);
}

- (NSSet)includedSyncIdentities
{
  uint64_t v3 = [(HDCloudSyncCodableSequence *)self->_underlyingSequence includedSyncIdentities];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    int64_t v5 = [(HDCloudSyncCodableSequence *)self->_underlyingSequence includedSyncIdentities];
    id v6 = objc_msgSend(v5, "hk_mapToSet:", &__block_literal_global_413);
  }
  else
  {
    id v6 = [MEMORY[0x1E4F1CAD0] set];
  }

  return (NSSet *)v6;
}

id __51__HDCloudSyncSequenceRecord_includedSyncIdentities__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v7 = 0;
  v2 = +[HDSyncIdentity syncIdentityWithCodable:a2 error:&v7];
  id v3 = v7;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    _HKInitializeLogging();
    int64_t v5 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v9 = v3;
      _os_log_fault_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_FAULT, "Failed to decode codableIdentity with error: %{public}@", buf, 0xCu);
    }
  }

  return v2;
}

- (NSSet)includedChildSyncIdentities
{
  id v3 = [(HDCloudSyncCodableSequence *)self->_underlyingSequence includedChildSyncIdentities];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    int64_t v5 = [(HDCloudSyncCodableSequence *)self->_underlyingSequence includedChildSyncIdentities];
    id v6 = objc_msgSend(v5, "hk_mapToSet:", &__block_literal_global_416);
  }
  else
  {
    id v6 = [MEMORY[0x1E4F1CAD0] set];
  }

  return (NSSet *)v6;
}

id __56__HDCloudSyncSequenceRecord_includedChildSyncIdentities__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v7 = 0;
  v2 = +[HDSyncIdentity syncIdentityWithCodable:a2 error:&v7];
  id v3 = v7;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    _HKInitializeLogging();
    int64_t v5 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v9 = v3;
      _os_log_fault_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_FAULT, "Failed to decode codable child sync Identity with error: %{public}@", buf, 0xCu);
    }
  }

  return v2;
}

- (void)setIncludedChildSyncIdentities:(id)a3
{
  id v6 = [a3 allObjects];
  id v4 = objc_msgSend(v6, "hk_map:", &__block_literal_global_418);
  int64_t v5 = (void *)[v4 mutableCopy];
  [(HDCloudSyncCodableSequence *)self->_underlyingSequence setIncludedChildSyncIdentities:v5];
}

uint64_t __60__HDCloudSyncSequenceRecord_setIncludedChildSyncIdentities___block_invoke(uint64_t a1, void *a2)
{
  return [a2 codableSyncIdentity];
}

- (HDSyncAnchorMap)syncAnchorMap
{
  v2 = [(HDCloudSyncCodableSequence *)self->_underlyingSequence anchorMap];
  id v3 = +[HDSyncAnchorMap syncAnchorMapWithCodableSyncAnchorRangeMap:v2];

  return (HDSyncAnchorMap *)v3;
}

- (void)updateSyncAnchorMapWithSyncAnchorMap:(id)a3
{
  id v10 = a3;
  if ([v10 anchorCount])
  {
    id v4 = [(HDCloudSyncSequenceRecord *)self syncAnchorMap];
    [v4 setAnchorsFromMap:v10];
    int64_t v5 = [v4 codableSyncAnchorRangeMap];
    [(HDCloudSyncCodableSequence *)self->_underlyingSequence setAnchorMap:v5];

    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
    [v6 encodeObject:v4 forKey:@"EntityAnchorMap"];
    id v7 = [v6 encodedData];
    id v8 = [(HDCloudSyncRecord *)self record];
    id v9 = [v8 encryptedValues];
    [v9 setObject:v7 forKeyedSubscript:@"EntityAnchorMap"];
  }
}

- (void)replaceSyncAnchorMapWithSyncAnchorMap:(id)a3
{
  id v4 = a3;
  int64_t v5 = [v4 codableSyncAnchorRangeMap];
  [(HDCloudSyncCodableSequence *)self->_underlyingSequence setAnchorMap:v5];

  id v9 = (id)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
  [v9 encodeObject:v4 forKey:@"EntityAnchorMap"];

  id v6 = [v9 encodedData];
  id v7 = [(HDCloudSyncRecord *)self record];
  id v8 = [v7 encryptedValues];
  [v8 setObject:v6 forKeyedSubscript:@"EntityAnchorMap"];
}

- (HDSyncAnchorMap)frozenSyncAnchorMap
{
  if ([(HDCloudSyncCodableSequence *)self->_underlyingSequence hasFrozenAnchorMap])
  {
    id v3 = [(HDCloudSyncCodableSequence *)self->_underlyingSequence frozenAnchorMap];
    id v4 = +[HDSyncAnchorMap syncAnchorMapWithCodableSyncAnchorRangeMap:v3];
  }
  else
  {
    id v4 = 0;
  }

  return (HDSyncAnchorMap *)v4;
}

- (void)updateFrozenSyncAnchorMapWithSyncAnchorMap:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int64_t v5 = [(HDCloudSyncSequenceRecord *)self frozenSyncAnchorMap];
  if (!v5) {
    int64_t v5 = objc_alloc_init(HDSyncAnchorMap);
  }
  [(HDSyncAnchorMap *)v5 setAnchorsFromMap:v4];
  id v6 = [(HDSyncAnchorMap *)v5 codableSyncAnchorRangeMap];
  [(HDCloudSyncCodableSequence *)self->_underlyingSequence setFrozenAnchorMap:v6];

  id v12 = 0;
  id v7 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v5 requiringSecureCoding:1 error:&v12];
  id v8 = v12;
  if (v7)
  {
    id v9 = [(HDCloudSyncRecord *)self record];
    id v10 = [v9 encryptedValues];
    [v10 setObject:v7 forKeyedSubscript:@"FrozenAnchorMap"];
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v11 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v14 = v8;
      _os_log_error_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_ERROR, "Failed to encode updated frozen anchor map: %{public}@", buf, 0xCu);
    }
  }
}

- (CKRecordID)firstUnfrozenChangeRecord
{
  id v3 = [(HDCloudSyncCodableSequence *)self->_underlyingSequence unfrozenChangeRecordNames];
  id v4 = [v3 firstObject];

  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F1A2F8]);
    id v6 = [(HDCloudSyncRecord *)self recordID];
    id v7 = [v6 zoneID];
    id v8 = (void *)[v5 initWithRecordName:v4 zoneID:v7];
  }
  else
  {
    id v8 = 0;
  }

  return (CKRecordID *)v8;
}

- (void)setFirstUnfrozenChangeRecord:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 recordName];
    v13[0] = v6;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    id v8 = (void *)[v7 mutableCopy];
    [(HDCloudSyncCodableSequence *)self->_underlyingSequence setUnfrozenChangeRecordNames:v8];

    id v9 = (void *)[objc_alloc(MEMORY[0x1E4F1A348]) initWithRecordID:v5 action:0];
    id v10 = [(HDCloudSyncRecord *)self record];
    [v10 setObject:v9 forKeyedSubscript:@"FirstUnfrozenChange"];
  }
  else
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [(HDCloudSyncCodableSequence *)self->_underlyingSequence setUnfrozenChangeRecordNames:v11];

    id v12 = [(HDCloudSyncRecord *)self record];
    [v12 setObject:0 forKey:@"FirstUnfrozenChange"];
  }
}

- (BOOL)isEqual:(id)a3
{
  id v7 = (HDCloudSyncSequenceRecord *)a3;
  if (v7 == self)
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v8 = [(HDCloudSyncSequenceRecord *)v7 slot];
      if (v8 == [(HDCloudSyncCodableSequence *)self->_underlyingSequence slot])
      {
        id v9 = [(HDCloudSyncSequenceRecord *)v7 storeIdentifier];
        storeIdentifier = self->_storeIdentifier;
        if (v9 != storeIdentifier)
        {
          if (!storeIdentifier)
          {
            BOOL v11 = 0;
            goto LABEL_33;
          }
          id v3 = [(HDCloudSyncSequenceRecord *)v7 storeIdentifier];
          if (![v3 isEqual:self->_storeIdentifier])
          {
            BOOL v11 = 0;
LABEL_32:

            goto LABEL_33;
          }
        }
        id v12 = [(HDCloudSyncSequenceRecord *)v7 syncAnchorMap];
        int v13 = [(HDCloudSyncSequenceRecord *)self syncAnchorMap];
        if (v12 != v13)
        {
          uint64_t v14 = [(HDCloudSyncSequenceRecord *)self syncAnchorMap];
          if (!v14)
          {
LABEL_29:

LABEL_30:
            BOOL v11 = 0;
            goto LABEL_31;
          }
          id v4 = (void *)v14;
          uint64_t v15 = [(HDCloudSyncSequenceRecord *)v7 syncAnchorMap];
          id v5 = [(HDCloudSyncSequenceRecord *)self syncAnchorMap];
          if (([v15 isEqual:v5] & 1) == 0)
          {

LABEL_28:
            goto LABEL_29;
          }
          id v56 = v15;
        }
        BOOL v16 = [(HDCloudSyncSequenceRecord *)v7 isActive];
        if (v16 != [(HDCloudSyncSequenceRecord *)self isActive]
          || (uint64_t v17 = [(HDCloudSyncSequenceRecord *)v7 changeIndex],
              v17 != [(HDCloudSyncSequenceRecord *)self changeIndex])
          || (uint64_t v18 = [(HDCloudSyncSequenceRecord *)v7 baselineEpoch],
              v18 != [(HDCloudSyncSequenceRecord *)self baselineEpoch])
          || (uint64_t v19 = [(HDCloudSyncSequenceRecord *)v7 childRecordCount],
              v19 != [(HDCloudSyncSequenceRecord *)self childRecordCount]))
        {
          BOOL v26 = 0;
          BOOL v11 = 0;
LABEL_24:
          if (v12 != v13)
          {

            BOOL v11 = v26;
          }

LABEL_31:
          if (v9 != storeIdentifier) {
            goto LABEL_32;
          }
LABEL_33:

          goto LABEL_34;
        }
        uint64_t v20 = [(HDCloudSyncSequenceRecord *)v7 includedIdentifiers];
        [(HDCloudSyncSequenceRecord *)self includedIdentifiers];
        uint64_t v55 = v54 = (void *)v20;
        if ((void *)v20 == v55) {
          goto LABEL_35;
        }
        uint64_t v21 = [(HDCloudSyncSequenceRecord *)self includedIdentifiers];
        if (!v21)
        {
          BOOL v26 = 0;
          uint64_t v32 = v54;
          goto LABEL_57;
        }
        v51 = (void *)v21;
        uint64_t v22 = [(HDCloudSyncSequenceRecord *)v7 includedIdentifiers];
        uint64_t v23 = [(HDCloudSyncSequenceRecord *)self includedIdentifiers];
        v50 = (void *)v22;
        uint64_t v24 = (void *)v22;
        int v25 = (void *)v23;
        if ([v24 isEqual:v23])
        {
          v47 = v25;
LABEL_35:
          uint64_t v28 = [(HDCloudSyncSequenceRecord *)v7 includedSyncIdentities];
          v52 = [(HDCloudSyncSequenceRecord *)self includedSyncIdentities];
          v53 = (void *)v28;
          if ((void *)v28 != v52)
          {
            uint64_t v29 = [(HDCloudSyncSequenceRecord *)self includedSyncIdentities];
            if (!v29)
            {
              BOOL v26 = 0;
LABEL_52:
              uint64_t v39 = v54;

              uint64_t v40 = v55;
LABEL_62:
              if (v39 != v40)
              {
              }
              BOOL v11 = v26;
              goto LABEL_24;
            }
            v46 = (void *)v29;
            v30 = [(HDCloudSyncSequenceRecord *)v7 includedSyncIdentities];
            v44 = [(HDCloudSyncSequenceRecord *)self includedSyncIdentities];
            v45 = v30;
            if (![v30 isEqual:v44])
            {
              BOOL v26 = 0;
              uint64_t v31 = v52;
LABEL_55:

              uint64_t v32 = v54;
              if (v54 == v55)
              {

                goto LABEL_58;
              }

LABEL_57:
LABEL_58:

              if (v12 != v13)
              {
              }
              BOOL v11 = v26;
              goto LABEL_31;
            }
          }
          uint64_t v33 = [(HDCloudSyncSequenceRecord *)v7 includedChildSyncIdentities];
          [(HDCloudSyncSequenceRecord *)self includedChildSyncIdentities];
          v49 = v48 = v33;
          if (v33 == v49) {
            goto LABEL_47;
          }
          uint64_t v34 = [(HDCloudSyncSequenceRecord *)self includedChildSyncIdentities];
          if (!v34)
          {

            uint64_t v38 = v53;
            BOOL v26 = 0;
LABEL_50:
            uint64_t v31 = v52;
            if (v38 != v52)
            {

              goto LABEL_52;
            }
LABEL_61:

            uint64_t v40 = v55;
            uint64_t v39 = v54;
            goto LABEL_62;
          }
          v43 = (void *)v34;
          uint64_t v35 = [(HDCloudSyncSequenceRecord *)v7 includedChildSyncIdentities];
          char v41 = [(HDCloudSyncSequenceRecord *)self includedChildSyncIdentities];
          int v42 = v35;
          if ([v35 isEqual:v41])
          {
LABEL_47:
            int v37 = [(HDCloudSyncSequenceRecord *)v7 protocolVersion];
            BOOL v26 = v37 == [(HDCloudSyncSequenceRecord *)self protocolVersion];
            uint64_t v36 = v48;
            if (v48 == v49)
            {

              uint64_t v31 = v52;
              if (v53 != v52) {
                goto LABEL_55;
              }
              goto LABEL_61;
            }
          }
          else
          {
            BOOL v26 = 0;
            uint64_t v36 = v48;
          }

          uint64_t v38 = v53;
          goto LABEL_50;
        }

        if (v12 == v13)
        {

          goto LABEL_30;
        }

        goto LABEL_28;
      }
    }
    BOOL v11 = 0;
  }
LABEL_34:

  return v11;
}

- (unint64_t)hash
{
  return [(HDCloudSyncCodableSequence *)self->_underlyingSequence hash];
}

- (id)printDescription
{
  uint64_t v24 = NSString;
  uint64_t v3 = [(HDCloudSyncSequenceRecord *)self slot];
  if ((v3 - 1) >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v3);
    v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v27 = off_1E62FB990[(int)v3 - 1];
  }
  BOOL v4 = [(HDCloudSyncSequenceRecord *)self isActive];
  id v5 = @"inactive";
  if (v4) {
    id v5 = @"ACTIVE";
  }
  uint64_t v22 = v5;
  BOOL v26 = [(HDCloudSyncRecord *)self record];
  uint64_t v20 = [v26 modificationDate];
  int64_t v19 = [(HDCloudSyncSequenceRecord *)self baselineEpoch];
  int64_t v17 = [(HDCloudSyncSequenceRecord *)self changeIndex];
  int64_t v16 = [(HDCloudSyncSequenceRecord *)self childRecordCount];
  [(HDCloudSyncSequenceRecord *)self protocolVersion];
  uint64_t v15 = HKSyncProtocolVersionToString();
  uint64_t v23 = [(HDCloudSyncSequenceRecord *)self includedIdentifiers];
  uint64_t v21 = [v23 allObjects];
  id v6 = [v21 componentsJoinedByString:@", "];
  uint64_t v18 = [(HDCloudSyncSequenceRecord *)self includedSyncIdentities];
  id v7 = [v18 allObjects];
  int v8 = [v7 componentsJoinedByString:@", "];
  id v9 = [(HDCloudSyncSequenceRecord *)self includedChildSyncIdentities];
  id v10 = [v9 allObjects];
  BOOL v11 = [v10 componentsJoinedByString:@", "];
  id v12 = [(HDCloudSyncSequenceRecord *)self syncAnchorMap];
  int v13 = [(HDCloudSyncSequenceRecord *)self frozenSyncAnchorMap];
  int v25 = [v24 stringWithFormat:@"+ %@ (%@, %@) Epoch: %lld | Change: %lld | Children: %lld | Version: %@\n| Included Identifiers: %@\n| Included Sync Identities: %@\n| Included Child Sync Identities: %@\n| EntityAnchorMap: %@\n| FrozenAnchorMap: %@\n+--------------------------------------------------", v27, v22, v20, v19, v17, v16, v15, v6, v8, v11, v12, v13];

  return v25;
}

- (void)_unitTest_setChildRecordCount:(unint64_t)a3
{
  [(HDCloudSyncCodableSequence *)self->_underlyingSequence setChildRecordCount:a3];
  objc_msgSend(NSNumber, "numberWithLongLong:", -[HDCloudSyncCodableSequence childRecordCount](self->_underlyingSequence, "childRecordCount"));
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  BOOL v4 = [(HDCloudSyncRecord *)self record];
  [v4 setObject:v5 forKeyedSubscript:@"ChildRecordCount"];
}

- (NSUUID)storeIdentifier
{
  return self->_storeIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeIdentifier, 0);

  objc_storeStrong((id *)&self->_underlyingSequence, 0);
}

@end