@interface LSBindableDeactivate
@end

@implementation LSBindableDeactivate

void ___LSBindableDeactivate_block_invoke(uint64_t a1, int a2, int a3)
{
  if (*(unsigned char *)(a1 + 48))
  {
    v6 = *(void **)(a1 + 32);
    int Generation = CSStoreGetGeneration();
    _LSBindableSetGeneration(v6, a3, Generation + 1);
  }
  if (*(_DWORD *)(a1 + 52) == a3) {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  }
}

@end