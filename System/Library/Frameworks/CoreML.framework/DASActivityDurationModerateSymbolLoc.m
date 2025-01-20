@interface DASActivityDurationModerateSymbolLoc
@end

@implementation DASActivityDurationModerateSymbolLoc

void *__get_DASActivityDurationModerateSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)DuetActivitySchedulerLibrary();
  result = dlsym(v2, "_DASActivityDurationModerate");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  get_DASActivityDurationModerateSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

@end