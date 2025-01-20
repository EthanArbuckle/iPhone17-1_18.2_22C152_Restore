@interface NumTrackedFacesSymbolLoc
@end

@implementation NumTrackedFacesSymbolLoc

void *__getkCVAFaceTracking_NumTrackedFacesSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)AppleCVALibrary();
  result = dlsym(v2, "kCVAFaceTracking_NumTrackedFaces");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkCVAFaceTracking_NumTrackedFacesSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

@end