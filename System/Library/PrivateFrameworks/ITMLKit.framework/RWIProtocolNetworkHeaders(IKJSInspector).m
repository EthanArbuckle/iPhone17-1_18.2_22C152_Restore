@interface RWIProtocolNetworkHeaders(IKJSInspector)
+ (id)ik_networkHeadersFromHTTPHeaderFields:()IKJSInspector;
- (__CFString)ik_text;
- (id)httpHeaders;
- (void)setHTTPHeaderFields:()IKJSInspector;
@end

@implementation RWIProtocolNetworkHeaders(IKJSInspector)

+ (id)ik_networkHeadersFromHTTPHeaderFields:()IKJSInspector
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setHTTPHeaderFields:v3];

  return v4;
}

- (id)httpHeaders
{
  return objc_getAssociatedObject(a1, sel_httpHeaders);
}

- (void)setHTTPHeaderFields:()IKJSInspector
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [a1 httpHeaders];
  char v6 = [v5 isEqualToDictionary:v4];

  if ((v6 & 1) == 0)
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v7 = [a1 httpHeaders];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v24 != v10) {
            objc_enumerationMutation(v7);
          }
          [a1 removeKey:*(void *)(*((void *)&v23 + 1) + 8 * i)];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v9);
    }

    objc_setAssociatedObject(a1, sel_httpHeaders, v4, (void *)3);
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v12 = v4;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v20;
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v19 + 1) + 8 * j);
          v18 = objc_msgSend(v12, "objectForKey:", v17, (void)v19);
          [a1 setString:v18 forKey:v17];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
      }
      while (v14);
    }
  }
}

- (__CFString)ik_text
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F28E78] string];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v3 = [a1 httpHeaders];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v9 = [a1 httpHeaders];
        uint64_t v10 = [v9 objectForKey:v8];
        [v2 appendFormat:@"\"%@\" = \"%@\"\n", v8, v10];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }

  v11 = [a1 httpHeaders];
  if ([v11 count])
  {
    objc_msgSend(v2, "substringToIndex:", objc_msgSend(v2, "length") - 1);
    id v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v12 = &stru_1F3E09950;
  }

  return v12;
}

@end