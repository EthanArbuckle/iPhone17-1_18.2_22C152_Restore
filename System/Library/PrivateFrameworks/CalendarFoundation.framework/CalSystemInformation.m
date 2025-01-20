@interface CalSystemInformation
+ (BOOL)isRunningAsSetupUser;
+ (id)systemBuildVersion;
@end

@implementation CalSystemInformation

+ (id)systemBuildVersion
{
  if (systemBuildVersion_onceToken[0] != -1) {
    dispatch_once(systemBuildVersion_onceToken, &__block_literal_global_39);
  }
  v2 = (void *)systemBuildVersion_buildVersion;

  return v2;
}

void __42__CalSystemInformation_systemBuildVersion__block_invoke()
{
  v0 = (void *)_CFCopyServerVersionDictionary();
  if (!v0) {
    v0 = (void *)_CFCopySystemVersionDictionary();
  }
  id v3 = v0;
  uint64_t v1 = [v0 objectForKeyedSubscript:*MEMORY[0x1E4F1CD10]];
  v2 = (void *)systemBuildVersion_buildVersion;
  systemBuildVersion_buildVersion = v1;
}

+ (BOOL)isRunningAsSetupUser
{
  return 0;
}

@end