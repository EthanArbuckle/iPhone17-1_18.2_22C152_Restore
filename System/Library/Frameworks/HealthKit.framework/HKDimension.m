@interface HKDimension
@end

@implementation HKDimension

void __25___HKDimension_reduction__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  if ([v8 canBeReduced])
  {
    v5 = [v8 reducedUnit];

    id v8 = [v5 _dimensionReduction];

    v6 = *(void **)(a1 + 32);
    v7 = [v8 factorizationByRaisingToExponent:a3];
    [v6 multiplyByFactorization:v7];
  }
  else
  {
    [*(id *)(a1 + 32) multiplyByFactor:v8 exponent:a3];
  }
}

@end