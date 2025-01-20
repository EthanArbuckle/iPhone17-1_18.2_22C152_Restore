@interface HDCloudSyncStateRecord
+ (BOOL)hasFutureSchema:(id)a3;
+ (BOOL)isStateRecord:(id)a3;
+ (BOOL)requiresEncryptedSchemaVersion;
+ (BOOL)requiresUnderlyingMessage;
+ (BOOL)shouldSerializeUnderlyingMessageAsProtected;
+ (id)recordIDWithZoneID:(id)a3 recordIdentifier:(id)a4;
+ (id)recordType;
+ (id)recordWithStateData:(id)a3 zoneID:(id)a4 recordIdentifier:(id)a5 error:(id *)a6;
- (BOOL)hasStateData;
- (HDCloudSyncStateRecord)initWithCKRecord:(id)a3 schemaVersion:(int64_t)a4;
- (NSData)stateData;
- (NSString)key;
- (NSURL)stateDataAssetURL;
- (id)_createAssetWithStateData:(id)a3 error:(id *)a4;
- (id)_initWithStateData:(id)a3 zoneID:(id)a4 recordIdentifier:(id)a5 error:(id *)a6;
- (id)initInZone:(id)a3 recordIdentifier:(id)a4;
- (id)serializeUnderlyingMessage;
- (void)setStateData:(id)a3;
- (void)updateStateData:(id)a3;
@end

@implementation HDCloudSyncStateRecord

- (id)initInZone:(id)a3 recordIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(id)objc_opt_class() recordIDWithZoneID:v7 recordIdentifier:v6];

  v9 = (void *)[objc_alloc(MEMORY[0x1E4F1A2D8]) initWithRecordType:@"CloudSyncStateRecord" recordID:v8];
  v10 = [(HDCloudSyncStateRecord *)self initWithCKRecord:v9 schemaVersion:1];

  return v10;
}

- (HDCloudSyncStateRecord)initWithCKRecord:(id)a3 schemaVersion:(int64_t)a4
{
  v15.receiver = self;
  v15.super_class = (Class)HDCloudSyncStateRecord;
  v4 = [(HDCloudSyncRecord *)&v15 initWithCKRecord:a3 schemaVersion:a4];
  v5 = v4;
  if (!v4) {
    goto LABEL_9;
  }
  id v6 = [(HDCloudSyncRecord *)v4 underlyingMessage];
  if (!v6)
  {
    v11 = objc_alloc_init(HDCloudSyncCodableState);
    underlyingStateData = v5->_underlyingStateData;
    v5->_underlyingStateData = v11;

    goto LABEL_8;
  }
  id v7 = [[HDCloudSyncCodableState alloc] initWithData:v6];
  v8 = v5->_underlyingStateData;
  v5->_underlyingStateData = v7;

  if (v5->_underlyingStateData)
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
    v14[0] = 0;
    _os_log_fault_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_FAULT, "Failed to decode underlying state message.", (uint8_t *)v14, 2u);
  }

  v10 = 0;
LABEL_10:

  return v10;
}

+ (id)recordWithStateData:(id)a3 zoneID:(id)a4 recordIdentifier:(id)a5 error:(id *)a6
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [[HDCloudSyncStateRecord alloc] _initWithStateData:v11 zoneID:v10 recordIdentifier:v9 error:a6];

  return v12;
}

- (id)_initWithStateData:(id)a3 zoneID:(id)a4 recordIdentifier:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a4;
  v13 = [(id)objc_opt_class() recordIDWithZoneID:v12 recordIdentifier:v11];

  v14 = (void *)[objc_alloc(MEMORY[0x1E4F1A2D8]) initWithRecordType:@"CloudSyncStateRecord" recordID:v13];
  objc_super v15 = [(HDCloudSyncStateRecord *)self initWithCKRecord:v14 schemaVersion:1];
  if (v15)
  {
    if ((unint64_t)[v10 length] >> 20)
    {
      v16 = [(HDCloudSyncStateRecord *)v15 _createAssetWithStateData:v10 error:a6];
      if (v16)
      {
        [v14 setObject:v16 forKeyedSubscript:@"CloudSyncStateAsset"];
      }
      else
      {
        _HKInitializeLogging();
        v17 = *MEMORY[0x1E4F29FA8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)v19 = 0;
          _os_log_fault_impl(&dword_1BCB7D000, v17, OS_LOG_TYPE_FAULT, "Unable to create CKAsset for State Sync record", v19, 2u);
        }
      }
    }
    else
    {
      [(HDCloudSyncCodableState *)v15->_underlyingStateData setStateData:v10];
    }
  }

  return v15;
}

