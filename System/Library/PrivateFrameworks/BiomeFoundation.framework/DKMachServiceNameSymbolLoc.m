@interface DKMachServiceNameSymbolLoc
@end

@implementation DKMachServiceNameSymbolLoc

void *__get_DKMachServiceNameSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)CoreDuetLibrary();
  result = dlsym(v2, "_DKMachServiceName");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  get_DKMachServiceNameSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

@end