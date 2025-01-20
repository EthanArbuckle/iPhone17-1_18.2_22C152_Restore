@interface HDCloudSyncSharedSummaryTransactionRecord
+ (BOOL)hasFutureSchema:(id)a3;
+ (BOOL)isTransactionRecord:(id)a3;
+ (BOOL)requiresUnderlyingMessage;
+ (BOOL)shouldSerializeUnderlyingMessageAsProtected;
+ (id)recordIDWithZoneID:(id)a3 UUID:(id)a4;
+ (id)recordType;
- (HDCloudSyncSharedSummaryTransactionRecord)initWithCKRecord:(id)a3 schemaVersion:(int64_t)a4;
- (NSArray)summaryIdentifiers;
- (NSData)metadata;
- (NSString)sourceDeviceIdentifier;
- (NSUUID)UUID;
- (id)initInZone:(id)a3 UUID:(id)a4 sourceDeviceIdentifier:(id)a5 summaryIdentifiers:(id)a6 metadata:(id)a7;
- (id)printDescription;
- (id)serializeUnderlyingMessage;
@end

@implementation HDCloudSyncSharedSummaryTransactionRecord

+ (BOOL)requiresUnderlyingMessage
{
  return 1;
}

+ (id)recordType
{
  return @"SharedSummaryTransactionRecordType";
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
  v8 = [v5 stringWithFormat:@"%@/%@", @"SharedSummaryTransactionRecord", v7];

  v9 = (void *)[objc_alloc(MEMORY[0x1E4F1A2F8]) initWithRecordName:v8 zoneID:v6];

  return v9;
}

+ (BOOL)isTransactionRecord:(id)a3
{
  v3 = [a3 recordType];
  char v4 = [v3 isEqualToString:@"SharedSummaryTransactionRecordType"];

  return v4;
}

- (id)initInZone:(id)a3 UUID:(id)a4 sourceDeviceIdentifier:(id)a5 summaryIdentifiers:(id)a6 metadata:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = a3;
  v17 = [(id)objc_opt_class() recordIDWithZoneID:v16 UUID:v12];

  v18 = (void *)[objc_alloc(MEMORY[0x1E4F1A2D8]) initWithRecordType:@"SharedSummaryTransactionRecordType" recordID:v17];
  v19 = [(HDCloudSyncSharedSummaryTransactionRecord *)self initWithCKRecord:v18 schemaVersion:1];
  if (v19)
  {
    v20 = [v12 UUIDString];
    v21 = (void *)[v20 copy];
    [(HDCloudSyncCodableSharedSummaryTransactionRecord *)v19->_underlyingTransactionRecord setUuid:v21];

    v22 = (void *)[v13 copy];
    [(HDCloudSyncCodableSharedSummaryTransactionRecord *)v19->_underlyingTransactionRecord setSourceDeviceIdentifier:v22];

    v23 = objc_msgSend(v14, "hk_map:", &__block_literal_global_123);
    v24 = (void *)[v23 mutableCopy];
    [(HDCloudSyncCodableSharedSummaryTransactionRecord *)v19->_underlyingTransactionRecord setSummaryIdentifiers:v24];

    v25 = (void *)[v15 copy];
    [(HDCloudSyncCodableSharedSummaryTransactionRecord *)v19->_underlyingTransactionRecord setMetadata:v25];
  }
  return v19;
}

uint64_t __112__HDCloudSyncSharedSummaryTransactionRecord_initInZone_UUID_sourceDeviceIdentifier_summaryIdentifiers_metadata___block_invoke(uint64_t a1, void *a2)
{
  return [a2 UUIDString];
}

- (HDCloudSyncSharedSummaryTransactionRecord)initWithCKRecord:(id)a3 schemaVersion:(int64_t)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)HDCloudSyncSharedSummaryTransactionRecord;
  char v4 = [(HDCloudSyncRecord *)&v14 initWithCKRecord:a3 schemaVersion:a4];
  BOOL v5 = v4;
  if (!v4) {
    goto LABEL_9;
  }
  id v6 = [(HDCloudSyncRecord *)v4 underlyingMessage];
  if (!v6)
  {
    v11 = objc_alloc_init(HDCloudSyncCodableSharedSummaryTransactionRecord);
    underlyingTransactionRecord = v5->_underlyingTransactionRecord;
    v5->_underlyingTransactionRecord = v11;

    goto LABEL_8;
  }
  v7 = [[HDCloudSyncCodableSharedSummaryTransactionRecord alloc] initWithData:v6];
  v8 = v5->_underlyingTransactionRecord;
  v5->_underlyingTransactionRecord = v7;

  if (v5->_underlyingTransactionRecord)
  {
LABEL_8:

LABEL_9:
    v10 = v5;
    goto LABEL_10;
  }
  _HKInitializeLogging();
  v9 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v16 = v5;
    _os_log_fault_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_FAULT, "[summary-sharing] %{public}@: Failed to decode underlying record.", buf, 0xCu);
  }

  v10 = 0;
LABEL_10:

  return v10;
}

- (NSUUID)UUID
{
  id v3 = objc_alloc(MEMORY[0x1E4F29128]);
  char v4 = [(HDCloudSyncCodableSharedSummaryTransactionRecord *)self->_underlyingTransactionRecord uuid];
  BOOL v5 = (void *)[v3 initWithUUIDString:v4];

  return (NSUUID *)v5;
}

- (NSString)sourceDeviceIdentifier
{
  v2 = [(HDCloudSyncCodableSharedSummaryTransactionRecord *)self->_underlyingTransactionRecord sourceDeviceIdentifier];
  id v3 = (void *)[v2 copy];

  return (NSString *)v3;
}

- (NSArray)summaryIdentifiers
{
  v2 = [(HDCloudSyncCodableSharedSummaryTransactionRecord *)self->_underlyingTransactionRecord summaryIdentifiers];
  id v3 = objc_msgSend(v2, "hk_map:", &__block_literal_global_293_1);

  return (NSArray *)v3;
}

id __63__HDCloudSyncSharedSummaryTransactionRecord_summaryIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x1E4F29128];
  id v3 = a2;
  char v4 = (void *)[[v2 alloc] initWithUUIDString:v3];

  return v4;
}

- (NSData)metadata
{
  return [(HDCloudSyncCodableSharedSummaryTransactionRecord *)self->_underlyingTransactionRecord metadata];
}

- (id)serializeUnderlyingMessage
{
  return (id)[(HDCloudSyncCodableSharedSummaryTransactionRecord *)self->_underlyingTransactionRecord data];
}

+ (BOOL)shouldSerializeUnderlyingMessageAsProtected
{
  return 1;
}

- (id)printDescription
{
  v2 = NSString;
  id v3 = [(HDCloudSyncSharedSummaryTransactionRecord *)self sourceDeviceIdentifier];
  char v4 = [v2 stringWithFormat:@"+ Source Device Identifier: %@\n+--------------------------------------------------", v3];

  return v4;
}

- (void).cxx_destruct
{
}

@end