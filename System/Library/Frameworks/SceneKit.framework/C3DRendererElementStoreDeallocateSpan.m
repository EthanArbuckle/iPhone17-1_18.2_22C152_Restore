@interface C3DRendererElementStoreDeallocateSpan
@end

@implementation C3DRendererElementStoreDeallocateSpan

uint64_t ____C3DRendererElementStoreDeallocateSpan_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t ProgramHashCodeStore = C3DEngineContextGetProgramHashCodeStore(a2);
  C3DProgramHashCodeStoreInvalidateRendererElementSpan(ProgramHashCodeStore, *(void *)(a1 + 32));
  uint64_t SortSystem = C3DEngineContextGetSortSystem(a2);
  unint64_t v6 = *(void *)(a1 + 32);

  return C3DSortSystemInvalidateKeyForRendererElementSpan(SortSystem, v6);
}

@end