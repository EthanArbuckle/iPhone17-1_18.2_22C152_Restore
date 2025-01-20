@interface _DPStrings
+ (id)algorithmParametersPath;
+ (id)bitValueMapDirectoryPath;
+ (id)budgetPropertiesPath;
+ (id)dataTypeParametersPath;
+ (id)dataValueStorageClass;
+ (id)databaseDirectoryPath;
+ (id)defaultBudgetKey;
+ (id)errorDomain;
+ (id)ipsDirectoryPath;
+ (id)keyNamesPath;
+ (id)keyPropertiesPath;
+ (id)machServiceName;
+ (id)namespaceParametersPath;
+ (id)reportsDirectoryPath;
+ (id)runtimeBlacklistDirectoryPath;
+ (id)submissionServiceAccessEntitlement;
+ (id)submissionServiceDomainName;
+ (id)systemBlacklistDirectoryPath;
+ (id)tokenRefreshHoursKeyName;
+ (id)tokensDirectoryPath;
+ (id)transparencyLogDirectoryPath;
+ (id)unitTestBitValueMapDirectoryPath:(id)a3;
+ (id)unitTestDatabaseDirectoryPath:(id)a3;
+ (id)unitTestOutputDirectoryPath;
+ (id)unitTestReportsDirectoryPath:(id)a3;
+ (id)unitTestRuntimeBlacklistDirectoryPath:(id)a3;
+ (id)unitTestSystemBlacklistDirectoryPath:(id)a3;
@end

@implementation _DPStrings

+ (id)machServiceName
{
  return @"com.apple.dprivacyd";
}

+ (id)databaseDirectoryPath
{
  if (databaseDirectoryPath_onceToken != -1) {
    dispatch_once(&databaseDirectoryPath_onceToken, &__block_literal_global_6);
  }
  v2 = (void *)databaseDirectoryPath__DPDatabaseDirectoryPath;
  return v2;
}

+ (id)reportsDirectoryPath
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34___DPStrings_reportsDirectoryPath__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (reportsDirectoryPath_onceToken != -1) {
    dispatch_once(&reportsDirectoryPath_onceToken, block);
  }
  v2 = (void *)reportsDirectoryPath__DPReportsDirectoryPath;
  return v2;
}

+ (id)transparencyLogDirectoryPath
{
  if (transparencyLogDirectoryPath_onceToken != -1) {
    dispatch_once(&transparencyLogDirectoryPath_onceToken, &__block_literal_global_12);
  }
  v2 = (void *)transparencyLogDirectoryPath__DPTransparencyLogDirectoryPath;
  return v2;
}

+ (id)tokensDirectoryPath
{
  if (tokensDirectoryPath_onceToken != -1) {
    dispatch_once(&tokensDirectoryPath_onceToken, &__block_literal_global_17);
  }
  v2 = (void *)tokensDirectoryPath__DPDediscoTokensDirectoryPath;
  return v2;
}

+ (id)keyNamesPath
{
  if (keyNamesPath_onceToken != -1) {
    dispatch_once(&keyNamesPath_onceToken, &__block_literal_global_25);
  }
  v2 = (void *)keyNamesPath__DPKeyNamesPlist;
  return v2;
}

+ (id)keyPropertiesPath
{
  if (keyPropertiesPath_onceToken != -1) {
    dispatch_once(&keyPropertiesPath_onceToken, &__block_literal_global_30);
  }
  v2 = (void *)keyPropertiesPath__DPKeyPropertiesPlist;
  return v2;
}

+ (id)budgetPropertiesPath
{
  if (budgetPropertiesPath_onceToken != -1) {
    dispatch_once(&budgetPropertiesPath_onceToken, &__block_literal_global_35);
  }
  v2 = (void *)budgetPropertiesPath__DPBudgetPropertiesPlist;
  return v2;
}

