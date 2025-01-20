@interface NETRBClientGetGlobalServiceStateSymbolLoc
@end

@implementation NETRBClientGetGlobalServiceStateSymbolLoc

void *__get_NETRBClientGetGlobalServiceStateSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = NetrbLibrary();
  result = dlsym(v2, "_NETRBClientGetGlobalServiceState");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  get_NETRBClientGetGlobalServiceStateSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

@end