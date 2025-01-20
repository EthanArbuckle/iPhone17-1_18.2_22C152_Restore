@interface HDCloudSyncRecord
+ (BOOL)_deserializeData:(void *)a3 record:(void *)a4 fields:(uint64_t)a5 error:;
+ (BOOL)hasFutureSchema:(id)a3;
+ (BOOL)requiresEncryptedSchemaVersion;
+ (BOOL)requiresUnderlyingMessage;
+ (BOOL)shouldSerializeUnderlyingMessageAsProtected;
+ (id)_serializeRecord:(void *)a3 fields:;
+ (id)fieldsForProtectedSerialization;
+ (id)fieldsForUnprotectedSerialization;
+ (id)initWithSerializedRecord:(id)a3 error:(id *)a4;
+ (id)recordType;
+ (id)recordWithCKRecord:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)repaired;
- (BOOL)unsaved;
- (BOOL)validateWithError:(id *)a3;
- (CKRecord)record;
- (CKRecordID)recordID;
- (HDCloudSyncRecord)init;
- (HDCloudSyncRecord)initWithCKRecord:(id)a3 schemaVersion:(int64_t)a4;
- (NSData)underlyingMessage;
- (id)printDescription;
- (id)serialize;
- (id)serializeUnderlyingMessage;
- (int64_t)schemaVersion;
- (unint64_t)hash;
- (void)setRepaired:(BOOL)a3;
@end

@implementation HDCloudSyncRecord

- (HDCloudSyncRecord)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HDCloudSyncRecord)initWithCKRecord:(id)a3 schemaVersion:(int64_t)a4
{
  id v7 = a3;
  v21.receiver = self;
  v21.super_class = (Class)HDCloudSyncRecord;
  v8 = [(HDCloudSyncRecord *)&v21 init];
  v9 = v8;
  if (v8)
  {
    p_record = (void **)&v8->_record;
    objc_storeStrong((id *)&v8->_record, a3);
    int v11 = [(id)objc_opt_class() requiresEncryptedSchemaVersion];
    v12 = [(CKRecord *)v9->_record allKeys];
    uint64_t v13 = [v12 count];

    if (v13)
    {
      v14 = *p_record;
      if (v11)
      {
        v15 = [v14 encryptedValues];
        v16 = [v15 objectForKeyedSubscript:@"Version"];

        if (!v16) {
          goto LABEL_10;
        }
      }
      else
      {
        v16 = [v14 objectForKeyedSubscript:@"Version"];
        if (!v16) {
          goto LABEL_10;
        }
      }
      if ([v16 integerValue] == a4)
      {
LABEL_11:

        goto LABEL_14;
      }
LABEL_10:

      v9 = 0;
      goto LABEL_11;
    }
    v17 = [NSNumber numberWithInteger:a4];
    v18 = *p_record;
    if (v11)
    {
      v19 = [v18 encryptedValues];
      [v19 setObject:v17 forKeyedSubscript:@"Version"];
    }
    else
    {
      [v18 setObject:v17 forKeyedSubscript:@"Version"];
    }

    v9->_unsaved = 1;
  }
LABEL_14:

  return v9;
}

