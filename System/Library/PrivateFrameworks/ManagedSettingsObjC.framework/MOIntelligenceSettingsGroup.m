@interface MOIntelligenceSettingsGroup
+ (MOBoolSettingMetadata)denyExternalIntelligenceIntegrationsMetadata;
+ (MOBoolSettingMetadata)denyGenmojiMetadata;
+ (MOBoolSettingMetadata)denyImagePlaygroundMetadata;
+ (MOBoolSettingMetadata)denyImageWandMetadata;
+ (MOBoolSettingMetadata)denyWritingToolsMetadata;
+ (id)groupName;
- (NSNumber)denyExternalIntelligenceIntegrations;
- (NSNumber)denyGenmoji;
- (NSNumber)denyImagePlayground;
- (NSNumber)denyImageWand;
- (NSNumber)denyWritingTools;
- (void)setDenyExternalIntelligenceIntegrations:(id)a3;
- (void)setDenyGenmoji:(id)a3;
- (void)setDenyImagePlayground:(id)a3;
- (void)setDenyImageWand:(id)a3;
- (void)setDenyWritingTools:(id)a3;
@end

@implementation MOIntelligenceSettingsGroup

+ (id)groupName
{
  return @"intelligence";
}

- (NSNumber)denyExternalIntelligenceIntegrations
{
  return (NSNumber *)[(MOSettingsGroup *)self valueForSetting:@"denyExternalIntelligenceIntegrations"];
}

- (void)setDenyExternalIntelligenceIntegrations:(id)a3
{
}

+ (MOBoolSettingMetadata)denyExternalIntelligenceIntegrationsMetadata
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__MOIntelligenceSettingsGroup_denyExternalIntelligenceIntegrationsMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (denyExternalIntelligenceIntegrationsMetadata_onceToken != -1) {
    dispatch_once(&denyExternalIntelligenceIntegrationsMetadata_onceToken, block);
  }
  v2 = (void *)denyExternalIntelligenceIntegrationsMetadata_metadata;
  return (MOBoolSettingMetadata *)v2;
}

void __75__MOIntelligenceSettingsGroup_denyExternalIntelligenceIntegrationsMetadata__block_invoke()
{
  v0 = NSString;
  v1 = [(id)objc_opt_class() groupName];
  id v4 = [v0 stringWithFormat:@"%@.%@", v1, @"denyExternalIntelligenceIntegrations"];

  v2 = [[MOBoolSettingMetadata alloc] initWithSettingName:v4 defaultBool:0 combineOperator:0 isPublic:0 scope:@"user" isPrivacySensitive:0];
  v3 = (void *)denyExternalIntelligenceIntegrationsMetadata_metadata;
  denyExternalIntelligenceIntegrationsMetadata_metadata = (uint64_t)v2;
}

- (NSNumber)denyGenmoji
{
  return (NSNumber *)[(MOSettingsGroup *)self valueForSetting:@"denyGenmoji"];
}

- (void)setDenyGenmoji:(id)a3
{
}

+ (MOBoolSettingMetadata)denyGenmojiMetadata
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__MOIntelligenceSettingsGroup_denyGenmojiMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (denyGenmojiMetadata_onceToken != -1) {
    dispatch_once(&denyGenmojiMetadata_onceToken, block);
  }
  v2 = (void *)denyGenmojiMetadata_metadata;
  return (MOBoolSettingMetadata *)v2;
}

void __50__MOIntelligenceSettingsGroup_denyGenmojiMetadata__block_invoke()
{
  v0 = NSString;
  v1 = [(id)objc_opt_class() groupName];
  id v4 = [v0 stringWithFormat:@"%@.%@", v1, @"denyGenmoji"];

  v2 = [[MOBoolSettingMetadata alloc] initWithSettingName:v4 defaultBool:0 combineOperator:0 isPublic:0 scope:@"user" isPrivacySensitive:0];
  v3 = (void *)denyGenmojiMetadata_metadata;
  denyGenmojiMetadata_metadata = (uint64_t)v2;
}

