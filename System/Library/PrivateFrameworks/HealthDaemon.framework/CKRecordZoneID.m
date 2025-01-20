@interface CKRecordZoneID
+ (id)_hd_zoneIDForSyncCircleIdentifier:(void *)a3 name:;
- (uint64_t)_hd_isZoneIDForSyncCircleIdentifier:(void *)a3 name:;
@end

@implementation CKRecordZoneID

+ (id)_hd_zoneIDForSyncCircleIdentifier:(void *)a3 name:
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = self;
  if ([v4 containsString:@":"])
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:sel__hd_zoneIDForSyncCircleIdentifier_name_, v6, @"CKRecordZoneID+HDCloudSync.m", 29, @"Invalid parameter not satisfying: %@", @"![syncCircleIdentifier containsString:RecordZoneIDComponentsSeparator]" object file lineNumber description];
  }
  v7 = [NSString stringWithFormat:@"%@%@%@", v4, @":", v5];
  id v8 = objc_alloc(MEMORY[0x1E4F1A320]);
  v9 = (void *)[v8 initWithZoneName:v7 ownerName:*MEMORY[0x1E4F19C08]];

  return v9;
}

- (uint64_t)_hd_isZoneIDForSyncCircleIdentifier:(void *)a3 name:
{
  id v5 = a3;
  if (a1)
  {
    uint64_t v6 = [a1 zoneName];
    v7 = [v6 componentsSeparatedByString:@":"];

    if ([v7 count] == 2
      && ([v7 objectAtIndexedSubscript:1],
          id v8 = objc_claimAutoreleasedReturnValue(),
          int v9 = [v8 isEqualToString:v5],
          v8,
          v9))
    {
      *a2 = [v7 objectAtIndexedSubscript:0];
      uint64_t v10 = 1;
    }
    else
    {
      uint64_t v10 = 0;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

@end