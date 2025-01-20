@interface BRLTPreprocessorHelper
+ (id)mergeLocationMap:(id)a3 withLocationMap:(id)a4;
+ (void)mergePreprocessorOutputLocationMap:(id)a3 outputToPreprocessedMap:(int *)a4 outputLen:(int64_t)a5 outputToTextMap:(id *)a6;
@end

@implementation BRLTPreprocessorHelper

+ (id)mergeLocationMap:(id)a3 withLocationMap:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (v6)
  {
    id v8 = v6;
    v9 = (unint64_t *)[v8 bytes];
    unint64_t v10 = [v8 length];
    id v11 = v5;
    uint64_t v12 = [v11 bytes];
    unint64_t v13 = [v11 length];
    objc_msgSend(MEMORY[0x263EFF990], "dataWithCapacity:", objc_msgSend(v8, "length"));
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    if (v10 >= 8)
    {
      unint64_t v15 = v13 >> 3;
      unint64_t v16 = v10 >> 3;
      do
      {
        if (*v9 >= v15)
        {
          v18 = v14;
          v17 = v9;
        }
        else
        {
          uint64_t v20 = *(void *)(v12 + 8 * *v9);
          v17 = (unint64_t *)&v20;
          v18 = v14;
        }
        [v18 appendBytes:v17 length:8];
        ++v9;
        --v16;
      }
      while (v16);
    }
  }
  else
  {
    id v14 = v5;
  }

  return v14;
}

+ (void)mergePreprocessorOutputLocationMap:(id)a3 outputToPreprocessedMap:(int *)a4 outputLen:(int64_t)a5 outputToTextMap:(id *)a6
{
  id v9 = a3;
  if (v9 && a4 && a6)
  {
    int64_t v10 = 8 * a5;
    id v15 = v9;
    id v11 = malloc_type_malloc(8 * a5, 0x535E06BDuLL);
    uint64_t v12 = [v15 bytes];
    if (a5 >= 1)
    {
      unint64_t v13 = v11;
      do
      {
        uint64_t v14 = *a4++;
        *v13++ = *(void *)(v12 + 8 * v14);
        --a5;
      }
      while (a5);
    }
    *a6 = [MEMORY[0x263EFF8F8] dataWithBytes:v11 length:v10];
    free(v11);
    id v9 = v15;
  }
}

@end