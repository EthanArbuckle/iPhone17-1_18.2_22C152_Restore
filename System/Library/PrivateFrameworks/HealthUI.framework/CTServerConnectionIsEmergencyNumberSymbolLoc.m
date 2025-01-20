@interface CTServerConnectionIsEmergencyNumberSymbolLoc
@end

@implementation CTServerConnectionIsEmergencyNumberSymbolLoc

void *__get_CTServerConnectionIsEmergencyNumberSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)CoreTelephonyLibrary();
  result = dlsym(v2, "_CTServerConnectionIsEmergencyNumber");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  get_CTServerConnectionIsEmergencyNumberSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

@end