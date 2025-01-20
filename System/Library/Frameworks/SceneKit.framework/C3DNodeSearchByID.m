@interface C3DNodeSearchByID
@end

@implementation C3DNodeSearchByID

uint64_t ___C3DNodeSearchByID_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = _C3DNodeSearchByID(a2, *(void *)(a1 + 40));
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    *a4 = 1;
  }
  return result;
}

@end