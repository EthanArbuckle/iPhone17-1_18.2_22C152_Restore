@interface NSArray(HFAdditions)
- (id)hf_firstMostCommonObject;
- (void)hf_fanOutAtIndex:()HFAdditions usingBlock:;
@end

@implementation NSArray(HFAdditions)

- (id)hf_firstMostCommonObject
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F08760] setWithArray:a1];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v3 = a1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = 0;
    v7 = 0;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v3);
        }
        v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v2, "countForObject:", v10, (void)v15);
        if (v11 > v6)
        {
          uint64_t v12 = v11;
          id v13 = v10;

          uint64_t v6 = v12;
          v7 = v13;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)hf_fanOutAtIndex:()HFAdditions usingBlock:
{
  v7 = a4;
  if ([a1 count] <= a3)
  {
    v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2, a1, @"NSArray+HFAdditions.m", 34, @"Invalid parameter not satisfying: %@", @"index < self.count" object file lineNumber description];
  }
  char v15 = 0;
  uint64_t v8 = [a1 objectAtIndexedSubscript:a3];
  v7[2](v7, v8, a3, &v15);

  if (!v15)
  {
    unint64_t v9 = a3 - 1;
    for (unint64_t i = 1; ; ++i)
    {
      if (i <= a3)
      {
        uint64_t v12 = [a1 objectAtIndexedSubscript:v9];
        v7[2](v7, v12, v9, &v15);

        if (v15) {
          break;
        }
        unint64_t v11 = a3 + i;
        if (a3 + i >= [a1 count]) {
          goto LABEL_12;
        }
      }
      else
      {
        unint64_t v11 = i + a3;
        if (i + a3 >= [a1 count]) {
          break;
        }
      }
      id v13 = [a1 objectAtIndexedSubscript:v11];
      v7[2](v7, v13, v11, &v15);

      if (v15) {
        break;
      }
LABEL_12:
      --v9;
    }
  }
}

@end