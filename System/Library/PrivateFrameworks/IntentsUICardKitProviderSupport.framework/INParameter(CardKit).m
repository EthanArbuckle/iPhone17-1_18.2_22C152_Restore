@interface INParameter(CardKit)
- (uint64_t)isSubParameterOf:()CardKit;
@end

@implementation INParameter(CardKit)

- (uint64_t)isSubParameterOf:()CardKit
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [a1 parameterClass];
  if (v5 == [v4 parameterClass])
  {
    v7 = [v4 parameterKeyPath];
    uint64_t v8 = [v7 length];

    v9 = [a1 parameterKeyPath];
    v10 = [v4 parameterKeyPath];
    int v11 = [v9 hasPrefix:v10];

    v12 = [v4 _indexesForSubKeyPaths];
    v13 = [a1 _indexesForSubKeyPaths];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    v14 = [v12 allKeys];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      int v25 = v11;
      uint64_t v26 = v8;
      uint64_t v17 = *(void *)v28;
      while (2)
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v28 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void *)(*((void *)&v27 + 1) + 8 * i);
          v20 = [v13 objectForKey:v19];
          v21 = [v12 objectForKey:v19];
          int v22 = [v20 isEqual:v21];

          if (!v22)
          {
            int v23 = 0;
            goto LABEL_13;
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v27 objects:v31 count:16];
        if (v16) {
          continue;
        }
        break;
      }
      int v23 = 1;
LABEL_13:
      uint64_t v8 = v26;
      int v11 = v25;
    }
    else
    {
      int v23 = 1;
    }

    if (v8) {
      uint64_t v6 = v11 & v23;
    }
    else {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

@end