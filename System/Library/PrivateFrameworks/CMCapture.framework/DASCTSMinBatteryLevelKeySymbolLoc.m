@interface DASCTSMinBatteryLevelKeySymbolLoc
@end

@implementation DASCTSMinBatteryLevelKeySymbolLoc

void *__get_DASCTSMinBatteryLevelKeySymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)DuetActivitySchedulerLibrary();
  result = dlsym(v2, "_DASCTSMinBatteryLevelKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  get_DASCTSMinBatteryLevelKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

@end