@interface HUTriggerUtilities
+ (void)preloadShortcutHomeManager;
+ (void)preloadShortcuts;
@end

@implementation HUTriggerUtilities

+ (void)preloadShortcuts
{
  v2 = [MEMORY[0x1E4F691A0] sharedDispatcher];
  v3 = [v2 homeManager];
  v4 = [v3 homes];

  v5 = [MEMORY[0x1E4F7A0F0] globalAsyncScheduler];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__HUTriggerUtilities_preloadShortcuts__block_invoke;
  v7[3] = &unk_1E6386018;
  id v8 = v4;
  id v6 = v4;
  [v5 performBlock:v7];
}

uint64_t __38__HUTriggerUtilities_preloadShortcuts__block_invoke(uint64_t a1)
{
  return [MEMORY[0x1E4FB7220] setCachedHomes:*(void *)(a1 + 32)];
}

+ (void)preloadShortcutHomeManager
{
  id v2 = [MEMORY[0x1E4F7A0F0] globalAsyncScheduler];
  [v2 performBlock:&__block_literal_global_59];
}

uint64_t __48__HUTriggerUtilities_preloadShortcutHomeManager__block_invoke()
{
  return [MEMORY[0x1E4FB74D0] preloadHomeManager];
}

@end