@interface MOApplicationSettingsGroup
+ (MOApplicationSetSettingMetadata)blockedApplicationsMetadata;
+ (MOApplicationSetSettingMetadata)unremovableApplicationsMetadata;
+ (MOBoolSettingMetadata)denyAppClipsMetadata;
+ (MOBoolSettingMetadata)denyAppInstallationMetadata;
+ (MOBoolSettingMetadata)denyAppRemovalMetadata;
+ (MOBoolSettingMetadata)denyBackgroundAppRefreshMetadata;
+ (id)groupName;
- (NSNumber)denyAppClips;
- (NSNumber)denyAppInstallation;
- (NSNumber)denyAppRemoval;
- (NSNumber)denyBackgroundAppRefresh;
- (NSSet)blockedApplications;
- (NSSet)unremovableApplications;
- (void)setBlockedApplications:(id)a3;
- (void)setDenyAppClips:(id)a3;
- (void)setDenyAppInstallation:(id)a3;
- (void)setDenyAppRemoval:(id)a3;
- (void)setDenyBackgroundAppRefresh:(id)a3;
- (void)setUnremovableApplications:(id)a3;
@end

@implementation MOApplicationSettingsGroup

+ (id)groupName
{
  return @"application";
}

- (NSSet)blockedApplications
{
  return (NSSet *)[(MOSettingsGroup *)self valueForSetting:@"blockedApplications"];
}

- (void)setBlockedApplications:(id)a3
{
}

+ (MOApplicationSetSettingMetadata)blockedApplicationsMetadata
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__MOApplicationSettingsGroup_blockedApplicationsMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (blockedApplicationsMetadata_onceToken != -1) {
    dispatch_once(&blockedApplicationsMetadata_onceToken, block);
  }
  v2 = (void *)blockedApplicationsMetadata_metadata;
  return (MOApplicationSetSettingMetadata *)v2;
}

void __57__MOApplicationSettingsGroup_blockedApplicationsMetadata__block_invoke()
{
  v0 = NSString;
  v1 = [(id)objc_opt_class() groupName];
  id v7 = [v0 stringWithFormat:@"%@.%@", v1, @"blockedApplications"];

  v2 = [MOApplicationSetSettingMetadata alloc];
  v3 = objc_opt_new();
  LOBYTE(v6) = 0;
  uint64_t v4 = [(MOSetSettingMetadata *)v2 initWithSettingName:v7 defaultSet:v3 combineOperator:1 maximumCount:50 isPublic:1 scope:@"user" isPrivacySensitive:v6];
  v5 = (void *)blockedApplicationsMetadata_metadata;
  blockedApplicationsMetadata_metadata = v4;
}

- (NSNumber)denyAppClips
{
  return (NSNumber *)[(MOSettingsGroup *)self valueForSetting:@"denyAppClips"];
}

- (void)setDenyAppClips:(id)a3
{
}

+ (MOBoolSettingMetadata)denyAppClipsMetadata
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__MOApplicationSettingsGroup_denyAppClipsMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (denyAppClipsMetadata_onceToken != -1) {
    dispatch_once(&denyAppClipsMetadata_onceToken, block);
  }
  v2 = (void *)denyAppClipsMetadata_metadata;
  return (MOBoolSettingMetadata *)v2;
}

void __50__MOApplicationSettingsGroup_denyAppClipsMetadata__block_invoke()
{
  v0 = NSString;
  v1 = [(id)objc_opt_class() groupName];
  id v4 = [v0 stringWithFormat:@"%@.%@", v1, @"denyAppClips"];

  v2 = [[MOBoolSettingMetadata alloc] initWithSettingName:v4 defaultBool:0 combineOperator:0 isPublic:0 scope:@"user" isPrivacySensitive:0];
  v3 = (void *)denyAppClipsMetadata_metadata;
  denyAppClipsMetadata_metadata = (uint64_t)v2;
}

- (NSNumber)denyAppInstallation
{
  return (NSNumber *)[(MOSettingsGroup *)self valueForSetting:@"denyAppInstallation"];
}

- (void)setDenyAppInstallation:(id)a3
{
}

+ (MOBoolSettingMetadata)denyAppInstallationMetadata
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__MOApplicationSettingsGroup_denyAppInstallationMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (denyAppInstallationMetadata_onceToken != -1) {
    dispatch_once(&denyAppInstallationMetadata_onceToken, block);
  }
  v2 = (void *)denyAppInstallationMetadata_metadata;
  return (MOBoolSettingMetadata *)v2;
}

