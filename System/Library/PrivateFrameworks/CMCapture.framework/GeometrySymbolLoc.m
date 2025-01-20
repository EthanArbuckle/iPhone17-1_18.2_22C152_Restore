@interface GeometrySymbolLoc
@end

@implementation GeometrySymbolLoc

void *__getkCVAFaceTracking_GeometrySymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)AppleCVALibrary_0();
  result = dlsym(v2, "kCVAFaceTracking_Geometry");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkCVAFaceTracking_GeometrySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

@end