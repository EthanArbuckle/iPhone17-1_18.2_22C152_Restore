@interface MOScreenTimeSettingsGroup
+ (MOPersistableKeyStringDictionarySettingMetadata)applicationShieldPoliciesMetadata;
+ (MOPersistableKeyStringDictionarySettingMetadata)categoryShieldPoliciesMetadata;
+ (MOPersistableKeyStringDictionarySettingMetadata)webDomainShieldPoliciesMetadata;
+ (id)groupName;
- (NSDictionary)applicationShieldPolicies;
- (NSDictionary)categoryShieldPolicies;
- (NSDictionary)webDomainShieldPolicies;
- (void)setApplicationShieldPolicies:(id)a3;
- (void)setCategoryShieldPolicies:(id)a3;
- (void)setWebDomainShieldPolicies:(id)a3;
@end

@implementation MOScreenTimeSettingsGroup

+ (id)groupName
{
  return @"screenTime";
}

- (NSDictionary)applicationShieldPolicies
{
  return (NSDictionary *)[(MOSettingsGroup *)self valueForSetting:@"applicationShieldPolicies"];
}

- (void)setApplicationShieldPolicies:(id)a3
{
}

+ (MOPersistableKeyStringDictionarySettingMetadata)applicationShieldPoliciesMetadata
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__MOScreenTimeSettingsGroup_applicationShieldPoliciesMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (applicationShieldPoliciesMetadata_onceToken != -1) {
    dispatch_once(&applicationShieldPoliciesMetadata_onceToken, block);
  }
  v2 = (void *)applicationShieldPoliciesMetadata_metadata;
  return (MOPersistableKeyStringDictionarySettingMetadata *)v2;
}

void __62__MOScreenTimeSettingsGroup_applicationShieldPoliciesMetadata__block_invoke()
{
  v11[5] = *MEMORY[0x1E4F143B8];
  v0 = NSString;
  v1 = [(id)objc_opt_class() groupName];
  v2 = [v0 stringWithFormat:@"%@.%@", v1, @"applicationShieldPolicies"];

  v3 = [MOPersistableKeyStringDictionarySettingMetadata alloc];
  uint64_t v4 = objc_opt_class();
  v10[0] = @"none";
  v10[1] = @"warn";
  v11[0] = &unk_1F12BB668;
  v11[1] = &unk_1F12BB680;
  v10[2] = @"ask";
  v10[3] = @"askPending";
  v11[2] = &unk_1F12BB698;
  v11[3] = &unk_1F12BB6B0;
  v10[4] = @"blocked";
  v11[4] = &unk_1F12BB6C8;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:5];
  LOBYTE(v9) = 0;
  LOBYTE(v8) = 0;
  uint64_t v6 = [(MOPersistableKeyStringDictionarySettingMetadata *)v3 initWithSettingName:v2 defaultDictionary:MEMORY[0x1E4F1CC08] persistableKeyClass:v4 combineOperator:1 rankedAllowedValues:v5 maximumCount:-1 isPublic:v8 scope:@"user" isPrivacySensitive:v9];
  v7 = (void *)applicationShieldPoliciesMetadata_metadata;
  applicationShieldPoliciesMetadata_metadata = v6;
}

- (NSDictionary)categoryShieldPolicies
{
  return (NSDictionary *)[(MOSettingsGroup *)self valueForSetting:@"categoryShieldPolicies"];
}

- (void)setCategoryShieldPolicies:(id)a3
{
}

+ (MOPersistableKeyStringDictionarySettingMetadata)categoryShieldPoliciesMetadata
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__MOScreenTimeSettingsGroup_categoryShieldPoliciesMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (categoryShieldPoliciesMetadata_onceToken != -1) {
    dispatch_once(&categoryShieldPoliciesMetadata_onceToken, block);
  }
  v2 = (void *)categoryShieldPoliciesMetadata_metadata;
  return (MOPersistableKeyStringDictionarySettingMetadata *)v2;
}

