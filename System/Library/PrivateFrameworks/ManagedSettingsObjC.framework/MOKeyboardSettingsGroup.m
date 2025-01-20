@interface MOKeyboardSettingsGroup
+ (MOBoolSettingMetadata)denyDictationMetadata;
+ (MOBoolSettingMetadata)denyMathSolvingKeyboardMetadata;
+ (id)groupName;
- (NSNumber)denyDictation;
- (NSNumber)denyMathSolvingKeyboard;
- (void)setDenyDictation:(id)a3;
- (void)setDenyMathSolvingKeyboard:(id)a3;
@end

@implementation MOKeyboardSettingsGroup

+ (id)groupName
{
  return @"keyboard";
}

- (NSNumber)denyDictation
{
  return (NSNumber *)[(MOSettingsGroup *)self valueForSetting:@"denyDictation"];
}

- (void)setDenyDictation:(id)a3
{
}

+ (MOBoolSettingMetadata)denyDictationMetadata
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__MOKeyboardSettingsGroup_denyDictationMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (denyDictationMetadata_onceToken != -1) {
    dispatch_once(&denyDictationMetadata_onceToken, block);
  }
  v2 = (void *)denyDictationMetadata_metadata;
  return (MOBoolSettingMetadata *)v2;
}

void __48__MOKeyboardSettingsGroup_denyDictationMetadata__block_invoke()
{
  v0 = NSString;
  v1 = [(id)objc_opt_class() groupName];
  id v4 = [v0 stringWithFormat:@"%@.%@", v1, @"denyDictation"];

  v2 = [[MOBoolSettingMetadata alloc] initWithSettingName:v4 defaultBool:0 combineOperator:0 isPublic:0 scope:@"user" isPrivacySensitive:0];
  v3 = (void *)denyDictationMetadata_metadata;
  denyDictationMetadata_metadata = (uint64_t)v2;
}

- (NSNumber)denyMathSolvingKeyboard
{
  return (NSNumber *)[(MOSettingsGroup *)self valueForSetting:@"denyMathSolvingKeyboard"];
}

- (void)setDenyMathSolvingKeyboard:(id)a3
{
}

+ (MOBoolSettingMetadata)denyMathSolvingKeyboardMetadata
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__MOKeyboardSettingsGroup_denyMathSolvingKeyboardMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (denyMathSolvingKeyboardMetadata_onceToken != -1) {
    dispatch_once(&denyMathSolvingKeyboardMetadata_onceToken, block);
  }
  v2 = (void *)denyMathSolvingKeyboardMetadata_metadata;
  return (MOBoolSettingMetadata *)v2;
}

void __58__MOKeyboardSettingsGroup_denyMathSolvingKeyboardMetadata__block_invoke()
{
  v0 = NSString;
  v1 = [(id)objc_opt_class() groupName];
  id v4 = [v0 stringWithFormat:@"%@.%@", v1, @"denyMathSolvingKeyboard"];

  v2 = [[MOBoolSettingMetadata alloc] initWithSettingName:v4 defaultBool:0 combineOperator:0 isPublic:0 scope:@"user" isPrivacySensitive:0];
  v3 = (void *)denyMathSolvingKeyboardMetadata_metadata;
  denyMathSolvingKeyboardMetadata_metadata = (uint64_t)v2;
}

@end