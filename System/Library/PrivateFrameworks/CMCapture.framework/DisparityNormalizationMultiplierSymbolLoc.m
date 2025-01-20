@interface DisparityNormalizationMultiplierSymbolLoc
@end

@implementation DisparityNormalizationMultiplierSymbolLoc

void *__getkCVAFaceTracking_DisparityNormalizationMultiplierSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)AppleCVALibrary();
  result = dlsym(v2, "kCVAFaceTracking_DisparityNormalizationMultiplier");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkCVAFaceTracking_DisparityNormalizationMultiplierSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                                + 24);
  return result;
}

@end