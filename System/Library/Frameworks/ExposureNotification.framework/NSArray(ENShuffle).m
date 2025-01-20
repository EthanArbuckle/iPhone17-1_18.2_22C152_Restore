@interface NSArray(ENShuffle)
- (id)enRandomlyShuffled;
@end

@implementation NSArray(ENShuffle)

- (id)enRandomlyShuffled
{
  if ((unint64_t)[a1 count] > 1)
  {
    v3 = (void *)[a1 mutableCopy];
    [v3 enRandomlyShuffle];
    v2 = (void *)[v3 copy];
  }
  else
  {
    v2 = (void *)[a1 copy];
  }

  return v2;
}

@end