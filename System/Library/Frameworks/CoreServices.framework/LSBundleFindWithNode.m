@interface LSBundleFindWithNode
@end

@implementation LSBundleFindWithNode

BOOL ___LSBundleFindWithNode_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _LSBundleMatchesNode(**(void ***)(a1 + 40), *(_DWORD *)a3, *(void *)(a3 + 8), *(void **)(a1 + 32), *(void *)(a1 + 48)) != 0;
}

uint64_t ___LSBundleFindWithNode_block_invoke_137(uint64_t a1, int a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a3;
  uint64_t result = _LSBundleMatchesNode(**(void ***)(a1 + 64), *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24), *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24), *(void **)(a1 + 32), *(void *)(a1 + 72));
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    *a5 = 1;
  }
  return result;
}

void ___LSBundleFindWithNode_block_invoke_2(uint64_t a1, int a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  v9 = (void *)MEMORY[0x18530F680]();
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = _LSAliasMatchesPath_NoIO(**(void ***)(a1 + 64), **(_DWORD **)(*(void *)(*(void *)(a1 + 48) + 8)+ 24), *(void **)(a1 + 32), 0);
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
    *a5 = 1;
  }
}

@end