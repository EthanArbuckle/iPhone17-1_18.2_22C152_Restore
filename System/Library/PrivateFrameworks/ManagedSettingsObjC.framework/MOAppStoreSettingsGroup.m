@interface MOAppStoreSettingsGroup
+ (MOBoolSettingMetadata)denyAppStoreAppInstallationMetadata;
+ (MOBoolSettingMetadata)denyInAppPurchasesMetadata;
+ (MOBoolSettingMetadata)denyMarketplaceAppInstallationMetadata;
+ (MOBoolSettingMetadata)denyWebDistributionAppInstallationMetadata;
+ (MOBoolSettingMetadata)requirePasswordForPurchasesMetadata;
+ (MOIntegerSettingMetadata)maximumRatingMetadata;
+ (id)groupName;
- (NSNumber)denyAppStoreAppInstallation;
- (NSNumber)denyInAppPurchases;
- (NSNumber)denyMarketplaceAppInstallation;
- (NSNumber)denyWebDistributionAppInstallation;
- (NSNumber)maximumRating;
- (NSNumber)requirePasswordForPurchases;
- (void)setDenyAppStoreAppInstallation:(id)a3;
- (void)setDenyInAppPurchases:(id)a3;
- (void)setDenyMarketplaceAppInstallation:(id)a3;
- (void)setDenyWebDistributionAppInstallation:(id)a3;
- (void)setMaximumRating:(id)a3;
- (void)setRequirePasswordForPurchases:(id)a3;
@end

@implementation MOAppStoreSettingsGroup

+ (id)groupName
{
  return @"appStore";
}

- (NSNumber)denyAppStoreAppInstallation
{
  return (NSNumber *)[(MOSettingsGroup *)self valueForSetting:@"denyAppStoreAppInstallation"];
}

- (void)setDenyAppStoreAppInstallation:(id)a3
{
}

+ (MOBoolSettingMetadata)denyAppStoreAppInstallationMetadata
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__MOAppStoreSettingsGroup_denyAppStoreAppInstallationMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (denyAppStoreAppInstallationMetadata_onceToken != -1) {
    dispatch_once(&denyAppStoreAppInstallationMetadata_onceToken, block);
  }
  v2 = (void *)denyAppStoreAppInstallationMetadata_metadata;
  return (MOBoolSettingMetadata *)v2;
}

void __62__MOAppStoreSettingsGroup_denyAppStoreAppInstallationMetadata__block_invoke()
{
  v0 = NSString;
  v1 = [(id)objc_opt_class() groupName];
  id v4 = [v0 stringWithFormat:@"%@.%@", v1, @"denyAppStoreAppInstallation"];

  v2 = [[MOBoolSettingMetadata alloc] initWithSettingName:v4 defaultBool:0 combineOperator:0 isPublic:0 scope:@"user" isPrivacySensitive:0];
  v3 = (void *)denyAppStoreAppInstallationMetadata_metadata;
  denyAppStoreAppInstallationMetadata_metadata = (uint64_t)v2;
}

- (NSNumber)denyInAppPurchases
{
  return (NSNumber *)[(MOSettingsGroup *)self valueForSetting:@"denyInAppPurchases"];
}

- (void)setDenyInAppPurchases:(id)a3
{
}

+ (MOBoolSettingMetadata)denyInAppPurchasesMetadata
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__MOAppStoreSettingsGroup_denyInAppPurchasesMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (denyInAppPurchasesMetadata_onceToken != -1) {
    dispatch_once(&denyInAppPurchasesMetadata_onceToken, block);
  }
  v2 = (void *)denyInAppPurchasesMetadata_metadata;
  return (MOBoolSettingMetadata *)v2;
}

void __53__MOAppStoreSettingsGroup_denyInAppPurchasesMetadata__block_invoke()
{
  v0 = NSString;
  v1 = [(id)objc_opt_class() groupName];
  id v4 = [v0 stringWithFormat:@"%@.%@", v1, @"denyInAppPurchases"];

  v2 = [[MOBoolSettingMetadata alloc] initWithSettingName:v4 defaultBool:0 combineOperator:0 isPublic:1 scope:@"user" isPrivacySensitive:0];
  v3 = (void *)denyInAppPurchasesMetadata_metadata;
  denyInAppPurchasesMetadata_metadata = (uint64_t)v2;
}

- (NSNumber)denyMarketplaceAppInstallation
{
  return (NSNumber *)[(MOSettingsGroup *)self valueForSetting:@"denyMarketplaceAppInstallation"];
}

- (void)setDenyMarketplaceAppInstallation:(id)a3
{
}

+ (MOBoolSettingMetadata)denyMarketplaceAppInstallationMetadata
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__MOAppStoreSettingsGroup_denyMarketplaceAppInstallationMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (denyMarketplaceAppInstallationMetadata_onceToken != -1) {
    dispatch_once(&denyMarketplaceAppInstallationMetadata_onceToken, block);
  }
  v2 = (void *)denyMarketplaceAppInstallationMetadata_metadata;
  return (MOBoolSettingMetadata *)v2;
}

