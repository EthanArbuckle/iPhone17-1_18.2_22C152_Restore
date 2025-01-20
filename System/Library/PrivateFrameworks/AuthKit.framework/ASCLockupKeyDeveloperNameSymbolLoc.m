@interface ASCLockupKeyDeveloperNameSymbolLoc
@end

@implementation ASCLockupKeyDeveloperNameSymbolLoc

void *__get_ASCLockupKeyDeveloperNameSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)AppStoreComponentsLibrary();
  result = dlsym(v2, "_ASCLockupKeyDeveloperName");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  get_ASCLockupKeyDeveloperNameSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

@end