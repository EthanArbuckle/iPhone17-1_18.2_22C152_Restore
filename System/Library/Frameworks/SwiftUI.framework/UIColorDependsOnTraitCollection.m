@interface UIColorDependsOnTraitCollection
@end

@implementation UIColorDependsOnTraitCollection

uint64_t ___UIColorDependsOnTraitCollection_block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4FB1618] instanceMethodForSelector:*(void *)(a1 + 32)];
  _UIColorDependsOnTraitCollection_UIColor_imp = result;
  return result;
}

@end