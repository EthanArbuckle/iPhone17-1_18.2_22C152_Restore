@interface CTServerConnectionCreateOnTargetQueueSymbolLoc
@end

@implementation CTServerConnectionCreateOnTargetQueueSymbolLoc

void *__get_CTServerConnectionCreateOnTargetQueueSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)CoreTelephonyLibrary();
  result = dlsym(v2, "_CTServerConnectionCreateOnTargetQueue");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  get_CTServerConnectionCreateOnTargetQueueSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

@end