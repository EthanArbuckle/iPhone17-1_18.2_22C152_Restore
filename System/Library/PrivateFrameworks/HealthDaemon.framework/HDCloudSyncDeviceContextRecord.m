@interface HDCloudSyncDeviceContextRecord
+ (BOOL)hasFutureSchema:(id)a3;
+ (BOOL)isDeviceContextRecord:(id)a3;
+ (BOOL)isDeviceContextRecordID:(id)a3;
+ (BOOL)requiresEncryptedSchemaVersion;
+ (BOOL)requiresUnderlyingMessage;
+ (BOOL)shouldSerializeUnderlyingMessageAsProtected;
+ (id)recordIDWithZoneID:(id)a3 syncIdentity:(id)a4;
+ (id)recordType;
+ (id)unitTest_recordWithRandomIDInZone:(id)a3 deviceContext:(id)a4;
- (HDCloudSyncDeviceContextRecord)initWithCKRecord:(id)a3 schemaVersion:(int64_t)a4;
- (id)codableDeviceContext;
- (id)deviceContext:(id *)a3;
- (id)deviceContextWithError:(id *)a3;
- (id)initInZone:(id)a3 deviceContext:(id)a4;
- (id)printDescription;
- (id)serializeUnderlyingMessage;
- (void)updateDeviceContextWithContext:(id)a3;
@end

@implementation HDCloudSyncDeviceContextRecord

+ (BOOL)isDeviceContextRecord:(id)a3
{
  v3 = [a3 recordType];
  char v4 = [v3 isEqualToString:@"CloudSyncDeviceContextRecordType"];

  return v4;
}

+ (BOOL)isDeviceContextRecordID:(id)a3
{
  v3 = [a3 recordName];
  char v4 = [v3 componentsSeparatedByString:@"/"];

  if ([v4 count] == 2)
  {
    v5 = [v4 objectAtIndexedSubscript:0];
    char v6 = [v5 isEqualToString:@"CloudSyncDeviceContextRecord"];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

+ (id)recordIDWithZoneID:(id)a3 syncIdentity:(id)a4
{
  v5 = NSString;
  id v6 = a3;
  v7 = [a4 identityString];
  v8 = [v5 stringWithFormat:@"%@%@%@", @"CloudSyncDeviceContextRecord", @"/", v7];

  v9 = (void *)[objc_alloc(MEMORY[0x1E4F1A2F8]) initWithRecordName:v8 zoneID:v6];

  return v9;
}

- (id)initInZone:(id)a3 deviceContext:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v6 syncIdentity];
  v9 = +[HDCloudSyncDeviceContextRecord recordIDWithZoneID:v7 syncIdentity:v8];

  v10 = (void *)[objc_alloc(MEMORY[0x1E4F1A2D8]) initWithRecordType:@"CloudSyncDeviceContextRecordType" recordID:v9];
  v11 = [(HDCloudSyncDeviceContextRecord *)self initWithCKRecord:v10 schemaVersion:1];
  v12 = v11;
  if (v11) {
    setUnderlyingDeviceContext(v11->_underlyingDeviceContext, v6);
  }

  return v12;
}

