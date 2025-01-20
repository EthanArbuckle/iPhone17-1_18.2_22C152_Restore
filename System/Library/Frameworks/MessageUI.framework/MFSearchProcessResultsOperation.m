@interface MFSearchProcessResultsOperation
@end

@implementation MFSearchProcessResultsOperation

uint64_t __40___MFSearchProcessResultsOperation_main__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = _shouldCancel(*(void **)(a1 + 32), *(void **)(*(void *)(a1 + 32) + 248));
  if ((result & 1) == 0)
  {
    uint64_t result = [*(id *)(*(void *)(a1 + 32) + 248) _didFinishSearchForType:a2];
    if (result)
    {
      uint64_t v5 = *(void *)(a1 + 40);
      v6 = *(void **)(*(void *)(a1 + 32) + 248);
      uint64_t v7 = *(void *)(a1 + 48);
      return [v6 _appendSortedResultsOfType:a2 excluding:v5 toResults:v7];
    }
  }
  return result;
}

@end