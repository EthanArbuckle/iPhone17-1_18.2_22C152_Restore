@interface CTServerConnectionCopyISOForMCCSymbolLoc
@end

@implementation CTServerConnectionCopyISOForMCCSymbolLoc

void *__get_CTServerConnectionCopyISOForMCCSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)CoreTelephonyLibrary();
  result = dlsym(v2, "_CTServerConnectionCopyISOForMCC");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  get_CTServerConnectionCopyISOForMCCSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

@end