@interface EventsSortedByAnchor
@end

@implementation EventsSortedByAnchor

uint64_t ___EventsSortedByAnchor_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  unsigned int v6 = [v4 anchor];
  if (v6 >= [v5 anchor])
  {
    unsigned int v8 = [v4 anchor];
    if (v8 <= [v5 anchor])
    {
      v9 = [v4 timestamp];
      v10 = [v5 timestamp];
      uint64_t v7 = [v9 compare:v10];
    }
    else
    {
      uint64_t v7 = 1;
    }
  }
  else
  {
    uint64_t v7 = -1;
  }

  return v7;
}

@end