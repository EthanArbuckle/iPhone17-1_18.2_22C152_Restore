@interface MONewsSettingsGroup
+ (MOBoolSettingMetadata)denyNewsMetadata;
+ (id)groupName;
- (NSNumber)denyNews;
- (void)setDenyNews:(id)a3;
@end

@implementation MONewsSettingsGroup

+ (id)groupName
{
  return @"news";
}

- (NSNumber)denyNews
{
  return (NSNumber *)[(MOSettingsGroup *)self valueForSetting:@"denyNews"];
}

- (void)setDenyNews:(id)a3
{
}

+ (MOBoolSettingMetadata)denyNewsMetadata
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__MONewsSettingsGroup_denyNewsMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (denyNewsMetadata_onceToken != -1) {
    dispatch_once(&denyNewsMetadata_onceToken, block);
  }
  v2 = (void *)denyNewsMetadata_metadata;
  return (MOBoolSettingMetadata *)v2;
}

void __39__MONewsSettingsGroup_denyNewsMetadata__block_invoke()
{
  v0 = NSString;
  v1 = [(id)objc_opt_class() groupName];
  id v4 = [v0 stringWithFormat:@"%@.%@", v1, @"denyNews"];

  v2 = [[MOBoolSettingMetadata alloc] initWithSettingName:v4 defaultBool:0 combineOperator:0 isPublic:0 scope:@"user" isPrivacySensitive:0];
  v3 = (void *)denyNewsMetadata_metadata;
  denyNewsMetadata_metadata = (uint64_t)v2;
}

@end