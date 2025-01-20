@interface NSURL
- (id)fragments;
@end

@implementation NSURL

- (id)fragments
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (a1)
  {
    v2 = objc_opt_new();
    v3 = [a1 fragment];
    v4 = [v3 componentsSeparatedByString:@"&"];

    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "componentsSeparatedByString:", @"=", (void)v14);
          if ((unint64_t)[v10 count] >= 2)
          {
            v11 = [v10 objectAtIndexedSubscript:1];
            v12 = [v10 objectAtIndexedSubscript:0];
            [v2 setObject:v11 forKeyedSubscript:v12];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

@end