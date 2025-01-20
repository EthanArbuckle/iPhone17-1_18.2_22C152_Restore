@interface MOFaceTimeSettingsGroup
+ (MOBoolSettingMetadata)denyFaceTimeMetadata;
+ (MOBoolSettingMetadata)denySharePlayMetadata;
+ (id)groupName;
- (NSNumber)denyFaceTime;
- (NSNumber)denySharePlay;
- (void)setDenyFaceTime:(id)a3;
- (void)setDenySharePlay:(id)a3;
@end

@implementation MOFaceTimeSettingsGroup

+ (id)groupName
{
  return @"faceTime";
}

- (NSNumber)denyFaceTime
{
  return (NSNumber *)[(MOSettingsGroup *)self valueForSetting:@"denyFaceTime"];
}

- (void)setDenyFaceTime:(id)a3
{
}

+ (MOBoolSettingMetadata)denyFaceTimeMetadata
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__MOFaceTimeSettingsGroup_denyFaceTimeMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (denyFaceTimeMetadata_onceToken != -1) {
    dispatch_once(&denyFaceTimeMetadata_onceToken, block);
  }
  v2 = (void *)denyFaceTimeMetadata_metadata;
  return (MOBoolSettingMetadata *)v2;
}

void __47__MOFaceTimeSettingsGroup_denyFaceTimeMetadata__block_invoke()
{
  v0 = NSString;
  v1 = [(id)objc_opt_class() groupName];
  id v4 = [v0 stringWithFormat:@"%@.%@", v1, @"denyFaceTime"];

  v2 = [[MOBoolSettingMetadata alloc] initWithSettingName:v4 defaultBool:0 combineOperator:0 isPublic:0 scope:@"user" isPrivacySensitive:0];
  v3 = (void *)denyFaceTimeMetadata_metadata;
  denyFaceTimeMetadata_metadata = (uint64_t)v2;
}

- (NSNumber)denySharePlay
{
  return (NSNumber *)[(MOSettingsGroup *)self valueForSetting:@"denySharePlay"];
}

- (void)setDenySharePlay:(id)a3
{
}

+ (MOBoolSettingMetadata)denySharePlayMetadata
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__MOFaceTimeSettingsGroup_denySharePlayMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (denySharePlayMetadata_onceToken != -1) {
    dispatch_once(&denySharePlayMetadata_onceToken, block);
  }
  v2 = (void *)denySharePlayMetadata_metadata;
  return (MOBoolSettingMetadata *)v2;
}

void __48__MOFaceTimeSettingsGroup_denySharePlayMetadata__block_invoke()
{
  v0 = NSString;
  v1 = [(id)objc_opt_class() groupName];
  id v4 = [v0 stringWithFormat:@"%@.%@", v1, @"denySharePlay"];

  v2 = [[MOBoolSettingMetadata alloc] initWithSettingName:v4 defaultBool:0 combineOperator:0 isPublic:0 scope:@"user" isPrivacySensitive:0];
  v3 = (void *)denySharePlayMetadata_metadata;
  denySharePlayMetadata_metadata = (uint64_t)v2;
}

@end