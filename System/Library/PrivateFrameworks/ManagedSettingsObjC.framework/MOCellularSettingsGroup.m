@interface MOCellularSettingsGroup
+ (MOBoolSettingMetadata)lockAppCellularDataMetadata;
+ (MOBoolSettingMetadata)lockCellularPlanMetadata;
+ (MOBoolSettingMetadata)lockESIMMetadata;
+ (id)groupName;
- (NSNumber)lockAppCellularData;
- (NSNumber)lockCellularPlan;
- (NSNumber)lockESIM;
- (void)setLockAppCellularData:(id)a3;
- (void)setLockCellularPlan:(id)a3;
- (void)setLockESIM:(id)a3;
@end

@implementation MOCellularSettingsGroup

+ (id)groupName
{
  return @"cellular";
}

- (NSNumber)lockAppCellularData
{
  return (NSNumber *)[(MOSettingsGroup *)self valueForSetting:@"lockAppCellularData"];
}

- (void)setLockAppCellularData:(id)a3
{
}

+ (MOBoolSettingMetadata)lockAppCellularDataMetadata
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__MOCellularSettingsGroup_lockAppCellularDataMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (lockAppCellularDataMetadata_onceToken != -1) {
    dispatch_once(&lockAppCellularDataMetadata_onceToken, block);
  }
  v2 = (void *)lockAppCellularDataMetadata_metadata;
  return (MOBoolSettingMetadata *)v2;
}

void __54__MOCellularSettingsGroup_lockAppCellularDataMetadata__block_invoke()
{
  v0 = NSString;
  v1 = [(id)objc_opt_class() groupName];
  id v4 = [v0 stringWithFormat:@"%@.%@", v1, @"lockAppCellularData"];

  v2 = [[MOBoolSettingMetadata alloc] initWithSettingName:v4 defaultBool:0 combineOperator:0 isPublic:1 scope:@"user" isPrivacySensitive:0];
  v3 = (void *)lockAppCellularDataMetadata_metadata;
  lockAppCellularDataMetadata_metadata = (uint64_t)v2;
}

- (NSNumber)lockCellularPlan
{
  return (NSNumber *)[(MOSettingsGroup *)self valueForSetting:@"lockCellularPlan"];
}

- (void)setLockCellularPlan:(id)a3
{
}

+ (MOBoolSettingMetadata)lockCellularPlanMetadata
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__MOCellularSettingsGroup_lockCellularPlanMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (lockCellularPlanMetadata_onceToken != -1) {
    dispatch_once(&lockCellularPlanMetadata_onceToken, block);
  }
  v2 = (void *)lockCellularPlanMetadata_metadata;
  return (MOBoolSettingMetadata *)v2;
}

void __51__MOCellularSettingsGroup_lockCellularPlanMetadata__block_invoke()
{
  v0 = NSString;
  v1 = [(id)objc_opt_class() groupName];
  id v4 = [v0 stringWithFormat:@"%@.%@", v1, @"lockCellularPlan"];

  v2 = [[MOBoolSettingMetadata alloc] initWithSettingName:v4 defaultBool:0 combineOperator:0 isPublic:1 scope:@"user" isPrivacySensitive:0];
  v3 = (void *)lockCellularPlanMetadata_metadata;
  lockCellularPlanMetadata_metadata = (uint64_t)v2;
}

- (NSNumber)lockESIM
{
  return (NSNumber *)[(MOSettingsGroup *)self valueForSetting:@"lockESIM"];
}

- (void)setLockESIM:(id)a3
{
}

+ (MOBoolSettingMetadata)lockESIMMetadata
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__MOCellularSettingsGroup_lockESIMMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (lockESIMMetadata_onceToken != -1) {
    dispatch_once(&lockESIMMetadata_onceToken, block);
  }
  v2 = (void *)lockESIMMetadata_metadata;
  return (MOBoolSettingMetadata *)v2;
}

void __43__MOCellularSettingsGroup_lockESIMMetadata__block_invoke()
{
  v0 = NSString;
  v1 = [(id)objc_opt_class() groupName];
  id v4 = [v0 stringWithFormat:@"%@.%@", v1, @"lockESIM"];

  v2 = [[MOBoolSettingMetadata alloc] initWithSettingName:v4 defaultBool:0 combineOperator:0 isPublic:1 scope:@"user" isPrivacySensitive:0];
  v3 = (void *)lockESIMMetadata_metadata;
  lockESIMMetadata_metadata = (uint64_t)v2;
}

@end