- (id)deviceContextWithError:(id *)a3
{
  v5 = [(HDCloudSyncCodableDeviceContext *)self->_underlyingDeviceContext syncIdentity];
  id v6 = +[HDSyncIdentity syncIdentityWithCodable:v5 error:a3];

  if (v6)
  {
    id v7 = [HDDeviceContext alloc];
    int64_t v8 = [(HDCloudSyncCodableDeviceContext *)self->_underlyingDeviceContext type];
    v9 = [(HDCloudSyncCodableDeviceContext *)self->_underlyingDeviceContext productTypeName];
    v10 = [(HDCloudSyncCodableDeviceContext *)self->_underlyingDeviceContext currentOSName];
    v11 = [(HDCloudSyncCodableDeviceContext *)self->_underlyingDeviceContext currentOSVersion];
    HKNSOperatingSystemVersionFromString();
    v12 = (void *)MEMORY[0x1E4F1C9C8];
    [(HDCloudSyncCodableDeviceContext *)self->_underlyingDeviceContext modificationDate];
    v13 = objc_msgSend(v12, "dateWithTimeIntervalSinceReferenceDate:");
    v14 = [(HDDeviceContext *)v7 initWithType:v8 productTypeName:v9 currentOSName:v10 currentOSVersion:v17 modificationDate:v13 syncIdentity:v6];
  }
  else
  {
    _HKInitializeLogging();
    v15 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1BCB7D000, v15, OS_LOG_TYPE_FAULT, "Failed to decode sync identity from its codable.", buf, 2u);
    }
    v14 = 0;
  }

  return v14;
}

- (HDCloudSyncDeviceContextRecord)initWithCKRecord:(id)a3 schemaVersion:(int64_t)a4
{
  v15.receiver = self;
  v15.super_class = (Class)HDCloudSyncDeviceContextRecord;
  char v4 = [(HDCloudSyncRecord *)&v15 initWithCKRecord:a3 schemaVersion:a4];
  v5 = v4;
  if (!v4) {
    goto LABEL_9;
  }
  id v6 = [(HDCloudSyncRecord *)v4 underlyingMessage];
  if (!v6)
  {
    v11 = objc_alloc_init(HDCloudSyncCodableDeviceContext);
    underlyingDeviceContext = v5->_underlyingDeviceContext;
    v5->_underlyingDeviceContext = v11;

    goto LABEL_8;
  }
  id v7 = [[HDCloudSyncCodableDeviceContext alloc] initWithData:v6];
  int64_t v8 = v5->_underlyingDeviceContext;
  v5->_underlyingDeviceContext = v7;

  if (v5->_underlyingDeviceContext)
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
    _os_log_fault_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_FAULT, "Failed to decode underlying device context message.", (uint8_t *)v14, 2u);
  }

  v10 = 0;
LABEL_10:

  return v10;
}

- (void)updateDeviceContextWithContext:(id)a3
{
}

- (id)codableDeviceContext
{
  return self->_underlyingDeviceContext;
}

- (id)deviceContext:(id *)a3
{
  if ([(HDCloudSyncCodableDeviceContext *)self->_underlyingDeviceContext hasCurrentOSName])
  {
    if ([(HDCloudSyncCodableDeviceContext *)self->_underlyingDeviceContext hasCurrentOSVersion])
    {
      if ([(HDCloudSyncCodableDeviceContext *)self->_underlyingDeviceContext hasProductTypeName])
      {
        if ([(HDCloudSyncCodableDeviceContext *)self->_underlyingDeviceContext hasModificationDate])
        {
          v5 = [(HDCloudSyncCodableDeviceContext *)self->_underlyingDeviceContext syncIdentity];
          id v6 = +[HDSyncIdentity syncIdentityWithCodable:v5 error:a3];

          if (v6)
          {
            id v7 = [HDDeviceContext alloc];
            int64_t v8 = [(HDCloudSyncCodableDeviceContext *)self->_underlyingDeviceContext type];
            v9 = [(HDCloudSyncCodableDeviceContext *)self->_underlyingDeviceContext productTypeName];
            v10 = [(HDCloudSyncCodableDeviceContext *)self->_underlyingDeviceContext currentOSName];
            v11 = [(HDCloudSyncCodableDeviceContext *)self->_underlyingDeviceContext currentOSVersion];
            HKNSOperatingSystemVersionFromString();
            [(HDCloudSyncCodableDeviceContext *)self->_underlyingDeviceContext modificationDate];
            v12 = HDDecodeDateForValue();
            v13 = [(HDDeviceContext *)v7 initWithType:v8 productTypeName:v9 currentOSName:v10 currentOSVersion:v17 modificationDate:v12 syncIdentity:v6];
          }
          else
          {
            v13 = 0;
          }

          goto LABEL_12;
        }
        v14 = (void *)MEMORY[0x1E4F28C58];
        objc_super v15 = @"Missing modification date";
      }
      else
      {
        v14 = (void *)MEMORY[0x1E4F28C58];
        objc_super v15 = @"Missing Product type name";
      }
    }
    else
    {
      v14 = (void *)MEMORY[0x1E4F28C58];
      objc_super v15 = @"Missing OS Version";
    }
  }
  else
  {
    v14 = (void *)MEMORY[0x1E4F28C58];
    objc_super v15 = @"Missing OS Name";
  }
  objc_msgSend(v14, "hk_assignError:code:format:", a3, 3, v15);
  v13 = 0;
LABEL_12:

  return v13;
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
  return @"CloudSyncDeviceContextRecordType";
}

