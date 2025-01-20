@interface HDCloudSyncChangeRecord
+ (BOOL)hasFutureSchema:(id)a3;
+ (BOOL)isChangeRecord:(id)a3;
+ (BOOL)isChangeRecord:(id)a3 inSequence:(id)a4;
+ (BOOL)isChangeRecordID:(id)a3;
+ (BOOL)requiresUnderlyingMessage;
+ (HDSyncAnchorRangeMap)_decodedSyncAnchorRangeMapForAnchorRangeData:(uint64_t)a1;
+ (id)_assetForCKRecord:(uint64_t)a3 error:;
+ (id)assetKeys;
+ (id)changesetArchiveContentDataForCKRecord:(id)a3 error:(id *)a4;
+ (id)changesetArchiveFileHandleForCKRecord:(id)a3 error:(id *)a4;
+ (id)changesetArchiveURLForCKRecord:(id)a3 error:(id *)a4;
+ (id)fieldsForUnprotectedSerialization;
+ (id)nonAssetKeys;
+ (id)recordType;
+ (id)recordWithCKRecord:(id)a3 error:(id *)a4;
+ (int64_t)bytesPerChangeRecordAssetThreshold;
+ (int64_t)bytesPerChangeRecordAssetThresholdHardLimit;
- (BOOL)finalForSequence;
- (BOOL)shouldFetchAssetContentInMemory;
- (CKRecordID)sequenceRecordID;
- (HDCloudSyncChangeRecord)initWithCKRecord:(id)a3 schemaVersion:(int64_t)a4;
- (HDCloudSyncChangeRecord)initWithSyncAnchorRangeMap:(id)a3 changeIndex:(int64_t)a4 changesetAsset:(id)a5 changeSize:(int64_t)a6 protocolVersion:(int)a7 finalForSequence:(BOOL)a8 sequenceRecordID:(id)a9 record:(id)a10 schemaVersion:(int64_t)a11;
- (HDCloudSyncChangeRecord)initWithSyncAnchorRangeMap:(id)a3 finalForSequence:(BOOL)a4 changesetArchiveFileHandle:(id)a5 sequenceRecord:(id)a6 protocolVersion:(int)a7;
- (HDSyncAnchorRangeMap)decodedSyncAnchorRangeMap;
- (NSNumber)changeSize;
- (NSURL)changesetArchiveFileURL;
- (id)initWithCKRecord:(uint64_t)a3 schemaVersion:(void *)a4 underlyingChange:;
- (id)printDescription;
- (id)serializeUnderlyingMessage;
- (int)protocolVersion;
- (int64_t)changeIndex;
- (int64_t)compare:(id)a3;
@end

@implementation HDCloudSyncChangeRecord

+ (BOOL)requiresUnderlyingMessage
{
  return 0;
}

+ (id)recordType
{
  return @"CloudSyncChangeRecord";
}

- (HDCloudSyncChangeRecord)initWithCKRecord:(id)a3 schemaVersion:(int64_t)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3C8];
  v7 = NSStringFromSelector(a2);
  [v5 raise:v6, @"The -%@ method is not available on %@", v7, objc_opt_class() format];

  return 0;
}

