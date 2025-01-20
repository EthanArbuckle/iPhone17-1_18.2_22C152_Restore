@interface NSLayoutConstraintSortDiff
@end

@implementation NSLayoutConstraintSortDiff

uint64_t ___NSLayoutConstraintSortDiff_block_invoke(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *a3;
  LODWORD(result) = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (result) {
    return result;
  }
  else {
    return (v3 - v4);
  }
}

uint64_t ___NSLayoutConstraintSortDiff_block_invoke_2(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *a3;
  LODWORD(result) = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (result) {
    return result;
  }
  else {
    return (v3 - v4);
  }
}

@end