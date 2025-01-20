@interface HKProfileIdentifier(CloudSync)
+ (id)hd_profileIdentifierWithSyncCircleIdentifier:()CloudSync;
- (__CFString)hd_syncCircleIdentifier;
@end

@implementation HKProfileIdentifier(CloudSync)

+ (id)hd_profileIdentifierWithSyncCircleIdentifier:()CloudSync
{
  v3 = [a3 componentsSeparatedByString:@"$"];
  if ([v3 count] == 2)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F29128]);
    v5 = [v3 objectAtIndexedSubscript:1];
    v6 = (void *)[v4 initWithUUIDString:v5];

    if (v6)
    {
      v7 = [v3 objectAtIndexedSubscript:0];
      uint64_t v8 = [v7 integerValue];

      if ((unint64_t)(v8 - 1) < 4 || (v9 = 0, v8 == 100))
      {
        v9 = [MEMORY[0x1E4F2B358] _profileWithUUID:v6 type:v8];
      }
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (__CFString)hd_syncCircleIdentifier
{
  v1 = a1;
  uint64_t v2 = [(__CFString *)a1 type];
  if ((unint64_t)(v2 - 1) < 3)
  {
LABEL_4:
    v1 = @"PrimarySyncCircle";
    goto LABEL_6;
  }
  if (v2 != 4)
  {
    if (v2 != 100) {
      goto LABEL_6;
    }
    goto LABEL_4;
  }
  v3 = NSString;
  uint64_t v4 = [(__CFString *)v1 type];
  v5 = [(__CFString *)v1 identifier];
  v6 = [v5 UUIDString];
  v1 = [v3 stringWithFormat:@"%ld$%@", v4, v6];

LABEL_6:

  return v1;
}

@end