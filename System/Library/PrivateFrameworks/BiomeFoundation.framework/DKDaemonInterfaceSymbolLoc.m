@interface DKDaemonInterfaceSymbolLoc
@end

@implementation DKDaemonInterfaceSymbolLoc

void *__get_DKDaemonInterfaceSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)CoreDuetLibrary();
  result = dlsym(v2, "_DKDaemonInterface");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  get_DKDaemonInterfaceSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

@end