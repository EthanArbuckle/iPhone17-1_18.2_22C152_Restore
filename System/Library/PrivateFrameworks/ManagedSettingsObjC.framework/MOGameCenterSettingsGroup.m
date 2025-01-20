@interface MOGameCenterSettingsGroup
+ (MOBoolSettingMetadata)denyAddingFriendsMetadata;
+ (MOBoolSettingMetadata)denyGameCenterMetadata;
+ (MOBoolSettingMetadata)denyMultiplayerGamingMetadata;
+ (MOBoolSettingMetadata)denyNearbyMultiplayerMetadata;
+ (MOBoolSettingMetadata)denyPrivateMessagingMetadata;
+ (MOBoolSettingMetadata)lockFriendsSharingMetadata;
+ (MOBoolSettingMetadata)lockProfileMetadata;
+ (MOBoolSettingMetadata)lockProfilePrivacyMetadata;
+ (MOStringSettingMetadata)allowedOtherPlayerTypesMetadata;
+ (id)groupName;
- (NSNumber)denyAddingFriends;
- (NSNumber)denyGameCenter;
- (NSNumber)denyMultiplayerGaming;
- (NSNumber)denyNearbyMultiplayer;
- (NSNumber)denyPrivateMessaging;
- (NSNumber)lockFriendsSharing;
- (NSNumber)lockProfile;
- (NSNumber)lockProfilePrivacy;
- (NSString)allowedOtherPlayerTypes;
- (void)setAllowedOtherPlayerTypes:(id)a3;
- (void)setDenyAddingFriends:(id)a3;
- (void)setDenyGameCenter:(id)a3;
- (void)setDenyMultiplayerGaming:(id)a3;
- (void)setDenyNearbyMultiplayer:(id)a3;
- (void)setDenyPrivateMessaging:(id)a3;
- (void)setLockFriendsSharing:(id)a3;
- (void)setLockProfile:(id)a3;
- (void)setLockProfilePrivacy:(id)a3;
@end

@implementation MOGameCenterSettingsGroup

+ (id)groupName
{
  return @"gameCenter";
}

- (NSString)allowedOtherPlayerTypes
{
  return (NSString *)[(MOSettingsGroup *)self valueForSetting:@"allowedOtherPlayerTypes"];
}

- (void)setAllowedOtherPlayerTypes:(id)a3
{
}

+ (MOStringSettingMetadata)allowedOtherPlayerTypesMetadata
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__MOGameCenterSettingsGroup_allowedOtherPlayerTypesMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (allowedOtherPlayerTypesMetadata_onceToken != -1) {
    dispatch_once(&allowedOtherPlayerTypesMetadata_onceToken, block);
  }
  v2 = (void *)allowedOtherPlayerTypesMetadata_metadata;
  return (MOStringSettingMetadata *)v2;
}

void __60__MOGameCenterSettingsGroup_allowedOtherPlayerTypesMetadata__block_invoke()
{
  v9[3] = *MEMORY[0x1E4F143B8];
  v0 = NSString;
  v1 = [(id)objc_opt_class() groupName];
  v2 = [v0 stringWithFormat:@"%@.%@", v1, @"allowedOtherPlayerTypes"];

  v3 = [MOStringSettingMetadata alloc];
  v8[0] = @"none";
  v8[1] = @"friendsOnly";
  v9[0] = &unk_1F12BB6E0;
  v9[1] = &unk_1F12BB6F8;
  v8[2] = @"everyone";
  v9[2] = &unk_1F12BB710;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:3];
  LOBYTE(v7) = 0;
  uint64_t v5 = [(MOStringSettingMetadata *)v3 initWithSettingName:v2 defaultString:@"everyone" combineOperator:0 rankedAllowedValues:v4 isPublic:0 scope:@"user" isPrivacySensitive:v7];
  v6 = (void *)allowedOtherPlayerTypesMetadata_metadata;
  allowedOtherPlayerTypesMetadata_metadata = v5;
}

- (NSNumber)denyAddingFriends
{
  return (NSNumber *)[(MOSettingsGroup *)self valueForSetting:@"denyAddingFriends"];
}

- (void)setDenyAddingFriends:(id)a3
{
}

+ (MOBoolSettingMetadata)denyAddingFriendsMetadata
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__MOGameCenterSettingsGroup_denyAddingFriendsMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (denyAddingFriendsMetadata_onceToken != -1) {
    dispatch_once(&denyAddingFriendsMetadata_onceToken, block);
  }
  v2 = (void *)denyAddingFriendsMetadata_metadata;
  return (MOBoolSettingMetadata *)v2;
}

