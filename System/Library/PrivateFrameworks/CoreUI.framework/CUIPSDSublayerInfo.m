@interface CUIPSDSublayerInfo
@end

@implementation CUIPSDSublayerInfo

uint64_t __53___CUIPSDSublayerInfo_newWithSublayerCount_indexSet___block_invoke(uint64_t result, int a2)
{
  uint64_t v2 = *(void *)(result + 40);
  uint64_t v3 = *(void *)(*(void *)(result + 32) + 8);
  uint64_t v4 = *(void *)(v3 + 24);
  *(void *)(v3 + 24) = v4 + 1;
  *(_DWORD *)(v2 + 4 * v4) = a2;
  return result;
}

@end