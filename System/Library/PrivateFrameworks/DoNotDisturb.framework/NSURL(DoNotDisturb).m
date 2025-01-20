@interface NSURL(DoNotDisturb)
+ (id)dnd_settingsURLWithModeIdentifier:()DoNotDisturb;
+ (id)dnd_setupURLWithSemanticType:()DoNotDisturb;
+ (uint64_t)dnd_defaultSettingsURL;
+ (uint64_t)dnd_defaultSetupURL;
@end

@implementation NSURL(DoNotDisturb)

+ (uint64_t)dnd_defaultSettingsURL
{
  return [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=DO_NOT_DISTURB"];
}

+ (uint64_t)dnd_defaultSetupURL
{
  return [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=DO_NOT_DISTURB&path=setup"];
}

+ (id)dnd_setupURLWithSemanticType:()DoNotDisturb
{
  v3 = (void *)MEMORY[0x1E4F1CB10];
  v4 = objc_msgSend(NSString, "stringWithFormat:", @"prefs:root=DO_NOT_DISTURB&path=setup&type=%ld", a3);
  v5 = [v3 URLWithString:v4];

  return v5;
}

+ (id)dnd_settingsURLWithModeIdentifier:()DoNotDisturb
{
  v3 = (void *)MEMORY[0x1E4F1CB10];
  v4 = [NSString stringWithFormat:@"prefs:root=DO_NOT_DISTURB&path=%@", a3];
  v5 = [v3 URLWithString:v4];

  return v5;
}

@end