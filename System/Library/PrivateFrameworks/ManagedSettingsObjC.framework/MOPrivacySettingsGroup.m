@interface MOPrivacySettingsGroup
+ (MOBoolSettingMetadata)forceLimitAdTrackingMetadata;
+ (id)groupName;
- (NSNumber)forceLimitAdTracking;
- (void)setForceLimitAdTracking:(id)a3;
@end

@implementation MOPrivacySettingsGroup

+ (id)groupName
{
  return @"privacy";
}

- (NSNumber)forceLimitAdTracking
{
  return (NSNumber *)[(MOSettingsGroup *)self valueForSetting:@"forceLimitAdTracking"];
}

- (void)setForceLimitAdTracking:(id)a3
{
}

+ (MOBoolSettingMetadata)forceLimitAdTrackingMetadata
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__MOPrivacySettingsGroup_forceLimitAdTrackingMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (forceLimitAdTrackingMetadata_onceToken != -1) {
    dispatch_once(&forceLimitAdTrackingMetadata_onceToken, block);
  }
  v2 = (void *)forceLimitAdTrackingMetadata_metadata;
  return (MOBoolSettingMetadata *)v2;
}

void __54__MOPrivacySettingsGroup_forceLimitAdTrackingMetadata__block_invoke()
{
  v0 = NSString;
  v1 = [(id)objc_opt_class() groupName];
  id v4 = [v0 stringWithFormat:@"%@.%@", v1, @"forceLimitAdTracking"];

  v2 = [[MOBoolSettingMetadata alloc] initWithSettingName:v4 defaultBool:0 combineOperator:0 isPublic:0 scope:@"user" isPrivacySensitive:0];
  v3 = (void *)forceLimitAdTrackingMetadata_metadata;
  forceLimitAdTrackingMetadata_metadata = (uint64_t)v2;
}

@end