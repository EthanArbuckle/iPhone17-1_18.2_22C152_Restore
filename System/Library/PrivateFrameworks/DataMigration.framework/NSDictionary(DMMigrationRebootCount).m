@interface NSDictionary(DMMigrationRebootCount)
+ (__CFString)dm_migrationRebootCountPref_buildVersionKey;
+ (__CFString)dm_migrationRebootCountPref_rebootCountKey;
+ (id)dm_migrationRebootCountPrefWithRebootCount:()DMMigrationRebootCount buildVersion:;
- (id)dm_migrationRebootCountPref_buildVersion;
- (uint64_t)dm_migrationRebootCountPref_rebootCount;
@end

@implementation NSDictionary(DMMigrationRebootCount)

+ (id)dm_migrationRebootCountPrefWithRebootCount:()DMMigrationRebootCount buildVersion:
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = objc_msgSend(a1, "dm_migrationRebootCountPref_buildVersionKey");
  v12[0] = v7;
  v13[0] = v6;
  v8 = objc_msgSend(a1, "dm_migrationRebootCountPref_rebootCountKey");
  v12[1] = v8;
  v9 = [NSNumber numberWithUnsignedInteger:a3];
  v13[1] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];

  return v10;
}

- (uint64_t)dm_migrationRebootCountPref_rebootCount
{
  v2 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dm_migrationRebootCountPref_rebootCountKey");
  v3 = [a1 objectForKeyedSubscript:v2];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (!v3) {
      return 0;
    }
    uint64_t v4 = [v3 unsignedIntegerValue];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)dm_migrationRebootCountPref_buildVersion
{
  v2 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dm_migrationRebootCountPref_buildVersionKey");
  v3 = [a1 objectForKeyedSubscript:v2];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v3 = 0;
  }

  return v3;
}

+ (__CFString)dm_migrationRebootCountPref_rebootCountKey
{
  return @"rebootCount";
}

+ (__CFString)dm_migrationRebootCountPref_buildVersionKey
{
  return @"buildVersion";
}

@end