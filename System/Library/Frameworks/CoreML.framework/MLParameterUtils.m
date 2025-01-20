@interface MLParameterUtils
+ (id)deScopeParameters:(id)a3 byDeletingPrefixingScope:(id)a4;
+ (id)numberForKey:(id)a3 inDictionary:(id)a4;
+ (id)objectForKey:(id)a3 class:(Class)a4 dictionary:(id)a5;
+ (id)stringForKey:(id)a3 inDictionary:(id)a4;
+ (void)appendParameterDescriptions:(id)a3 toModelDescription:(id)a4;
@end

@implementation MLParameterUtils

+ (void)appendParameterDescriptions:(id)a3 toModelDescription:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([v5 count])
  {
    v7 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
    v8 = [v6 parameterDescriptionsByKey];

    if (v8)
    {
      v9 = [v6 parameterDescriptionsByKey];
      uint64_t v10 = [v9 mutableCopy];

      v7 = (void *)v10;
    }
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v11 = v5;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v19 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          v17 = objc_msgSend(v16, "key", (void)v18);
          [v7 setObject:v16 forKeyedSubscript:v17];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v13);
    }

    [v6 setParameterDescriptionsByKey:v7];
  }
}

+ (id)deScopeParameters:(id)a3 byDeletingPrefixingScope:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    v7 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v8 = [v5 allKeys];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v29 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          if ([v13 hasGlobalScope])
          {
            uint64_t v14 = [v5 objectForKeyedSubscript:v13];
            [v7 setObject:v14 forKeyedSubscript:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v10);
    }

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v15 = objc_msgSend(v5, "allKeys", 0);
    uint64_t v16 = [v15 countByEnumeratingWithState:&v24 objects:v32 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v25;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v25 != v18) {
            objc_enumerationMutation(v15);
          }
          long long v20 = *(void **)(*((void *)&v24 + 1) + 8 * j);
          long long v21 = [v20 deletingPrefixingScope:v6];
          v22 = [v5 objectForKeyedSubscript:v20];
          [v7 setObject:v22 forKeyedSubscript:v21];
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v24 objects:v32 count:16];
      }
      while (v17);
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)numberForKey:(id)a3 inDictionary:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [a1 objectForKey:v7 class:objc_opt_class() dictionary:v6];

  return v8;
}

+ (id)stringForKey:(id)a3 inDictionary:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [a1 objectForKey:v7 class:objc_opt_class() dictionary:v6];

  return v8;
}

+ (id)objectForKey:(id)a3 class:(Class)a4 dictionary:(id)a5
{
  id v5 = [a5 objectForKeyedSubscript:a3];
  if (v5 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  return v6;
}

@end