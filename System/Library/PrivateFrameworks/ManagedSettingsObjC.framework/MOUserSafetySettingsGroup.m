@interface MOUserSafetySettingsGroup
+ (MOApplicationSetSettingMetadata)allowedClientsMetadata;
+ (MOUserSafetyScanningPolicySettingMetadata)scanningPolicyMetadata;
+ (id)groupName;
- (MOUserSafetyScanningPolicy)scanningPolicy;
- (NSSet)allowedClients;
- (void)setAllowedClients:(id)a3;
- (void)setScanningPolicy:(id)a3;
@end

@implementation MOUserSafetySettingsGroup

- (MOUserSafetyScanningPolicy)scanningPolicy
{
  return (MOUserSafetyScanningPolicy *)[(MOSettingsGroup *)self valueForSetting:@"scanningPolicy"];
}

+ (MOUserSafetyScanningPolicySettingMetadata)scanningPolicyMetadata
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__MOUserSafetySettingsGroup_scanningPolicyMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (scanningPolicyMetadata_onceToken != -1) {
    dispatch_once(&scanningPolicyMetadata_onceToken, block);
  }
  v2 = (void *)scanningPolicyMetadata_metadata;
  return (MOUserSafetyScanningPolicySettingMetadata *)v2;
}

void __51__MOUserSafetySettingsGroup_scanningPolicyMetadata__block_invoke()
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v0 = NSString;
  v1 = [(id)objc_opt_class() groupName];
  v2 = [v0 stringWithFormat:@"%@.%@", v1, @"scanningPolicy"];

  v3 = [MOUserSafetyScanningPolicySettingMetadata alloc];
  v4 = +[MOUserSafetyScanningPolicy nonePolicy];
  v9[0] = @"child";
  v9[1] = @"teen";
  v10[0] = &unk_1F12BB7E8;
  v10[1] = &unk_1F12BB800;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  LOBYTE(v8) = 0;
  uint64_t v6 = [(MOUserSafetyScanningPolicySettingMetadata *)v3 initWithSettingName:v2 defaultPolicy:v4 interventionCombineOperator:0 rankedInterventionTypes:v5 maximumApplicationCount:-1 isPublic:0 scope:@"user" isPrivacySensitive:v8];
  v7 = (void *)scanningPolicyMetadata_metadata;
  scanningPolicyMetadata_metadata = v6;
}

+ (id)groupName
{
  return @"userSafety";
}

- (NSSet)allowedClients
{
  return (NSSet *)[(MOSettingsGroup *)self valueForSetting:@"allowedClients"];
}

- (void)setAllowedClients:(id)a3
{
}

+ (MOApplicationSetSettingMetadata)allowedClientsMetadata
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__MOUserSafetySettingsGroup_allowedClientsMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (allowedClientsMetadata_onceToken_0 != -1) {
    dispatch_once(&allowedClientsMetadata_onceToken_0, block);
  }
  v2 = (void *)allowedClientsMetadata_metadata_0;
  return (MOApplicationSetSettingMetadata *)v2;
}

void __51__MOUserSafetySettingsGroup_allowedClientsMetadata__block_invoke()
{
  v0 = NSString;
  v1 = [(id)objc_opt_class() groupName];
  id v7 = [v0 stringWithFormat:@"%@.%@", v1, @"allowedClients"];

  v2 = [MOApplicationSetSettingMetadata alloc];
  v3 = objc_opt_new();
  LOBYTE(v6) = 0;
  uint64_t v4 = [(MOSetSettingMetadata *)v2 initWithSettingName:v7 defaultSet:v3 combineOperator:1 maximumCount:-1 isPublic:0 scope:@"user" isPrivacySensitive:v6];
  v5 = (void *)allowedClientsMetadata_metadata_0;
  allowedClientsMetadata_metadata_0 = v4;
}

- (void)setScanningPolicy:(id)a3
{
}

@end