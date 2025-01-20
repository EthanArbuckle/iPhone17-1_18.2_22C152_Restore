@interface NSArray(Brook)
- (id)brk_shuffledArray;
@end

@implementation NSArray(Brook)

- (id)brk_shuffledArray
{
  unint64_t v2 = [a1 count];
  if (v2 > 1)
  {
    unint64_t v4 = v2;
    v5 = (void *)[a1 mutableCopy];
    uint64_t v6 = 0;
    do
    {
      [v5 exchangeObjectAtIndex:v6 withObjectAtIndex:v6 + arc4random_uniform(v4)];
      ++v6;
      --v4;
    }
    while (v4 != 1);
    id v3 = (id)[v5 copy];
  }
  else
  {
    id v3 = a1;
  }
  return v3;
}

@end