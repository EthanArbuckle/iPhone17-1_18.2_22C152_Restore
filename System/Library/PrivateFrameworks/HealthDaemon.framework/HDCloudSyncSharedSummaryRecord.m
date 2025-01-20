@interface HDCloudSyncSharedSummaryRecord
+ (BOOL)hasFutureSchema:(id)a3;
+ (BOOL)isSummaryRecord:(id)a3;
+ (BOOL)requiresUnderlyingMessage;
+ (BOOL)shouldSerializeUnderlyingMessageAsProtected;
+ (id)recordIDWithZoneID:(id)a3 UUID:(id)a4;
+ (id)recordType;
- (HDCloudSyncSharedSummaryRecord)initWithCKRecord:(id)a3 schemaVersion:(int64_t)a4;
- (NSArray)authorizationIdentifiers;
- (NSArray)objectTypes;
- (NSData)summaryData;
- (NSString)compatibilityVersion;
- (NSString)name;
- (NSString)package;
- (NSString)version;
- (NSUUID)UUID;
- (id)initInZone:(id)a3 UUID:(id)a4 package:(id)a5 name:(id)a6 version:(id)a7 compatibilityVersion:(id)a8 objectTypes:(id)a9 authorizationIdentifiers:(id)a10 summaryData:(id)a11;
- (id)printDescription;
- (id)serializeUnderlyingMessage;
@end

@implementation HDCloudSyncSharedSummaryRecord

+ (BOOL)requiresUnderlyingMessage
{
  return 1;
}

+ (id)recordType
{
  return @"SharedSummaryRecordType";
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
  v8 = [v5 stringWithFormat:@"%@/%@", @"SharedSummaryRecord", v7];

  v9 = (void *)[objc_alloc(MEMORY[0x1E4F1A2F8]) initWithRecordName:v8 zoneID:v6];

  return v9;
}

+ (BOOL)isSummaryRecord:(id)a3
{
  v3 = [a3 recordType];
  char v4 = [v3 isEqualToString:@"SharedSummaryRecordType"];

  return v4;
}

- (id)initInZone:(id)a3 UUID:(id)a4 package:(id)a5 name:(id)a6 version:(id)a7 compatibilityVersion:(id)a8 objectTypes:(id)a9 authorizationIdentifiers:(id)a10 summaryData:(id)a11
{
  id v17 = a4;
  id v39 = a5;
  id v38 = a6;
  id v37 = a7;
  id v36 = a8;
  id v18 = a9;
  id v19 = a10;
  id v20 = a11;
  id v21 = a3;
  v22 = [(id)objc_opt_class() recordIDWithZoneID:v21 UUID:v17];

  v23 = (void *)[objc_alloc(MEMORY[0x1E4F1A2D8]) initWithRecordType:@"SharedSummaryRecordType" recordID:v22];
  v24 = [(HDCloudSyncSharedSummaryRecord *)self initWithCKRecord:v23 schemaVersion:1];
  if (v24)
  {
    v25 = [v17 UUIDString];
    v26 = (void *)[v25 copy];
    [(HDCloudSyncCodableSharedSummaryRecord *)v24->_underlyingSummaryRecord setUuid:v26];

    v27 = (void *)[v39 copy];
    [(HDCloudSyncCodableSharedSummaryRecord *)v24->_underlyingSummaryRecord setPackage:v27];

    v28 = (void *)[v38 copy];
    [(HDCloudSyncCodableSharedSummaryRecord *)v24->_underlyingSummaryRecord setName:v28];

    v29 = (void *)[v37 copy];
    [(HDCloudSyncCodableSharedSummaryRecord *)v24->_underlyingSummaryRecord setVersion:v29];

    v30 = (void *)[v36 copy];
    [(HDCloudSyncCodableSharedSummaryRecord *)v24->_underlyingSummaryRecord setCompatibilityVersion:v30];

    v31 = objc_msgSend(v18, "hk_map:", &__block_literal_global_205);
    v32 = (void *)[v31 mutableCopy];
    [(HDCloudSyncCodableSharedSummaryRecord *)v24->_underlyingSummaryRecord setObjectTypeIdentifiers:v32];

    v33 = (void *)[v19 copy];
    [(HDCloudSyncCodableSharedSummaryRecord *)v24->_underlyingSummaryRecord setAuthorizationCategories:v33];

    v34 = (void *)[v20 copy];
    [(HDCloudSyncCodableSharedSummaryRecord *)v24->_underlyingSummaryRecord setSummaryData:v34];
  }
  return v24;
}

