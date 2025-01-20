@interface TrackedFacesArraySymbolLoc
@end

@implementation TrackedFacesArraySymbolLoc

void *__getkCVAFaceTracking_TrackedFacesArraySymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)AppleCVALibrary_0();
  result = dlsym(v2, "kCVAFaceTracking_TrackedFacesArray");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkCVAFaceTracking_TrackedFacesArraySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkCVAFaceTracking_TrackedFacesArraySymbolLoc_block_invoke_0(uint64_t a1)
{
  v2 = (void *)AppleCVALibrary_1();
  result = dlsym(v2, "kCVAFaceTracking_TrackedFacesArray");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkCVAFaceTracking_TrackedFacesArraySymbolLoc_ptr_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

@end