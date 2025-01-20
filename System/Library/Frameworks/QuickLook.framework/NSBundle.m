@interface NSBundle
@end

@implementation NSBundle

uint64_t __59__NSBundle__QLUtilities__mainBundleSupportsBackgroundAudio__block_invoke()
{
  v0 = [MEMORY[0x263F086E0] mainBundle];
  v1 = [v0 infoDictionary];
  v5 = [v1 objectForKey:*MEMORY[0x263F833D8]];

  v2 = v5;
  if (v5)
  {
    uint64_t v3 = [v5 containsObject:*MEMORY[0x263F833D0]];
    v2 = v5;
  }
  else
  {
    uint64_t v3 = 0;
  }
  mainBundleSupportsBackgroundAudio__appsSupportsBackgroundAudio = v3;

  return MEMORY[0x270F9A758](v3, v2);
}

void __59__NSBundle__QLUtilities__mainBundleRequiresStatusBarHidden__block_invoke()
{
  id v2 = [MEMORY[0x263F086E0] mainBundle];
  v0 = [v2 infoDictionary];
  v1 = [v0 objectForKey:*MEMORY[0x263F839B0]];
  mainBundleRequiresStatusBarHidden__appRequiresStatusBarHidden = [v1 BOOLValue];
}

void __56__NSBundle__QLUtilities__mainBundleSupportsPrintCommand__block_invoke()
{
  v0 = [MEMORY[0x263F086E0] mainBundle];
  id v3 = [v0 infoDictionary];

  v1 = [v3 objectForKey:*MEMORY[0x263F83398]];
  int v2 = [v1 BOOLValue];
  if (v2) {
    LOBYTE(v2) = dyld_program_sdk_at_least();
  }
  mainBundleSupportsPrintCommand__supportsPrintCommand = v2;
}

@end