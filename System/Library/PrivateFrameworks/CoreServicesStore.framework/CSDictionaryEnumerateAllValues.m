@interface CSDictionaryEnumerateAllValues
@end

@implementation CSDictionaryEnumerateAllValues

uint64_t ___CSDictionaryEnumerateAllValues_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, BOOL *a4)
{
  char v6 = 0;
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  *a4 = v6 != 0;
  return result;
}

@end