void __54__MOGameCenterSettingsGroup_denyAddingFriendsMetadata__block_invoke()
{
  v0 = NSString;
  v1 = [(id)objc_opt_class() groupName];
  id v4 = [v0 stringWithFormat:@"%@.%@", v1, @"denyAddingFriends"];

  v2 = [[MOBoolSettingMetadata alloc] initWithSettingName:v4 defaultBool:0 combineOperator:0 isPublic:1 scope:@"user" isPrivacySensitive:0];
  v3 = (void *)denyAddingFriendsMetadata_metadata;
  denyAddingFriendsMetadata_metadata = (uint64_t)v2;
}

- (NSNumber)denyGameCenter
{
  return (NSNumber *)[(MOSettingsGroup *)self valueForSetting:@"denyGameCenter"];
}

- (void)setDenyGameCenter:(id)a3
{
}

+ (MOBoolSettingMetadata)denyGameCenterMetadata
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__MOGameCenterSettingsGroup_denyGameCenterMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (denyGameCenterMetadata_onceToken != -1) {
    dispatch_once(&denyGameCenterMetadata_onceToken, block);
  }
  v2 = (void *)denyGameCenterMetadata_metadata;
  return (MOBoolSettingMetadata *)v2;
}

void __51__MOGameCenterSettingsGroup_denyGameCenterMetadata__block_invoke()
{
  v0 = NSString;
  v1 = [(id)objc_opt_class() groupName];
  id v4 = [v0 stringWithFormat:@"%@.%@", v1, @"denyGameCenter"];

  v2 = [[MOBoolSettingMetadata alloc] initWithSettingName:v4 defaultBool:0 combineOperator:0 isPublic:0 scope:@"user" isPrivacySensitive:0];
  v3 = (void *)denyGameCenterMetadata_metadata;
  denyGameCenterMetadata_metadata = (uint64_t)v2;
}

- (NSNumber)denyMultiplayerGaming
{
  return (NSNumber *)[(MOSettingsGroup *)self valueForSetting:@"denyMultiplayerGaming"];
}

- (void)setDenyMultiplayerGaming:(id)a3
{
}

+ (MOBoolSettingMetadata)denyMultiplayerGamingMetadata
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__MOGameCenterSettingsGroup_denyMultiplayerGamingMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (denyMultiplayerGamingMetadata_onceToken != -1) {
    dispatch_once(&denyMultiplayerGamingMetadata_onceToken, block);
  }
  v2 = (void *)denyMultiplayerGamingMetadata_metadata;
  return (MOBoolSettingMetadata *)v2;
}

void __58__MOGameCenterSettingsGroup_denyMultiplayerGamingMetadata__block_invoke()
{
  v0 = NSString;
  v1 = [(id)objc_opt_class() groupName];
  id v4 = [v0 stringWithFormat:@"%@.%@", v1, @"denyMultiplayerGaming"];

  v2 = [[MOBoolSettingMetadata alloc] initWithSettingName:v4 defaultBool:0 combineOperator:0 isPublic:1 scope:@"user" isPrivacySensitive:0];
  v3 = (void *)denyMultiplayerGamingMetadata_metadata;
  denyMultiplayerGamingMetadata_metadata = (uint64_t)v2;
}

- (NSNumber)denyNearbyMultiplayer
{
  return (NSNumber *)[(MOSettingsGroup *)self valueForSetting:@"denyNearbyMultiplayer"];
}

- (void)setDenyNearbyMultiplayer:(id)a3
{
}

+ (MOBoolSettingMetadata)denyNearbyMultiplayerMetadata
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__MOGameCenterSettingsGroup_denyNearbyMultiplayerMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (denyNearbyMultiplayerMetadata_onceToken != -1) {
    dispatch_once(&denyNearbyMultiplayerMetadata_onceToken, block);
  }
  v2 = (void *)denyNearbyMultiplayerMetadata_metadata;
  return (MOBoolSettingMetadata *)v2;
}

void __58__MOGameCenterSettingsGroup_denyNearbyMultiplayerMetadata__block_invoke()
{
  v0 = NSString;
  v1 = [(id)objc_opt_class() groupName];
  id v4 = [v0 stringWithFormat:@"%@.%@", v1, @"denyNearbyMultiplayer"];

  v2 = [[MOBoolSettingMetadata alloc] initWithSettingName:v4 defaultBool:0 combineOperator:0 isPublic:0 scope:@"user" isPrivacySensitive:0];
  v3 = (void *)denyNearbyMultiplayerMetadata_metadata;
  denyNearbyMultiplayerMetadata_metadata = (uint64_t)v2;
}

- (NSNumber)denyPrivateMessaging
{
  return (NSNumber *)[(MOSettingsGroup *)self valueForSetting:@"denyPrivateMessaging"];
}

- (void)setDenyPrivateMessaging:(id)a3
{
}

