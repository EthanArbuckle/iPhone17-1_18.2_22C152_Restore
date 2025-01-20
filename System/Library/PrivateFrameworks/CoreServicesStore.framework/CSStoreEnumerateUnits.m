@interface CSStoreEnumerateUnits
@end

@implementation CSStoreEnumerateUnits

uint64_t ___CSStoreEnumerateUnits_block_invoke(uint64_t a1, uint64_t a2, BOOL *a3)
{
  char v5 = 0;
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  *a3 = v5 != 0;
  return result;
}

@end