- (id)_createAssetWithStateData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  id v7 = [v6 temporaryDirectory];
  v8 = [MEMORY[0x1E4F29128] UUID];
  id v9 = [v8 UUIDString];
  id v10 = [v7 URLByAppendingPathComponent:v9];

  id v11 = HDAssetFileHandleForFileURL(v10, v6, (uint64_t)a4);
  id v12 = v11;
  if (v11 && [v11 writeData:v5 error:a4])
  {
    int v13 = _HDIsUnitTesting;
    id v14 = objc_alloc(MEMORY[0x1E4F19E50]);
    if (v13) {
      uint64_t v15 = [v14 initWithFileURL:v10];
    }
    else {
      uint64_t v15 = objc_msgSend(v14, "initWithFileDescriptor:", objc_msgSend(v12, "fileDescriptor"));
    }
    v16 = (void *)v15;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (BOOL)isStateRecord:(id)a3
{
  v3 = [a3 recordType];
  char v4 = [v3 isEqualToString:@"CloudSyncStateRecord"];

  return v4;
}

+ (id)recordIDWithZoneID:(id)a3 recordIdentifier:(id)a4
{
  id v5 = NSString;
  id v6 = a3;
  id v7 = [v5 stringWithFormat:@"%@%@%@", @"CloudSyncState", @"/", a4];
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F1A2F8]) initWithRecordName:v7 zoneID:v6];

  return v8;
}

- (NSString)key
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v3 = [(HDCloudSyncRecord *)self record];
  char v4 = [v3 recordID];
  id v5 = [v4 recordName];
  id v6 = [v5 componentsSeparatedByString:@"/"];

  if ([v6 count] == 2)
  {
    id v7 = [v6 lastObject];
  }
  else
  {
    _HKInitializeLogging();
    v8 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_FAULT))
    {
      int v10 = 138412290;
      id v11 = self;
      _os_log_fault_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_FAULT, "Error fetching key from State Sync record %@", (uint8_t *)&v10, 0xCu);
    }
    id v7 = 0;
  }

  return (NSString *)v7;
}

- (void)setStateData:(id)a3
{
}

- (NSData)stateData
{
  return [(HDCloudSyncCodableState *)self->_underlyingStateData stateData];
}

- (BOOL)hasStateData
{
  return [(HDCloudSyncCodableState *)self->_underlyingStateData hasStateData];
}

- (NSURL)stateDataAssetURL
{
  v2 = [(HDCloudSyncRecord *)self record];
  v3 = [v2 objectForKeyedSubscript:@"CloudSyncStateAsset"];

  char v4 = [v3 fileURL];

  return (NSURL *)v4;
}

- (void)updateStateData:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((unint64_t)[v4 length] <= 0x100000)
  {
    [(HDCloudSyncCodableState *)self->_underlyingStateData setStateData:v4];

    id v10 = [(HDCloudSyncRecord *)self record];
    [v10 setObject:0 forKeyedSubscript:@"CloudSyncStateAsset"];
  }
  else
  {
    id v11 = 0;
    id v5 = [(HDCloudSyncStateRecord *)self _createAssetWithStateData:v4 error:&v11];

    id v6 = v11;
    id v7 = v6;
    if (v5 || !v6)
    {
      id v9 = [(HDCloudSyncRecord *)self record];
      [v9 setObject:v5 forKeyedSubscript:@"CloudSyncStateAsset"];

      [(HDCloudSyncCodableState *)self->_underlyingStateData setStateData:0];
    }
    else
    {
      _HKInitializeLogging();
      v8 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        int v13 = self;
        __int16 v14 = 2114;
        uint64_t v15 = v7;
        _os_log_error_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_ERROR, "%{public}@ Failed to update asset on HDCloudSyncStateRecord, %{public}@", buf, 0x16u);
      }
    }
  }
}

+ (BOOL)requiresUnderlyingMessage
{
  return 1;
}

+ (BOOL)requiresEncryptedSchemaVersion
{
  return 1;
}

+ (id)recordType
{
  return @"CloudSyncStateRecord";
}

+ (BOOL)hasFutureSchema:(id)a3
{
  v3 = [a3 encryptedValues];
  id v4 = [v3 objectForKeyedSubscript:@"Version"];

  BOOL v5 = v4 && [v4 integerValue] > 1;
  return v5;
}

- (id)serializeUnderlyingMessage
{
  return (id)[(HDCloudSyncCodableState *)self->_underlyingStateData data];
}

+ (BOOL)shouldSerializeUnderlyingMessageAsProtected
{
  return 1;
}

- (void).cxx_destruct
{
}

@end