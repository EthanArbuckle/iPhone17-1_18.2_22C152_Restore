@interface MOSiriSettingsGroup
+ (MOBoolSettingMetadata)denyFeature1Metadata;
+ (MOBoolSettingMetadata)denySiriMetadata;
+ (MOBoolSettingMetadata)denySiriUserGeneratedContentMetadata;
+ (MOBoolSettingMetadata)forceSiriProfanityFilterMetadata;
+ (id)groupName;
- (NSNumber)denyFeature1;
- (NSNumber)denySiri;
- (NSNumber)denySiriUserGeneratedContent;
- (NSNumber)forceSiriProfanityFilter;
- (void)setDenyFeature1:(id)a3;
- (void)setDenySiri:(id)a3;
- (void)setDenySiriUserGeneratedContent:(id)a3;
- (void)setForceSiriProfanityFilter:(id)a3;
@end

@implementation MOSiriSettingsGroup

+ (id)groupName
{
  return @"siri";
}

- (NSNumber)denyFeature1
{
  return (NSNumber *)[(MOSettingsGroup *)self valueForSetting:@"denyFeature1"];
}

- (void)setDenyFeature1:(id)a3
{
}

+ (MOBoolSettingMetadata)denyFeature1Metadata
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__MOSiriSettingsGroup_denyFeature1Metadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (denyFeature1Metadata_onceToken != -1) {
    dispatch_once(&denyFeature1Metadata_onceToken, block);
  }
  v2 = (void *)denyFeature1Metadata_metadata;
  return (MOBoolSettingMetadata *)v2;
}

void __43__MOSiriSettingsGroup_denyFeature1Metadata__block_invoke()
{
  v0 = NSString;
  v1 = [(id)objc_opt_class() groupName];
  id v4 = [v0 stringWithFormat:@"%@.%@", v1, @"denyFeature1"];

  v2 = [[MOBoolSettingMetadata alloc] initWithSettingName:v4 defaultBool:0 combineOperator:0 isPublic:0 scope:@"user" isPrivacySensitive:0];
  v3 = (void *)denyFeature1Metadata_metadata;
  denyFeature1Metadata_metadata = (uint64_t)v2;
}

- (NSNumber)denySiri
{
  return (NSNumber *)[(MOSettingsGroup *)self valueForSetting:@"denySiri"];
}

- (void)setDenySiri:(id)a3
{
}

+ (MOBoolSettingMetadata)denySiriMetadata
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__MOSiriSettingsGroup_denySiriMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (denySiriMetadata_onceToken != -1) {
    dispatch_once(&denySiriMetadata_onceToken, block);
  }
  v2 = (void *)denySiriMetadata_metadata;
  return (MOBoolSettingMetadata *)v2;
}

void __39__MOSiriSettingsGroup_denySiriMetadata__block_invoke()
{
  v0 = NSString;
  v1 = [(id)objc_opt_class() groupName];
  id v4 = [v0 stringWithFormat:@"%@.%@", v1, @"denySiri"];

  v2 = [[MOBoolSettingMetadata alloc] initWithSettingName:v4 defaultBool:0 combineOperator:0 isPublic:1 scope:@"user" isPrivacySensitive:0];
  v3 = (void *)denySiriMetadata_metadata;
  denySiriMetadata_metadata = (uint64_t)v2;
}

- (NSNumber)denySiriUserGeneratedContent
{
  return (NSNumber *)[(MOSettingsGroup *)self valueForSetting:@"denySiriUserGeneratedContent"];
}

- (void)setDenySiriUserGeneratedContent:(id)a3
{
}

+ (MOBoolSettingMetadata)denySiriUserGeneratedContentMetadata
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__MOSiriSettingsGroup_denySiriUserGeneratedContentMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (denySiriUserGeneratedContentMetadata_onceToken != -1) {
    dispatch_once(&denySiriUserGeneratedContentMetadata_onceToken, block);
  }
  v2 = (void *)denySiriUserGeneratedContentMetadata_metadata;
  return (MOBoolSettingMetadata *)v2;
}

void __59__MOSiriSettingsGroup_denySiriUserGeneratedContentMetadata__block_invoke()
{
  v0 = NSString;
  v1 = [(id)objc_opt_class() groupName];
  id v4 = [v0 stringWithFormat:@"%@.%@", v1, @"denySiriUserGeneratedContent"];

  v2 = [[MOBoolSettingMetadata alloc] initWithSettingName:v4 defaultBool:0 combineOperator:0 isPublic:0 scope:@"user" isPrivacySensitive:0];
  v3 = (void *)denySiriUserGeneratedContentMetadata_metadata;
  denySiriUserGeneratedContentMetadata_metadata = (uint64_t)v2;
}

- (NSNumber)forceSiriProfanityFilter
{
  return (NSNumber *)[(MOSettingsGroup *)self valueForSetting:@"forceSiriProfanityFilter"];
}

- (void)setForceSiriProfanityFilter:(id)a3
{
}

+ (MOBoolSettingMetadata)forceSiriProfanityFilterMetadata
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__MOSiriSettingsGroup_forceSiriProfanityFilterMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (forceSiriProfanityFilterMetadata_onceToken != -1) {
    dispatch_once(&forceSiriProfanityFilterMetadata_onceToken, block);
  }
  v2 = (void *)forceSiriProfanityFilterMetadata_metadata;
  return (MOBoolSettingMetadata *)v2;
}

void __55__MOSiriSettingsGroup_forceSiriProfanityFilterMetadata__block_invoke()
{
  v0 = NSString;
  v1 = [(id)objc_opt_class() groupName];
  id v4 = [v0 stringWithFormat:@"%@.%@", v1, @"forceSiriProfanityFilter"];

  v2 = [[MOBoolSettingMetadata alloc] initWithSettingName:v4 defaultBool:0 combineOperator:0 isPublic:0 scope:@"user" isPrivacySensitive:0];
  v3 = (void *)forceSiriProfanityFilterMetadata_metadata;
  forceSiriProfanityFilterMetadata_metadata = (uint64_t)v2;
}

@end