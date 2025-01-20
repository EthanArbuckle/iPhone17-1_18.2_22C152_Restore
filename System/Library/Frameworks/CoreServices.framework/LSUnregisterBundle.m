@interface LSUnregisterBundle
@end

@implementation LSUnregisterBundle

uint64_t ___LSUnregisterBundle_block_invoke(uint64_t a1, uint64_t a2, int a3, unsigned char *a4)
{
  uint64_t result = _LSBundleGet(**(void ***)(a1 + 40), a3);
  BOOL v8 = *(_DWORD *)(a1 + 56) == a3 || result == 0;
  if (!v8 && *(_DWORD *)(result + 168) == 2 && *(_DWORD *)(result + 12) == *(_DWORD *)(*(void *)(a1 + 48) + 12))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

void ___LSUnregisterBundle_block_invoke_184(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = _LSGetOSStatusFromNSError(v3);
}

void ___LSUnregisterBundle_block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  v6 = v5;
  if (a2)
  {
    int v7 = 0;
  }
  else
  {
    id v8 = v5;
    int v7 = _LSGetOSStatusFromNSError(v5);
    v6 = v8;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v7;
}

@end