@interface JXURLEncoding
+ (id)encodedDictionary:(id)a3;
+ (id)encodedString:(id)a3;
+ (id)formEncodedDictionary:(id)a3;
+ (id)formEncodedString:(id)a3;
+ (void)encodeObject:(id)a3 withKey:(id)a4 andSubKey:(id)a5 intoArray:(id)a6;
@end

@implementation JXURLEncoding

+ (void)encodeObject:(id)a3 withKey:(id)a4 andSubKey:(id)a5 intoArray:(id)a6
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = v10;
  id v14 = v12;
  id v15 = a6;
  if (v10 && [v11 length])
  {
    if (v14)
    {
      id v16 = [NSString alloc];
      v17 = [a1 encodedString:v11];
      v18 = [a1 encodedString:v14];
      v19 = (void *)[v16 initWithFormat:@"%@[%@]", v17, v18];
    }
    else
    {
      v19 = [a1 encodedString:v11];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v40 = v14;
      id v41 = v11;
      v20 = [v10 allKeys];
      v21 = [v20 sortedArrayUsingSelector:sel_localizedCaseInsensitiveCompare_];

      long long v49 = 0u;
      long long v50 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      id v22 = v21;
      uint64_t v23 = [v22 countByEnumeratingWithState:&v47 objects:v52 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v48;
        do
        {
          for (uint64_t i = 0; i != v24; ++i)
          {
            if (*(void *)v48 != v25) {
              objc_enumerationMutation(v22);
            }
            uint64_t v27 = *(void *)(*((void *)&v47 + 1) + 8 * i);
            v28 = [v13 objectForKey:v27];
            [a1 encodeObject:v28 withKey:v19 andSubKey:v27 intoArray:v15];
          }
          uint64_t v24 = [v22 countByEnumeratingWithState:&v47 objects:v52 count:16];
        }
        while (v24);
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v35 = [NSString alloc];
          v36 = [v10 stringValue];
          v37 = (void *)[v35 initWithFormat:@"%@=%@", v19, v36];
          [v15 addObject:v37];

          v13 = v10;
        }
        else
        {
          v38 = [a1 encodedString:v10];
          v39 = (void *)[[NSString alloc] initWithFormat:@"%@=%@", v19, v38];
          [v15 addObject:v39];

          v13 = v10;
        }
        goto LABEL_25;
      }
      id v40 = v14;
      id v41 = v11;
      long long v45 = 0u;
      long long v46 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      obuint64_t j = v10;
      uint64_t v29 = [obj countByEnumeratingWithState:&v43 objects:v51 count:16];
      if (v29)
      {
        uint64_t v30 = v29;
        uint64_t v31 = *(void *)v44;
        do
        {
          for (uint64_t j = 0; j != v30; ++j)
          {
            if (*(void *)v44 != v31) {
              objc_enumerationMutation(obj);
            }
            uint64_t v33 = *(void *)(*((void *)&v43 + 1) + 8 * j);
            v34 = (void *)[[NSString alloc] initWithFormat:@"%@[]", v19];
            [a1 encodeObject:v33 withKey:v34 andSubKey:0 intoArray:v15];
          }
          uint64_t v30 = [obj countByEnumeratingWithState:&v43 objects:v51 count:16];
        }
        while (v30);
      }

      v13 = v10;
    }
    id v14 = v40;
    id v11 = v41;
LABEL_25:
  }
}

+ (id)formEncodedDictionary:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    v5 = [a1 encodedDictionary:v4];
    v6 = [v5 stringByReplacingOccurrencesOfString:@"%20" withString:@"+"];
  }
  else
  {
    v6 = &stru_26F008428;
  }

  return v6;
}

+ (id)encodedDictionary:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 count])
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v4, "count"));
    v6 = [v4 allKeys];
    v7 = [v6 sortedArrayUsingSelector:sel_localizedCaseInsensitiveCompare_];

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          id v14 = objc_msgSend(v4, "objectForKey:", v13, (void)v17);
          [a1 encodeObject:v14 withKey:v13 andSubKey:0 intoArray:v5];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v10);
    }

    id v15 = [v5 componentsJoinedByString:@"&"];
  }
  else
  {
    id v15 = &stru_26F008428;
  }

  return v15;
}

+ (id)formEncodedString:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    v5 = [a1 encodedString:v4];
    v6 = [v5 stringByReplacingOccurrencesOfString:@"%20" withString:@"+"];
  }
  else
  {
    v6 = &stru_26F008428;
  }

  return v6;
}

+ (id)encodedString:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    id v4 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@":/?#[]@!$&'()*+,="];;
    v5 = [v4 invertedSet];
    v6 = [v3 stringByAddingPercentEncodingWithAllowedCharacters:v5];
  }
  else
  {
    v6 = &stru_26F008428;
  }

  return v6;
}

@end