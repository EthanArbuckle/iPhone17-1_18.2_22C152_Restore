@interface MOAirDropSettingsGroup
+ (MOBoolSettingMetadata)denyAirDropMetadata;
+ (id)groupName;
- (NSNumber)denyAirDrop;
- (void)setDenyAirDrop:(id)a3;
@end

@implementation MOAirDropSettingsGroup

+ (id)groupName
{
  return @"airDrop";
}

- (NSNumber)denyAirDrop
{
  return (NSNumber *)[(MOSettingsGroup *)self valueForSetting:@"denyAirDrop"];
}

- (void)setDenyAirDrop:(id)a3
{
}

+ (MOBoolSettingMetadata)denyAirDropMetadata
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__MOAirDropSettingsGroup_denyAirDropMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (denyAirDropMetadata_onceToken != -1) {
    dispatch_once(&denyAirDropMetadata_onceToken, block);
  }
  v2 = (void *)denyAirDropMetadata_metadata;
  return (MOBoolSettingMetadata *)v2;
}

void __45__MOAirDropSettingsGroup_denyAirDropMetadata__block_invoke()
{
  v0 = NSString;
  v1 = [(id)objc_opt_class() groupName];
  id v4 = [v0 stringWithFormat:@"%@.%@", v1, @"denyAirDrop"];

  v2 = [[MOBoolSettingMetadata alloc] initWithSettingName:v4 defaultBool:0 combineOperator:0 isPublic:0 scope:@"user" isPrivacySensitive:0];
  v3 = (void *)denyAirDropMetadata_metadata;
  denyAirDropMetadata_metadata = (uint64_t)v2;
}

@end