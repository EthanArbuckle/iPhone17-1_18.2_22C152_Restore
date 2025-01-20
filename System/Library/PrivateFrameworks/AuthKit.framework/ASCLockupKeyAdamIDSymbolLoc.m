@interface ASCLockupKeyAdamIDSymbolLoc
@end

@implementation ASCLockupKeyAdamIDSymbolLoc

void *__get_ASCLockupKeyAdamIDSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)AppStoreComponentsLibrary();
  result = dlsym(v2, "_ASCLockupKeyAdamID");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  get_ASCLockupKeyAdamIDSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

@end