+ (id)initWithSerializedRecord:(id)a3 error:(id *)a4
{
  id v7 = a3;
  v8 = (void *)MEMORY[0x1E4F1A2D8];
  v9 = [v7 systemData];
  v10 = objc_msgSend(v8, "hd_recordWithSystemData:error:", v9, a4);

  if (!v10)
  {
    objc_super v21 = 0;
    goto LABEL_24;
  }
  int v11 = [a1 fieldsForUnprotectedSerialization];
  if (![v11 count]) {
    goto LABEL_5;
  }
  v12 = [v7 unprotectedDBData];

  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"serializedRecord.unprotectedDBData", objc_opt_class(), a2, @"Class requires unprotected serialized data but none is present in the serialized record.");
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      if (a4) {
        *a4 = v15;
      }
      else {
        _HKLogDroppedError();
      }
    }

    goto LABEL_21;
  }
  uint64_t v13 = [v7 unprotectedDBData];
  BOOL v14 = +[HDCloudSyncRecord _deserializeData:record:fields:error:]((uint64_t)a1, v13, v10, v11, (uint64_t)a4);

  if (v14)
  {
LABEL_5:
    id v15 = [a1 fieldsForProtectedSerialization];
    if (![v15 count])
    {
LABEL_8:
      v19 = [v10 valueStore];
      [v19 resetChangedKeys];

      v20 = [v10 encryptedValueStore];
      [v20 resetChangedKeys];

      objc_super v21 = [a1 recordWithCKRecord:v10 error:a4];
LABEL_22:

      goto LABEL_23;
    }
    v16 = [v7 protectedDBData];

    if (v16)
    {
      v17 = [v7 protectedDBData];
      BOOL v18 = +[HDCloudSyncRecord _deserializeData:record:fields:error:]((uint64_t)a1, v17, v10, v15, (uint64_t)a4);

      if (v18) {
        goto LABEL_8;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"serializedRecord.protectedDBData", objc_opt_class(), a2, @"Class requires protected serialized data but none is present in the serialized record.");
      id v22 = (id)objc_claimAutoreleasedReturnValue();
      if (v22)
      {
        if (a4) {
          *a4 = v22;
        }
        else {
          _HKLogDroppedError();
        }
      }
    }
LABEL_21:
    objc_super v21 = 0;
    goto LABEL_22;
  }
  objc_super v21 = 0;
LABEL_23:

LABEL_24:

  return v21;
}

+ (BOOL)_deserializeData:(void *)a3 record:(void *)a4 fields:(uint64_t)a5 error:
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  self;
  int v11 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v8 error:a5];
  if (v11)
  {
    id v24 = v10;
    id v25 = v8;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v12 = v10;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v27 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          BOOL v18 = objc_msgSend(v17, "classes", v24, v25, (void)v26);
          v19 = [v17 key];
          v20 = [v11 decodeObjectOfClasses:v18 forKey:v19];

          if ([v17 encrypted])
          {
            objc_super v21 = [v9 encryptedValues];
            id v22 = [v17 key];
            [v21 setObject:v20 forKeyedSubscript:v22];
          }
          else
          {
            objc_super v21 = [v17 key];
            [v9 setObject:v20 forKeyedSubscript:v21];
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v14);
    }

    [v11 finishDecoding];
    id v10 = v24;
    id v8 = v25;
  }

  return v11 != 0;
}

- (BOOL)validateWithError:(id *)a3
{
  v5 = [(HDCloudSyncRecord *)self record];
  v6 = (void *)[v5 copy];

  id v7 = [(id)objc_opt_class() recordWithCKRecord:v6 error:a3];
  if (!v7) {
    goto LABEL_5;
  }
  if (![(HDCloudSyncRecord *)self isEqual:v7])
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a3, 709, @"Validation failed for %@; does not compare equal after inflation to %@",
      self,
      v7);
LABEL_5:
    BOOL v8 = 0;
    goto LABEL_6;
  }
  BOOL v8 = 1;
LABEL_6:

  return v8;
}

- (CKRecord)record
{
  v3 = [(HDCloudSyncRecord *)self serializeUnderlyingMessage];
  uint64_t v4 = [(HDCloudSyncRecord *)self underlyingMessage];
  v5 = v4;
  if (v4 != v3 && (!v3 || ([v4 isEqual:v3] & 1) == 0))
  {
    v6 = [(CKRecord *)self->_record encryptedValues];
    [v6 setObject:v3 forKeyedSubscript:@"UnderlyingMessage"];
  }
  id v7 = self->_record;

  return v7;
}

- (CKRecordID)recordID
{
  return [(CKRecord *)self->_record recordID];
}

