@interface CNSortsByPositionInAuxiliaryArray
@end

@implementation CNSortsByPositionInAuxiliaryArray

void __57___CNSortsByPositionInAuxiliaryArray_prepareRankingIndex__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v5 = NSNumber;
  id v6 = a2;
  id v7 = [v5 numberWithUnsignedInteger:a3];
  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v6];
}

uint64_t __48___CNSortsByPositionInAuxiliaryArray_comparator__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = [v5 rankForObject:a2];
  v8 = [*(id *)(a1 + 32) rankForObject:v6];

  uint64_t v9 = [v7 compare:v8];
  return v9;
}

@end