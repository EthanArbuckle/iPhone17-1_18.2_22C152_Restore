@interface HDCloudSyncMasterRecord
+ (BOOL)hasFutureSchema:(id)a3;
+ (BOOL)isMasterRecord:(id)a3;
+ (BOOL)isMasterRecordID:(id)a3;
+ (HDCloudSyncMasterRecord)recordWithCKRecord:(id)a3 error:(id *)a4;
+ (id)fieldsForUnprotectedSerialization;
+ (id)recordIDWithZoneID:(id)a3;
+ (id)recordType;
- (HDCloudSyncMasterRecord)initWithCKRecord:(id)a3 schemaVersion:(int64_t)a4;
- (NSSet)disabledOwnerIdentifiers;
- (id)initInSyncCircle:(id)a3 disabledOwnerIdentifiers:(id)a4;
- (id)initInZone:(id)a3 disabledOwnerIdentifiers:(id)a4;
- (id)initWithCKRecord:(void *)a3 disabledOwnerIdentifiers:(uint64_t)a4 schemaVersion:;
- (id)printDescription;
- (id)serializeUnderlyingMessage;
- (void)setDisabledOwnerIdentifiers:(id)a3;
@end

@implementation HDCloudSyncMasterRecord

- (HDCloudSyncMasterRecord)initWithCKRecord:(id)a3 schemaVersion:(int64_t)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3C8];
  v7 = NSStringFromSelector(a2);
  [v5 raise:v6, @"The -%@ method is not available on %@", v7, objc_opt_class() format];

  return 0;
}

- (id)initInSyncCircle:(id)a3 disabledOwnerIdentifiers:(id)a4
{
  uint64_t v6 = (void *)MEMORY[0x1E4F1A320];
  id v7 = a4;
  v8 = objc_msgSend(v6, "hd_masterZoneIDForSyncCircleIdentifier:", a3);
  id v9 = [(HDCloudSyncMasterRecord *)self initInZone:v8 disabledOwnerIdentifiers:v7];

  return v9;
}

- (id)initInZone:(id)a3 disabledOwnerIdentifiers:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(id)objc_opt_class() recordIDWithZoneID:v7];

  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F1A2D8]) initWithRecordType:@"CloudSyncMasterRecord" recordID:v8];
  v10 = -[HDCloudSyncMasterRecord initWithCKRecord:disabledOwnerIdentifiers:schemaVersion:](self, v9, v6, 1);

  return v10;
}

