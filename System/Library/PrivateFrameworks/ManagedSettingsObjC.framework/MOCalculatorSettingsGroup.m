@interface MOCalculatorSettingsGroup
+ (MOBoolSettingMetadata)denyMathPaperSolvingMetadata;
+ (id)groupName;
- (NSNumber)denyMathPaperSolving;
- (void)setDenyMathPaperSolving:(id)a3;
@end

@implementation MOCalculatorSettingsGroup

+ (id)groupName
{
  return @"calculator";
}

- (NSNumber)denyMathPaperSolving
{
  return (NSNumber *)[(MOSettingsGroup *)self valueForSetting:@"denyMathPaperSolving"];
}

- (void)setDenyMathPaperSolving:(id)a3
{
}

+ (MOBoolSettingMetadata)denyMathPaperSolvingMetadata
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__MOCalculatorSettingsGroup_denyMathPaperSolvingMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (denyMathPaperSolvingMetadata_onceToken != -1) {
    dispatch_once(&denyMathPaperSolvingMetadata_onceToken, block);
  }
  v2 = (void *)denyMathPaperSolvingMetadata_metadata;
  return (MOBoolSettingMetadata *)v2;
}

void __57__MOCalculatorSettingsGroup_denyMathPaperSolvingMetadata__block_invoke()
{
  v0 = NSString;
  v1 = [(id)objc_opt_class() groupName];
  id v4 = [v0 stringWithFormat:@"%@.%@", v1, @"denyMathPaperSolving"];

  v2 = [[MOBoolSettingMetadata alloc] initWithSettingName:v4 defaultBool:0 combineOperator:0 isPublic:0 scope:@"user" isPrivacySensitive:0];
  v3 = (void *)denyMathPaperSolvingMetadata_metadata;
  denyMathPaperSolvingMetadata_metadata = (uint64_t)v2;
}

@end