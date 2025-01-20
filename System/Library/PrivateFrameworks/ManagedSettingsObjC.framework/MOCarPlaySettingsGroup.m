@interface MOCarPlaySettingsGroup
+ (MOBoolSettingMetadata)denyCarPlayMetadata;
+ (id)groupName;
- (NSNumber)denyCarPlay;
- (void)setDenyCarPlay:(id)a3;
@end

@implementation MOCarPlaySettingsGroup

+ (id)groupName
{
  return @"carPlay";
}

- (NSNumber)denyCarPlay
{
  return (NSNumber *)[(MOSettingsGroup *)self valueForSetting:@"denyCarPlay"];
}

- (void)setDenyCarPlay:(id)a3
{
}

+ (MOBoolSettingMetadata)denyCarPlayMetadata
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__MOCarPlaySettingsGroup_denyCarPlayMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (denyCarPlayMetadata_onceToken != -1) {
    dispatch_once(&denyCarPlayMetadata_onceToken, block);
  }
  v2 = (void *)denyCarPlayMetadata_metadata;
  return (MOBoolSettingMetadata *)v2;
}

void __45__MOCarPlaySettingsGroup_denyCarPlayMetadata__block_invoke()
{
  v0 = NSString;
  v1 = [(id)objc_opt_class() groupName];
  id v4 = [v0 stringWithFormat:@"%@.%@", v1, @"denyCarPlay"];

  v2 = [[MOBoolSettingMetadata alloc] initWithSettingName:v4 defaultBool:0 combineOperator:0 isPublic:0 scope:@"user" isPrivacySensitive:0];
  v3 = (void *)denyCarPlayMetadata_metadata;
  denyCarPlayMetadata_metadata = (uint64_t)v2;
}

@end