- (int64_t)schemaVersion
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  int v3 = [(id)objc_opt_class() requiresEncryptedSchemaVersion];
  record = self->_record;
  uint64_t v5 = objc_opt_class();
  if (v3)
  {
    uint64_t v18 = 0;
    v6 = (id *)&v18;
    uint64_t v7 = [(CKRecord *)record hd_requiredEncryptedValueForKey:@"Version" type:v5 error:&v18];
  }
  else
  {
    uint64_t v17 = 0;
    v6 = (id *)&v17;
    uint64_t v7 = [(CKRecord *)record hd_requiredValueForKey:@"Version" type:v5 error:&v17];
  }
  BOOL v8 = (void *)v7;
  id v9 = *v6;
  id v10 = v9;
  if (v8) {
    BOOL v11 = 1;
  }
  else {
    BOOL v11 = v9 == 0;
  }
  if (v11)
  {
    int64_t v12 = [v8 integerValue];
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v13 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_FAULT))
    {
      v16 = self->_record;
      *(_DWORD *)buf = 138543618;
      v20 = v16;
      __int16 v21 = 2114;
      id v22 = v10;
      _os_log_fault_impl(&dword_1BCB7D000, v13, OS_LOG_TYPE_FAULT, "Failed to find schema version in record %{public}@: %{public}@", buf, 0x16u);
    }
    int64_t v12 = 0;
  }

  return v12;
}

- (NSData)underlyingMessage
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int v3 = [(CKRecord *)self->_record encryptedValues];
  uint64_t v4 = [v3 objectForKeyedSubscript:@"UnderlyingMessage"];

  if (v4)
  {
    record = self->_record;
    id v13 = 0;
    v6 = [(CKRecord *)record hd_requiredEncryptedValueForKey:@"UnderlyingMessage" type:objc_opt_class() error:&v13];
    id v7 = v13;
    BOOL v8 = v7;
    if (v6) {
      BOOL v9 = 1;
    }
    else {
      BOOL v9 = v7 == 0;
    }
    if (!v9)
    {
      _HKInitializeLogging();
      id v10 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_FAULT))
      {
        int64_t v12 = self->_record;
        *(_DWORD *)buf = 138543618;
        uint64_t v15 = v12;
        __int16 v16 = 2114;
        uint64_t v17 = v8;
        _os_log_fault_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_FAULT, "Failed to find underlying message in record %{public}@: %{public}@", buf, 0x16u);
      }
    }
  }
  else
  {
    v6 = 0;
  }

  return (NSData *)v6;
}

- (id)serializeUnderlyingMessage
{
  return 0;
}

- (unint64_t)hash
{
  v2 = [(HDCloudSyncRecord *)self record];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [(HDCloudSyncRecord *)self record];
    v6 = [v4 record];
    char v7 = objc_msgSend(v5, "hd_equivalentRecord:", v6);
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

+ (id)recordWithCKRecord:(id)a3 error:(id *)a4
{
  id v7 = a3;
  BOOL v8 = [v7 recordType];
  BOOL v9 = [a1 recordType];
  char v10 = [v8 isEqualToString:v9];

  if ((v10 & 1) == 0)
  {
    id v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = [v7 recordType];
    __int16 v16 = [a1 recordType];
    objc_msgSend(v13, "hk_errorForInvalidArgument:class:selector:format:", @"record", v14, a2, @"record has type (%@), but expected (%@)", v15, v16);
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      if (a4) {
        *a4 = v17;
      }
      else {
        _HKLogDroppedError();
      }
    }

    goto LABEL_14;
  }
  int v11 = [(id)objc_opt_class() requiresEncryptedSchemaVersion];
  uint64_t v12 = objc_opt_class();
  if (v11) {
    objc_msgSend(v7, "hd_requiredEncryptedValueForKey:type:error:", @"Version", v12, a4);
  }
  else {
  uint64_t v15 = objc_msgSend(v7, "hd_requiredValueForKey:type:error:", @"Version", v12, a4);
  }
  if (!v15)
  {
LABEL_14:
    uint64_t v18 = 0;
    goto LABEL_15;
  }
  if (![a1 requiresUnderlyingMessage]
    || (objc_msgSend(v7, "hd_requiredEncryptedValueForKey:type:error:", @"UnderlyingMessage", objc_opt_class(), a4), uint64_t v18 = objc_claimAutoreleasedReturnValue(), v18, v18))
  {
    uint64_t v18 = objc_msgSend(objc_alloc((Class)a1), "initWithCKRecord:schemaVersion:", v7, objc_msgSend(v15, "integerValue"));
  }
LABEL_15:

  return v18;
}

+ (BOOL)requiresUnderlyingMessage
{
  return 0;
}

+ (id)recordType
{
  return 0;
}

