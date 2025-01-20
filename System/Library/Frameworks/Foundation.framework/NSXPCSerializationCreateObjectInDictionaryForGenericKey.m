@interface NSXPCSerializationCreateObjectInDictionaryForGenericKey
@end

@implementation NSXPCSerializationCreateObjectInDictionaryForGenericKey

uint64_t ___NSXPCSerializationCreateObjectInDictionaryForGenericKey_block_invoke(void *a1, uint64_t a2, uint64_t a3)
{
  if (*(_DWORD *)(a2 + 8) == 224)
  {
    uint64_t v4 = *(void *)(a1[4] + 8);
    uint64_t v5 = *(void *)(v4 + 24);
    if (a1[6] == v5)
    {
      uint64_t result = 0;
      *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
      uint64_t v7 = a1[7];
      *(void *)uint64_t v7 = 0;
      *(_DWORD *)(v7 + 8) = 255;
      *(void *)uint64_t v7 = *(void *)a3;
      *(_DWORD *)(v7 + 8) = *(_DWORD *)(a3 + 8);
      return result;
    }
    *(void *)(v4 + 24) = v5 + 1;
  }
  return 1;
}

@end