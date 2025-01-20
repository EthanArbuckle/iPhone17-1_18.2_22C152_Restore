@interface CTServerConnectionSetCellularDataIsEnabledSymbolLoc
@end

@implementation CTServerConnectionSetCellularDataIsEnabledSymbolLoc

void *__get_CTServerConnectionSetCellularDataIsEnabledSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = CoreTelephonyLibrary_48700();
  result = dlsym(v2, "_CTServerConnectionSetCellularDataIsEnabled");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  get_CTServerConnectionSetCellularDataIsEnabledSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                             + 24);
  return result;
}

@end