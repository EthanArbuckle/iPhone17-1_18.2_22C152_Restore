@interface HDCloudSyncSharedSummaryAuthorizationRecord
+ (BOOL)hasFutureSchema:(id)a3;
+ (BOOL)isAuthorizationRecord:(id)a3;
+ (BOOL)requiresUnderlyingMessage;
+ (BOOL)shouldSerializeUnderlyingMessageAsProtected;
+ (id)codableRecordFromRecord:(id)a3;
+ (id)fieldsForUnprotectedSerialization;
+ (id)recordIDWithZoneID:(id)a3 UUID:(id)a4;
+ (id)recordType;
+ (id)recordWithCKRecord:(id)a3 error:(id *)a4;
- (CKRecordID)participantRecordID;
- (HDCloudSyncSharedSummaryAuthorizationRecord)initWithCKRecord:(id)a3 schemaVersion:(int64_t)a4;
- (NSArray)authorizationIdentifiers;
- (NSUUID)UUID;
- (id)initInZone:(id)a3 UUID:(id)a4 authorizationIdentifiers:(id)a5 participantRecord:(id)a6;
- (id)printDescription;
- (id)serializeUnderlyingMessage;
- (void)replaceAuthorizationIdentifiers:(id)a3;
- (void)updateAuthorizationWithIdentifiersToAdd:(id)a3 identifiersToDelete:(id)a4;
@end

@implementation HDCloudSyncSharedSummaryAuthorizationRecord

+ (BOOL)requiresUnderlyingMessage
{
  return 1;
}

+ (id)recordType
{
  return @"SharedSummaryAuthorizationRecordType";
}

+ (BOOL)hasFutureSchema:(id)a3
{
  v3 = [a3 objectForKeyedSubscript:@"Version"];
  v4 = v3;
  BOOL v5 = v3 && [v3 integerValue] > 1;

  return v5;
}

+ (id)recordIDWithZoneID:(id)a3 UUID:(id)a4
{
  BOOL v5 = NSString;
  id v6 = a3;
  v7 = [a4 UUIDString];
  v8 = [v5 stringWithFormat:@"%@/%@", @"SharedSummaryAuthorizationRecord", v7];

  v9 = (void *)[objc_alloc(MEMORY[0x1E4F1A2F8]) initWithRecordName:v8 zoneID:v6];

  return v9;
}

+ (BOOL)isAuthorizationRecord:(id)a3
{
  v3 = [a3 recordType];
  char v4 = [v3 isEqualToString:@"SharedSummaryAuthorizationRecordType"];

  return v4;
}

- (id)initInZone:(id)a3 UUID:(id)a4 authorizationIdentifiers:(id)a5 participantRecord:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = a3;
  v14 = [(id)objc_opt_class() recordIDWithZoneID:v13 UUID:v10];

  v15 = (void *)[objc_alloc(MEMORY[0x1E4F1A2D8]) initWithRecordType:@"SharedSummaryAuthorizationRecordType" recordID:v14];
  v16 = [(HDCloudSyncSharedSummaryAuthorizationRecord *)self initWithCKRecord:v15 schemaVersion:1];
  if (v16)
  {
    id v17 = objc_alloc(MEMORY[0x1E4F1A348]);
    v18 = [v12 record];
    v19 = [v18 recordID];
    v20 = (void *)[v17 initWithRecordID:v19 action:1];
    [v15 setObject:v20 forKeyedSubscript:@"ParticipantRecord"];

    v21 = [v10 UUIDString];
    v22 = (void *)[v21 copy];
    [(HDCloudSyncCodableSharedSummaryAuthorizationRecord *)v16->_underlyingAuthorizationRecord setUuid:v22];

    v23 = (void *)[v11 copy];
    [(HDCloudSyncCodableSharedSummaryAuthorizationRecord *)v16->_underlyingAuthorizationRecord setAuthorizationCategories:v23];
  }
  return v16;
}

- (HDCloudSyncSharedSummaryAuthorizationRecord)initWithCKRecord:(id)a3 schemaVersion:(int64_t)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)HDCloudSyncSharedSummaryAuthorizationRecord;
  char v4 = [(HDCloudSyncRecord *)&v14 initWithCKRecord:a3 schemaVersion:a4];
  BOOL v5 = v4;
  if (!v4) {
    goto LABEL_9;
  }
  id v6 = [(HDCloudSyncRecord *)v4 underlyingMessage];
  if (!v6)
  {
    id v11 = objc_alloc_init(HDCloudSyncCodableSharedSummaryAuthorizationRecord);
    underlyingAuthorizationRecord = v5->_underlyingAuthorizationRecord;
    v5->_underlyingAuthorizationRecord = v11;

    goto LABEL_8;
  }
  v7 = [[HDCloudSyncCodableSharedSummaryAuthorizationRecord alloc] initWithData:v6];
  v8 = v5->_underlyingAuthorizationRecord;
  v5->_underlyingAuthorizationRecord = v7;

  if (v5->_underlyingAuthorizationRecord)
  {
LABEL_8:

LABEL_9:
    id v10 = v5;
    goto LABEL_10;
  }
  _HKInitializeLogging();
  v9 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138543362;
    v16 = v5;
    _os_log_fault_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_FAULT, "[summary-sharing] %{public}@: Failed to decode underlying record.", buf, 0xCu);
  }

  id v10 = 0;
LABEL_10:

  return v10;
}

- (NSUUID)UUID
{
  id v3 = objc_alloc(MEMORY[0x1E4F29128]);
  char v4 = [(HDCloudSyncCodableSharedSummaryAuthorizationRecord *)self->_underlyingAuthorizationRecord uuid];
  BOOL v5 = (void *)[v3 initWithUUIDString:v4];

  return (NSUUID *)v5;
}

