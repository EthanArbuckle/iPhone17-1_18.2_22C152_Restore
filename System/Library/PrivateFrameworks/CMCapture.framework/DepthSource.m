@interface DepthSource
@end

@implementation DepthSource

void *__getkCVAFaceTracking_DepthSource_SMPRawSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)AppleCVALibrary();
  result = dlsym(v2, "kCVAFaceTracking_DepthSource_SMPRaw");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkCVAFaceTracking_DepthSource_SMPRawSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkCVAFaceTracking_DepthSource_PearlSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)AppleCVALibrary();
  result = dlsym(v2, "kCVAFaceTracking_DepthSource_Pearl");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkCVAFaceTracking_DepthSource_PearlSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

@end