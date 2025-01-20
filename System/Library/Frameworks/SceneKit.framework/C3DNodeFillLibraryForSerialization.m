@interface C3DNodeFillLibraryForSerialization
@end

@implementation C3DNodeFillLibraryForSerialization

void *___C3DNodeFillLibraryForSerialization_block_invoke(uint64_t a1, const void *a2)
{
  C3DLibraryAddEntry(*(void *)(a1 + 32), a2);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);

  return C3DFillLibraryForSerialization(a2, v4, v5);
}

@end