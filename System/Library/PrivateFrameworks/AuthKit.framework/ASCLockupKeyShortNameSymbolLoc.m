@interface ASCLockupKeyShortNameSymbolLoc
@end

@implementation ASCLockupKeyShortNameSymbolLoc

void *__get_ASCLockupKeyShortNameSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)AppStoreComponentsLibrary();
  result = dlsym(v2, "_ASCLockupKeyShortName");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  get_ASCLockupKeyShortNameSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

@end