- (NSNumber)denyImagePlayground
{
  return (NSNumber *)[(MOSettingsGroup *)self valueForSetting:@"denyImagePlayground"];
}

- (void)setDenyImagePlayground:(id)a3
{
}

+ (MOBoolSettingMetadata)denyImagePlaygroundMetadata
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__MOIntelligenceSettingsGroup_denyImagePlaygroundMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (denyImagePlaygroundMetadata_onceToken != -1) {
    dispatch_once(&denyImagePlaygroundMetadata_onceToken, block);
  }
  v2 = (void *)denyImagePlaygroundMetadata_metadata;
  return (MOBoolSettingMetadata *)v2;
}

void __58__MOIntelligenceSettingsGroup_denyImagePlaygroundMetadata__block_invoke()
{
  v0 = NSString;
  v1 = [(id)objc_opt_class() groupName];
  id v4 = [v0 stringWithFormat:@"%@.%@", v1, @"denyImagePlayground"];

  v2 = [[MOBoolSettingMetadata alloc] initWithSettingName:v4 defaultBool:0 combineOperator:0 isPublic:0 scope:@"user" isPrivacySensitive:0];
  v3 = (void *)denyImagePlaygroundMetadata_metadata;
  denyImagePlaygroundMetadata_metadata = (uint64_t)v2;
}

- (NSNumber)denyImageWand
{
  return (NSNumber *)[(MOSettingsGroup *)self valueForSetting:@"denyImageWand"];
}

- (void)setDenyImageWand:(id)a3
{
}

+ (MOBoolSettingMetadata)denyImageWandMetadata
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__MOIntelligenceSettingsGroup_denyImageWandMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (denyImageWandMetadata_onceToken != -1) {
    dispatch_once(&denyImageWandMetadata_onceToken, block);
  }
  v2 = (void *)denyImageWandMetadata_metadata;
  return (MOBoolSettingMetadata *)v2;
}

void __52__MOIntelligenceSettingsGroup_denyImageWandMetadata__block_invoke()
{
  v0 = NSString;
  v1 = [(id)objc_opt_class() groupName];
  id v4 = [v0 stringWithFormat:@"%@.%@", v1, @"denyImageWand"];

  v2 = [[MOBoolSettingMetadata alloc] initWithSettingName:v4 defaultBool:0 combineOperator:0 isPublic:0 scope:@"user" isPrivacySensitive:0];
  v3 = (void *)denyImageWandMetadata_metadata;
  denyImageWandMetadata_metadata = (uint64_t)v2;
}

- (NSNumber)denyWritingTools
{
  return (NSNumber *)[(MOSettingsGroup *)self valueForSetting:@"denyWritingTools"];
}

- (void)setDenyWritingTools:(id)a3
{
}

+ (MOBoolSettingMetadata)denyWritingToolsMetadata
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__MOIntelligenceSettingsGroup_denyWritingToolsMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (denyWritingToolsMetadata_onceToken != -1) {
    dispatch_once(&denyWritingToolsMetadata_onceToken, block);
  }
  v2 = (void *)denyWritingToolsMetadata_metadata;
  return (MOBoolSettingMetadata *)v2;
}

void __55__MOIntelligenceSettingsGroup_denyWritingToolsMetadata__block_invoke()
{
  v0 = NSString;
  v1 = [(id)objc_opt_class() groupName];
  id v4 = [v0 stringWithFormat:@"%@.%@", v1, @"denyWritingTools"];

  v2 = [[MOBoolSettingMetadata alloc] initWithSettingName:v4 defaultBool:0 combineOperator:0 isPublic:0 scope:@"user" isPrivacySensitive:0];
  v3 = (void *)denyWritingToolsMetadata_metadata;
  denyWritingToolsMetadata_metadata = (uint64_t)v2;
}

@end