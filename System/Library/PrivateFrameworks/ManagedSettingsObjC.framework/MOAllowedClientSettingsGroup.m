@interface MOAllowedClientSettingsGroup
+ (MOApplicationSettingMetadata)allowedClientMetadata;
+ (MOBoolSettingMetadata)denyMDMEnrollmentMetadata;
+ (MODataSetSettingMetadata)tokenKeysMetadata;
+ (id)groupName;
- (MOApplication)allowedClient;
- (NSNumber)denyMDMEnrollment;
- (NSSet)tokenKeys;
- (void)setAllowedClient:(id)a3;
- (void)setDenyMDMEnrollment:(id)a3;
- (void)setTokenKeys:(id)a3;
@end

@implementation MOAllowedClientSettingsGroup

+ (id)groupName
{
  return @"allowedClient";
}

- (MOApplication)allowedClient
{
  return (MOApplication *)[(MOSettingsGroup *)self valueForSetting:@"allowedClient"];
}

- (void)setAllowedClient:(id)a3
{
}

+ (MOApplicationSettingMetadata)allowedClientMetadata
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__MOAllowedClientSettingsGroup_allowedClientMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (allowedClientMetadata_onceToken != -1) {
    dispatch_once(&allowedClientMetadata_onceToken, block);
  }
  v2 = (void *)allowedClientMetadata_metadata;
  return (MOApplicationSettingMetadata *)v2;
}

void __53__MOAllowedClientSettingsGroup_allowedClientMetadata__block_invoke()
{
  v0 = NSString;
  v1 = [(id)objc_opt_class() groupName];
  id v6 = [v0 stringWithFormat:@"%@.%@", v1, @"allowedClient"];

  v2 = [MOApplicationSettingMetadata alloc];
  v3 = objc_opt_new();
  uint64_t v4 = [(MOApplicationSettingMetadata *)v2 initWithSettingName:v6 defaultApplication:v3 combineOperator:0 isPublic:0 scope:@"user" isPrivacySensitive:0];
  v5 = (void *)allowedClientMetadata_metadata;
  allowedClientMetadata_metadata = v4;
}

- (NSNumber)denyMDMEnrollment
{
  return (NSNumber *)[(MOSettingsGroup *)self valueForSetting:@"denyMDMEnrollment"];
}

- (void)setDenyMDMEnrollment:(id)a3
{
}

+ (MOBoolSettingMetadata)denyMDMEnrollmentMetadata
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__MOAllowedClientSettingsGroup_denyMDMEnrollmentMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (denyMDMEnrollmentMetadata_onceToken != -1) {
    dispatch_once(&denyMDMEnrollmentMetadata_onceToken, block);
  }
  v2 = (void *)denyMDMEnrollmentMetadata_metadata;
  return (MOBoolSettingMetadata *)v2;
}

void __57__MOAllowedClientSettingsGroup_denyMDMEnrollmentMetadata__block_invoke()
{
  v0 = NSString;
  v1 = [(id)objc_opt_class() groupName];
  id v4 = [v0 stringWithFormat:@"%@.%@", v1, @"denyMDMEnrollment"];

  v2 = [[MOBoolSettingMetadata alloc] initWithSettingName:v4 defaultBool:0 combineOperator:0 isPublic:0 scope:@"user" isPrivacySensitive:0];
  v3 = (void *)denyMDMEnrollmentMetadata_metadata;
  denyMDMEnrollmentMetadata_metadata = (uint64_t)v2;
}

- (NSSet)tokenKeys
{
  return (NSSet *)[(MOSettingsGroup *)self valueForSetting:@"tokenKeys"];
}

- (void)setTokenKeys:(id)a3
{
}

+ (MODataSetSettingMetadata)tokenKeysMetadata
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__MOAllowedClientSettingsGroup_tokenKeysMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (tokenKeysMetadata_onceToken != -1) {
    dispatch_once(&tokenKeysMetadata_onceToken, block);
  }
  v2 = (void *)tokenKeysMetadata_metadata;
  return (MODataSetSettingMetadata *)v2;
}

void __49__MOAllowedClientSettingsGroup_tokenKeysMetadata__block_invoke()
{
  v0 = NSString;
  v1 = [(id)objc_opt_class() groupName];
  id v7 = [v0 stringWithFormat:@"%@.%@", v1, @"tokenKeys"];

  v2 = [MODataSetSettingMetadata alloc];
  v3 = objc_opt_new();
  LOBYTE(v6) = 0;
  uint64_t v4 = [(MOSetSettingMetadata *)v2 initWithSettingName:v7 defaultSet:v3 combineOperator:1 maximumCount:-1 isPublic:0 scope:@"user" isPrivacySensitive:v6];
  v5 = (void *)tokenKeysMetadata_metadata;
  tokenKeysMetadata_metadata = v4;
}

@end