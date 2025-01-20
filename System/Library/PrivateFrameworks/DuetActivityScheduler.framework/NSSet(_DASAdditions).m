@interface NSSet(_DASAdditions)
+ (id)setWithObjectsFrom:()_DASAdditions;
- (BOOL)enumerateObjectsInChunksOfSize:()_DASAdditions block:;
@end

@implementation NSSet(_DASAdditions)

+ (id)setWithObjectsFrom:()_DASAdditions
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  unint64_t v11 = [v10 count];
  v12 = [MEMORY[0x1E4F1CA80] setWithObject:v10];
  v39 = (id *)&a10;
  id v13 = a9;
  if (v13)
  {
    v14 = v13;
    while ([v14 conformsToProtocol:&unk_1F0E772B0])
    {
      v11 += [v14 count];
      [v12 addObject:v14];
      v15 = v39++;
      id v16 = *v15;

      v14 = v16;
      if (!v16) {
        goto LABEL_5;
      }
    }

    v17 = 0;
  }
  else
  {
LABEL_5:
    if (v11 > 1)
    {
      id v30 = v10;
      v17 = [MEMORY[0x1E4F1CA80] setWithCapacity:1 << ((unint64_t)log2((double)(v11 - 1)) + 1)];
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id v18 = v12;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v35 objects:v41 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v36;
        do
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v36 != v21) {
              objc_enumerationMutation(v18);
            }
            v23 = *(void **)(*((void *)&v35 + 1) + 8 * i);
            long long v31 = 0u;
            long long v32 = 0u;
            long long v33 = 0u;
            long long v34 = 0u;
            id v24 = v23;
            uint64_t v25 = [v24 countByEnumeratingWithState:&v31 objects:v40 count:16];
            if (v25)
            {
              uint64_t v26 = v25;
              uint64_t v27 = *(void *)v32;
              do
              {
                for (uint64_t j = 0; j != v26; ++j)
                {
                  if (*(void *)v32 != v27) {
                    objc_enumerationMutation(v24);
                  }
                  [v17 addObject:*(void *)(*((void *)&v31 + 1) + 8 * j)];
                }
                uint64_t v26 = [v24 countByEnumeratingWithState:&v31 objects:v40 count:16];
              }
              while (v26);
            }
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v35 objects:v41 count:16];
        }
        while (v20);
      }

      id v10 = v30;
    }
    else
    {
      v17 = [MEMORY[0x1E4F1CA80] setWithCapacity:1];
    }
  }

  return v17;
}

- (BOOL)enumerateObjectsInChunksOfSize:()_DASAdditions block:
{
  v6 = a4;
  v7 = [a1 allObjects];
  unint64_t v8 = vcvtpd_u64_f64((double)(unint64_t)[a1 count] / (double)a3);
  unsigned __int8 v21 = 0;
  if (v8)
  {
    uint64_t v9 = 0;
    uint64_t v10 = 0;
    uint64_t v11 = 0;
    unint64_t v20 = v8 - 1;
    unint64_t v12 = a3;
    do
    {
      unint64_t v13 = [a1 count];
      if (v13 >= v12) {
        unint64_t v14 = v12;
      }
      else {
        unint64_t v14 = v13;
      }
      v15 = objc_msgSend(v7, "subarrayWithRange:", v10, v14 + v9);
      v6[2](v6, v15, v11, &v21);
      int v16 = v21;

      if (v16) {
        BOOL v17 = 1;
      }
      else {
        BOOL v17 = v20 == v11;
      }
      ++v11;
      v10 += a3;
      v9 -= a3;
      v12 += a3;
    }
    while (!v17);
    BOOL v18 = v21 == 0;
  }
  else
  {
    BOOL v18 = 1;
  }

  return v18;
}

@end