@interface MOAccountSettingsGroup
+ (MOBoolSettingMetadata)denyiCloudLogoutMetadata;
+ (MOBoolSettingMetadata)lockAccountsMetadata;
+ (id)groupName;
- (NSNumber)denyiCloudLogout;
- (NSNumber)lockAccounts;
- (void)setDenyiCloudLogout:(id)a3;
- (void)setLockAccounts:(id)a3;
@end

@implementation MOAccountSettingsGroup

+ (id)groupName
{
  return @"account";
}

- (NSNumber)denyiCloudLogout
{
  return (NSNumber *)[(MOSettingsGroup *)self valueForSetting:@"denyiCloudLogout"];
}

- (void)setDenyiCloudLogout:(id)a3
{
}

+ (MOBoolSettingMetadata)denyiCloudLogoutMetadata
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__MOAccountSettingsGroup_denyiCloudLogoutMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (denyiCloudLogoutMetadata_onceToken != -1) {
    dispatch_once(&denyiCloudLogoutMetadata_onceToken, block);
  }
  v2 = (void *)denyiCloudLogoutMetadata_metadata;
  return (MOBoolSettingMetadata *)v2;
}

void __50__MOAccountSettingsGroup_denyiCloudLogoutMetadata__block_invoke()
{
  v0 = NSString;
  v1 = [(id)objc_opt_class() groupName];
  id v4 = [v0 stringWithFormat:@"%@.%@", v1, @"denyiCloudLogout"];

  v2 = [[MOBoolSettingMetadata alloc] initWithSettingName:v4 defaultBool:0 combineOperator:0 isPublic:0 scope:@"user" isPrivacySensitive:0];
  v3 = (void *)denyiCloudLogoutMetadata_metadata;
  denyiCloudLogoutMetadata_metadata = (uint64_t)v2;
}

- (NSNumber)lockAccounts
{
  return (NSNumber *)[(MOSettingsGroup *)self valueForSetting:@"lockAccounts"];
}

- (void)setLockAccounts:(id)a3
{
}

+ (MOBoolSettingMetadata)lockAccountsMetadata
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__MOAccountSettingsGroup_lockAccountsMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (lockAccountsMetadata_onceToken != -1) {
    dispatch_once(&lockAccountsMetadata_onceToken, block);
  }
  v2 = (void *)lockAccountsMetadata_metadata;
  return (MOBoolSettingMetadata *)v2;
}

void __46__MOAccountSettingsGroup_lockAccountsMetadata__block_invoke()
{
  v0 = NSString;
  v1 = [(id)objc_opt_class() groupName];
  id v4 = [v0 stringWithFormat:@"%@.%@", v1, @"lockAccounts"];

  v2 = [[MOBoolSettingMetadata alloc] initWithSettingName:v4 defaultBool:0 combineOperator:0 isPublic:1 scope:@"user" isPrivacySensitive:0];
  v3 = (void *)lockAccountsMetadata_metadata;
  lockAccountsMetadata_metadata = (uint64_t)v2;
}

@end