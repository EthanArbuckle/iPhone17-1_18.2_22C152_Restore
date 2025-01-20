@interface MOCameraSettingsGroup
+ (MOBoolSettingMetadata)denyCameraMetadata;
+ (MOBoolSettingMetadata)denyScreenRecordingMetadata;
+ (id)groupName;
- (NSNumber)denyCamera;
- (NSNumber)denyScreenRecording;
- (void)setDenyCamera:(id)a3;
- (void)setDenyScreenRecording:(id)a3;
@end

@implementation MOCameraSettingsGroup

+ (id)groupName
{
  return @"camera";
}

- (NSNumber)denyCamera
{
  return (NSNumber *)[(MOSettingsGroup *)self valueForSetting:@"denyCamera"];
}

- (void)setDenyCamera:(id)a3
{
}

+ (MOBoolSettingMetadata)denyCameraMetadata
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__MOCameraSettingsGroup_denyCameraMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (denyCameraMetadata_onceToken != -1) {
    dispatch_once(&denyCameraMetadata_onceToken, block);
  }
  v2 = (void *)denyCameraMetadata_metadata;
  return (MOBoolSettingMetadata *)v2;
}

void __43__MOCameraSettingsGroup_denyCameraMetadata__block_invoke()
{
  v0 = NSString;
  v1 = [(id)objc_opt_class() groupName];
  id v4 = [v0 stringWithFormat:@"%@.%@", v1, @"denyCamera"];

  v2 = [[MOBoolSettingMetadata alloc] initWithSettingName:v4 defaultBool:0 combineOperator:0 isPublic:0 scope:@"user" isPrivacySensitive:0];
  v3 = (void *)denyCameraMetadata_metadata;
  denyCameraMetadata_metadata = (uint64_t)v2;
}

- (NSNumber)denyScreenRecording
{
  return (NSNumber *)[(MOSettingsGroup *)self valueForSetting:@"denyScreenRecording"];
}

- (void)setDenyScreenRecording:(id)a3
{
}

+ (MOBoolSettingMetadata)denyScreenRecordingMetadata
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__MOCameraSettingsGroup_denyScreenRecordingMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (denyScreenRecordingMetadata_onceToken != -1) {
    dispatch_once(&denyScreenRecordingMetadata_onceToken, block);
  }
  v2 = (void *)denyScreenRecordingMetadata_metadata;
  return (MOBoolSettingMetadata *)v2;
}

void __52__MOCameraSettingsGroup_denyScreenRecordingMetadata__block_invoke()
{
  v0 = NSString;
  v1 = [(id)objc_opt_class() groupName];
  id v4 = [v0 stringWithFormat:@"%@.%@", v1, @"denyScreenRecording"];

  v2 = [[MOBoolSettingMetadata alloc] initWithSettingName:v4 defaultBool:0 combineOperator:0 isPublic:0 scope:@"user" isPrivacySensitive:0];
  v3 = (void *)denyScreenRecordingMetadata_metadata;
  denyScreenRecordingMetadata_metadata = (uint64_t)v2;
}

@end