void __59__MOScreenTimeSettingsGroup_categoryShieldPoliciesMetadata__block_invoke()
{
  v11[5] = *MEMORY[0x1E4F143B8];
  v0 = NSString;
  v1 = [(id)objc_opt_class() groupName];
  v2 = [v0 stringWithFormat:@"%@.%@", v1, @"categoryShieldPolicies"];

  v3 = [MOPersistableKeyStringDictionarySettingMetadata alloc];
  uint64_t v4 = objc_opt_class();
  v10[0] = @"none";
  v10[1] = @"warn";
  v11[0] = &unk_1F12BB668;
  v11[1] = &unk_1F12BB680;
  v10[2] = @"ask";
  v10[3] = @"askPending";
  v11[2] = &unk_1F12BB698;
  v11[3] = &unk_1F12BB6B0;
  v10[4] = @"blocked";
  v11[4] = &unk_1F12BB6C8;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:5];
  LOBYTE(v9) = 0;
  LOBYTE(v8) = 0;
  uint64_t v6 = [(MOPersistableKeyStringDictionarySettingMetadata *)v3 initWithSettingName:v2 defaultDictionary:MEMORY[0x1E4F1CC08] persistableKeyClass:v4 combineOperator:1 rankedAllowedValues:v5 maximumCount:-1 isPublic:v8 scope:@"user" isPrivacySensitive:v9];
  v7 = (void *)categoryShieldPoliciesMetadata_metadata;
  categoryShieldPoliciesMetadata_metadata = v6;
}

- (NSDictionary)webDomainShieldPolicies
{
  return (NSDictionary *)[(MOSettingsGroup *)self valueForSetting:@"webDomainShieldPolicies"];
}

- (void)setWebDomainShieldPolicies:(id)a3
{
}

+ (MOPersistableKeyStringDictionarySettingMetadata)webDomainShieldPoliciesMetadata
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__MOScreenTimeSettingsGroup_webDomainShieldPoliciesMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (webDomainShieldPoliciesMetadata_onceToken != -1) {
    dispatch_once(&webDomainShieldPoliciesMetadata_onceToken, block);
  }
  v2 = (void *)webDomainShieldPoliciesMetadata_metadata;
  return (MOPersistableKeyStringDictionarySettingMetadata *)v2;
}

void __60__MOScreenTimeSettingsGroup_webDomainShieldPoliciesMetadata__block_invoke()
{
  v11[5] = *MEMORY[0x1E4F143B8];
  v0 = NSString;
  v1 = [(id)objc_opt_class() groupName];
  v2 = [v0 stringWithFormat:@"%@.%@", v1, @"webDomainShieldPolicies"];

  v3 = [MOPersistableKeyStringDictionarySettingMetadata alloc];
  uint64_t v4 = objc_opt_class();
  v10[0] = @"none";
  v10[1] = @"warn";
  v11[0] = &unk_1F12BB668;
  v11[1] = &unk_1F12BB680;
  v10[2] = @"ask";
  v10[3] = @"askPending";
  v11[2] = &unk_1F12BB698;
  v11[3] = &unk_1F12BB6B0;
  v10[4] = @"blocked";
  v11[4] = &unk_1F12BB6C8;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:5];
  LOBYTE(v9) = 0;
  LOBYTE(v8) = 0;
  uint64_t v6 = [(MOPersistableKeyStringDictionarySettingMetadata *)v3 initWithSettingName:v2 defaultDictionary:MEMORY[0x1E4F1CC08] persistableKeyClass:v4 combineOperator:1 rankedAllowedValues:v5 maximumCount:-1 isPublic:v8 scope:@"user" isPrivacySensitive:v9];
  v7 = (void *)webDomainShieldPoliciesMetadata_metadata;
  webDomainShieldPoliciesMetadata_metadata = v6;
}

@end