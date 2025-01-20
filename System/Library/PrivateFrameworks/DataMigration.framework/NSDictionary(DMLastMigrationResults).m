@interface NSDictionary(DMLastMigrationResults)
+ (__CFString)dmlmr_buildVersionKey;
+ (__CFString)dmlmr_successKey;
+ (id)dmlmr_lastMigrationResultsWithSuccess:()DMLastMigrationResults buildVersion:;
- (id)dmlmr_buildVersion;
- (id)dmlmr_success;
@end

@implementation NSDictionary(DMLastMigrationResults)

+ (id)dmlmr_lastMigrationResultsWithSuccess:()DMLastMigrationResults buildVersion:
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = objc_msgSend(a1, "dmlmr_buildVersionKey");
  v12[0] = v7;
  v13[0] = v6;
  v8 = objc_msgSend(a1, "dmlmr_successKey");
  v12[1] = v8;
  v9 = [NSNumber numberWithBool:a3];
  v13[1] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];

  return v10;
}

- (id)dmlmr_success
{
  v2 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dmlmr_successKey");
  v3 = [a1 objectForKeyedSubscript:v2];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v3 = 0;
  }

  return v3;
}

- (id)dmlmr_buildVersion
{
  v2 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dmlmr_buildVersionKey");
  v3 = [a1 objectForKeyedSubscript:v2];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v3 = 0;
  }

  return v3;
}

+ (__CFString)dmlmr_successKey
{
  return @"success";
}

+ (__CFString)dmlmr_buildVersionKey
{
  return @"buildVersion";
}

@end