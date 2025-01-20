@interface CalDefaults
+ (id)shared;
+ (id)thisProcess;
+ (void)initialize;
@end

@implementation CalDefaults

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = (void *)MEMORY[0x1E4F1C9E8];
    v3 = [NSNumber numberWithBool:1];
    v4 = [NSNumber numberWithBool:1];
    v5 = [NSNumber numberWithBool:0];
    v6 = [NSNumber numberWithBool:1];
    v7 = [NSNumber numberWithBool:0];
    v8 = [NSNumber numberWithBool:0];
    v10 = objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, @"display birthdays calendar", v4, @"add holiday calendar", v5, @"Add default alarms", v6, @"Disable invitation alerts", v7, @"Disable shared calendar alerts", v8, @"CALPrefCrashImmediatelyUponException", 0);

    v9 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v9 registerDefaults:v10];
  }
}

+ (id)thisProcess
{
  return (id)[MEMORY[0x1E4F1CB18] standardUserDefaults];
}

+ (id)shared
{
  v2 = @"com.apple.mobilecal";
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __21__CalDefaults_shared__block_invoke;
  block[3] = &unk_1E56CD9A0;
  v6 = v2;
  if (shared_onceToken != -1) {
    dispatch_once(&shared_onceToken, block);
  }
  id v3 = (id)shared__defaults;

  return v3;
}

uint64_t __21__CalDefaults_shared__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  MainBundle = CFBundleGetMainBundle();
  if ([v2 isEqualToString:CFBundleGetIdentifier(MainBundle)])
  {
    uint64_t v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  }
  else
  {
    uint64_t v4 = [objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:*(void *)(a1 + 32)];
  }
  shared__defaults = v4;

  return MEMORY[0x1F41817F8]();
}

@end