@interface URLForDictionary
@end

@implementation URLForDictionary

uint64_t ___geo_URLForDictionary_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  int v6 = [v4 hasPrefix:@"_"];
  if (v6 == [v5 hasPrefix:@"_"])
  {
    uint64_t v7 = [v4 compare:v5];
  }
  else if (v6)
  {
    uint64_t v7 = 1;
  }
  else
  {
    uint64_t v7 = -1;
  }

  return v7;
}

void ___geo_URLForDictionary_block_invoke_450(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (v8)
    {
      id v10 = v8;
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v17;
        do
        {
          uint64_t v14 = 0;
          do
          {
            if (*(void *)v17 != v13) {
              objc_enumerationMutation(v10);
            }
            (*(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) + 16))();
            ++v14;
          }
          while (v12 != v14);
          uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
        }
        while (v12);
      }
    }
  }
  else
  {
    v15 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:v7 value:v8];
    [v9 addObject:v15];
  }
}

@end