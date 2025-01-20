@interface NSDictionary
@end

@implementation NSDictionary

uint64_t __35__NSDictionary_BaseBoard__bs_each___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __37__NSDictionary_BaseBoard__bs_filter___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  if (result)
  {
    v7 = *(void **)(a1 + 32);
    return [v7 setObject:a3 forKey:a2];
  }
  return result;
}

@end