@interface ColorOnlySymbolLoc
@end

@implementation ColorOnlySymbolLoc

void *__getkCVAFaceTracking_ColorOnlySymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)AppleCVALibrary();
  result = dlsym(v2, "kCVAFaceTracking_ColorOnly");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkCVAFaceTracking_ColorOnlySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

@end