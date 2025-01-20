@interface PHFetchResult
@end

@implementation PHFetchResult

uint64_t __46__PHFetchResult_MediaAnalysis__resultsAsArray__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

uint64_t __44__PHFetchResult_MediaAnalysis__resultsAsSet__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

@end