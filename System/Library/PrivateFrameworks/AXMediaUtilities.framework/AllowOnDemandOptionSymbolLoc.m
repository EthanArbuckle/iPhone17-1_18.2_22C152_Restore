@interface AllowOnDemandOptionSymbolLoc
@end

@implementation AllowOnDemandOptionSymbolLoc

void *__getVCPMediaAnalysisService_AllowOnDemandOptionSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)MediaAnalysisLibrary();
  result = dlsym(v2, "VCPMediaAnalysisService_AllowOnDemandOption");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getVCPMediaAnalysisService_AllowOnDemandOptionSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 24);
  return result;
}

@end