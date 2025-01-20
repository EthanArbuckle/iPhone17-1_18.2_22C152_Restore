@interface NSArray(BMUtilities)
+ (id)bm_shuffledArrayWithArray:()BMUtilities;
@end

@implementation NSArray(BMUtilities)

+ (id)bm_shuffledArrayWithArray:()BMUtilities
{
  id v3 = a3;
  if ((unint64_t)[v3 count] > 1)
  {
    v5 = (void *)[v3 mutableCopy];
    uint64_t v6 = [v5 count];
    uint64_t v7 = v6 - 1;
    if (v6 != 1)
    {
      do
      {
        [v5 exchangeObjectAtIndex:v7 withObjectAtIndex:arc4random_uniform(v7 + 1)];
        --v7;
      }
      while (v7);
    }
    v4 = (void *)[v5 copy];
  }
  else
  {
    v4 = (void *)[v3 copy];
  }

  return v4;
}

@end