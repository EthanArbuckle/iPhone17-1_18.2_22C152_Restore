@interface NSDictionary(CARenderValue)
- CA_copyRenderKeyValueArray;
@end

@implementation NSDictionary(CARenderValue)

- CA_copyRenderKeyValueArray
{
  uint64_t v2;
  CA::Render::Array *v3;
  size_t v4;
  char *v5;
  uint64_t v6;
  const __CFString **v7;
  _DWORD *v8;
  CA::Render::Array *i;
  int v10;
  atomic_uint *v11;
  malloc_zone_t *malloc_zone;
  _DWORD *v13;
  atomic_uint *v14;
  BOOL v15;
  void v17[2];

  v17[1] = *MEMORY[0x1E4F143B8];
  v2 = [a1 count];
  v3 = (CA::Render::Array *)v2;
  v4 = 8 * v2;
  if ((unint64_t)(8 * v2) > 0x1000)
  {
    v5 = (char *)malloc_type_malloc(8 * v2, 0x1014220uLL);
    v7 = (const __CFString **)malloc_type_malloc(v4, 0x4717BFE4uLL);
  }
  else
  {
    MEMORY[0x1F4188790](v2);
    v5 = (char *)v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v5, v4);
    MEMORY[0x1F4188790](v6);
    v7 = (const __CFString **)v5;
    bzero(v5, v4);
  }
  v8 = 0;
  if (v5)
  {
    if (v7)
    {
      v8 = CA::Render::Array::new_array(v3, 0, 0, 0);
      if (v8)
      {
        [a1 getObjects:v5 andKeys:v7 count:v3];
        if (!v3) {
          return v8;
        }
        for (i = 0; i != v3; i = (CA::Render::Array *)((char *)i + 1))
        {
          v10 = CAInternAtom(v7[(void)i], 1);
          v11 = (atomic_uint *)objc_msgSend(*(id *)&v5[8 * (void)i], "CA_copyRenderValue");
          malloc_zone = (malloc_zone_t *)get_malloc_zone();
          v13 = malloc_type_zone_calloc(malloc_zone, 1uLL, 0x20uLL, 0x743898A5uLL);
          if (v13)
          {
            v13[2] = 1;
            v13[3] = 28;
            ++dword_1EB2ADE38;
            *(void *)v13 = &unk_1ED02FFB8;
            v13[4] = v10;
            if (v11)
            {
              v14 = v11;
              if (!atomic_fetch_add(v11 + 2, 1u))
              {
                v14 = 0;
                atomic_fetch_add(v11 + 2, 0xFFFFFFFF);
              }
            }
            else
            {
              v14 = 0;
            }
            *((void *)v13 + 3) = v14;
          }
          *(void *)&v8[2 * i + 6] = v13;
          if (v11 && atomic_fetch_add(v11 + 2, 0xFFFFFFFF) == 1) {
            (*(void (**)(atomic_uint *))(*(void *)v11 + 16))(v11);
          }
        }
      }
    }
  }
  v15 = v4 > 0x1000;
  if (v4 > 0x1000 && v7)
  {
    free(v7);
    v15 = 1;
  }
  if (v15 && v5) {
    free(v5);
  }
  return v8;
}

@end