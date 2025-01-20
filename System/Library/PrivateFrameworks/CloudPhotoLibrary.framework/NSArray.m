@interface NSArray
@end

@implementation NSArray

uint64_t __34__NSArray_CPLCopying__cplDeepCopy__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = [a2 cplDeepCopy];
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(v6 + 8 * a3);
  *(void *)(v6 + 8 * a3) = v5;
  return MEMORY[0x1F41817F8](v5, v7);
}

@end