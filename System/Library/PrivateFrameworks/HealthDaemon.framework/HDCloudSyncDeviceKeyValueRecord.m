@interface HDCloudSyncDeviceKeyValueRecord
+ (BOOL)hasFutureSchema:(id)a3;
+ (BOOL)isDeviceKeyValueRecord:(id)a3;
+ (BOOL)isDeviceKeyValueRecordID:(id)a3;
+ (BOOL)requiresEncryptedSchemaVersion;
+ (BOOL)requiresUnderlyingMessage;
+ (BOOL)shouldSerializeUnderlyingMessageAsProtected;
+ (id)fieldsForUnprotectedSerialization;
+ (id)recordType;
- (BOOL)isEqual:(id)a3;
- (HDCloudSyncCodableDeviceKeyValue)underlyingDeviceKeyValue;
- (HDCloudSyncDeviceKeyValueRecord)initWithCKRecord:(id)a3 schemaVersion:(int64_t)a4;
- (id)codableDeviceKeyValueEntry;
- (id)deviceContextRecordID;
- (id)deviceKeyValueEntry:(id *)a3;
- (id)initInZone:(id)a3 deviceKeyValueEntry:(id)a4 deviceContextRecord:(id)a5 UUID:(id)a6;
- (id)printDescription;
- (id)serializeUnderlyingMessage;
- (id)syncIdentity;
- (void)setUnderlyingDeviceKeyValue:(id)a3;
- (void)updateDeviceKeyValueEntry:(id)a3;
@end

@implementation HDCloudSyncDeviceKeyValueRecord

+ (BOOL)isDeviceKeyValueRecord:(id)a3
{
  v3 = [a3 recordType];
  char v4 = [v3 isEqualToString:@"CloudSyncDeviceKeyValueRecordType"];

  return v4;
}

+ (BOOL)isDeviceKeyValueRecordID:(id)a3
{
  v3 = [a3 recordName];
  char v4 = [v3 componentsSeparatedByString:@"/"];

  if ([v4 count] == 2)
  {
    v5 = [v4 objectAtIndexedSubscript:0];
    char v6 = [v5 isEqualToString:@"CloudSyncDeviceKeyValueRecord"];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (id)deviceContextRecordID
{
  v2 = [(HDCloudSyncRecord *)self record];
  v3 = [v2 objectForKeyedSubscript:@"HDCloudSyncDeviceContextRecordReference"];

  char v4 = [v3 recordID];

  return v4;
}

+ (id)fieldsForUnprotectedSerialization
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___HDCloudSyncDeviceKeyValueRecord;
  v2 = objc_msgSendSuper2(&v8, sel_fieldsForUnprotectedSerialization);
  uint64_t v9 = objc_opt_class();
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v9 count:1];
  char v4 = +[HDCloudSyncSerializedField fieldForKey:@"HDCloudSyncDeviceContextRecordReference" classes:v3 encrypted:0];
  v10[0] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  char v6 = [v2 arrayByAddingObjectsFromArray:v5];

  return v6;
}

- (id)initInZone:(id)a3 deviceKeyValueEntry:(id)a4 deviceContextRecord:(id)a5 UUID:(id)a6
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = a3;
  self;
  v14 = NSString;
  v15 = [v12 UUIDString];

  v16 = [v14 stringWithFormat:@"%@/%@", @"CloudSyncDeviceKeyValueRecord", v15];

  v17 = (void *)[objc_alloc(MEMORY[0x1E4F1A2F8]) initWithRecordName:v16 zoneID:v13];
  v18 = (void *)[objc_alloc(MEMORY[0x1E4F1A2D8]) initWithRecordType:@"CloudSyncDeviceKeyValueRecordType" recordID:v17];
  id v31 = 0;
  v19 = [v11 deviceContextWithError:&v31];
  id v20 = v31;
  if (v20)
  {
    _HKInitializeLogging();
    v21 = *MEMORY[0x1E4F29F28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v33 = v20;
      _os_log_fault_impl(&dword_1BCB7D000, v21, OS_LOG_TYPE_FAULT, "Error %@ fetching device context from record", buf, 0xCu);
    }
    v22 = 0;
  }
  else
  {
    v23 = [(HDCloudSyncDeviceKeyValueRecord *)self initWithCKRecord:v18 schemaVersion:1];
    if (v23)
    {
      id v24 = objc_alloc(MEMORY[0x1E4F1A348]);
      v25 = [v11 record];
      v26 = [v25 recordID];
      v27 = (void *)[v24 initWithRecordID:v26 action:1];
      [v18 setObject:v27 forKeyedSubscript:@"HDCloudSyncDeviceContextRecordReference"];

      v28 = [v19 syncIdentity];
      v29 = [v28 codableSyncIdentity];
      [(HDCloudSyncCodableDeviceKeyValue *)v23->_underlyingDeviceKeyValue setSyncIdentity:v29];

      setUnderlyingDeviceKeyValue(v23->_underlyingDeviceKeyValue, v10);
    }
    self = v23;
    v22 = self;
  }

  return v22;
}