+ (MOBoolSettingMetadata)denyPrivateMessagingMetadata
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__MOGameCenterSettingsGroup_denyPrivateMessagingMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (denyPrivateMessagingMetadata_onceToken != -1) {
    dispatch_once(&denyPrivateMessagingMetadata_onceToken, block);
  }
  v2 = (void *)denyPrivateMessagingMetadata_metadata;
  return (MOBoolSettingMetadata *)v2;
}

void __57__MOGameCenterSettingsGroup_denyPrivateMessagingMetadata__block_invoke()
{
  v0 = NSString;
  v1 = [(id)objc_opt_class() groupName];
  id v4 = [v0 stringWithFormat:@"%@.%@", v1, @"denyPrivateMessaging"];

  v2 = [[MOBoolSettingMetadata alloc] initWithSettingName:v4 defaultBool:0 combineOperator:0 isPublic:0 scope:@"user" isPrivacySensitive:0];
  v3 = (void *)denyPrivateMessagingMetadata_metadata;
  denyPrivateMessagingMetadata_metadata = (uint64_t)v2;
}

- (NSNumber)lockFriendsSharing
{
  return (NSNumber *)[(MOSettingsGroup *)self valueForSetting:@"lockFriendsSharing"];
}

- (void)setLockFriendsSharing:(id)a3
{
}

+ (MOBoolSettingMetadata)lockFriendsSharingMetadata
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__MOGameCenterSettingsGroup_lockFriendsSharingMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (lockFriendsSharingMetadata_onceToken != -1) {
    dispatch_once(&lockFriendsSharingMetadata_onceToken, block);
  }
  v2 = (void *)lockFriendsSharingMetadata_metadata;
  return (MOBoolSettingMetadata *)v2;
}

void __55__MOGameCenterSettingsGroup_lockFriendsSharingMetadata__block_invoke()
{
  v0 = NSString;
  v1 = [(id)objc_opt_class() groupName];
  id v4 = [v0 stringWithFormat:@"%@.%@", v1, @"lockFriendsSharing"];

  v2 = [[MOBoolSettingMetadata alloc] initWithSettingName:v4 defaultBool:0 combineOperator:0 isPublic:0 scope:@"user" isPrivacySensitive:0];
  v3 = (void *)lockFriendsSharingMetadata_metadata;
  lockFriendsSharingMetadata_metadata = (uint64_t)v2;
}

- (NSNumber)lockProfile
{
  return (NSNumber *)[(MOSettingsGroup *)self valueForSetting:@"lockProfile"];
}

- (void)setLockProfile:(id)a3
{
}

+ (MOBoolSettingMetadata)lockProfileMetadata
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__MOGameCenterSettingsGroup_lockProfileMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (lockProfileMetadata_onceToken != -1) {
    dispatch_once(&lockProfileMetadata_onceToken, block);
  }
  v2 = (void *)lockProfileMetadata_metadata;
  return (MOBoolSettingMetadata *)v2;
}

void __48__MOGameCenterSettingsGroup_lockProfileMetadata__block_invoke()
{
  v0 = NSString;
  v1 = [(id)objc_opt_class() groupName];
  id v4 = [v0 stringWithFormat:@"%@.%@", v1, @"lockProfile"];

  v2 = [[MOBoolSettingMetadata alloc] initWithSettingName:v4 defaultBool:0 combineOperator:0 isPublic:0 scope:@"user" isPrivacySensitive:0];
  v3 = (void *)lockProfileMetadata_metadata;
  lockProfileMetadata_metadata = (uint64_t)v2;
}

- (NSNumber)lockProfilePrivacy
{
  return (NSNumber *)[(MOSettingsGroup *)self valueForSetting:@"lockProfilePrivacy"];
}

- (void)setLockProfilePrivacy:(id)a3
{
}

+ (MOBoolSettingMetadata)lockProfilePrivacyMetadata
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__MOGameCenterSettingsGroup_lockProfilePrivacyMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (lockProfilePrivacyMetadata_onceToken != -1) {
    dispatch_once(&lockProfilePrivacyMetadata_onceToken, block);
  }
  v2 = (void *)lockProfilePrivacyMetadata_metadata;
  return (MOBoolSettingMetadata *)v2;
}

void __55__MOGameCenterSettingsGroup_lockProfilePrivacyMetadata__block_invoke()
{
  v0 = NSString;
  v1 = [(id)objc_opt_class() groupName];
  id v4 = [v0 stringWithFormat:@"%@.%@", v1, @"lockProfilePrivacy"];

  v2 = [[MOBoolSettingMetadata alloc] initWithSettingName:v4 defaultBool:0 combineOperator:0 isPublic:0 scope:@"user" isPrivacySensitive:0];
  v3 = (void *)lockProfilePrivacyMetadata_metadata;
  lockProfilePrivacyMetadata_metadata = (uint64_t)v2;
}

@end