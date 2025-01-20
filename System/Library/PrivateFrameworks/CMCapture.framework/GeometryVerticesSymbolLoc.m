@interface GeometryVerticesSymbolLoc
@end

@implementation GeometryVerticesSymbolLoc

void *__getkCVAFaceTracking_GeometryVerticesSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)AppleCVALibrary_0();
  result = dlsym(v2, "kCVAFaceTracking_GeometryVertices");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkCVAFaceTracking_GeometryVerticesSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

@end