- (HDCloudSyncDeviceKeyValueRecord)initWithCKRecord:(id)a3 schemaVersion:(int64_t)a4
{
  v15.receiver = self;
  v15.super_class = (Class)HDCloudSyncDeviceKeyValueRecord;
  char v4 = [(HDCloudSyncRecord *)&v15 initWithCKRecord:a3 schemaVersion:a4];
  v5 = v4;
  if (!v4) {
    goto LABEL_9;
  }
  char v6 = [(HDCloudSyncRecord *)v4 underlyingMessage];
  if (!v6)
  {
    id v11 = objc_alloc_init(HDCloudSyncCodableDeviceKeyValue);
    underlyingDeviceKeyValue = v5->_underlyingDeviceKeyValue;
    v5->_underlyingDeviceKeyValue = v11;

    goto LABEL_8;
  }
  v7 = [[HDCloudSyncCodableDeviceKeyValue alloc] initWithData:v6];
  objc_super v8 = v5->_underlyingDeviceKeyValue;
  v5->_underlyingDeviceKeyValue = v7;

  if (v5->_underlyingDeviceKeyValue)
  {
LABEL_8:

LABEL_9:
    id v10 = v5;
    goto LABEL_10;
  }
  _HKInitializeLogging();
  uint64_t v9 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_FAULT))
  {
    v14[0] = 0;
    _os_log_fault_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_FAULT, "Failed to decode underlying key value entry message.", (uint8_t *)v14, 2u);
  }

  id v10 = 0;
LABEL_10:

  return v10;
}

- (id)syncIdentity
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = [(HDCloudSyncCodableDeviceKeyValue *)self->_underlyingDeviceKeyValue syncIdentity];
  id v8 = 0;
  v3 = +[HDSyncIdentity syncIdentityWithCodable:v2 error:&v8];
  id v4 = v8;

  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    _HKInitializeLogging();
    char v6 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v10 = v4;
      _os_log_fault_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_FAULT, "Failed to extract sync identity from codable %@", buf, 0xCu);
    }
  }

  return v3;
}

- (void)updateDeviceKeyValueEntry:(id)a3
{
}

- (id)codableDeviceKeyValueEntry
{
  return self->_underlyingDeviceKeyValue;
}

