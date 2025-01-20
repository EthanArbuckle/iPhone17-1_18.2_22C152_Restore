@interface MOSafariSettingsGroup
+ (MOBoolSettingMetadata)denyAutoFillMetadata;
+ (MOBoolSettingMetadata)denySafariMetadata;
+ (MOStringSettingMetadata)cookiePolicyMetadata;
+ (id)groupName;
- (NSNumber)denyAutoFill;
- (NSNumber)denySafari;
- (NSString)cookiePolicy;
- (void)setCookiePolicy:(id)a3;
- (void)setDenyAutoFill:(id)a3;
- (void)setDenySafari:(id)a3;
@end

@implementation MOSafariSettingsGroup

+ (id)groupName
{
  return @"safari";
}

- (NSString)cookiePolicy
{
  return (NSString *)[(MOSettingsGroup *)self valueForSetting:@"cookiePolicy"];
}

- (void)setCookiePolicy:(id)a3
{
}

+ (MOStringSettingMetadata)cookiePolicyMetadata
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__MOSafariSettingsGroup_cookiePolicyMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (cookiePolicyMetadata_onceToken != -1) {
    dispatch_once(&cookiePolicyMetadata_onceToken, block);
  }
  v2 = (void *)cookiePolicyMetadata_metadata;
  return (MOStringSettingMetadata *)v2;
}

void __45__MOSafariSettingsGroup_cookiePolicyMetadata__block_invoke()
{
  v9[4] = *MEMORY[0x1E4F143B8];
  v0 = NSString;
  v1 = [(id)objc_opt_class() groupName];
  v2 = [v0 stringWithFormat:@"%@.%@", v1, @"cookiePolicy"];

  v3 = [MOStringSettingMetadata alloc];
  v8[0] = @"never";
  v8[1] = @"currentWebsite";
  v9[0] = &unk_1F12BB770;
  v9[1] = &unk_1F12BB788;
  v8[2] = @"visitedWebsites";
  v8[3] = @"always";
  v9[2] = &unk_1F12BB7A0;
  v9[3] = &unk_1F12BB7B8;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:4];
  LOBYTE(v7) = 0;
  uint64_t v5 = [(MOStringSettingMetadata *)v3 initWithSettingName:v2 defaultString:@"always" combineOperator:0 rankedAllowedValues:v4 isPublic:1 scope:@"user" isPrivacySensitive:v7];
  v6 = (void *)cookiePolicyMetadata_metadata;
  cookiePolicyMetadata_metadata = v5;
}

- (NSNumber)denyAutoFill
{
  return (NSNumber *)[(MOSettingsGroup *)self valueForSetting:@"denyAutoFill"];
}

- (void)setDenyAutoFill:(id)a3
{
}

+ (MOBoolSettingMetadata)denyAutoFillMetadata
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__MOSafariSettingsGroup_denyAutoFillMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (denyAutoFillMetadata_onceToken != -1) {
    dispatch_once(&denyAutoFillMetadata_onceToken, block);
  }
  v2 = (void *)denyAutoFillMetadata_metadata;
  return (MOBoolSettingMetadata *)v2;
}

void __45__MOSafariSettingsGroup_denyAutoFillMetadata__block_invoke()
{
  v0 = NSString;
  v1 = [(id)objc_opt_class() groupName];
  id v4 = [v0 stringWithFormat:@"%@.%@", v1, @"denyAutoFill"];

  v2 = [[MOBoolSettingMetadata alloc] initWithSettingName:v4 defaultBool:0 combineOperator:0 isPublic:1 scope:@"user" isPrivacySensitive:0];
  v3 = (void *)denyAutoFillMetadata_metadata;
  denyAutoFillMetadata_metadata = (uint64_t)v2;
}

- (NSNumber)denySafari
{
  return (NSNumber *)[(MOSettingsGroup *)self valueForSetting:@"denySafari"];
}

- (void)setDenySafari:(id)a3
{
}

+ (MOBoolSettingMetadata)denySafariMetadata
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__MOSafariSettingsGroup_denySafariMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (denySafariMetadata_onceToken != -1) {
    dispatch_once(&denySafariMetadata_onceToken, block);
  }
  v2 = (void *)denySafariMetadata_metadata;
  return (MOBoolSettingMetadata *)v2;
}

void __43__MOSafariSettingsGroup_denySafariMetadata__block_invoke()
{
  v0 = NSString;
  v1 = [(id)objc_opt_class() groupName];
  id v4 = [v0 stringWithFormat:@"%@.%@", v1, @"denySafari"];

  v2 = [[MOBoolSettingMetadata alloc] initWithSettingName:v4 defaultBool:0 combineOperator:0 isPublic:0 scope:@"user" isPrivacySensitive:0];
  v3 = (void *)denySafariMetadata_metadata;
  denySafariMetadata_metadata = (uint64_t)v2;
}

@end