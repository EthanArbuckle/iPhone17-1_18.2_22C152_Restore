@interface NSXPCSerializationCreateObjectInDictionaryForKey
@end

@implementation NSXPCSerializationCreateObjectInDictionaryForKey

uint64_t ___NSXPCSerializationCreateObjectInDictionaryForKey_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __s1[1] = *(void **)MEMORY[0x1E4F143B8];
  int v6 = *(_DWORD *)(a2 + 8);
  if (v6 == 96)
  {
    v8 = _NSXPCSerializationStringForObject(*(void **)(a1 + 48), (char **)a2);
    if (v8 && [*(id *)(a1 + 32) isEqualToString:v8]) {
      goto LABEL_10;
    }
  }
  else if (v6 == 112)
  {
    __s1[0] = 0;
    size_t __n = 0;
    if (_getASCIIStringAtMarker(*(void **)(a1 + 48), __s1, *(void *)a2, (uint64_t *)&__n, &v12))
    {
      v7 = *(const void **)(a1 + 56);
      if (v7)
      {
        if (__n == *(void *)(a1 + 64) && !memcmp(__s1[0], v7, __n)) {
          goto LABEL_10;
        }
      }
      else if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", _NSXPCSerializationStringForObject(*(void **)(a1 + 48), (char **)a2)))
      {
LABEL_10:
        uint64_t result = 0;
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
        uint64_t v10 = *(void *)(a1 + 72);
        *(void *)uint64_t v10 = 0;
        *(_DWORD *)(v10 + 8) = 255;
        *(void *)uint64_t v10 = *(void *)a3;
        *(_DWORD *)(v10 + 8) = *(_DWORD *)(a3 + 8);
        return result;
      }
    }
  }
  return 1;
}

@end