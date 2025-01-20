@interface GLPString
@end

@implementation GLPString

void *__deserialize_GLPString_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(a1 + 40) + (unint64_t)*(unsigned int *)(v2 + 260) > *(unsigned int *)(v2 + 256)) {
    glpDeserialError(v2, 1u);
  }
  v3 = (void *)(*(uint64_t (**)(void))(*(void *)(v2 + 240) + 8))(**(void **)(v2 + 240));
  memcpy(v3, (const void *)(*(void *)(*(void *)(a1 + 32) + 248) + *(unsigned int *)(*(void *)(a1 + 32) + 260)), *(void *)(a1 + 40));
  *(_DWORD *)(*(void *)(a1 + 32) + 260) += *(_DWORD *)(a1 + 40);
  return v3;
}

@end