- (id)deviceKeyValueEntry:(id *)a3
{
  if (![(HDCloudSyncCodableDeviceKeyValue *)self->_underlyingDeviceKeyValue hasKey])
  {
    v14 = (void *)MEMORY[0x1E4F28C58];
    objc_super v15 = @"Error extracting device key value storage entry from record due to missing key";
LABEL_14:
    objc_msgSend(v14, "hk_assignError:code:format:", a3, 3, v15);
    id v13 = 0;
    goto LABEL_15;
  }
  if (![(HDCloudSyncCodableDeviceKeyValue *)self->_underlyingDeviceKeyValue hasValue])
  {
    v14 = (void *)MEMORY[0x1E4F28C58];
    objc_super v15 = @"Error extracting device key value storage entry from record due to missing value";
    goto LABEL_14;
  }
  if (![(HDCloudSyncCodableDeviceKeyValue *)self->_underlyingDeviceKeyValue hasDomain])
  {
    v14 = (void *)MEMORY[0x1E4F28C58];
    objc_super v15 = @"Error extracting device key value storage entry from record due to missing domain";
    goto LABEL_14;
  }
  if (![(HDCloudSyncCodableDeviceKeyValue *)self->_underlyingDeviceKeyValue hasModificationDate])
  {
    v14 = (void *)MEMORY[0x1E4F28C58];
    objc_super v15 = @"Error extracting device key value storage entry from record due to missing modification date";
    goto LABEL_14;
  }
  if (![(HDCloudSyncCodableDeviceKeyValue *)self->_underlyingDeviceKeyValue hasSyncIdentity])
  {
    v14 = (void *)MEMORY[0x1E4F28C58];
    objc_super v15 = @"Error extracting device key value storage entry from record due to missing sync identity";
    goto LABEL_14;
  }
  id v5 = [(HDCloudSyncCodableDeviceKeyValue *)self->_underlyingDeviceKeyValue syncIdentity];
  char v6 = +[HDSyncIdentity syncIdentityWithCodable:v5 error:a3];

  if (!v6)
  {
LABEL_19:
    id v13 = 0;
    goto LABEL_20;
  }
  if (![(HDCloudSyncCodableDeviceKeyValue *)self->_underlyingDeviceKeyValue hasProtectionCategory])
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a3, 3, @"Error extracting device key value storage entry from record due to missing protection category");
    goto LABEL_19;
  }
  v7 = [HDDeviceKeyValueStorageEntry alloc];
  id v8 = [(HDCloudSyncCodableDeviceKeyValue *)self->_underlyingDeviceKeyValue domain];
  uint64_t v9 = [(HDCloudSyncCodableDeviceKeyValue *)self->_underlyingDeviceKeyValue key];
  id v10 = [(HDCloudSyncCodableDeviceKeyValue *)self->_underlyingDeviceKeyValue value];
  uint64_t v11 = (void *)MEMORY[0x1E4F1C9C8];
  [(HDCloudSyncCodableDeviceKeyValue *)self->_underlyingDeviceKeyValue modificationDate];
  id v12 = objc_msgSend(v11, "dateWithTimeIntervalSinceReferenceDate:");
  id v13 = [(HDDeviceKeyValueStorageEntry *)v7 initWithDomain:v8 key:v9 value:v10 modificationDate:v12 syncIdentity:v6 category:[(HDCloudSyncCodableDeviceKeyValue *)self->_underlyingDeviceKeyValue protectionCategory]];

LABEL_20:
LABEL_15:

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
  return @"CloudSyncDeviceKeyValueRecordType";
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
  return (id)[(HDCloudSyncCodableDeviceKeyValue *)self->_underlyingDeviceKeyValue data];
}

+ (BOOL)shouldSerializeUnderlyingMessageAsProtected
{
  return 1;
}

- (id)printDescription
{
  v3 = NSString;
  id v4 = [(HDCloudSyncCodableDeviceKeyValue *)self->_underlyingDeviceKeyValue key];
  BOOL v5 = [(HDCloudSyncCodableDeviceKeyValue *)self->_underlyingDeviceKeyValue value];
  [(HDCloudSyncCodableDeviceKeyValue *)self->_underlyingDeviceKeyValue modificationDate];
  char v6 = HDDecodeDateForValue();
  v7 = [v3 stringWithFormat:@"+ Key: %@\n+ Value: %@\n+ Modification date: %@\n+--------------------------------------------------", v4, v5, v6];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HDCloudSyncDeviceKeyValueRecord *)a3;
  if (self == v4)
  {
    char v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v5 = v4;
      underlyingDeviceKeyValue = self->_underlyingDeviceKeyValue;
      v7 = [(HDCloudSyncDeviceKeyValueRecord *)v5 underlyingDeviceKeyValue];
      if ([(HDCloudSyncCodableDeviceKeyValue *)underlyingDeviceKeyValue isEqual:v7])
      {
        id v8 = [(HDCloudSyncRecord *)self record];
        uint64_t v9 = [v8 objectForKeyedSubscript:@"HDCloudSyncDeviceContextRecordReference"];
        id v10 = [(HDCloudSyncRecord *)v5 record];
        uint64_t v11 = [v10 objectForKeyedSubscript:@"HDCloudSyncDeviceContextRecordReference"];
        char v12 = [v9 isEqual:v11];
      }
      else
      {
        char v12 = 0;
      }
    }
    else
    {
      char v12 = 0;
    }
  }

  return v12;
}

- (HDCloudSyncCodableDeviceKeyValue)underlyingDeviceKeyValue
{
  return self->_underlyingDeviceKeyValue;
}

- (void)setUnderlyingDeviceKeyValue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end