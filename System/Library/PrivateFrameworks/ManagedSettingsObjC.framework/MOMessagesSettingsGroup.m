@interface MOMessagesSettingsGroup
+ (MOBoolSettingMetadata)denyiMessageMetadata;
+ (id)groupName;
- (NSNumber)denyiMessage;
- (void)setDenyiMessage:(id)a3;
@end

@implementation MOMessagesSettingsGroup

+ (id)groupName
{
  return @"messages";
}

- (NSNumber)denyiMessage
{
  return (NSNumber *)[(MOSettingsGroup *)self valueForSetting:@"denyiMessage"];
}

- (void)setDenyiMessage:(id)a3
{
}

+ (MOBoolSettingMetadata)denyiMessageMetadata
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__MOMessagesSettingsGroup_denyiMessageMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (denyiMessageMetadata_onceToken != -1) {
    dispatch_once(&denyiMessageMetadata_onceToken, block);
  }
  v2 = (void *)denyiMessageMetadata_metadata;
  return (MOBoolSettingMetadata *)v2;
}

void __47__MOMessagesSettingsGroup_denyiMessageMetadata__block_invoke()
{
  v0 = NSString;
  v1 = [(id)objc_opt_class() groupName];
  id v4 = [v0 stringWithFormat:@"%@.%@", v1, @"denyiMessage"];

  v2 = [[MOBoolSettingMetadata alloc] initWithSettingName:v4 defaultBool:0 combineOperator:0 isPublic:0 scope:@"user" isPrivacySensitive:0];
  v3 = (void *)denyiMessageMetadata_metadata;
  denyiMessageMetadata_metadata = (uint64_t)v2;
}

@end