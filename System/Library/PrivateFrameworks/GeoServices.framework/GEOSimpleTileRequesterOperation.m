@interface GEOSimpleTileRequesterOperation
@end

@implementation GEOSimpleTileRequesterOperation

void __41___GEOSimpleTileRequesterOperation_start__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 operationFailed:*(void *)(a1 + 32) error:0];
}

@end