- (HDCloudSyncChangeRecord)initWithSyncAnchorRangeMap:(id)a3 finalForSequence:(BOOL)a4 changesetArchiveFileHandle:(id)a5 sequenceRecord:(id)a6 protocolVersion:(int)a7
{
  BOOL v41 = a4;
  id v43 = a3;
  id v10 = a5;
  id v11 = a6;
  id v12 = objc_alloc(MEMORY[0x1E4F1A2D8]);
  id v13 = v11;
  self;
  v14 = [v13 recordID];
  v15 = [v14 zoneID];
  uint64_t v44 = 0;
  int v16 = objc_msgSend(v15, "hd_isUnifiedSyncZoneIDForSyncCircleIdentifier:", &v44);

  id v17 = objc_alloc(MEMORY[0x1E4F1A2F8]);
  if (v16)
  {
    v39 = a2;
    v18 = NSString;
    v38 = [v13 recordID];
    v19 = [v38 recordName];
    v20 = [MEMORY[0x1E4F29128] UUID];
    v21 = [v20 UUIDString];
    v22 = [v18 stringWithFormat:@"%@/Change/%@", v19, v21];
    [v13 recordID];
    id v23 = v10;
    v25 = id v24 = v12;
    v26 = [v25 zoneID];
    v27 = (void *)[v17 initWithRecordName:v22 zoneID:v26];

    v28 = v38;
    id v12 = v24;
    id v10 = v23;

    a2 = v39;
  }
  else
  {
    v28 = [MEMORY[0x1E4F29128] UUID];
    v19 = [v28 UUIDString];
    v20 = [v13 recordID];
    v21 = [v20 zoneID];
    v27 = (void *)[v17 initWithRecordName:v19 zoneID:v21];
  }

  v29 = (void *)[v12 initWithRecordType:@"CloudSyncChangeRecord" recordID:v27];
  [v13 incrementChildRecordCount];
  [v10 seekToEndOfFile];
  uint64_t v30 = [v10 offsetInFile];
  if ((unint64_t)(v30 - 5242880) < 0xFFFFFFFFFFB00001)
  {
    v37 = [MEMORY[0x1E4F28B00] currentHandler];
    [v37 handleFailureInMethod:a2, self, @"HDCloudSyncChangeRecord.m", 85, @"changeSize (%lld) is invalid for anchors %@", v30, v43 object file lineNumber description];
  }
  v31 = objc_msgSend(objc_alloc(MEMORY[0x1E4F19E50]), "initWithFileDescriptor:", objc_msgSend(v10, "fileDescriptor"));
  [v31 setItemTypeHint:@"fxd"];
  uint64_t v32 = [v13 changeIndex];
  v33 = [v13 record];
  v34 = [v33 recordID];
  v35 = [(HDCloudSyncChangeRecord *)self initWithSyncAnchorRangeMap:v43 changeIndex:v32 changesetAsset:v31 changeSize:v30 protocolVersion:a7 finalForSequence:v41 sequenceRecordID:v34 record:v29 schemaVersion:1];

  return v35;
}

- (HDCloudSyncChangeRecord)initWithSyncAnchorRangeMap:(id)a3 changeIndex:(int64_t)a4 changesetAsset:(id)a5 changeSize:(int64_t)a6 protocolVersion:(int)a7 finalForSequence:(BOOL)a8 sequenceRecordID:(id)a9 record:(id)a10 schemaVersion:(int64_t)a11
{
  BOOL v11 = a8;
  id v16 = a10;
  id v17 = a9;
  id v18 = a5;
  id v19 = a3;
  v20 = objc_alloc_init(HDCloudSyncCodableChange);
  v21 = (void *)[objc_alloc(MEMORY[0x1E4F1A348]) initWithRecordID:v17 action:1];

  [v16 setObject:v21 forKeyedSubscript:@"SequenceRecord"];
  [v16 setObject:v18 forKeyedSubscript:@"ChangeSet"];

  v22 = [NSNumber numberWithInteger:a11];
  [v16 setObject:v22 forKeyedSubscript:@"Version"];

  [(HDCloudSyncCodableChange *)v20 setChangeIndex:a4];
  [(HDCloudSyncCodableChange *)v20 setFinalForSequence:v11];
  [(HDCloudSyncCodableChange *)v20 setProtocolVersion:a7];
  id v23 = [v19 codableSyncAnchorRangeMap];

  [(HDCloudSyncCodableChange *)v20 setAnchorRangeMap:v23];
  [(HDCloudSyncCodableChange *)v20 setChangeSize:a6];
  id v24 = (HDCloudSyncChangeRecord *)-[HDCloudSyncChangeRecord initWithCKRecord:schemaVersion:underlyingChange:](self, (uint64_t)v16, a11, v20);

  return v24;
}

- (id)initWithCKRecord:(uint64_t)a3 schemaVersion:(void *)a4 underlyingChange:
{
  id v8 = a4;
  if (a1)
  {
    v20.receiver = a1;
    v20.super_class = (Class)HDCloudSyncChangeRecord;
    v9 = (id *)objc_msgSendSuper2(&v20, sel_initWithCKRecord_schemaVersion_, a2, a3);
    id v10 = v9;
    if (v9)
    {
      objc_storeStrong(v9 + 3, a4);
      BOOL v11 = [v10 record];
      id v12 = [v10[3] anchorRangeMap];
      id v13 = [v12 data];
      v14 = [v11 encryptedValues];
      [v14 setObject:v13 forKeyedSubscript:@"EntityAnchorRangeMap"];

      v15 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v10[3], "changeIndex"));
      [v11 setObject:v15 forKeyedSubscript:@"CurrentChangeIndex"];

      id v16 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v10[3], "changeSize"));
      [v11 setObject:v16 forKeyedSubscript:@"ChangeSize"];

      id v17 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v10[3], "protocolVersion"));
      [v11 setObject:v17 forKeyedSubscript:@"ProtocolVersion"];

      id v18 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v10[3], "finalForSequence"));
      [v11 setObject:v18 forKeyedSubscript:@"Options"];
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)serializeUnderlyingMessage
{
  return (id)[(HDCloudSyncCodableChange *)self->_underlyingChange data];
}

