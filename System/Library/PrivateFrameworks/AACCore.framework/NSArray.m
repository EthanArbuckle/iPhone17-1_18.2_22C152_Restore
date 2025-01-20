@interface NSArray
@end

@implementation NSArray

uint64_t __41__NSArray_AEAdditions__ae_firstMatching___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (result) {
    *a4 = 1;
  }
  return result;
}

@end