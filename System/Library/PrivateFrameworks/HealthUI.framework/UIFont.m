@interface UIFont
@end

@implementation UIFont

uint64_t __53__UIFont_HKAdditions__hk_fontByAddingSymbolicTraits___block_invoke(uint64_t a1, unsigned int a2)
{
  return *(_DWORD *)(a1 + 32) | a2;
}

uint64_t __55__UIFont_HKAdditions__hk_fontByRemovingSymbolicTraits___block_invoke(uint64_t a1, int a2)
{
  return a2 & ~*(_DWORD *)(a1 + 32);
}

@end