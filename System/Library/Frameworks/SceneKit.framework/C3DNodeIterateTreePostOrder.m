@interface C3DNodeIterateTreePostOrder
@end

@implementation C3DNodeIterateTreePostOrder

uint64_t ___C3DNodeIterateTreePostOrder_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = _C3DNodeIterateTreePostOrder(a2, *(void *)(a1 + 32), *(void *)(a1 + 40));
  if (result == 3) {
    *a4 = 1;
  }
  return result;
}

@end