void __57__MOApplicationSettingsGroup_denyAppInstallationMetadata__block_invoke()
{
  v0 = NSString;
  v1 = [(id)objc_opt_class() groupName];
  id v4 = [v0 stringWithFormat:@"%@.%@", v1, @"denyAppInstallation"];

  v2 = [[MOBoolSettingMetadata alloc] initWithSettingName:v4 defaultBool:0 combineOperator:0 isPublic:1 scope:@"user" isPrivacySensitive:0];
  v3 = (void *)denyAppInstallationMetadata_metadata;
  denyAppInstallationMetadata_metadata = (uint64_t)v2;
}

- (NSNumber)denyAppRemoval
{
  return (NSNumber *)[(MOSettingsGroup *)self valueForSetting:@"denyAppRemoval"];
}

- (void)setDenyAppRemoval:(id)a3
{
}

+ (MOBoolSettingMetadata)denyAppRemovalMetadata
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__MOApplicationSettingsGroup_denyAppRemovalMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (denyAppRemovalMetadata_onceToken != -1) {
    dispatch_once(&denyAppRemovalMetadata_onceToken, block);
  }
  v2 = (void *)denyAppRemovalMetadata_metadata;
  return (MOBoolSettingMetadata *)v2;
}

void __52__MOApplicationSettingsGroup_denyAppRemovalMetadata__block_invoke()
{
  v0 = NSString;
  v1 = [(id)objc_opt_class() groupName];
  id v4 = [v0 stringWithFormat:@"%@.%@", v1, @"denyAppRemoval"];

  v2 = [[MOBoolSettingMetadata alloc] initWithSettingName:v4 defaultBool:0 combineOperator:0 isPublic:1 scope:@"user" isPrivacySensitive:0];
  v3 = (void *)denyAppRemovalMetadata_metadata;
  denyAppRemovalMetadata_metadata = (uint64_t)v2;
}

- (NSNumber)denyBackgroundAppRefresh
{
  return (NSNumber *)[(MOSettingsGroup *)self valueForSetting:@"denyBackgroundAppRefresh"];
}

- (void)setDenyBackgroundAppRefresh:(id)a3
{
}

+ (MOBoolSettingMetadata)denyBackgroundAppRefreshMetadata
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__MOApplicationSettingsGroup_denyBackgroundAppRefreshMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (denyBackgroundAppRefreshMetadata_onceToken != -1) {
    dispatch_once(&denyBackgroundAppRefreshMetadata_onceToken, block);
  }
  v2 = (void *)denyBackgroundAppRefreshMetadata_metadata;
  return (MOBoolSettingMetadata *)v2;
}

void __62__MOApplicationSettingsGroup_denyBackgroundAppRefreshMetadata__block_invoke()
{
  v0 = NSString;
  v1 = [(id)objc_opt_class() groupName];
  id v4 = [v0 stringWithFormat:@"%@.%@", v1, @"denyBackgroundAppRefresh"];

  v2 = [[MOBoolSettingMetadata alloc] initWithSettingName:v4 defaultBool:0 combineOperator:0 isPublic:0 scope:@"user" isPrivacySensitive:0];
  v3 = (void *)denyBackgroundAppRefreshMetadata_metadata;
  denyBackgroundAppRefreshMetadata_metadata = (uint64_t)v2;
}

- (NSSet)unremovableApplications
{
  return (NSSet *)[(MOSettingsGroup *)self valueForSetting:@"unremovableApplications"];
}

- (void)setUnremovableApplications:(id)a3
{
}

+ (MOApplicationSetSettingMetadata)unremovableApplicationsMetadata
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__MOApplicationSettingsGroup_unremovableApplicationsMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (unremovableApplicationsMetadata_onceToken != -1) {
    dispatch_once(&unremovableApplicationsMetadata_onceToken, block);
  }
  v2 = (void *)unremovableApplicationsMetadata_metadata;
  return (MOApplicationSetSettingMetadata *)v2;
}

void __61__MOApplicationSettingsGroup_unremovableApplicationsMetadata__block_invoke()
{
  v0 = NSString;
  v1 = [(id)objc_opt_class() groupName];
  id v7 = [v0 stringWithFormat:@"%@.%@", v1, @"unremovableApplications"];

  v2 = [MOApplicationSetSettingMetadata alloc];
  v3 = objc_opt_new();
  LOBYTE(v6) = 0;
  uint64_t v4 = [(MOSetSettingMetadata *)v2 initWithSettingName:v7 defaultSet:v3 combineOperator:1 maximumCount:-1 isPublic:0 scope:@"user" isPrivacySensitive:v6];
  v5 = (void *)unremovableApplicationsMetadata_metadata;
  unremovableApplicationsMetadata_metadata = v4;
}

@end