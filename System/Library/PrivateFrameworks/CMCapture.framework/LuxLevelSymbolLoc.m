@interface LuxLevelSymbolLoc
@end

@implementation LuxLevelSymbolLoc

void *__getkCVAFaceTracking_LuxLevelSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)AppleCVALibrary();
  result = dlsym(v2, "kCVAFaceTracking_LuxLevel");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkCVAFaceTracking_LuxLevelSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

@end