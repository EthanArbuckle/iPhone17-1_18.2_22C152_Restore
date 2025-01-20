@interface DDSContentItemMatcher
+ (BOOL)_anyDictionaryIn:(id)a3 matches:(id)a4 shouldLenientlyMatch:(id)a5;
+ (BOOL)_anyStringIn:(id)a3 matches:(id)a4 acceptUnspecifiedValue:(BOOL)a5;
+ (BOOL)_dictionary:(id)a3 matches:(id)a4 acceptUnspecifiedAttribute:(BOOL)a5 lenientMatch:(BOOL)a6;
+ (BOOL)_string:(id)a3 matches:(id)a4 acceptUnspecifiedValue:(BOOL)a5;
+ (BOOL)shouldLenientlyMatchWithContentItemsForRegion:(id)a3;
+ (id)assetContentItemsMatching:(id)a3 contentItems:(id)a4 parentAsset:(id)a5;
@end

@implementation DDSContentItemMatcher

+ (id)assetContentItemsMatching:(id)a3 contentItems:(id)a4 parentAsset:(id)a5
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v32 = a5;
  v36 = [v32 attributes];
  id v33 = [MEMORY[0x1E4F1CA48] array];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id obj = v9;
  uint64_t v10 = [obj countByEnumeratingWithState:&v45 objects:v49 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v46;
    id v37 = a1;
    id v38 = v8;
    do
    {
      uint64_t v13 = 0;
      uint64_t v34 = v11;
      do
      {
        if (*(void *)v46 != v12) {
          objc_enumerationMutation(obj);
        }
        v14 = *(void **)(*((void *)&v45 + 1) + 8 * v13);
        uint64_t v42 = [v14 objectForKey:@"ContentType"];
        v43 = [v8 objectForKeyedSubscript:@"ContentType"];
        v15 = [v14 objectForKey:@"Locale"];
        v16 = v15;
        if (v15)
        {
          id v17 = v15;
        }
        else
        {
          id v17 = [v36 objectForKeyedSubscript:@"AssetLocale"];
        }
        v41 = v17;

        v40 = [v8 objectForKeyedSubscript:@"Locale"];
        v18 = [v14 objectForKey:@"AssetRegion"];
        v19 = v18;
        if (v18)
        {
          id v20 = v18;
        }
        else
        {
          id v20 = [v36 objectForKeyedSubscript:@"AssetRegion"];
        }
        v39 = v20;

        v21 = [v8 objectForKeyedSubscript:@"AssetRegion"];
        v22 = [v21 allObjects];

        v44[0] = MEMORY[0x1E4F143A8];
        v44[1] = 3221225472;
        v44[2] = __76__DDSContentItemMatcher_assetContentItemsMatching_contentItems_parentAsset___block_invoke;
        v44[3] = &__block_descriptor_40_e22_B16__0__NSDictionary_8l;
        v44[4] = a1;
        v23 = (void *)MEMORY[0x1E4E7D2C0](v44);
        uint64_t v24 = objc_opt_class();
        v25 = [v43 allObjects];
        v26 = (void *)v24;
        v27 = (void *)v42;
        if ([v26 _anyStringIn:v25 matches:v42 acceptUnspecifiedValue:1])
        {
          v28 = objc_opt_class();
          v29 = [v40 allObjects];
          if ([v28 _anyStringIn:v29 matches:v41 acceptUnspecifiedValue:1])
          {
            int v30 = [(id)objc_opt_class() _anyDictionaryIn:v22 matches:v39 shouldLenientlyMatch:v23];

            uint64_t v11 = v34;
            v27 = (void *)v42;
            if (!v30) {
              goto LABEL_18;
            }
            v25 = [[DDSContentItem alloc] initWithParentAsset:v32 contents:v14];
            [v33 addObject:v25];
          }
          else
          {

            uint64_t v11 = v34;
            v27 = (void *)v42;
          }
        }

LABEL_18:
        ++v13;
        a1 = v37;
        id v8 = v38;
      }
      while (v11 != v13);
      uint64_t v11 = [obj countByEnumeratingWithState:&v45 objects:v49 count:16];
    }
    while (v11);
  }

  return v33;
}

