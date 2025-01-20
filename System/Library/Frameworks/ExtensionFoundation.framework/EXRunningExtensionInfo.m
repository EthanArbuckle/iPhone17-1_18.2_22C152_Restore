@interface EXRunningExtensionInfo
@end

@implementation EXRunningExtensionInfo

void __52___EXRunningExtensionInfo_notifyExtensionMainCalled__block_invoke()
{
  s_extensionMainCalled = 1;
}

uint64_t __57___EXRunningExtensionInfo_extensionInfoForCurrentProcess__block_invoke()
{
  extensionInfoForCurrentProcess_extensionForCurrentProcess = [[_EXRunningExtensionInfo alloc] initForCurrentProcess];

  return MEMORY[0x1F41817F8]();
}

@end