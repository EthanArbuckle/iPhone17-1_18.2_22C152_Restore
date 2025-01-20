@interface SFScreenScaleSymbolLoc
@end

@implementation SFScreenScaleSymbolLoc

void *__get_SFScreenScaleSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)MobileSafariLibrary();
  result = dlsym(v2, "_SFScreenScale");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  get_SFScreenScaleSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

@end