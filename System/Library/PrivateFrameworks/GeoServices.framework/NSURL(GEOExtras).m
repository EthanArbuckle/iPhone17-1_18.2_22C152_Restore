@interface NSURL(GEOExtras)
+ (id)_geo_URLWithString:()GEOExtras tokenSubstitutions:;
@end

@implementation NSURL(GEOExtras)

+ (id)_geo_URLWithString:()GEOExtras tokenSubstitutions:
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if (a3)
  {
    v6 = (void *)[a3 mutableCopy];
    v34 = [MEMORY[0x1E4F1CA48] array];
    v7 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v33 = v5;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v41 objects:v46 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v42 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v41 + 1) + 8 * i);
          uint64_t v14 = objc_msgSend(v6, "rangeOfString:", v13, v33);
          if (v14 != 0x7FFFFFFFFFFFFFFFLL)
          {
            uint64_t v16 = v14;
            uint64_t v17 = v15;
            objc_msgSend(v6, "replaceCharactersInRange:withString:", v14, v15, &stru_1ED51F370);
            [v34 addObject:v13];
            v18 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v16, v17);
            [v7 setObject:v18 forKey:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v41 objects:v46 count:16];
      }
      while (v10);
    }

    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __58__NSURL_GEOExtras___geo_URLWithString_tokenSubstitutions___block_invoke;
    v39[3] = &unk_1E53E3350;
    id v19 = v7;
    id v40 = v19;
    [v34 sortUsingComparator:v39];
    v20 = [MEMORY[0x1E4F1CA48] array];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v21 = v34;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v35 objects:v45 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v36;
      do
      {
        for (uint64_t j = 0; j != v23; ++j)
        {
          if (*(void *)v36 != v24) {
            objc_enumerationMutation(v21);
          }
          v26 = objc_msgSend(v8, "objectForKeyedSubscript:", *(void *)(*((void *)&v35 + 1) + 8 * j), v33);
          [v20 addObjectsFromArray:v26];
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v35 objects:v45 count:16];
      }
      while (v23);
    }

    v27 = [MEMORY[0x1E4F29088] componentsWithString:v6];
    id v5 = v33;
    if ([v20 count])
    {
      v28 = [v27 queryItems];
      if (v28)
      {
        v29 = [v27 queryItems];
        v30 = (void *)[v29 mutableCopy];
      }
      else
      {
        v30 = [MEMORY[0x1E4F1CA48] array];
      }

      [v30 addObjectsFromArray:v20];
      [v27 setQueryItems:v30];
    }
    v31 = objc_msgSend(v27, "URL", v33);
  }
  else
  {
    v31 = 0;
  }

  return v31;
}

@end