@interface MOShieldSettingsGroup
+ (MOApplicationCategoryShieldPolicySettingMetadata)applicationCategoriesMetadata;
+ (MOApplicationSetSettingMetadata)applicationsMetadata;
+ (MOApplicationSetSettingMetadata)unshieldableApplicationsMetadata;
+ (MOWebDomainCategoryShieldPolicySettingMetadata)webDomainCategoriesMetadata;
+ (MOWebDomainSetSettingMetadata)unshieldableWebDomainsMetadata;
+ (MOWebDomainSetSettingMetadata)webDomainsMetadata;
+ (id)groupName;
- (MOApplicationCategoryShieldPolicy)applicationCategories;
- (MOWebDomainCategoryShieldPolicy)webDomainCategories;
- (NSSet)applications;
- (NSSet)unshieldableApplications;
- (NSSet)unshieldableWebDomains;
- (NSSet)webDomains;
- (void)setApplicationCategories:(id)a3;
- (void)setApplications:(id)a3;
- (void)setUnshieldableApplications:(id)a3;
- (void)setUnshieldableWebDomains:(id)a3;
- (void)setWebDomainCategories:(id)a3;
- (void)setWebDomains:(id)a3;
@end

@implementation MOShieldSettingsGroup

- (NSSet)applications
{
  return (NSSet *)[(MOSettingsGroup *)self valueForSetting:@"applications"];
}

- (MOApplicationCategoryShieldPolicy)applicationCategories
{
  return (MOApplicationCategoryShieldPolicy *)[(MOSettingsGroup *)self valueForSetting:@"applicationCategories"];
}

+ (id)groupName
{
  return @"shield";
}

- (NSSet)webDomains
{
  return (NSSet *)[(MOSettingsGroup *)self valueForSetting:@"webDomains"];
}

+ (MOApplicationSetSettingMetadata)applicationsMetadata
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__MOShieldSettingsGroup_applicationsMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (applicationsMetadata_onceToken != -1) {
    dispatch_once(&applicationsMetadata_onceToken, block);
  }
  v2 = (void *)applicationsMetadata_metadata;
  return (MOApplicationSetSettingMetadata *)v2;
}

+ (MOApplicationCategoryShieldPolicySettingMetadata)applicationCategoriesMetadata
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__MOShieldSettingsGroup_applicationCategoriesMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (applicationCategoriesMetadata_onceToken != -1) {
    dispatch_once(&applicationCategoriesMetadata_onceToken, block);
  }
  v2 = (void *)applicationCategoriesMetadata_metadata;
  return (MOApplicationCategoryShieldPolicySettingMetadata *)v2;
}

- (MOWebDomainCategoryShieldPolicy)webDomainCategories
{
  return (MOWebDomainCategoryShieldPolicy *)[(MOSettingsGroup *)self valueForSetting:@"webDomainCategories"];
}

+ (MOWebDomainSetSettingMetadata)webDomainsMetadata
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__MOShieldSettingsGroup_webDomainsMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (webDomainsMetadata_onceToken != -1) {
    dispatch_once(&webDomainsMetadata_onceToken, block);
  }
  v2 = (void *)webDomainsMetadata_metadata;
  return (MOWebDomainSetSettingMetadata *)v2;
}

+ (MOWebDomainCategoryShieldPolicySettingMetadata)webDomainCategoriesMetadata
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__MOShieldSettingsGroup_webDomainCategoriesMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (webDomainCategoriesMetadata_onceToken != -1) {
    dispatch_once(&webDomainCategoriesMetadata_onceToken, block);
  }
  v2 = (void *)webDomainCategoriesMetadata_metadata;
  return (MOWebDomainCategoryShieldPolicySettingMetadata *)v2;
}

- (void)setApplications:(id)a3
{
}

void __45__MOShieldSettingsGroup_applicationsMetadata__block_invoke()
{
  v0 = NSString;
  v1 = [(id)objc_opt_class() groupName];
  id v7 = [v0 stringWithFormat:@"%@.%@", v1, @"applications"];

  v2 = [MOApplicationSetSettingMetadata alloc];
  v3 = objc_opt_new();
  LOBYTE(v6) = 0;
  uint64_t v4 = [(MOSetSettingMetadata *)v2 initWithSettingName:v7 defaultSet:v3 combineOperator:1 maximumCount:50 isPublic:1 scope:@"user" isPrivacySensitive:v6];
  v5 = (void *)applicationsMetadata_metadata;
  applicationsMetadata_metadata = v4;
}

- (void)setApplicationCategories:(id)a3
{
}

void __54__MOShieldSettingsGroup_applicationCategoriesMetadata__block_invoke()
{
  v0 = NSString;
  v1 = [(id)objc_opt_class() groupName];
  id v7 = [v0 stringWithFormat:@"%@.%@", v1, @"applicationCategories"];

  v2 = [MOApplicationCategoryShieldPolicySettingMetadata alloc];
  v3 = +[MOCategoryShieldPolicy nonePolicy];
  LOBYTE(v6) = 0;
  uint64_t v4 = [(MOApplicationCategoryShieldPolicySettingMetadata *)v2 initWithSettingName:v7 defaultPolicy:v3 maximumCategoryCount:50 maximumActivityCount:50 isPublic:1 scope:@"user" isPrivacySensitive:v6];
  v5 = (void *)applicationCategoriesMetadata_metadata;
  applicationCategoriesMetadata_metadata = v4;
}

