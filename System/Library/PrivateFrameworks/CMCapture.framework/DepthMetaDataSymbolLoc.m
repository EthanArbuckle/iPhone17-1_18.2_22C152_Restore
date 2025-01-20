@interface DepthMetaDataSymbolLoc
@end

@implementation DepthMetaDataSymbolLoc

void *__getkCVAFaceTracking_DepthMetaDataSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)AppleCVALibrary();
  result = dlsym(v2, "kCVAFaceTracking_DepthMetaData");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkCVAFaceTracking_DepthMetaDataSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

@end