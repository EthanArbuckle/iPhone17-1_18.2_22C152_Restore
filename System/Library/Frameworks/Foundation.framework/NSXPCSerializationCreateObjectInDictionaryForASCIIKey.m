@interface NSXPCSerializationCreateObjectInDictionaryForASCIIKey
@end

@implementation NSXPCSerializationCreateObjectInDictionaryForASCIIKey

uint64_t ___NSXPCSerializationCreateObjectInDictionaryForASCIIKey_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __s1[1] = *(void **)MEMORY[0x1E4F143B8];
  if (*(_DWORD *)(a2 + 8) != 112) {
    return 1;
  }
  __s1[0] = 0;
  size_t __n = 0;
  if (!_getASCIIStringAtMarker(*(void **)(a1 + 40), __s1, *(void *)a2, (uint64_t *)&__n, &v8)) {
    return 1;
  }
  if (__n != *(void *)(a1 + 48)) {
    return 1;
  }
  uint64_t result = memcmp(__s1[0], *(const void **)(a1 + 56), __n);
  if (result) {
    return 1;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  uint64_t v6 = *(void *)(a1 + 64);
  *(void *)uint64_t v6 = 0;
  *(_DWORD *)(v6 + 8) = 255;
  *(void *)uint64_t v6 = *(void *)a3;
  *(_DWORD *)(v6 + 8) = *(_DWORD *)(a3 + 8);
  return result;
}

@end