void __65__MOAppStoreSettingsGroup_denyMarketplaceAppInstallationMetadata__block_invoke()
{
  v0 = NSString;
  v1 = [(id)objc_opt_class() groupName];
  id v4 = [v0 stringWithFormat:@"%@.%@", v1, @"denyMarketplaceAppInstallation"];

  v2 = [[MOBoolSettingMetadata alloc] initWithSettingName:v4 defaultBool:0 combineOperator:0 isPublic:0 scope:@"user" isPrivacySensitive:0];
  v3 = (void *)denyMarketplaceAppInstallationMetadata_metadata;
  denyMarketplaceAppInstallationMetadata_metadata = (uint64_t)v2;
}

- (NSNumber)denyWebDistributionAppInstallation
{
  return (NSNumber *)[(MOSettingsGroup *)self valueForSetting:@"denyWebDistributionAppInstallation"];
}

- (void)setDenyWebDistributionAppInstallation:(id)a3
{
}

+ (MOBoolSettingMetadata)denyWebDistributionAppInstallationMetadata
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__MOAppStoreSettingsGroup_denyWebDistributionAppInstallationMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (denyWebDistributionAppInstallationMetadata_onceToken != -1) {
    dispatch_once(&denyWebDistributionAppInstallationMetadata_onceToken, block);
  }
  v2 = (void *)denyWebDistributionAppInstallationMetadata_metadata;
  return (MOBoolSettingMetadata *)v2;
}

void __69__MOAppStoreSettingsGroup_denyWebDistributionAppInstallationMetadata__block_invoke()
{
  v0 = NSString;
  v1 = [(id)objc_opt_class() groupName];
  id v4 = [v0 stringWithFormat:@"%@.%@", v1, @"denyWebDistributionAppInstallation"];

  v2 = [[MOBoolSettingMetadata alloc] initWithSettingName:v4 defaultBool:0 combineOperator:0 isPublic:0 scope:@"user" isPrivacySensitive:0];
  v3 = (void *)denyWebDistributionAppInstallationMetadata_metadata;
  denyWebDistributionAppInstallationMetadata_metadata = (uint64_t)v2;
}

- (NSNumber)maximumRating
{
  return (NSNumber *)[(MOSettingsGroup *)self valueForSetting:@"maximumRating"];
}

- (void)setMaximumRating:(id)a3
{
}

+ (MOIntegerSettingMetadata)maximumRatingMetadata
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__MOAppStoreSettingsGroup_maximumRatingMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (maximumRatingMetadata_onceToken != -1) {
    dispatch_once(&maximumRatingMetadata_onceToken, block);
  }
  v2 = (void *)maximumRatingMetadata_metadata;
  return (MOIntegerSettingMetadata *)v2;
}

void __48__MOAppStoreSettingsGroup_maximumRatingMetadata__block_invoke()
{
  v0 = NSString;
  v1 = [(id)objc_opt_class() groupName];
  id v5 = [v0 stringWithFormat:@"%@.%@", v1, @"maximumRating"];

  LOBYTE(v4) = 0;
  v2 = [[MOIntegerSettingMetadata alloc] initWithSettingName:v5 defaultInt:1000 combineOperator:0 lowerBound:0 upperBound:2000 isPublic:1 scope:@"user" isPrivacySensitive:v4];
  v3 = (void *)maximumRatingMetadata_metadata;
  maximumRatingMetadata_metadata = (uint64_t)v2;
}

- (NSNumber)requirePasswordForPurchases
{
  return (NSNumber *)[(MOSettingsGroup *)self valueForSetting:@"requirePasswordForPurchases"];
}

- (void)setRequirePasswordForPurchases:(id)a3
{
}

+ (MOBoolSettingMetadata)requirePasswordForPurchasesMetadata
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__MOAppStoreSettingsGroup_requirePasswordForPurchasesMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (requirePasswordForPurchasesMetadata_onceToken != -1) {
    dispatch_once(&requirePasswordForPurchasesMetadata_onceToken, block);
  }
  v2 = (void *)requirePasswordForPurchasesMetadata_metadata;
  return (MOBoolSettingMetadata *)v2;
}

void __62__MOAppStoreSettingsGroup_requirePasswordForPurchasesMetadata__block_invoke()
{
  v0 = NSString;
  v1 = [(id)objc_opt_class() groupName];
  id v4 = [v0 stringWithFormat:@"%@.%@", v1, @"requirePasswordForPurchases"];

  v2 = [[MOBoolSettingMetadata alloc] initWithSettingName:v4 defaultBool:0 combineOperator:0 isPublic:1 scope:@"user" isPrivacySensitive:0];
  v3 = (void *)requirePasswordForPurchasesMetadata_metadata;
  requirePasswordForPurchasesMetadata_metadata = (uint64_t)v2;
}

@end