@interface DASExtensionLaunchReasonMLComputeSymbolLoc
@end

@implementation DASExtensionLaunchReasonMLComputeSymbolLoc

void *__get_DASExtensionLaunchReasonMLComputeSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)DuetActivitySchedulerLibrary();
  result = dlsym(v2, "_DASExtensionLaunchReasonMLCompute");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  get_DASExtensionLaunchReasonMLComputeSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

@end