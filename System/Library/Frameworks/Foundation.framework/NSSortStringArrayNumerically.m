@interface NSSortStringArrayNumerically
@end

@implementation NSSortStringArrayNumerically

uint64_t ___NSSortStringArrayNumerically_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 compare:a3 options:64];
}

@end