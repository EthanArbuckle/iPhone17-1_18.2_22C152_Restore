@interface C3DRendererContextCFFinalize
@end

@implementation C3DRendererContextCFFinalize

void ___C3DRendererContextCFFinalize_block_invoke(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  v3 = (const void *)*a3;
  if (*a3)
  {
    C3DRendererContextDeleteBufferObject(*(_DWORD **)(a1 + 32), *a3);
    CFRelease(v3);
  }
}

uint64_t ___C3DRendererContextCFFinalize_block_invoke_2(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  int v5 = *a3;
  uint64_t result = (*(uint64_t (**)(uint64_t, int *, uint64_t))(v3 + 1944))(1, &v5, v3);
  --*(_DWORD *)(v3 + 428);
  return result;
}

@end