+ (BOOL)_anyStringIn:(id)a3 matches:(id)a4 acceptUnspecifiedValue:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    if ([v7 count])
    {
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      id v9 = v7;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v17;
        while (2)
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v17 != v12) {
              objc_enumerationMutation(v9);
            }
            if (objc_msgSend((id)objc_opt_class(), "_string:matches:acceptUnspecifiedValue:", *(void *)(*((void *)&v16 + 1) + 8 * i), v8, v5, (void)v16))
            {

              goto LABEL_13;
            }
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
          if (v11) {
            continue;
          }
          break;
        }
      }

      char v14 = 0;
    }
    else
    {
      char v14 = [(id)objc_opt_class() _string:&stru_1F3FA8828 matches:v8 acceptUnspecifiedValue:1];
    }
  }
  else
  {
LABEL_13:
    char v14 = 1;
  }

  return v14;
}

+ (BOOL)_string:(id)a3 matches:(id)a4 acceptUnspecifiedValue:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = &stru_1F3FA8828;
  if (a4) {
    id v8 = (__CFString *)a4;
  }
  id v9 = v8;
  uint64_t v10 = v9;
  if (!v5)
  {
    if (!v7)
    {
      BOOL v12 = 1;
      goto LABEL_10;
    }
    goto LABEL_8;
  }
  uint64_t v11 = [(__CFString *)v9 length];
  BOOL v12 = 1;
  if (v7 && v11) {
LABEL_8:
  }
    BOOL v12 = [v7 caseInsensitiveCompare:v10] == 0;
LABEL_10:

  return v12;
}

+ (BOOL)_anyDictionaryIn:(id)a3 matches:(id)a4 shouldLenientlyMatch:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = (uint64_t (**)(id, void))a5;
  if (v7)
  {
    if ([v7 count])
    {
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v19 = v7;
      id v10 = v7;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v21;
        while (2)
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v21 != v13) {
              objc_enumerationMutation(v10);
            }
            uint64_t v15 = *(void *)(*((void *)&v20 + 1) + 8 * i);
            if (v9) {
              uint64_t v16 = v9[2](v9, *(void *)(*((void *)&v20 + 1) + 8 * i));
            }
            else {
              uint64_t v16 = 0;
            }
            if ([(id)objc_opt_class() _dictionary:v15 matches:v8 acceptUnspecifiedAttribute:v16 ^ 1 lenientMatch:v16])
            {

              char v17 = 1;
              goto LABEL_17;
            }
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
          if (v12) {
            continue;
          }
          break;
        }
      }

      char v17 = 0;
LABEL_17:
      id v7 = v19;
    }
    else
    {
      char v17 = [(id)objc_opt_class() _dictionary:MEMORY[0x1E4F1CC08] matches:v8 acceptUnspecifiedAttribute:1 lenientMatch:0];
    }
  }
  else
  {
    char v17 = 1;
  }

  return v17;
}

uint64_t __76__DDSContentItemMatcher_assetContentItemsMatching_contentItems_parentAsset___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [(id)objc_opt_class() shouldLenientlyMatchWithContentItemsForRegion:v2];

  return v3;
}

+ (BOOL)shouldLenientlyMatchWithContentItemsForRegion:(id)a3
{
  id v3 = a3;
  v4 = [v3 objectForKeyedSubscript:@"City"];
  if ([v4 length])
  {
    BOOL v5 = [v3 objectForKeyedSubscript:@"Province"];
    if ([v5 length])
    {
      v6 = [v3 objectForKeyedSubscript:@"Country"];
      BOOL v7 = [v6 length] == 0;
    }
    else
    {
      BOOL v7 = 1;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

+ (BOOL)_dictionary:(id)a3 matches:(id)a4 acceptUnspecifiedAttribute:(BOOL)a5 lenientMatch:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v23 = a5;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (v8 && [v9 count])
  {
    if ([v8 count])
    {
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id obj = [v8 allKeys];
      uint64_t v11 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v25;
        while (2)
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v25 != v13) {
              objc_enumerationMutation(obj);
            }
            uint64_t v15 = *(void *)(*((void *)&v24 + 1) + 8 * i);
            uint64_t v16 = [v8 objectForKeyedSubscript:v15];
            char v17 = v16;
            if (!v6 || [v16 length])
            {
              long long v18 = [v10 objectForKeyedSubscript:v15];
              char v19 = [(id)objc_opt_class() _string:v17 matches:v18 acceptUnspecifiedValue:v23];

              if ((v19 & 1) == 0)
              {

                BOOL v20 = 0;
                goto LABEL_17;
              }
            }
          }
          uint64_t v12 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
          if (v12) {
            continue;
          }
          break;
        }
      }
      BOOL v20 = 1;
LABEL_17:
    }
    else
    {
      BOOL v20 = [v10 count] == 0;
    }
  }
  else
  {
    BOOL v20 = 1;
  }

  return v20;
}

@end