+ (BOOL)hasFutureSchema:(id)a3
{
  v3 = [a3 encryptedValues];
  char v4 = [v3 objectForKeyedSubscript:@"Version"];

  BOOL v5 = v4 && [v4 integerValue] > 1;
  return v5;
}

- (id)serializeUnderlyingMessage
{
  return (id)[(HDCloudSyncCodableDeviceContext *)self->_underlyingDeviceContext data];
}

+ (BOOL)shouldSerializeUnderlyingMessageAsProtected
{
  return 1;
}

- (id)printDescription
{
  v3 = [(HDCloudSyncCodableDeviceContext *)self->_underlyingDeviceContext syncIdentity];
  id v13 = 0;
  char v4 = +[HDSyncIdentity syncIdentityWithCodable:v3 error:&v13];
  id v5 = v13;

  id v6 = NSString;
  id v7 = [(HDCloudSyncCodableDeviceContext *)self->_underlyingDeviceContext productTypeName];
  int64_t v8 = [(HDCloudSyncCodableDeviceContext *)self->_underlyingDeviceContext currentOSVersion];
  v9 = [(HDCloudSyncCodableDeviceContext *)self->_underlyingDeviceContext currentOSName];
  [(HDCloudSyncCodableDeviceContext *)self->_underlyingDeviceContext modificationDate];

  v10 = HDDecodeDateForValue();
  v11 = [v6 stringWithFormat:@"+ Product Type Name: %@\n+ Current OS Version: %@\n+ Current OS Name: %@\n+ Sync identity: %@\n+ Modification date: %@\n+--------------------------------------------------", v7, v8, v9, v4, v10];

  return v11;
}

+ (id)unitTest_recordWithRandomIDInZone:(id)a3 deviceContext:(id)a4
{
  id v6 = NSString;
  id v7 = (void *)MEMORY[0x1E4F29128];
  id v8 = a4;
  id v9 = a3;
  v10 = [v7 UUID];
  v11 = [v10 UUIDString];
  v12 = [v6 stringWithFormat:@"%@%@%@", @"CloudSyncDeviceContextRecord", @"/", v11];

  id v13 = (void *)[objc_alloc(MEMORY[0x1E4F1A2F8]) initWithRecordName:v12 zoneID:v9];
  id v14 = objc_alloc((Class)a1);
  id v15 = v8;
  if (v14)
  {
    v16 = (objc_class *)MEMORY[0x1E4F1A2D8];
    id v17 = v13;
    v18 = (void *)[[v16 alloc] initWithRecordType:@"CloudSyncDeviceContextRecordType" recordID:v17];

    uint64_t v19 = [v14 initWithCKRecord:v18 schemaVersion:1];
    v20 = (void *)v19;
    if (v19) {
      setUnderlyingDeviceContext(*(void **)(v19 + 24), v15);
    }
    id v14 = v20;
  }

  return v14;
}

- (void).cxx_destruct
{
}

@end