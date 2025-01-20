@interface UTTypeGetActiveIdentifierForTag
@end

@implementation UTTypeGetActiveIdentifierForTag

uint64_t ___UTTypeGetActiveIdentifierForTag_block_invoke(uint64_t result, uint64_t a2, int a3, uint64_t a4, unsigned char *a5)
{
  uint64_t v8 = result;
  unsigned int v9 = *(_DWORD *)(result + 56);
  if (!v9 || (result = _UTTypeConformsTo(*(void **)(result + 32), a3, v9), result))
  {
    if (*(unsigned char *)(a4 + 8))
    {
      v10 = *(int **)(v8 + 48);
      if (v10) {
        int *v10 = a3;
      }
      *(void *)(*(void *)(*(void *)(v8 + 40) + 8) + 24) = a4;
      *a5 = 1;
    }
  }
  return result;
}

@end