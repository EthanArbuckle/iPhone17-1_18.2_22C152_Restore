@interface MODateAndTimeSettingsGroup
+ (MOBoolSettingMetadata)requireAutomaticDateAndTimeMetadata;
+ (id)groupName;
- (NSNumber)requireAutomaticDateAndTime;
- (void)setRequireAutomaticDateAndTime:(id)a3;
@end

@implementation MODateAndTimeSettingsGroup

+ (id)groupName
{
  return @"dateAndTime";
}

- (NSNumber)requireAutomaticDateAndTime
{
  return (NSNumber *)[(MOSettingsGroup *)self valueForSetting:@"requireAutomaticDateAndTime"];
}

- (void)setRequireAutomaticDateAndTime:(id)a3
{
}

+ (MOBoolSettingMetadata)requireAutomaticDateAndTimeMetadata
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__MODateAndTimeSettingsGroup_requireAutomaticDateAndTimeMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (requireAutomaticDateAndTimeMetadata_onceToken != -1) {
    dispatch_once(&requireAutomaticDateAndTimeMetadata_onceToken, block);
  }
  v2 = (void *)requireAutomaticDateAndTimeMetadata_metadata;
  return (MOBoolSettingMetadata *)v2;
}

void __65__MODateAndTimeSettingsGroup_requireAutomaticDateAndTimeMetadata__block_invoke()
{
  v0 = NSString;
  v1 = [(id)objc_opt_class() groupName];
  id v4 = [v0 stringWithFormat:@"%@.%@", v1, @"requireAutomaticDateAndTime"];

  v2 = [[MOBoolSettingMetadata alloc] initWithSettingName:v4 defaultBool:0 combineOperator:0 isPublic:1 scope:@"user" isPrivacySensitive:0];
  v3 = (void *)requireAutomaticDateAndTimeMetadata_metadata;
  requireAutomaticDateAndTimeMetadata_metadata = (uint64_t)v2;
}

@end