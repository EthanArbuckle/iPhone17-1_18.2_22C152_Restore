@interface C3DNodeCopyChildNodesPassingTest
@end

@implementation C3DNodeCopyChildNodesPassingTest

uint64_t ___C3DNodeCopyChildNodesPassingTest_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = _C3DNodeCopyChildNodesPassingTest(a2, *(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 40));
  if ((result & 1) == 0) {
    *a4 = 1;
  }
  return result;
}

@end