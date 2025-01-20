@interface DisparityNormalizationOffsetSymbolLoc
@end

@implementation DisparityNormalizationOffsetSymbolLoc

void *__getkCVAFaceTracking_DisparityNormalizationOffsetSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)AppleCVALibrary();
  result = dlsym(v2, "kCVAFaceTracking_DisparityNormalizationOffset");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkCVAFaceTracking_DisparityNormalizationOffsetSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                            + 24);
  return result;
}

@end