- (id)initWithCKRecord:(void *)a3 disabledOwnerIdentifiers:(uint64_t)a4 schemaVersion:
{
  id v7 = a2;
  id v8 = a3;
  if (a1)
  {
    v14.receiver = a1;
    v14.super_class = (Class)HDCloudSyncMasterRecord;
    id v9 = (id *)objc_msgSendSuper2(&v14, sel_initWithCKRecord_schemaVersion_, v7, a4);
    if (v9)
    {
      v10 = [v8 allObjects];
      [v7 setObject:v10 forKeyedSubscript:@"DeletedOwnerIdentifiers"];

      v11 = (void *)[v8 copy];
      v12 = v11;
      if (!v11)
      {
        v12 = [MEMORY[0x1E4F1CAD0] set];
      }
      objc_storeStrong(v9 + 3, v12);
      if (!v11) {
    }
      }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (void)setDisabledOwnerIdentifiers:(id)a3
{
  id v4 = a3;
  v5 = (NSSet *)[v4 copy];
  disabledOwnerIdentifiers = self->_disabledOwnerIdentifiers;
  self->_disabledOwnerIdentifiers = v5;

  id v8 = [v4 allObjects];

  id v7 = [(HDCloudSyncRecord *)self record];
  [v7 setObject:v8 forKeyedSubscript:@"DeletedOwnerIdentifiers"];
}

- (id)serializeUnderlyingMessage
{
  return 0;
}

+ (id)fieldsForUnprotectedSerialization
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___HDCloudSyncMasterRecord;
  v2 = objc_msgSendSuper2(&v8, sel_fieldsForUnprotectedSerialization);
  v9[0] = objc_opt_class();
  v9[1] = objc_opt_class();
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  id v4 = +[HDCloudSyncSerializedField fieldForKey:@"DeletedOwnerIdentifiers" classes:v3 encrypted:0];
  v10[0] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  id v6 = [v2 arrayByAddingObjectsFromArray:v5];

  return v6;
}

+ (HDCloudSyncMasterRecord)recordWithCKRecord:(id)a3 error:(id *)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [v6 recordType];
  char v8 = [v7 isEqualToString:@"CloudSyncMasterRecord"];

  if (v8)
  {
    id v9 = objc_msgSend(v6, "hd_requiredValueForKey:type:error:", @"Version", objc_opt_class(), a4);
    if (v9)
    {
      v10 = objc_msgSend(v6, "hd_requiredValueForKey:type:error:", @"DeletedOwnerIdentifiers", objc_opt_class(), a4);
      v11 = v10;
      if (v10)
      {
        v26 = v6;
        long long v29 = 0u;
        long long v30 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        uint64_t v12 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v28;
          do
          {
            for (uint64_t i = 0; i != v13; ++i)
            {
              if (*(void *)v28 != v14) {
                objc_enumerationMutation(v11);
              }
              uint64_t v16 = *(void *)(*((void *)&v27 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), a2, @"master record's disabled owner identifiers has non-string member %@"", v16);
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
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v27 objects:v31 count:16];
          }
          while (v13);
        }
        v18 = [HDCloudSyncMasterRecord alloc];
        v19 = [MEMORY[0x1E4F1CAD0] setWithArray:v11];
        id v6 = v26;
        v20 = -[HDCloudSyncMasterRecord initWithCKRecord:disabledOwnerIdentifiers:schemaVersion:](v18, v26, v19, [v9 integerValue]);
      }
      else
      {
        v20 = 0;
      }
    }
    else
    {
      v20 = 0;
    }
  }
  else
  {
    v21 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v22 = objc_opt_class();
    v23 = [v6 recordType];
    objc_msgSend(v21, "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", v22, a2, @"record has type (%@), but expected (%@)", v23, @"CloudSyncMasterRecord"");
    id v24 = (id)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      if (a4) {
        *a4 = v24;
      }
      else {
        _HKLogDroppedError();
      }
    }

    v20 = 0;
  }

  return (HDCloudSyncMasterRecord *)v20;
}

+ (BOOL)hasFutureSchema:(id)a3
{
  v3 = [a3 objectForKeyedSubscript:@"Version"];
  id v4 = v3;
  BOOL v5 = v3 && [v3 integerValue] > 1;

  return v5;
}

+ (id)recordIDWithZoneID:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F1A2F8];
  id v4 = a3;
  BOOL v5 = (void *)[[v3 alloc] initWithRecordName:@"CloudSyncMaster" zoneID:v4];

  return v5;
}

+ (BOOL)isMasterRecord:(id)a3
{
  v3 = [a3 recordType];
  char v4 = [v3 isEqualToString:@"CloudSyncMasterRecord"];

  return v4;
}

+ (BOOL)isMasterRecordID:(id)a3
{
  v3 = [a3 recordName];
  char v4 = [v3 isEqualToString:@"CloudSyncMaster"];

  return v4;
}

+ (id)recordType
{
  return @"CloudSyncMasterRecord";
}

- (id)printDescription
{
  v2 = NSString;
  v3 = [(HDCloudSyncMasterRecord *)self disabledOwnerIdentifiers];
  char v4 = [v3 allObjects];
  BOOL v5 = [v4 componentsJoinedByString:@", "];
  id v6 = [v2 stringWithFormat:@"+ Disabled Owners: %@\n+--------------------------------------------------", v5];

  return v6;
}

- (NSSet)disabledOwnerIdentifiers
{
  return self->_disabledOwnerIdentifiers;
}

- (void).cxx_destruct
{
}

@end