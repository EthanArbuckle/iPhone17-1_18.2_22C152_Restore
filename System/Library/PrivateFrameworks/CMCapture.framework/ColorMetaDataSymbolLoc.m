@interface ColorMetaDataSymbolLoc
@end

@implementation ColorMetaDataSymbolLoc

void *__getkCVAFaceTracking_ColorMetaDataSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)AppleCVALibrary();
  result = dlsym(v2, "kCVAFaceTracking_ColorMetaData");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkCVAFaceTracking_ColorMetaDataSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

@end