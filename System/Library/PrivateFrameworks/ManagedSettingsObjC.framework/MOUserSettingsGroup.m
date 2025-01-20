@interface MOUserSettingsGroup
+ (MOBoolSettingMetadata)denySharingMetadata;
+ (MOBoolSettingMetadata)denyUnrestrictedSharingMetadata;
+ (MOStringSettingMetadata)sharingPolicyMetadata;
+ (id)groupName;
- (NSNumber)denySharing;
- (NSNumber)denyUnrestrictedSharing;
- (NSString)sharingPolicy;
- (void)setDenySharing:(id)a3;
- (void)setDenyUnrestrictedSharing:(id)a3;
- (void)setSharingPolicy:(id)a3;
@end

@implementation MOUserSettingsGroup

+ (id)groupName
{
  return @"user";
}

- (NSNumber)denySharing
{
  return (NSNumber *)[(MOSettingsGroup *)self valueForSetting:@"denySharing"];
}

- (void)setDenySharing:(id)a3
{
}

+ (MOBoolSettingMetadata)denySharingMetadata
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__MOUserSettingsGroup_denySharingMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (denySharingMetadata_onceToken != -1) {
    dispatch_once(&denySharingMetadata_onceToken, block);
  }
  v2 = (void *)denySharingMetadata_metadata;
  return (MOBoolSettingMetadata *)v2;
}

void __42__MOUserSettingsGroup_denySharingMetadata__block_invoke()
{
  v0 = NSString;
  v1 = [(id)objc_opt_class() groupName];
  id v4 = [v0 stringWithFormat:@"%@.%@", v1, @"denySharing"];

  v2 = [[MOBoolSettingMetadata alloc] initWithSettingName:v4 defaultBool:0 combineOperator:0 isPublic:0 scope:@"user" isPrivacySensitive:0];
  v3 = (void *)denySharingMetadata_metadata;
  denySharingMetadata_metadata = (uint64_t)v2;
}

- (NSNumber)denyUnrestrictedSharing
{
  return (NSNumber *)[(MOSettingsGroup *)self valueForSetting:@"denyUnrestrictedSharing"];
}

- (void)setDenyUnrestrictedSharing:(id)a3
{
}

+ (MOBoolSettingMetadata)denyUnrestrictedSharingMetadata
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__MOUserSettingsGroup_denyUnrestrictedSharingMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (denyUnrestrictedSharingMetadata_onceToken != -1) {
    dispatch_once(&denyUnrestrictedSharingMetadata_onceToken, block);
  }
  v2 = (void *)denyUnrestrictedSharingMetadata_metadata;
  return (MOBoolSettingMetadata *)v2;
}

void __54__MOUserSettingsGroup_denyUnrestrictedSharingMetadata__block_invoke()
{
  v0 = NSString;
  v1 = [(id)objc_opt_class() groupName];
  id v4 = [v0 stringWithFormat:@"%@.%@", v1, @"denyUnrestrictedSharing"];

  v2 = [[MOBoolSettingMetadata alloc] initWithSettingName:v4 defaultBool:1 combineOperator:0 isPublic:0 scope:@"user" isPrivacySensitive:0];
  v3 = (void *)denyUnrestrictedSharingMetadata_metadata;
  denyUnrestrictedSharingMetadata_metadata = (uint64_t)v2;
}

- (NSString)sharingPolicy
{
  return (NSString *)[(MOSettingsGroup *)self valueForSetting:@"sharingPolicy"];
}

- (void)setSharingPolicy:(id)a3
{
}

+ (MOStringSettingMetadata)sharingPolicyMetadata
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__MOUserSettingsGroup_sharingPolicyMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharingPolicyMetadata_onceToken != -1) {
    dispatch_once(&sharingPolicyMetadata_onceToken, block);
  }
  v2 = (void *)sharingPolicyMetadata_metadata;
  return (MOStringSettingMetadata *)v2;
}

void __44__MOUserSettingsGroup_sharingPolicyMetadata__block_invoke()
{
  v9[3] = *MEMORY[0x1E4F143B8];
  v0 = NSString;
  v1 = [(id)objc_opt_class() groupName];
  v2 = [v0 stringWithFormat:@"%@.%@", v1, @"sharingPolicy"];

  v3 = [MOStringSettingMetadata alloc];
  v8[0] = @"none";
  v8[1] = @"unrestricted";
  v9[0] = &unk_1F12BB728;
  v9[1] = &unk_1F12BB740;
  v8[2] = @"restricted";
  v9[2] = &unk_1F12BB758;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:3];
  LOBYTE(v7) = 0;
  uint64_t v5 = [(MOStringSettingMetadata *)v3 initWithSettingName:v2 defaultString:@"none" combineOperator:1 rankedAllowedValues:v4 isPublic:0 scope:@"user" isPrivacySensitive:v7];
  v6 = (void *)sharingPolicyMetadata_metadata;
  sharingPolicyMetadata_metadata = v5;
}

@end