+ (id)fieldsForUnprotectedSerialization
{
  v25[6] = *MEMORY[0x1E4F143B8];
  v18.receiver = a1;
  v18.super_class = (Class)&OBJC_METACLASS___HDCloudSyncChangeRecord;
  v2 = objc_msgSendSuper2(&v18, sel_fieldsForUnprotectedSerialization);
  uint64_t v24 = objc_opt_class();
  id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
  id v16 = +[HDCloudSyncSerializedField fieldForKey:@"SequenceRecord" classes:v17 encrypted:0];
  v25[0] = v16;
  uint64_t v23 = objc_opt_class();
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
  v14 = +[HDCloudSyncSerializedField fieldForKey:@"EntityAnchorRangeMap" classes:v15 encrypted:1];
  v25[1] = v14;
  uint64_t v22 = objc_opt_class();
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
  v3 = +[HDCloudSyncSerializedField fieldForKey:@"CurrentChangeIndex" classes:v13 encrypted:0];
  v25[2] = v3;
  uint64_t v21 = objc_opt_class();
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
  v5 = +[HDCloudSyncSerializedField fieldForKey:@"ProtocolVersion" classes:v4 encrypted:0];
  v25[3] = v5;
  uint64_t v20 = objc_opt_class();
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
  v7 = +[HDCloudSyncSerializedField fieldForKey:@"Options" classes:v6 encrypted:0];
  v25[4] = v7;
  uint64_t v19 = objc_opt_class();
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
  v9 = +[HDCloudSyncSerializedField fieldForKey:@"ChangeSize" classes:v8 encrypted:0];
  v25[5] = v9;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:6];
  BOOL v11 = [v2 arrayByAddingObjectsFromArray:v10];

  return v11;
}

