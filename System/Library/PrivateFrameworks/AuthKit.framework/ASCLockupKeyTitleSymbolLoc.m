@interface ASCLockupKeyTitleSymbolLoc
@end

@implementation ASCLockupKeyTitleSymbolLoc

void *__get_ASCLockupKeyTitleSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)AppStoreComponentsLibrary();
  result = dlsym(v2, "_ASCLockupKeyTitle");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  get_ASCLockupKeyTitleSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

@end