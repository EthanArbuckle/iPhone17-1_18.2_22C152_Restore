@interface NormalizedDisparitySymbolLoc
@end

@implementation NormalizedDisparitySymbolLoc

void *__getkCVAFaceTracking_NormalizedDisparitySymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)AppleCVALibrary();
  result = dlsym(v2, "kCVAFaceTracking_NormalizedDisparity");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkCVAFaceTracking_NormalizedDisparitySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

@end