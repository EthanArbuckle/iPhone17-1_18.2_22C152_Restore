@interface MOPasscodeSettingsGroup
+ (MOBoolSettingMetadata)lockPasscodeMetadata;
+ (id)groupName;
- (NSNumber)lockPasscode;
- (void)setLockPasscode:(id)a3;
@end

@implementation MOPasscodeSettingsGroup

+ (id)groupName
{
  return @"passcode";
}

- (NSNumber)lockPasscode
{
  return (NSNumber *)[(MOSettingsGroup *)self valueForSetting:@"lockPasscode"];
}

- (void)setLockPasscode:(id)a3
{
}

+ (MOBoolSettingMetadata)lockPasscodeMetadata
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__MOPasscodeSettingsGroup_lockPasscodeMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (lockPasscodeMetadata_onceToken != -1) {
    dispatch_once(&lockPasscodeMetadata_onceToken, block);
  }
  v2 = (void *)lockPasscodeMetadata_metadata;
  return (MOBoolSettingMetadata *)v2;
}

void __47__MOPasscodeSettingsGroup_lockPasscodeMetadata__block_invoke()
{
  v0 = NSString;
  v1 = [(id)objc_opt_class() groupName];
  id v4 = [v0 stringWithFormat:@"%@.%@", v1, @"lockPasscode"];

  v2 = [[MOBoolSettingMetadata alloc] initWithSettingName:v4 defaultBool:0 combineOperator:0 isPublic:1 scope:@"user" isPrivacySensitive:0];
  v3 = (void *)lockPasscodeMetadata_metadata;
  lockPasscodeMetadata_metadata = (uint64_t)v2;
}

@end