@interface EDMigrateBlockedSenderEnabledToBlockedSenderActionEnumUpgradeStep
+ (BOOL)run;
@end

@implementation EDMigrateBlockedSenderEnabledToBlockedSenderActionEnumUpgradeStep

+ (BOOL)run
{
  v2 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
  uint64_t v3 = *MEMORY[0x1E4F600D8];
  v4 = [v2 valueForKey:*MEMORY[0x1E4F600D8]];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v4 BOOLValue]) {
      v5 = &unk_1F35BAE08;
    }
    else {
      v5 = &unk_1F35BAE20;
    }
    [v2 setValue:v5 forKey:*MEMORY[0x1E4F600D0]];
  }
  [v2 removeObjectForKey:v3];

  return 1;
}

@end