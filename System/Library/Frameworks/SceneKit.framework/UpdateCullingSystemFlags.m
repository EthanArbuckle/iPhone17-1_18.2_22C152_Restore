@interface UpdateCullingSystemFlags
@end

@implementation UpdateCullingSystemFlags

uint64_t ____UpdateCullingSystemFlags_block_invoke(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = *(_DWORD *)(a2 + 216);
  if (v2 != -1) {
    C3DCullingSystemUpdateFlags(*(__C3DCullingSystem **)(a1 + 32), v2);
  }
  return 0;
}

@end