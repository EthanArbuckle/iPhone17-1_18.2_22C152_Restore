@interface MODeviceActivitySettingsGroup
+ (MOApplicationSetSettingMetadata)allowedClientsMetadata;
+ (MOBoolSettingMetadata)shareAcrossDevicesMetadata;
+ (MOStringSetSettingMetadata)sharingAppleIDsMetadata;
+ (id)groupName;
- (NSNumber)shareAcrossDevices;
- (NSSet)allowedClients;
- (NSSet)sharingAppleIDs;
- (void)setAllowedClients:(id)a3;
- (void)setShareAcrossDevices:(id)a3;
- (void)setSharingAppleIDs:(id)a3;
@end

@implementation MODeviceActivitySettingsGroup

+ (id)groupName
{
  return @"deviceActivity";
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
  block[2] = __55__MODeviceActivitySettingsGroup_allowedClientsMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (allowedClientsMetadata_onceToken != -1) {
    dispatch_once(&allowedClientsMetadata_onceToken, block);
  }
  v2 = (void *)allowedClientsMetadata_metadata;
  return (MOApplicationSetSettingMetadata *)v2;
}

void __55__MODeviceActivitySettingsGroup_allowedClientsMetadata__block_invoke()
{
  v0 = NSString;
  v1 = [(id)objc_opt_class() groupName];
  id v7 = [v0 stringWithFormat:@"%@.%@", v1, @"allowedClients"];

  v2 = [MOApplicationSetSettingMetadata alloc];
  v3 = objc_opt_new();
  LOBYTE(v6) = 0;
  uint64_t v4 = [(MOSetSettingMetadata *)v2 initWithSettingName:v7 defaultSet:v3 combineOperator:1 maximumCount:-1 isPublic:0 scope:@"user" isPrivacySensitive:v6];
  v5 = (void *)allowedClientsMetadata_metadata;
  allowedClientsMetadata_metadata = v4;
}

- (NSSet)sharingAppleIDs
{
  return (NSSet *)[(MOSettingsGroup *)self valueForSetting:@"sharingAppleIDs"];
}

- (void)setSharingAppleIDs:(id)a3
{
}

+ (MOStringSetSettingMetadata)sharingAppleIDsMetadata
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__MODeviceActivitySettingsGroup_sharingAppleIDsMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharingAppleIDsMetadata_onceToken != -1) {
    dispatch_once(&sharingAppleIDsMetadata_onceToken, block);
  }
  v2 = (void *)sharingAppleIDsMetadata_metadata;
  return (MOStringSetSettingMetadata *)v2;
}

void __56__MODeviceActivitySettingsGroup_sharingAppleIDsMetadata__block_invoke()
{
  v0 = NSString;
  v1 = [(id)objc_opt_class() groupName];
  id v7 = [v0 stringWithFormat:@"%@.%@", v1, @"sharingAppleIDs"];

  v2 = [MOStringSetSettingMetadata alloc];
  v3 = objc_opt_new();
  LOBYTE(v6) = 1;
  uint64_t v4 = [(MOSetSettingMetadata *)v2 initWithSettingName:v7 defaultSet:v3 combineOperator:1 maximumCount:-1 isPublic:0 scope:@"user" isPrivacySensitive:v6];
  v5 = (void *)sharingAppleIDsMetadata_metadata;
  sharingAppleIDsMetadata_metadata = v4;
}

- (NSNumber)shareAcrossDevices
{
  return (NSNumber *)[(MOSettingsGroup *)self valueForSetting:@"shareAcrossDevices"];
}

- (void)setShareAcrossDevices:(id)a3
{
}

+ (MOBoolSettingMetadata)shareAcrossDevicesMetadata
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__MODeviceActivitySettingsGroup_shareAcrossDevicesMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (shareAcrossDevicesMetadata_onceToken != -1) {
    dispatch_once(&shareAcrossDevicesMetadata_onceToken, block);
  }
  v2 = (void *)shareAcrossDevicesMetadata_metadata;
  return (MOBoolSettingMetadata *)v2;
}

void __59__MODeviceActivitySettingsGroup_shareAcrossDevicesMetadata__block_invoke()
{
  v0 = NSString;
  v1 = [(id)objc_opt_class() groupName];
  id v4 = [v0 stringWithFormat:@"%@.%@", v1, @"shareAcrossDevices"];

  v2 = [[MOBoolSettingMetadata alloc] initWithSettingName:v4 defaultBool:1 combineOperator:1 isPublic:0 scope:@"user" isPrivacySensitive:0];
  v3 = (void *)shareAcrossDevicesMetadata_metadata;
  shareAcrossDevicesMetadata_metadata = (uint64_t)v2;
}

@end