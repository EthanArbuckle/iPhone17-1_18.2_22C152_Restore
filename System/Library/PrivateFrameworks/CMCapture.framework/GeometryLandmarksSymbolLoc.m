@interface GeometryLandmarksSymbolLoc
@end

@implementation GeometryLandmarksSymbolLoc

void *__getkCVAFaceTracking_GeometryLandmarksSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)AppleCVALibrary_0();
  result = dlsym(v2, "kCVAFaceTracking_GeometryLandmarks");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkCVAFaceTracking_GeometryLandmarksSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

@end