@interface NETRBClientDestroySymbolLoc
@end

@implementation NETRBClientDestroySymbolLoc

void *__get_NETRBClientDestroySymbolLoc_block_invoke(uint64_t a1)
{
  v2 = NetrbLibrary();
  result = dlsym(v2, "_NETRBClientDestroy");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  get_NETRBClientDestroySymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

@end