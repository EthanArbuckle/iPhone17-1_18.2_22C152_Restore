@interface NSDictionary(Utilities)
+ (id)dictionaryOfChangesBetween:()Utilities and:;
@end

@implementation NSDictionary(Utilities)

+ (id)dictionaryOfChangesBetween:()Utilities and:
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v7 = [MEMORY[0x263EFF9A0] dictionary];
  if (v6)
  {
    if (v5)
    {
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v8 = v6;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v20;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v20 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = *(void *)(*((void *)&v19 + 1) + 8 * i);
            v14 = objc_msgSend(v8, "objectForKey:", v13, (void)v19);
            v15 = [v5 objectForKey:v13];
            if (([v15 isEqual:v14] & 1) == 0) {
              [v7 setObject:v14 forKey:v13];
            }
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
        }
        while (v10);
      }

      id v16 = (id)[v7 copy];
    }
    else
    {
      id v16 = v6;
    }
    v17 = v16;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

@end