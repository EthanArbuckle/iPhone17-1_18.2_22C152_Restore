@interface HKWorkoutSessionStateNameSymbolLoc
@end

@implementation HKWorkoutSessionStateNameSymbolLoc

void *__get_HKWorkoutSessionStateNameSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)HealthKitLibraryCore();
  if (!v2)
  {
    v4 = (void *)abort_report_np();
    free(v4);
  }
  result = dlsym(v2, "_HKWorkoutSessionStateName");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  get_HKWorkoutSessionStateNameSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

@end