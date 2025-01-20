@interface _WKWebExtensionDeclarativeNetRequestTranslator
+ (id)jsonObjectsFromData:(id)a3 errorStrings:(id *)a4;
+ (id)translateRules:(id)a3 errorStrings:(id *)a4;
@end

@implementation _WKWebExtensionDeclarativeNetRequestTranslator

+ (id)translateRules:(id)a3 errorStrings:(id *)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v29 = a3;
  v4 = [MEMORY[0x1E4F1CA48] array];
  v5 = [MEMORY[0x1E4F1CA48] array];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  obuint64_t j = v29;
  uint64_t v6 = [obj countByEnumeratingWithState:&v43 objects:v49 count:16];
  if (v6)
  {
    unint64_t v7 = 0;
    uint64_t v31 = *(void *)v44;
    uint64_t v32 = v6;
    do
    {
      for (uint64_t i = 0; i != v32; ++i)
      {
        if (*(void *)v44 != v31) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        long long v39 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        id v9 = v8;
        uint64_t v10 = [v9 countByEnumeratingWithState:&v39 objects:v48 count:16];
        if (v10)
        {
          uint64_t v11 = *(void *)v40;
          do
          {
            uint64_t v12 = 0;
            do
            {
              if (*(void *)v40 != v11) {
                objc_enumerationMutation(v9);
              }
              uint64_t v13 = *(void *)(*((void *)&v39 + 1) + 8 * v12);
              v14 = [_WKWebExtensionDeclarativeNetRequestRule alloc];
              id v38 = 0;
              v15 = [(_WKWebExtensionDeclarativeNetRequestRule *)v14 initWithDictionary:v13 errorString:&v38];
              id v16 = v38;
              v17 = v16;
              if (v15)
              {
                [v4 addObject:v15];
              }
              else if (v16)
              {
                ++v7;
                if ((unint64_t)[v5 count] <= 0x31) {
                  [v5 addObject:v17];
                }
              }

              ++v12;
            }
            while (v10 != v12);
            uint64_t v18 = [v9 countByEnumeratingWithState:&v39 objects:v48 count:16];
            uint64_t v10 = v18;
          }
          while (v18);
        }
      }
      uint64_t v32 = [obj countByEnumeratingWithState:&v43 objects:v49 count:16];
    }
    while (v32);

    if (v7 >= 0x33) {
      [v5 addObject:@"Error limit hit. No longer omitting errors."];
    }
  }
  else
  {
  }
  if (a4) {
    *a4 = (id)[v5 copy];
  }
  v19 = objc_msgSend(v4, "sortedArrayUsingComparator:", &__block_literal_global_0, a4);
  v20 = (void *)[v19 mutableCopy];

  v21 = [MEMORY[0x1E4F1CA48] array];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v22 = v20;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v34 objects:v47 count:16];
  if (v23)
  {
    uint64_t v24 = *(void *)v35;
    do
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v35 != v24) {
          objc_enumerationMutation(v22);
        }
        v26 = [*(id *)(*((void *)&v34 + 1) + 8 * j) ruleInWebKitFormat];
        [v21 addObjectsFromArray:v26];
      }
      uint64_t v23 = [v22 countByEnumeratingWithState:&v34 objects:v47 count:16];
    }
    while (v23);
  }

  return v21;
}

+ (id)jsonObjectsFromData:(id)a3 errorStrings:(id *)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v17 = [MEMORY[0x1E4F1CA48] array];
  v4 = [MEMORY[0x1E4F1CA48] array];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  obuint64_t j = v15;
  uint64_t v5 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v21;
    uint64_t v7 = *MEMORY[0x1E4F28228];
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v21 != v6) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        id v19 = 0;
        uint64_t v10 = WebKit::parseJSON(v9, 1, (uint64_t)&v19);
        id v11 = v19;
        if (v10)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v17 addObject:v10];
          }
        }
        if (v11)
        {
          uint64_t v12 = [v11 userInfo];
          uint64_t v13 = [v12 objectForKeyedSubscript:v7];
          [v4 addObject:v13];
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v5);
  }

  if (a4) {
    *a4 = (id)[v4 copy];
  }

  return v17;
}

@end