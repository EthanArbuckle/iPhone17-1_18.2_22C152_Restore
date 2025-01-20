@interface HDCloudSyncDataUploadRequestRecord
+ (BOOL)isDataUploadRequestRecord:(id)a3;
+ (BOOL)requiresUnderlyingMessage;
+ (HDCloudSyncDataUploadRequestRecord)recordWithCKRecord:(id)a3 error:(id *)a4;
+ (id)recordForZoneID:(id)a3;
+ (id)recordIDWithZoneID:(id)a3;
+ (id)recordType;
- (id)description;
- (id)printDescription;
- (id)serializeUnderlyingMessage;
@end

@implementation HDCloudSyncDataUploadRequestRecord

+ (BOOL)requiresUnderlyingMessage
{
  return 0;
}

+ (id)recordType
{
  return @"CloudSyncDataUploadRequestRecord";
}

+ (id)recordIDWithZoneID:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F1A2F8];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithRecordName:@"CloudSyncDataUploadRequest" zoneID:v4];

  return v5;
}

+ (BOOL)isDataUploadRequestRecord:(id)a3
{
  v3 = [a3 recordType];
  char v4 = [v3 isEqualToString:@"CloudSyncDataUploadRequestRecord"];

  return v4;
}

+ (id)recordForZoneID:(id)a3
{
  id v4 = a3;
  v5 = [(id)objc_opt_class() recordIDWithZoneID:v4];

  v6 = (void *)[objc_alloc(MEMORY[0x1E4F1A2D8]) initWithRecordType:@"CloudSyncDataUploadRequestRecord" recordID:v5];
  v7 = (void *)[objc_alloc((Class)a1) initWithCKRecord:v6 schemaVersion:1];

  return v7;
}

+ (HDCloudSyncDataUploadRequestRecord)recordWithCKRecord:(id)a3 error:(id *)a4
{
  id v7 = a3;
  v8 = [v7 recordType];
  char v9 = [v8 isEqualToString:@"CloudSyncDataUploadRequestRecord"];

  if (v9)
  {
    v10 = objc_msgSend(v7, "hd_requiredValueForKey:type:error:", @"Version", objc_opt_class(), a4);
    if (v10)
    {
      v11 = objc_msgSend(objc_alloc((Class)a1), "initWithCKRecord:schemaVersion:", v7, objc_msgSend(v10, "integerValue"));
      goto LABEL_10;
    }
  }
  else
  {
    v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v13 = objc_opt_class();
    v10 = [v7 recordType];
    objc_msgSend(v12, "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", v13, a2, @"record has type (%@), but expected (%@)", v10, @"CloudSyncDataUploadRequestRecord"");
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      if (a4) {
        *a4 = v14;
      }
      else {
        _HKLogDroppedError();
      }
    }
  }
  v11 = 0;
LABEL_10:

  return (HDCloudSyncDataUploadRequestRecord *)v11;
}

- (id)serializeUnderlyingMessage
{
  return 0;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(HDCloudSyncRecord *)self record];
  v5 = [v4 recordID];
  v6 = [(HDCloudSyncRecord *)self record];
  id v7 = [v6 modificationDate];
  v8 = [(HDCloudSyncRecord *)self record];
  char v9 = [v8 objectForKeyedSubscript:@"Version"];
  v10 = [v3 stringWithFormat:@"DataUploadRequest %@\nLast Modified Date: %@\nSchema Version: %@\n", v5, v7, v9];

  return v10;
}

- (id)printDescription
{
  return &stru_1F1728D60;
}

@end