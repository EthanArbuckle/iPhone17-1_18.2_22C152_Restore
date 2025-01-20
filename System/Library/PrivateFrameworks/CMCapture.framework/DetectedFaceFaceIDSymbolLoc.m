@interface DetectedFaceFaceIDSymbolLoc
@end

@implementation DetectedFaceFaceIDSymbolLoc

void *__getkCVAFaceTracking_DetectedFaceFaceIDSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)AppleCVALibrary();
  result = dlsym(v2, "kCVAFaceTracking_DetectedFaceFaceID");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkCVAFaceTracking_DetectedFaceFaceIDSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

@end