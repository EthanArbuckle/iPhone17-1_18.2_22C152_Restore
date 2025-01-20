@interface NSBundle(_QLUtilities)
+ (uint64_t)mainBundleRequiresStatusBarHidden;
+ (uint64_t)mainBundleSupportsBackgroundAudio;
+ (uint64_t)mainBundleSupportsPrintCommand;
- (id)ql_applicationName;
@end

@implementation NSBundle(_QLUtilities)

+ (uint64_t)mainBundleSupportsBackgroundAudio
{
  if (mainBundleSupportsBackgroundAudio_onceToken != -1) {
    dispatch_once(&mainBundleSupportsBackgroundAudio_onceToken, &__block_literal_global_9);
  }
  return mainBundleSupportsBackgroundAudio__appsSupportsBackgroundAudio;
}

+ (uint64_t)mainBundleRequiresStatusBarHidden
{
  if (mainBundleRequiresStatusBarHidden_onceToken != -1) {
    dispatch_once(&mainBundleRequiresStatusBarHidden_onceToken, &__block_literal_global_2);
  }
  return mainBundleRequiresStatusBarHidden__appRequiresStatusBarHidden;
}

+ (uint64_t)mainBundleSupportsPrintCommand
{
  if (mainBundleSupportsPrintCommand_onceToken != -1) {
    dispatch_once(&mainBundleSupportsPrintCommand_onceToken, &__block_literal_global_4);
  }
  return mainBundleSupportsPrintCommand__supportsPrintCommand;
}

- (id)ql_applicationName
{
  v2 = [MEMORY[0x263F01890] bundleRecordForCurrentProcess];
  v3 = [v2 localizedName];
  if (!v3)
  {
    v4 = [a1 localizedInfoDictionary];
    uint64_t v5 = *MEMORY[0x263EFFA90];
    v3 = [v4 objectForKey:*MEMORY[0x263EFFA90]];

    if (!v3)
    {
      v6 = [a1 infoDictionary];
      v3 = [v6 objectForKey:v5];

      if (!v3)
      {
        v7 = [a1 localizedInfoDictionary];
        uint64_t v8 = *MEMORY[0x263EFFB68];
        v3 = [v7 objectForKey:*MEMORY[0x263EFFB68]];

        if (!v3)
        {
          v9 = [a1 infoDictionary];
          v3 = [v9 objectForKey:v8];
        }
      }
    }
  }

  return v3;
}

@end