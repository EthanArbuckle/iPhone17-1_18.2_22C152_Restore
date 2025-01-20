@interface INPlayMediaIntent(IntentUtilities)
- (id)atx_nonNilParametersByName;
@end

@implementation INPlayMediaIntent(IntentUtilities)

- (id)atx_nonNilParametersByName
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v18.receiver = a1;
  v18.super_class = (Class)&off_26FE4B238;
  v1 = objc_msgSendSuper2(&v18, sel_atx_nonNilParametersByName);
  v2 = (void *)[v1 mutableCopy];

  v3 = [v2 objectForKeyedSubscript:@"buckets"];
  if ([v3 count])
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v13 = v3;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v19 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v15;
      uint64_t v8 = 1;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          v11 = objc_msgSend(NSString, "stringWithFormat:", @"bucket_%i", v8 + i);
          [v2 setObject:v10 forKeyedSubscript:v11];
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v19 count:16];
        uint64_t v8 = (v8 + i);
      }
      while (v6);
    }

    v3 = v13;
  }

  return v2;
}

@end