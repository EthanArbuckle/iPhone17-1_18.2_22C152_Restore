@interface MOManagedSettingsSettingsGroup
+ (MOApplicationSetSettingMetadata)allowedClientsMetadata;
+ (MODataSetSettingMetadata)tokenDecodingKeysMetadata;
+ (MODataSettingMetadata)tokenEncodingKeyMetadata;
+ (id)groupName;
- (NSData)tokenEncodingKey;
- (NSSet)allowedClients;
- (NSSet)tokenDecodingKeys;
- (void)setAllowedClients:(id)a3;
- (void)setTokenDecodingKeys:(id)a3;
- (void)setTokenEncodingKey:(id)a3;
@end

@implementation MOManagedSettingsSettingsGroup

+ (id)groupName
{
  return @"managedSettings";
}

- (NSSet)allowedClients
{
  return (NSSet *)[(MOSettingsGroup *)self valueForSetting:@"allowedClients"];
}

- (void)setAllowedClients:(id)a3
{
}

+ (MOApplicationSetSettingMetadata)allowedClientsMetadata
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__MOManagedSettingsSettingsGroup_allowedClientsMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (allowedClientsMetadata_onceToken_1 != -1) {
    dispatch_once(&allowedClientsMetadata_onceToken_1, block);
  }
  v2 = (void *)allowedClientsMetadata_metadata_1;
  return (MOApplicationSetSettingMetadata *)v2;
}

void __56__MOManagedSettingsSettingsGroup_allowedClientsMetadata__block_invoke()
{
  v0 = NSString;
  v1 = [(id)objc_opt_class() groupName];
  id v7 = [v0 stringWithFormat:@"%@.%@", v1, @"allowedClients"];

  v2 = [MOApplicationSetSettingMetadata alloc];
  v3 = objc_opt_new();
  LOBYTE(v6) = 0;
  uint64_t v4 = [(MOSetSettingMetadata *)v2 initWithSettingName:v7 defaultSet:v3 combineOperator:1 maximumCount:-1 isPublic:0 scope:@"user" isPrivacySensitive:v6];
  v5 = (void *)allowedClientsMetadata_metadata_1;
  allowedClientsMetadata_metadata_1 = v4;
}

- (NSData)tokenEncodingKey
{
  return (NSData *)[(MOSettingsGroup *)self valueForSetting:@"tokenEncodingKey"];
}

- (void)setTokenEncodingKey:(id)a3
{
}

+ (MODataSettingMetadata)tokenEncodingKeyMetadata
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__MOManagedSettingsSettingsGroup_tokenEncodingKeyMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (tokenEncodingKeyMetadata_onceToken != -1) {
    dispatch_once(&tokenEncodingKeyMetadata_onceToken, block);
  }
  v2 = (void *)tokenEncodingKeyMetadata_metadata;
  return (MODataSettingMetadata *)v2;
}

void __58__MOManagedSettingsSettingsGroup_tokenEncodingKeyMetadata__block_invoke()
{
  v0 = NSString;
  v1 = [(id)objc_opt_class() groupName];
  id v6 = [v0 stringWithFormat:@"%@.%@", v1, @"tokenEncodingKey"];

  v2 = [MODataSettingMetadata alloc];
  v3 = objc_opt_new();
  uint64_t v4 = [(MODataSettingMetadata *)v2 initWithSettingName:v6 defaultData:v3 combineOperator:0 isPublic:0 scope:@"user" isPrivacySensitive:0];
  v5 = (void *)tokenEncodingKeyMetadata_metadata;
  tokenEncodingKeyMetadata_metadata = v4;
}

- (NSSet)tokenDecodingKeys
{
  return (NSSet *)[(MOSettingsGroup *)self valueForSetting:@"tokenDecodingKeys"];
}

- (void)setTokenDecodingKeys:(id)a3
{
}

+ (MODataSetSettingMetadata)tokenDecodingKeysMetadata
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__MOManagedSettingsSettingsGroup_tokenDecodingKeysMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (tokenDecodingKeysMetadata_onceToken != -1) {
    dispatch_once(&tokenDecodingKeysMetadata_onceToken, block);
  }
  v2 = (void *)tokenDecodingKeysMetadata_metadata;
  return (MODataSetSettingMetadata *)v2;
}

void __59__MOManagedSettingsSettingsGroup_tokenDecodingKeysMetadata__block_invoke()
{
  v0 = NSString;
  v1 = [(id)objc_opt_class() groupName];
  id v7 = [v0 stringWithFormat:@"%@.%@", v1, @"tokenDecodingKeys"];

  v2 = [MODataSetSettingMetadata alloc];
  v3 = objc_opt_new();
  LOBYTE(v6) = 0;
  uint64_t v4 = [(MOSetSettingMetadata *)v2 initWithSettingName:v7 defaultSet:v3 combineOperator:1 maximumCount:-1 isPublic:0 scope:@"user" isPrivacySensitive:v6];
  v5 = (void *)tokenDecodingKeysMetadata_metadata;
  tokenDecodingKeysMetadata_metadata = v4;
}

@end