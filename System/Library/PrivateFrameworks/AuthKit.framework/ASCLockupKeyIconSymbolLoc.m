@interface ASCLockupKeyIconSymbolLoc
@end

@implementation ASCLockupKeyIconSymbolLoc

void *__get_ASCLockupKeyIconSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)AppStoreComponentsLibrary();
  result = dlsym(v2, "_ASCLockupKeyIcon");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  get_ASCLockupKeyIconSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

@end