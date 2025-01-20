@interface HDCloudSyncSubscriptionRecord
+ (BOOL)hasFutureSchema:(id)a3;
+ (BOOL)isSubscriptionRecord:(id)a3;
+ (id)recordForZoneID:(id)a3;
+ (id)recordIDWithZoneID:(id)a3;
+ (id)recordIDsWithZoneID:(id)a3;
+ (id)recordWithCKRecord:(id)a3 error:(id *)a4;
- (id)description;
- (id)printDescription;
@end

@implementation HDCloudSyncSubscriptionRecord

+ (id)recordIDsWithZoneID:(id)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v3 = +[HDCloudSyncDataUploadRequestRecord recordIDWithZoneID:a3];
  v6[0] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];

  return v4;
}

+ (BOOL)isSubscriptionRecord:(id)a3
{
  return +[HDCloudSyncDataUploadRequestRecord isDataUploadRequestRecord:a3];
}

+ (id)recordWithCKRecord:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (+[HDCloudSyncDataUploadRequestRecord isDataUploadRequestRecord:v6])
  {
    v7 = +[HDCloudSyncDataUploadRequestRecord recordWithCKRecord:v6 error:a4];
  }
  else
  {
    v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v9 = objc_opt_class();
    v10 = [v6 recordType];
    objc_msgSend(v8, "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", v9, a2, @"Unexpected record of type (%@)"", v10);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      if (a4) {
        *a4 = v11;
      }
      else {
        _HKLogDroppedError();
      }
    }

    v7 = 0;
  }

  return v7;
}

+ (BOOL)hasFutureSchema:(id)a3
{
  v3 = [a3 objectForKeyedSubscript:@"Version"];
  v4 = v3;
  BOOL v5 = v3 && [v3 integerValue] > 1;

  return v5;
}

+ (id)recordIDWithZoneID:(id)a3
{
  return 0;
}

+ (id)recordForZoneID:(id)a3
{
  return 0;
}

- (id)description
{
  v3 = NSString;
  v4 = [(HDCloudSyncRecord *)self record];
  BOOL v5 = [v4 recordID];
  id v6 = [(HDCloudSyncRecord *)self record];
  v7 = [v6 modificationDate];
  v8 = [(HDCloudSyncRecord *)self record];
  uint64_t v9 = [v8 objectForKeyedSubscript:@"Version"];
  v10 = [v3 stringWithFormat:@"Subscription %@\nLast Modified Date: %@\nSchema Version: %@\n", v5, v7, v9];

  return v10;
}

- (id)printDescription
{
  return &stru_1F1728D60;
}

@end