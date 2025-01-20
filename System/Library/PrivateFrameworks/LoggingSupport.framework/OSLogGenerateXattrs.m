@interface OSLogGenerateXattrs
@end

@implementation OSLogGenerateXattrs

uint64_t ___OSLogGenerateXattrs_block_invoke(uint64_t a1, int *a2)
{
  int v3 = *a2;
  if (*a2 == 4096)
  {
    v4 = (unsigned __int8 *)(*(void *)(a1 + 32) + 4);
    if (*((void *)a2 + 1) <= 0xA7uLL)
    {
      uuid_clear(v4);
      return 1;
    }
    *(_OWORD *)v4 = *((_OWORD *)a2 + 9);
    int v3 = *a2;
  }
  if (v3 == 24587 && a2[1] >= 0x11)
  {
    uint64_t v5 = _catalog_create_with_chunk(a2, 0);
    if (v5)
    {
      v6 = *(void **)(v5 + 64);
      if (v6)
      {
        uint64_t v7 = *(void *)(a1 + 32);
        unint64_t v8 = *(void *)(v7 + 24);
        unint64_t v9 = *(void *)(v7 + 32);
        do
        {
          if (v8 >= v6[2]) {
            unint64_t v8 = v6[2];
          }
          if (v9 <= v6[3]) {
            unint64_t v9 = v6[3];
          }
          v6 = (void *)*v6;
        }
        while (v6);
        *(void *)(v7 + 24) = v8;
        *(void *)(v7 + 32) = v9;
      }
      _catalog_destroy(v5);
    }
  }
  return 1;
}

@end