+ (id)recordWithCKRecord:(id)a3 error:(id *)a4
{
  id v7 = a3;
  id v8 = [v7 recordType];
  char v9 = [v8 isEqualToString:@"CloudSyncChangeRecord"];

  if (v9)
  {
    id v10 = objc_msgSend(v7, "hd_requiredValueForKey:type:error:", @"Version", objc_opt_class(), a4);
    if (!v10)
    {
      id v16 = 0;
LABEL_59:

      goto LABEL_60;
    }
    BOOL v11 = objc_msgSend(v7, "hd_requiredValueForKey:type:error:", @"SequenceRecord", objc_opt_class(), a4);
    id v12 = v11;
    if (v11)
    {
      if ([v11 referenceAction] == 1)
      {
        id v48 = 0;
        id v13 = objc_msgSend(v7, "hd_optionalEncryptedValueForKey:type:error:", @"UnderlyingMessage", objc_opt_class(), &v48);
        id v14 = v48;
        v15 = v14;
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
          goto LABEL_57;
        }
        if (v13)
        {
          uint64_t v22 = [[HDCloudSyncCodableChange alloc] initWithData:v13];
          if (v22)
          {
            id v16 = -[HDCloudSyncChangeRecord initWithCKRecord:schemaVersion:underlyingChange:]([HDCloudSyncChangeRecord alloc], (uint64_t)v7, [v10 integerValue], v22);
LABEL_56:

LABEL_57:
            goto LABEL_58;
          }
          objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 3, @"Underlying message present but does not decode.");
        }
        else
        {
          objc_msgSend(v7, "hd_requiredValueForKey:type:error:", @"CurrentChangeIndex", objc_opt_class(), a4);
          uint64_t v22 = (HDCloudSyncCodableChange *)objc_claimAutoreleasedReturnValue();
          if (v22)
          {
            uint64_t v23 = objc_msgSend(v7, "hd_requiredEncryptedValueForKey:type:error:", @"EntityAnchorRangeMap", objc_opt_class(), a4);
            if (v23)
            {
              uint64_t v24 = +[HDCloudSyncChangeRecord _decodedSyncAnchorRangeMapForAnchorRangeData:]((uint64_t)a1, v23);
              if (v24)
              {
                v25 = objc_msgSend(v7, "hd_requiredValueForKey:type:error:", @"ProtocolVersion", objc_opt_class(), a4);
                if (v25)
                {
                  v42 = v24;
                  id v44 = v25;
                  id v47 = 0;
                  uint64_t v26 = objc_msgSend(v7, "hd_optionalValueForKey:type:error:", @"Options", objc_opt_class(), &v47);
                  id v27 = v47;
                  id v43 = (void *)v26;
                  if (v26 || !v27)
                  {
                    id v41 = v27;
                    id v46 = 0;
                    v29 = objc_msgSend(v7, "hd_optionalValueForKey:type:error:", @"ChangeSize", objc_opt_class(), &v46);
                    id v30 = v46;
                    v40 = v29;
                    if (v29 || !v30)
                    {
                      id v39 = v30;
                      id v45 = 0;
                      uint64_t v32 = objc_msgSend(v7, "hd_optionalValueForKey:type:error:", @"ChangeSet", objc_opt_class(), &v45);
                      id v33 = v45;
                      v38 = (void *)v32;
                      if (v32 || !v33)
                      {
                        v34 = v33;
                        v35 = objc_alloc_init(HDCloudSyncCodableChange);
                        -[HDCloudSyncCodableChange setChangeSize:](v35, "setChangeSize:", [v29 longLongValue]);
                        [(HDCloudSyncCodableChange *)v35 setChangeIndex:[(HDCloudSyncCodableChange *)v22 longLongValue]];
                        -[HDCloudSyncCodableChange setProtocolVersion:](v35, "setProtocolVersion:", (int)[v44 integerValue]);
                        -[HDCloudSyncCodableChange setFinalForSequence:](v35, "setFinalForSequence:", [v43 longLongValue] != 0);
                        v36 = [v42 codableSyncAnchorRangeMap];
                        [(HDCloudSyncCodableChange *)v35 setAnchorRangeMap:v36];

                        id v16 = -[HDCloudSyncChangeRecord initWithCKRecord:schemaVersion:underlyingChange:]([HDCloudSyncChangeRecord alloc], (uint64_t)v7, [v10 integerValue], v35);
                      }
                      else
                      {
                        v34 = v33;
                        if (a4)
                        {
                          id v16 = 0;
                          *a4 = v33;
                        }
                        else
                        {
                          _HKLogDroppedError();
                          id v16 = 0;
                        }
                      }

                      v31 = v39;
                    }
                    else
                    {
                      v31 = v30;
                      if (a4)
                      {
                        id v16 = 0;
                        *a4 = v30;
                      }
                      else
                      {
                        _HKLogDroppedError();
                        id v16 = 0;
                      }
                    }

                    v28 = v41;
                  }
                  else
                  {
                    v28 = v27;
                    if (a4)
                    {
                      id v16 = 0;
                      *a4 = v27;
                    }
                    else
                    {
                      _HKLogDroppedError();
                      id v16 = 0;
                    }
                  }

                  v25 = v44;
                  uint64_t v24 = v42;
                }
                else
                {
                  id v16 = 0;
                }
              }
              else
              {
                objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 3, @"Unable to decode anchor range map.");
                id v16 = 0;
              }
            }
            else
            {
              id v16 = 0;
            }

            goto LABEL_56;
          }
        }
        id v16 = 0;
        goto LABEL_56;
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
LABEL_58:

    goto LABEL_59;
  }
  id v17 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v18 = objc_opt_class();
  uint64_t v19 = [v7 recordType];
  objc_msgSend(v17, "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", v18, a2, @"record has type (%@), but expected (%@)", v19, @"CloudSyncChangeRecord"");
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
LABEL_60:

  return v16;
}

