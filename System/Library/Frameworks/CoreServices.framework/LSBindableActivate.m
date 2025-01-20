@interface LSBindableActivate
@end

@implementation LSBindableActivate

void ___LSBindableActivate_block_invoke(uint64_t a1, int a2, int a3)
{
  if (*(unsigned char *)(a1 + 56))
  {
    v6 = *(void **)(a1 + 32);
    int Generation = CSStoreGetGeneration();
    _LSBindableSetGeneration(v6, a3, Generation + 1);
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(_DWORD *)(v8 + 24) == -1)
  {
    if (*(_DWORD *)(a1 + 60) == a3)
    {
LABEL_8:
      *(_DWORD *)(v8 + 24) = a2;
      return;
    }
    v9 = *(unsigned int (**)(void))(a1 + 48);
    if (v9 && v9(*(void *)(a1 + 32)) == 1)
    {
      uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
      goto LABEL_8;
    }
  }
}

@end