uint64_t __141__HDCloudSyncSharedSummaryRecord_initInZone_UUID_package_name_version_compatibilityVersion_objectTypes_authorizationIdentifiers_summaryData___block_invoke(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

- (HDCloudSyncSharedSummaryRecord)initWithCKRecord:(id)a3 schemaVersion:(int64_t)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)HDCloudSyncSharedSummaryRecord;
  char v4 = [(HDCloudSyncRecord *)&v14 initWithCKRecord:a3 schemaVersion:a4];
  BOOL v5 = v4;
  if (!v4) {
    goto LABEL_9;
  }
  id v6 = [(HDCloudSyncRecord *)v4 underlyingMessage];
  if (!v6)
  {
    v11 = objc_alloc_init(HDCloudSyncCodableSharedSummaryRecord);
    underlyingSummaryRecord = v5->_underlyingSummaryRecord;
    v5->_underlyingSummaryRecord = v11;

    goto LABEL_8;
  }
  v7 = [[HDCloudSyncCodableSharedSummaryRecord alloc] initWithData:v6];
  v8 = v5->_underlyingSummaryRecord;
  v5->_underlyingSummaryRecord = v7;

  if (v5->_underlyingSummaryRecord)
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
    v16 = v5;
    _os_log_fault_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_FAULT, "[summary-sharing] %{public}@: Failed to decode underlying record.", buf, 0xCu);
  }

  v10 = 0;
LABEL_10:

  return v10;
}

- (NSUUID)UUID
{
  id v3 = objc_alloc(MEMORY[0x1E4F29128]);
  char v4 = [(HDCloudSyncCodableSharedSummaryRecord *)self->_underlyingSummaryRecord uuid];
  BOOL v5 = (void *)[v3 initWithUUIDString:v4];

  return (NSUUID *)v5;
}

- (NSString)package
{
  return [(HDCloudSyncCodableSharedSummaryRecord *)self->_underlyingSummaryRecord package];
}

- (NSString)name
{
  return [(HDCloudSyncCodableSharedSummaryRecord *)self->_underlyingSummaryRecord name];
}

- (NSString)version
{
  return [(HDCloudSyncCodableSharedSummaryRecord *)self->_underlyingSummaryRecord version];
}

- (NSString)compatibilityVersion
{
  return [(HDCloudSyncCodableSharedSummaryRecord *)self->_underlyingSummaryRecord compatibilityVersion];
}

- (NSArray)objectTypes
{
  v2 = [(HDCloudSyncCodableSharedSummaryRecord *)self->_underlyingSummaryRecord objectTypeIdentifiers];
  id v3 = objc_msgSend(v2, "hk_map:", &__block_literal_global_293_2);

  return (NSArray *)v3;
}

uint64_t __45__HDCloudSyncSharedSummaryRecord_objectTypes__block_invoke(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x1E4F2B2C0] _typeWithIdentifier:a2];
}

- (NSArray)authorizationIdentifiers
{
  v2 = [(HDCloudSyncCodableSharedSummaryRecord *)self->_underlyingSummaryRecord authorizationCategories];
  id v3 = (void *)[v2 copy];

  return (NSArray *)v3;
}

- (NSData)summaryData
{
  return [(HDCloudSyncCodableSharedSummaryRecord *)self->_underlyingSummaryRecord summaryData];
}

- (id)serializeUnderlyingMessage
{
  return (id)[(HDCloudSyncCodableSharedSummaryRecord *)self->_underlyingSummaryRecord data];
}

+ (BOOL)shouldSerializeUnderlyingMessageAsProtected
{
  return 1;
}

- (id)printDescription
{
  id v3 = NSString;
  char v4 = [(HDCloudSyncSharedSummaryRecord *)self name];
  BOOL v5 = [(HDCloudSyncSharedSummaryRecord *)self package];
  id v6 = [(HDCloudSyncSharedSummaryRecord *)self version];
  v7 = [(HDCloudSyncSharedSummaryRecord *)self compatibilityVersion];
  v8 = [(HDCloudSyncSharedSummaryRecord *)self authorizationIdentifiers];
  v9 = [v8 componentsJoinedByString:@", "];
  v10 = [v3 stringWithFormat:@"+ Name: %@\n| Package: %@\n| Version: %@\n| Compatibility Version: %@\n| Authorization Identifiers: %@\n+--------------------------------------------------", v4, v5, v6, v7, v9];

  return v10;
}

- (void).cxx_destruct
{
}

@end