+ (HDSyncAnchorRangeMap)_decodedSyncAnchorRangeMapForAnchorRangeData:(uint64_t)a1
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  self;
  v3 = [[HDCodableSyncAnchorRangeMap alloc] initWithData:v2];
  if (v3)
  {
    id v10 = 0;
    v4 = [[HDSyncAnchorRangeMap alloc] initWithCodableSyncAnchorRangeMap:v3 error:&v10];
    v5 = (HDCodableSyncAnchorRangeMap *)v10;
    if (v4) {
      goto LABEL_10;
    }
    _HKInitializeLogging();
    uint64_t v6 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v12 = v3;
      __int16 v13 = 2114;
      id v14 = v5;
      _os_log_error_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_ERROR, "Failed to decode codable sync anchor range map %{public}@: %{public}@", buf, 0x16u);
    }
  }
  id v9 = 0;
  objc_msgSend(MEMORY[0x1E4F28DC0], "hk_unarchivedObjectOfClass:forKey:data:error:", objc_opt_class(), @"EntityAnchorRangeMap", v2, &v9);
  v4 = (HDSyncAnchorRangeMap *)objc_claimAutoreleasedReturnValue();
  v5 = (HDCodableSyncAnchorRangeMap *)v9;
  if (!v4)
  {
    _HKInitializeLogging();
    id v7 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v12 = v5;
      _os_log_error_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_ERROR, "Invalid archive attempting to decode sync anchor range map: %{public}@", buf, 0xCu);
    }
    v4 = 0;
  }
LABEL_10:

  return v4;
}

+ (BOOL)isChangeRecord:(id)a3
{
  v3 = [a3 recordType];
  char v4 = [v3 isEqualToString:@"CloudSyncChangeRecord"];

  return v4;
}

+ (BOOL)isChangeRecordID:(id)a3
{
  id v3 = a3;
  char v4 = [v3 recordName];
  if ([v4 rangeOfString:@"/Change/"] == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F29128]);
    uint64_t v6 = [v3 recordName];
    id v7 = (void *)[v5 initWithUUIDString:v6];
    BOOL v8 = v7 != 0;
  }
  else
  {
    BOOL v8 = 1;
  }

  return v8;
}

+ (BOOL)isChangeRecord:(id)a3 inSequence:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v13 = 0;
  id v7 = objc_msgSend(v6, "hd_requiredValueForKey:type:error:", @"SequenceRecord", objc_opt_class(), &v13);

  if (v7)
  {
    BOOL v8 = [v7 recordID];
    id v9 = [v5 record];
    id v10 = [v9 recordID];
    char v11 = [v8 isEqual:v10];
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

+ (BOOL)hasFutureSchema:(id)a3
{
  id v3 = [a3 objectForKeyedSubscript:@"Version"];
  char v4 = v3;
  BOOL v5 = v3 && [v3 integerValue] > 1;

  return v5;
}

+ (int64_t)bytesPerChangeRecordAssetThreshold
{
  return 3145728;
}

+ (int64_t)bytesPerChangeRecordAssetThresholdHardLimit
{
  return 0x400000;
}

+ (id)nonAssetKeys
{
  if (qword_1EBA18AB8 != -1) {
    dispatch_once(&qword_1EBA18AB8, &__block_literal_global_6);
  }
  id v2 = (void *)_MergedGlobals_198;

  return v2;
}

void __39__HDCloudSyncChangeRecord_nonAssetKeys__block_invoke()
{
  v2[7] = *MEMORY[0x1E4F143B8];
  v2[0] = @"Version";
  v2[1] = @"SequenceRecord";
  v2[2] = @"EntityAnchorRangeMap";
  v2[3] = @"CurrentChangeIndex";
  v2[4] = @"ProtocolVersion";
  v2[5] = @"Options";
  v2[6] = @"ChangeSize";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:7];
  v1 = (void *)_MergedGlobals_198;
  _MergedGlobals_198 = v0;
}

+ (id)assetKeys
{
  if (qword_1EBA18AC8 != -1) {
    dispatch_once(&qword_1EBA18AC8, &__block_literal_global_353);
  }
  id v2 = (void *)qword_1EBA18AC0;

  return v2;
}

void __36__HDCloudSyncChangeRecord_assetKeys__block_invoke()
{
  v2[1] = *MEMORY[0x1E4F143B8];
  v2[0] = @"ChangeSet";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:1];
  v1 = (void *)qword_1EBA18AC0;
  qword_1EBA18AC0 = v0;
}

+ (id)changesetArchiveContentDataForCKRecord:(id)a3 error:(id *)a4
{
  id v6 = +[HDCloudSyncChangeRecord _assetForCKRecord:error:]((uint64_t)a1, a3, (uint64_t)a4);
  id v7 = v6;
  if (v6)
  {
    BOOL v8 = [v6 assetContent];
    if (v8) {
      goto LABEL_9;
    }
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), a2, @"record has nil assetContent"");
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      if (a4) {
        *a4 = v9;
      }
      else {
        _HKLogDroppedError();
      }
    }
  }
  BOOL v8 = 0;
LABEL_9:

  return v8;
}

