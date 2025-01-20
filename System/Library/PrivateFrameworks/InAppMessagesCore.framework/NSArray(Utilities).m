@interface NSArray(Utilities)
- (id)iam_compactMap:()Utilities;
- (id)iam_dictionaryFromArrayOfICIIAMParameters;
- (id)iam_map:()Utilities;
@end

@implementation NSArray(Utilities)

- (id)iam_map:()Utilities
{
  id v4 = a3;
  v5 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __30__NSArray_Utilities__iam_map___block_invoke;
  v11[3] = &unk_264346688;
  id v13 = v4;
  id v6 = v5;
  id v12 = v6;
  id v7 = v4;
  [a1 enumerateObjectsUsingBlock:v11];
  v8 = v12;
  id v9 = v6;

  return v9;
}

- (id)iam_compactMap:()Utilities
{
  id v4 = a3;
  v5 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __37__NSArray_Utilities__iam_compactMap___block_invoke;
  v11[3] = &unk_264346688;
  id v13 = v4;
  id v6 = v5;
  id v12 = v6;
  id v7 = v4;
  [a1 enumerateObjectsUsingBlock:v11];
  v8 = v12;
  id v9 = v6;

  return v9;
}

- (id)iam_dictionaryFromArrayOfICIIAMParameters
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v2 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v3 = a1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v9 = objc_msgSend(v8, "key", (void)v16);
        if (v9)
        {
          v10 = (void *)v9;
          v11 = [v8 value];

          if (v11)
          {
            id v12 = [v8 value];
            id v13 = [v8 key];
            [v2 setObject:v12 forKeyedSubscript:v13];
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v5);
  }

  v14 = (void *)[v2 copy];
  return v14;
}

@end