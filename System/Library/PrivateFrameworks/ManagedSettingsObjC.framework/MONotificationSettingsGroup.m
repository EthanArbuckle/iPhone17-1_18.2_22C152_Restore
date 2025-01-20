@interface MONotificationSettingsGroup
+ (MOBoolSettingMetadata)lockDriverDoNotDisturbMetadata;
+ (id)groupName;
- (NSNumber)lockDriverDoNotDisturb;
- (void)setLockDriverDoNotDisturb:(id)a3;
@end

@implementation MONotificationSettingsGroup

+ (id)groupName
{
  return @"notification";
}

- (NSNumber)lockDriverDoNotDisturb
{
  return (NSNumber *)[(MOSettingsGroup *)self valueForSetting:@"lockDriverDoNotDisturb"];
}

- (void)setLockDriverDoNotDisturb:(id)a3
{
}

+ (MOBoolSettingMetadata)lockDriverDoNotDisturbMetadata
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__MONotificationSettingsGroup_lockDriverDoNotDisturbMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (lockDriverDoNotDisturbMetadata_onceToken != -1) {
    dispatch_once(&lockDriverDoNotDisturbMetadata_onceToken, block);
  }
  v2 = (void *)lockDriverDoNotDisturbMetadata_metadata;
  return (MOBoolSettingMetadata *)v2;
}

void __61__MONotificationSettingsGroup_lockDriverDoNotDisturbMetadata__block_invoke()
{
  v0 = NSString;
  v1 = [(id)objc_opt_class() groupName];
  id v4 = [v0 stringWithFormat:@"%@.%@", v1, @"lockDriverDoNotDisturb"];

  v2 = [[MOBoolSettingMetadata alloc] initWithSettingName:v4 defaultBool:0 combineOperator:0 isPublic:0 scope:@"user" isPrivacySensitive:0];
  v3 = (void *)lockDriverDoNotDisturbMetadata_metadata;
  lockDriverDoNotDisturbMetadata_metadata = (uint64_t)v2;
}

@end