+ (id)_assetForCKRecord:(uint64_t)a3 error:
{
  id v4 = a2;
  self;
  BOOL v5 = objc_msgSend(v4, "hd_requiredValueForKey:type:error:", @"ChangeSet", objc_opt_class(), a3);

  return v5;
}

+ (id)changesetArchiveFileHandleForCKRecord:(id)a3 error:(id *)a4
{
  id v4 = +[HDCloudSyncChangeRecord _assetForCKRecord:error:]((uint64_t)a1, a3, (uint64_t)a4);
  BOOL v5 = v4;
  if (v4)
  {
    id v6 = [v4 fileHandle];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (id)changesetArchiveURLForCKRecord:(id)a3 error:(id *)a4
{
  id v4 = +[HDCloudSyncChangeRecord _assetForCKRecord:error:]((uint64_t)a1, a3, (uint64_t)a4);
  BOOL v5 = v4;
  if (v4)
  {
    id v6 = [v4 fileURL];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HDCloudSyncChangeRecord *)self changeIndex];
  if (v5 >= [v4 changeIndex])
  {
    uint64_t v7 = [(HDCloudSyncChangeRecord *)self changeIndex];
    int64_t v6 = v7 > [v4 changeIndex];
  }
  else
  {
    int64_t v6 = -1;
  }

  return v6;
}

- (BOOL)shouldFetchAssetContentInMemory
{
  return [(HDCloudSyncCodableChange *)self->_underlyingChange changeSize] >= 1
      && (unint64_t)[(HDCloudSyncCodableChange *)self->_underlyingChange changeSize] <= 0x40000;
}

- (int64_t)changeIndex
{
  return [(HDCloudSyncCodableChange *)self->_underlyingChange changeIndex];
}

- (int)protocolVersion
{
  return [(HDCloudSyncCodableChange *)self->_underlyingChange protocolVersion];
}

- (NSNumber)changeSize
{
  id v2 = NSNumber;
  int64_t v3 = [(HDCloudSyncCodableChange *)self->_underlyingChange changeSize];

  return (NSNumber *)[v2 numberWithLongLong:v3];
}

- (BOOL)finalForSequence
{
  return [(HDCloudSyncCodableChange *)self->_underlyingChange finalForSequence];
}

- (NSURL)changesetArchiveFileURL
{
  id v2 = [(HDCloudSyncRecord *)self record];
  int64_t v3 = [v2 objectForKeyedSubscript:@"ChangeSet"];
  id v4 = [v3 fileURL];

  return (NSURL *)v4;
}

- (HDSyncAnchorRangeMap)decodedSyncAnchorRangeMap
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  int64_t v3 = [HDSyncAnchorRangeMap alloc];
  id v4 = [(HDCloudSyncCodableChange *)self->_underlyingChange anchorRangeMap];
  id v12 = 0;
  uint64_t v5 = [(HDSyncAnchorRangeMap *)v3 initWithCodableSyncAnchorRangeMap:v4 error:&v12];
  id v6 = v12;

  if (!v5)
  {
    _HKInitializeLogging();
    uint64_t v7 = (void *)*MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      underlyingChange = self->_underlyingChange;
      id v9 = v7;
      id v10 = [(HDCloudSyncCodableChange *)underlyingChange anchorRangeMap];
      *(_DWORD *)buf = 138412290;
      id v14 = v10;
      _os_log_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_DEFAULT, "Failed to decode sync anchor range map: %@", buf, 0xCu);
    }
  }

  return v5;
}

- (CKRecordID)sequenceRecordID
{
  id v2 = [(HDCloudSyncRecord *)self record];
  int64_t v3 = [v2 objectForKeyedSubscript:@"SequenceRecord"];

  id v4 = [v3 recordID];

  return (CKRecordID *)v4;
}

- (id)printDescription
{
  int64_t v3 = NSString;
  int64_t v4 = [(HDCloudSyncChangeRecord *)self changeIndex];
  uint64_t v5 = [(HDCloudSyncChangeRecord *)self protocolVersion];
  BOOL v6 = [(HDCloudSyncCodableChange *)self->_underlyingChange finalForSequence];
  uint64_t v7 = "";
  if (v6) {
    uint64_t v7 = " FINAL";
  }
  return (id)objc_msgSend(v3, "stringWithFormat:", @"+ Change %llu (Version %d) %s\n+--------------------------------------------------", v4, v5, v7);
}

- (void).cxx_destruct
{
}

@end