- (NSSet)unshieldableApplications
{
  return (NSSet *)[(MOSettingsGroup *)self valueForSetting:@"unshieldableApplications"];
}

- (void)setUnshieldableApplications:(id)a3
{
}

+ (MOApplicationSetSettingMetadata)unshieldableApplicationsMetadata
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__MOShieldSettingsGroup_unshieldableApplicationsMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (unshieldableApplicationsMetadata_onceToken != -1) {
    dispatch_once(&unshieldableApplicationsMetadata_onceToken, block);
  }
  v2 = (void *)unshieldableApplicationsMetadata_metadata;
  return (MOApplicationSetSettingMetadata *)v2;
}

void __57__MOShieldSettingsGroup_unshieldableApplicationsMetadata__block_invoke()
{
  v0 = NSString;
  v1 = [(id)objc_opt_class() groupName];
  id v7 = [v0 stringWithFormat:@"%@.%@", v1, @"unshieldableApplications"];

  v2 = [MOApplicationSetSettingMetadata alloc];
  v3 = objc_opt_new();
  LOBYTE(v6) = 0;
  uint64_t v4 = [(MOSetSettingMetadata *)v2 initWithSettingName:v7 defaultSet:v3 combineOperator:1 maximumCount:-1 isPublic:0 scope:@"localContainer" isPrivacySensitive:v6];
  v5 = (void *)unshieldableApplicationsMetadata_metadata;
  unshieldableApplicationsMetadata_metadata = v4;
}

- (NSSet)unshieldableWebDomains
{
  return (NSSet *)[(MOSettingsGroup *)self valueForSetting:@"unshieldableWebDomains"];
}

- (void)setUnshieldableWebDomains:(id)a3
{
}

+ (MOWebDomainSetSettingMetadata)unshieldableWebDomainsMetadata
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__MOShieldSettingsGroup_unshieldableWebDomainsMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (unshieldableWebDomainsMetadata_onceToken != -1) {
    dispatch_once(&unshieldableWebDomainsMetadata_onceToken, block);
  }
  v2 = (void *)unshieldableWebDomainsMetadata_metadata;
  return (MOWebDomainSetSettingMetadata *)v2;
}

void __55__MOShieldSettingsGroup_unshieldableWebDomainsMetadata__block_invoke()
{
  v0 = NSString;
  v1 = [(id)objc_opt_class() groupName];
  id v7 = [v0 stringWithFormat:@"%@.%@", v1, @"unshieldableWebDomains"];

  v2 = [MOWebDomainSetSettingMetadata alloc];
  v3 = objc_opt_new();
  LOBYTE(v6) = 0;
  uint64_t v4 = [(MOSetSettingMetadata *)v2 initWithSettingName:v7 defaultSet:v3 combineOperator:1 maximumCount:-1 isPublic:0 scope:@"localContainer" isPrivacySensitive:v6];
  v5 = (void *)unshieldableWebDomainsMetadata_metadata;
  unshieldableWebDomainsMetadata_metadata = v4;
}

- (void)setWebDomains:(id)a3
{
}

void __43__MOShieldSettingsGroup_webDomainsMetadata__block_invoke()
{
  v0 = NSString;
  v1 = [(id)objc_opt_class() groupName];
  id v7 = [v0 stringWithFormat:@"%@.%@", v1, @"webDomains"];

  v2 = [MOWebDomainSetSettingMetadata alloc];
  v3 = objc_opt_new();
  LOBYTE(v6) = 0;
  uint64_t v4 = [(MOSetSettingMetadata *)v2 initWithSettingName:v7 defaultSet:v3 combineOperator:1 maximumCount:50 isPublic:1 scope:@"user" isPrivacySensitive:v6];
  v5 = (void *)webDomainsMetadata_metadata;
  webDomainsMetadata_metadata = v4;
}

- (void)setWebDomainCategories:(id)a3
{
}

void __52__MOShieldSettingsGroup_webDomainCategoriesMetadata__block_invoke()
{
  v0 = NSString;
  v1 = [(id)objc_opt_class() groupName];
  id v7 = [v0 stringWithFormat:@"%@.%@", v1, @"webDomainCategories"];

  v2 = [MOWebDomainCategoryShieldPolicySettingMetadata alloc];
  v3 = +[MOCategoryShieldPolicy nonePolicy];
  LOBYTE(v6) = 0;
  uint64_t v4 = [(MOWebDomainCategoryShieldPolicySettingMetadata *)v2 initWithSettingName:v7 defaultPolicy:v3 maximumCategoryCount:50 maximumActivityCount:50 isPublic:1 scope:@"user" isPrivacySensitive:v6];
  v5 = (void *)webDomainCategoriesMetadata_metadata;
  webDomainCategoriesMetadata_metadata = v4;
}

@end