+ (id)algorithmParametersPath
{
  if (algorithmParametersPath_onceToken != -1) {
    dispatch_once(&algorithmParametersPath_onceToken, &__block_literal_global_40);
  }
  v2 = (void *)algorithmParametersPath__DPAlgorithmParametersPlist;
  return v2;
}

+ (id)namespaceParametersPath
{
  if (namespaceParametersPath_onceToken != -1) {
    dispatch_once(&namespaceParametersPath_onceToken, &__block_literal_global_45);
  }
  v2 = (void *)namespaceParametersPath__DPNamespaceParametersPlist;
  return v2;
}

+ (id)dataTypeParametersPath
{
  if (dataTypeParametersPath_onceToken != -1) {
    dispatch_once(&dataTypeParametersPath_onceToken, &__block_literal_global_50);
  }
  v2 = (void *)dataTypeParametersPath__DPDataTypeParametersPlist;
  return v2;
}

+ (id)defaultBudgetKey
{
  return @"com.apple.DifferentialPrivacy.default";
}

+ (id)errorDomain
{
  return @"com.apple.DifferentialPrivacy";
}

+ (id)ipsDirectoryPath
{
  return @"/var/mobile/Library/Logs/CrashReporter";
}

+ (id)systemBlacklistDirectoryPath
{
  return @"/System/Library/DifferentialPrivacy/Configuration/Blacklists/";
}

+ (id)runtimeBlacklistDirectoryPath
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43___DPStrings_runtimeBlacklistDirectoryPath__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (runtimeBlacklistDirectoryPath_onceToken != -1) {
    dispatch_once(&runtimeBlacklistDirectoryPath_onceToken, block);
  }
  v2 = (void *)runtimeBlacklistDirectoryPath__DPBlacklistRuntimeDirectoryPath;
  return v2;
}

+ (id)bitValueMapDirectoryPath
{
  return @"/System/Library/DifferentialPrivacy/Configuration/BitValueMaps/";
}

+ (id)submissionServiceAccessEntitlement
{
  return @"com.apple.DPSubmissionService.allow";
}

+ (id)unitTestOutputDirectoryPath
{
  return @"/tmp/";
}

+ (id)unitTestDatabaseDirectoryPath:(id)a3
{
  id v4 = a3;
  v5 = [a1 unitTestOutputDirectoryPath];
  v6 = [v5 stringByAppendingString:v4];

  return v6;
}

+ (id)unitTestReportsDirectoryPath:(id)a3
{
  v3 = NSString;
  id v4 = [a1 unitTestDatabaseDirectoryPath:a3];
  v5 = [v3 stringWithFormat:@"%@/%@", v4, @"Reports"];

  return v5;
}

+ (id)unitTestSystemBlacklistDirectoryPath:(id)a3
{
  id v4 = NSString;
  id v5 = a3;
  v6 = [a1 unitTestOutputDirectoryPath];
  v7 = [v4 stringWithFormat:@"%@/SystemBlacklist/%@", v6, v5];

  return v7;
}

+ (id)unitTestRuntimeBlacklistDirectoryPath:(id)a3
{
  id v4 = NSString;
  id v5 = a3;
  v6 = [a1 unitTestOutputDirectoryPath];
  v7 = [v4 stringWithFormat:@"%@/RuntimeBlacklist/%@", v6, v5];

  return v7;
}

+ (id)unitTestBitValueMapDirectoryPath:(id)a3
{
  id v4 = NSString;
  id v5 = a3;
  v6 = [a1 unitTestOutputDirectoryPath];
  v7 = [v4 stringWithFormat:@"%@/BitValueMaps/%@", v6, v5];

  return v7;
}

+ (id)dataValueStorageClass
{
  return @"dprivacyd_storage";
}

+ (id)submissionServiceDomainName
{
  return @"com.apple.DPSubmissionService";
}

+ (id)tokenRefreshHoursKeyName
{
  return @"tokenRefreshHours";
}

@end