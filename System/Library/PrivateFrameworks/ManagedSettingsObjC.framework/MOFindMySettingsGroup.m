@interface MOFindMySettingsGroup
+ (MOBoolSettingMetadata)lockFindMyFriendsMetadata;
+ (id)groupName;
- (NSNumber)lockFindMyFriends;
- (void)setLockFindMyFriends:(id)a3;
@end

@implementation MOFindMySettingsGroup

+ (id)groupName
{
  return @"findMy";
}

- (NSNumber)lockFindMyFriends
{
  return (NSNumber *)[(MOSettingsGroup *)self valueForSetting:@"lockFindMyFriends"];
}

- (void)setLockFindMyFriends:(id)a3
{
}

+ (MOBoolSettingMetadata)lockFindMyFriendsMetadata
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__MOFindMySettingsGroup_lockFindMyFriendsMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (lockFindMyFriendsMetadata_onceToken != -1) {
    dispatch_once(&lockFindMyFriendsMetadata_onceToken, block);
  }
  v2 = (void *)lockFindMyFriendsMetadata_metadata;
  return (MOBoolSettingMetadata *)v2;
}

void __50__MOFindMySettingsGroup_lockFindMyFriendsMetadata__block_invoke()
{
  v0 = NSString;
  v1 = [(id)objc_opt_class() groupName];
  id v4 = [v0 stringWithFormat:@"%@.%@", v1, @"lockFindMyFriends"];

  v2 = [[MOBoolSettingMetadata alloc] initWithSettingName:v4 defaultBool:0 combineOperator:0 isPublic:0 scope:@"user" isPrivacySensitive:0];
  v3 = (void *)lockFindMyFriendsMetadata_metadata;
  lockFindMyFriendsMetadata_metadata = (uint64_t)v2;
}

@end