- (NSArray)authorizationIdentifiers
{
  v2 = [(HDCloudSyncCodableSharedSummaryAuthorizationRecord *)self->_underlyingAuthorizationRecord authorizationCategories];
  id v3 = (void *)[v2 copy];

  return (NSArray *)v3;
}

- (CKRecordID)participantRecordID
{
  v2 = [(HDCloudSyncRecord *)self record];
  id v3 = [v2 objectForKeyedSubscript:@"ParticipantRecord"];

  char v4 = [v3 recordID];

  return (CKRecordID *)v4;
}

- (void)updateAuthorizationWithIdentifiersToAdd:(id)a3 identifiersToDelete:(id)a4
{
  underlyingAuthorizationRecord = self->_underlyingAuthorizationRecord;
  id v7 = a4;
  id v8 = a3;
  v9 = [(HDCloudSyncCodableSharedSummaryAuthorizationRecord *)underlyingAuthorizationRecord authorizationCategories];
  HDSharedSummaryMergeAuthorizationIdentifiers((uint64_t)v9, v8, v7);
  id v11 = (id)objc_claimAutoreleasedReturnValue();

  id v10 = (void *)[v11 mutableCopy];
  [(HDCloudSyncCodableSharedSummaryAuthorizationRecord *)self->_underlyingAuthorizationRecord setAuthorizationCategories:v10];
}

- (void)replaceAuthorizationIdentifiers:(id)a3
{
  id v4 = (id)[a3 mutableCopy];
  [(HDCloudSyncCodableSharedSummaryAuthorizationRecord *)self->_underlyingAuthorizationRecord setAuthorizationCategories:v4];
}

- (id)serializeUnderlyingMessage
{
  return (id)[(HDCloudSyncCodableSharedSummaryAuthorizationRecord *)self->_underlyingAuthorizationRecord data];
}

+ (id)recordWithCKRecord:(id)a3 error:(id *)a4
{
  id v7 = a3;
  id v8 = [v7 recordType];
  v9 = [a1 recordType];
  char v10 = [v8 isEqualToString:v9];

  if ((v10 & 1) == 0)
  {
    v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v17 = objc_opt_class();
    id v11 = [v7 recordType];
    objc_super v14 = [a1 recordType];
    v18 = @"record has type (%@), but expected (%@)";
    v24 = v11;
    v25 = v14;
    v19 = v16;
    uint64_t v20 = v17;
LABEL_9:
    objc_msgSend(v19, "hk_errorForInvalidArgument:class:selector:format:", @"@\"\"", v20, a2, v18, v24, v25);
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

LABEL_15:
    v15 = 0;
    goto LABEL_16;
  }
  id v11 = objc_msgSend(v7, "hd_requiredValueForKey:type:error:", @"Version", objc_opt_class(), a4);
  if (!v11
    || [a1 requiresUnderlyingMessage]
    && (objc_msgSend(v7, "hd_requiredEncryptedValueForKey:type:error:", @"UnderlyingMessage", objc_opt_class(), a4), id v12 = objc_claimAutoreleasedReturnValue(), v12, !v12))
  {
    v15 = 0;
    goto LABEL_17;
  }
  id v13 = objc_msgSend(v7, "hd_requiredValueForKey:type:error:", @"ParticipantRecord", objc_opt_class(), a4);
  objc_super v14 = v13;
  if (!v13) {
    goto LABEL_15;
  }
  if ([v13 referenceAction] != 1)
  {
    v23 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v20 = objc_opt_class();
    v18 = @"record reference to parent does not have correct reference action";
    v19 = v23;
    goto LABEL_9;
  }
  v15 = objc_msgSend(objc_alloc((Class)a1), "initWithCKRecord:schemaVersion:", v7, objc_msgSend(v11, "integerValue"));
LABEL_16:

LABEL_17:

  return v15;
}

+ (BOOL)shouldSerializeUnderlyingMessageAsProtected
{
  return 1;
}

+ (id)fieldsForUnprotectedSerialization
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___HDCloudSyncSharedSummaryAuthorizationRecord;
  v2 = objc_msgSendSuper2(&v8, sel_fieldsForUnprotectedSerialization);
  uint64_t v9 = objc_opt_class();
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v9 count:1];
  id v4 = +[HDCloudSyncSerializedField fieldForKey:@"ParticipantRecord" classes:v3 encrypted:0];
  v10[0] = v4;
  BOOL v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  id v6 = [v2 arrayByAddingObjectsFromArray:v5];

  return v6;
}

- (id)printDescription
{
  v2 = NSString;
  id v3 = [(HDCloudSyncSharedSummaryAuthorizationRecord *)self authorizationIdentifiers];
  id v4 = [v3 componentsJoinedByString:@", "];
  BOOL v5 = [v2 stringWithFormat:@"+ Authorization Categories: %@\n+--------------------------------------------------", v4];

  return v5;
}

+ (id)codableRecordFromRecord:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(HDCloudSyncCodableSharedSummaryAuthorizationRecord);
  BOOL v5 = [v3 authorizationIdentifiers];
  id v6 = (void *)[v5 mutableCopy];
  [(HDCloudSyncCodableSharedSummaryAuthorizationRecord *)v4 setAuthorizationCategories:v6];

  id v7 = [v3 UUID];

  objc_super v8 = [v7 UUIDString];
  [(HDCloudSyncCodableSharedSummaryAuthorizationRecord *)v4 setUuid:v8];

  return v4;
}

- (void).cxx_destruct
{
}

@end