@interface MOWebContentSettingsGroup
+ (MOWebContentFilterPolicySettingMetadata)blockedByFilterMetadata;
+ (id)groupName;
- (MOWebContentFilterPolicy)blockedByFilter;
- (void)setBlockedByFilter:(id)a3;
@end

@implementation MOWebContentSettingsGroup

+ (id)groupName
{
  return @"webContent";
}

- (MOWebContentFilterPolicy)blockedByFilter
{
  return (MOWebContentFilterPolicy *)[(MOSettingsGroup *)self valueForSetting:@"blockedByFilter"];
}

- (void)setBlockedByFilter:(id)a3
{
}

+ (MOWebContentFilterPolicySettingMetadata)blockedByFilterMetadata
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__MOWebContentSettingsGroup_blockedByFilterMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (blockedByFilterMetadata_onceToken != -1) {
    dispatch_once(&blockedByFilterMetadata_onceToken, block);
  }
  v2 = (void *)blockedByFilterMetadata_metadata;
  return (MOWebContentFilterPolicySettingMetadata *)v2;
}

void __52__MOWebContentSettingsGroup_blockedByFilterMetadata__block_invoke()
{
  v0 = NSString;
  v1 = [(id)objc_opt_class() groupName];
  id v7 = [v0 stringWithFormat:@"%@.%@", v1, @"blockedByFilter"];

  v2 = [MOWebContentFilterPolicySettingMetadata alloc];
  v3 = +[MOWebContentFilterPolicy nonePolicy];
  LOBYTE(v6) = 0;
  uint64_t v4 = [(MOWebContentFilterPolicySettingMetadata *)v2 initWithSettingName:v7 defaultPolicy:v3 maximumAutoAllowCount:50 maximumNeverAllowCount:50 maximumOnlyAllowCount:50 isPublic:1 scope:@"user" isPrivacySensitive:v6];
  v5 = (void *)blockedByFilterMetadata_metadata;
  blockedByFilterMetadata_metadata = v4;
}

@end