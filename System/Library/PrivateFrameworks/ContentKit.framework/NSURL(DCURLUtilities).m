@interface NSURL(DCURLUtilities)
+ (id)dc_dictionaryFromQueryString:()DCURLUtilities;
+ (id)dc_queryItemsFromQueryDictionary:()DCURLUtilities;
+ (id)dc_queryItemsFromQueryString:()DCURLUtilities;
+ (id)dc_queryStringWithQueryDictionary:()DCURLUtilities addingPercentEscapes:;
+ (uint64_t)dc_queryStringWithQueryDictionary:()DCURLUtilities;
- (id)dc_fragmentQueryDictionary;
- (id)dc_queryDictionary;
- (uint64_t)dc_matchesHost:()DCURLUtilities;
@end

@implementation NSURL(DCURLUtilities)

- (uint64_t)dc_matchesHost:()DCURLUtilities
{
  id v4 = a3;
  v5 = [a1 host];
  if ([v5 isEqualToString:v4])
  {
    uint64_t v6 = 1;
  }
  else
  {
    v7 = [@"www." stringByAppendingString:v4];
    uint64_t v6 = [v5 isEqualToString:v7];
  }
  return v6;
}

- (id)dc_fragmentQueryDictionary
{
  v1 = [a1 fragment];
  if ([v1 length])
  {
    v2 = 0;
    if ([v1 characterAtIndex:0] == 33)
    {
      v3 = NSURL;
      id v4 = [v1 substringFromIndex:1];
      v2 = objc_msgSend(v3, "dc_dictionaryFromQueryString:", v4);
    }
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (id)dc_queryDictionary
{
  v1 = NSURL;
  v2 = [a1 query];
  v3 = objc_msgSend(v1, "dc_dictionaryFromQueryString:", v2);

  return v3;
}

+ (id)dc_queryStringWithQueryDictionary:()DCURLUtilities addingPercentEscapes:
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = objc_opt_new();
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = [v4 allKeys];
  uint64_t v6 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v27 != v8) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        v11 = [v4 objectForKeyedSubscript:v10];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v5 appendFormat:@"&%@", v10];
          goto LABEL_24;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v12 = [MEMORY[0x263F08708] URLQueryAllowedCharacterSet];
          v13 = (void *)[v12 mutableCopy];

          [v13 removeCharactersInString:@"?=&"];
          if (a4)
          {
            id v14 = [v10 stringByAddingPercentEncodingWithAllowedCharacters:v13];
            id v15 = [v11 stringByAddingPercentEncodingWithAllowedCharacters:v13];
          }
          else
          {
            id v14 = v10;
            id v15 = v11;
          }
          v19 = v15;
          [v5 appendFormat:@"&%@=%@", v14, v15];
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_24;
          }
          v16 = [MEMORY[0x263F08708] URLQueryAllowedCharacterSet];
          v13 = (void *)[v16 mutableCopy];

          [v13 removeCharactersInString:@"?=&"];
          id v17 = v11;
          if (v17)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              v18 = v17;
            }
            else {
              v18 = 0;
            }
          }
          else
          {
            v18 = 0;
          }
          id v14 = v18;

          if (a4)
          {
            id v20 = [v10 stringByAddingPercentEncodingWithAllowedCharacters:v13];
          }
          else
          {
            id v20 = v10;
          }
          v19 = v20;
          v21 = [v14 stringValue];
          [v5 appendFormat:@"&%@=%@", v19, v21];
        }
LABEL_24:
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v7);
  }

  if ([v5 length] && objc_msgSend(v5, "characterAtIndex:", 0) == 38) {
    objc_msgSend(v5, "deleteCharactersInRange:", 0, 1);
  }
  v22 = (void *)[v5 copy];

  return v22;
}

+ (uint64_t)dc_queryStringWithQueryDictionary:()DCURLUtilities
{
  return objc_msgSend(a1, "dc_queryStringWithQueryDictionary:addingPercentEscapes:", a3, 1);
}

+ (id)dc_dictionaryFromQueryString:()DCURLUtilities
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = objc_opt_new();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v6 = objc_msgSend(a1, "dc_queryItemsFromQueryString:", v4, 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v12 = [v11 value];
        v13 = (void *)v12;
        if (v12) {
          id v14 = (__CFString *)v12;
        }
        else {
          id v14 = &stru_26C71CE08;
        }
        id v15 = [v11 name];
        [v5 setObject:v14 forKey:v15];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  return v5;
}

+ (id)dc_queryItemsFromQueryDictionary:()DCURLUtilities
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v5 = [v3 allKeys];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v26;
    unint64_t v9 = 0x263F08000uLL;
    do
    {
      uint64_t v10 = 0;
      uint64_t v24 = v7;
      do
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v25 + 1) + 8 * v10);
        id v12 = [v3 objectForKey:v11];
        if (v12)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v13 = [MEMORY[0x263F08BD0] queryItemWithName:v11 value:v12];
LABEL_11:
            [v4 addObject:v13];
            goto LABEL_13;
          }

          id v14 = v12;
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v15 = v8;
            id v16 = v3;
            long long v17 = v5;
            id v18 = v4;
            unint64_t v19 = v9;
            long long v20 = (void *)MEMORY[0x263F08BD0];
            v21 = [v14 stringValue];
            uint64_t v22 = v20;
            unint64_t v9 = v19;
            id v4 = v18;
            v5 = v17;
            id v3 = v16;
            uint64_t v8 = v15;
            uint64_t v7 = v24;
            v13 = [v22 queryItemWithName:v11 value:v21];

            goto LABEL_11;
          }
        }
        v13 = 0;
LABEL_13:

        ++v10;
      }
      while (v7 != v10);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (id)dc_queryItemsFromQueryString:()DCURLUtilities
{
  id v3 = [a3 componentsSeparatedByString:@"&"];
  id v4 = objc_msgSend(v3, "if_compactMap:", &__block_literal_global_14745);

  return v4;
}

@end