@interface SmoothDataSymbolLoc
@end

@implementation SmoothDataSymbolLoc

void *__getkCVAFaceTracking_SmoothDataSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)AppleCVALibrary_0();
  result = dlsym(v2, "kCVAFaceTracking_SmoothData");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkCVAFaceTracking_SmoothDataSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkCVAFaceTracking_SmoothDataSymbolLoc_block_invoke_0(uint64_t a1)
{
  v2 = (void *)AppleCVALibrary_1();
  result = dlsym(v2, "kCVAFaceTracking_SmoothData");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkCVAFaceTracking_SmoothDataSymbolLoc_ptr_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

@end