+ (BOOL)hasFutureSchema:(id)a3
{
  return 0;
}

+ (BOOL)requiresEncryptedSchemaVersion
{
  return 0;
}

- (id)serialize
{
  unint64_t v3 = [(HDCloudSyncRecord *)self record];
  id v4 = objc_msgSend(v3, "hd_systemData");

  uint64_t v5 = [(id)objc_opt_class() fieldsForUnprotectedSerialization];
  if ([v5 count])
  {
    v6 = [(HDCloudSyncRecord *)self record];
    id v7 = +[HDCloudSyncRecord _serializeRecord:fields:]((uint64_t)HDCloudSyncRecord, v6, v5);
  }
  else
  {
    id v7 = 0;
  }
  BOOL v8 = [(id)objc_opt_class() fieldsForProtectedSerialization];
  if ([v8 count])
  {
    BOOL v9 = [(HDCloudSyncRecord *)self record];
    char v10 = +[HDCloudSyncRecord _serializeRecord:fields:]((uint64_t)HDCloudSyncRecord, v9, v8);
  }
  else
  {
    char v10 = 0;
  }
  int v11 = [[HDCloudSyncSerializedRecord alloc] initWithEncodedSystemData:v4 unprotectedDBData:v7 protectedDBData:v10];

  return v11;
}

+ (id)_serializeRecord:(void *)a3 fields:
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  self;
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if (objc_msgSend(v12, "encrypted", (void)v19))
        {
          id v13 = [v4 encryptedValues];
          uint64_t v14 = [v12 key];
          uint64_t v15 = [v13 objectForKeyedSubscript:v14];
        }
        else
        {
          id v13 = [v12 key];
          uint64_t v15 = [v4 objectForKeyedSubscript:v13];
        }

        __int16 v16 = [v12 key];
        [v6 encodeObject:v15 forKey:v16];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v9);
  }

  [v6 finishEncoding];
  id v17 = [v6 encodedData];

  return v17;
}

+ (id)fieldsForUnprotectedSerialization
{
  v14[1] = *MEMORY[0x1E4F143B8];
  int v2 = [a1 shouldSerializeUnderlyingMessageAsProtected];
  uint64_t v3 = objc_opt_class();
  if (v2)
  {
    uint64_t v13 = v3;
    id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];
    id v5 = +[HDCloudSyncSerializedField fieldForKey:classes:encrypted:](HDCloudSyncSerializedField, "fieldForKey:classes:encrypted:", @"Version", v4, [(id)objc_opt_class() requiresEncryptedSchemaVersion]);
    v14[0] = v5;
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  }
  else
  {
    uint64_t v11 = v3;
    id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1];
    id v5 = +[HDCloudSyncSerializedField fieldForKey:classes:encrypted:](HDCloudSyncSerializedField, "fieldForKey:classes:encrypted:", @"Version", v4, [(id)objc_opt_class() requiresEncryptedSchemaVersion]);
    v12[0] = v5;
    uint64_t v10 = objc_opt_class();
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v10 count:1];
    uint64_t v8 = +[HDCloudSyncSerializedField fieldForKey:@"UnderlyingMessage" classes:v7 encrypted:1];
    v12[1] = v8;
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  }

  return v6;
}

+ (id)fieldsForProtectedSerialization
{
  v7[1] = *MEMORY[0x1E4F143B8];
  if ([a1 shouldSerializeUnderlyingMessageAsProtected])
  {
    uint64_t v6 = objc_opt_class();
    int v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v6 count:1];
    uint64_t v3 = +[HDCloudSyncSerializedField fieldForKey:@"UnderlyingMessage" classes:v2 encrypted:1];
    v7[0] = v3;
    id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  }
  else
  {
    id v4 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v4;
}

+ (BOOL)shouldSerializeUnderlyingMessageAsProtected
{
  return 0;
}

- (id)printDescription
{
  return &stru_1F1728D60;
}

- (BOOL)repaired
{
  return self->_repaired;
}

- (void)setRepaired:(BOOL)a3
{
  self->_repaired = a3;
}

- (BOOL)unsaved
{
  return self->_unsaved;
}

- (void).cxx_destruct
{
}

@end