@interface NSDictionary(CoreDAVExtensions)
- (id)CDVMergeOverrideDictionary:()CoreDAVExtensions;
- (id)CDVObjectForKeyCaseInsensitive:()CoreDAVExtensions;
- (id)CDVObjectForKeyWithNameSpace:()CoreDAVExtensions andName:;
@end

@implementation NSDictionary(CoreDAVExtensions)

- (id)CDVObjectForKeyCaseInsensitive:()CoreDAVExtensions
{
  id v4 = a3;
  v5 = [a1 objectForKey:v4];
  if (!v5)
  {
    v6 = [v4 lowercaseString];
    v5 = [a1 objectForKey:v6];

    if (!v5)
    {
      v7 = [v4 capitalizedString];
      v5 = [a1 objectForKey:v7];

      if (!v5)
      {
        v11[0] = MEMORY[0x263EF8330];
        v11[1] = 3221225472;
        v11[2] = __66__NSDictionary_CoreDAVExtensions__CDVObjectForKeyCaseInsensitive___block_invoke;
        v11[3] = &unk_2641E0070;
        id v12 = v4;
        v8 = [a1 keysOfEntriesPassingTest:v11];
        if ([v8 count])
        {
          v9 = [v8 anyObject];
          v5 = [a1 objectForKey:v9];
        }
        else
        {
          v5 = 0;
        }
      }
    }
  }

  return v5;
}

- (id)CDVObjectForKeyWithNameSpace:()CoreDAVExtensions andName:
{
  v6 = (objc_class *)NSString;
  id v7 = a4;
  id v8 = a3;
  v9 = (void *)[[v6 alloc] initWithCDVNameSpace:v8 andName:v7];

  v10 = [a1 objectForKey:v9];

  return v10;
}

- (id)CDVMergeOverrideDictionary:()CoreDAVExtensions
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)[a1 mutableCopy];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = [v4 allKeys];
  uint64_t v6 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        v11 = [a1 objectForKey:v10];
        id v12 = [v4 objectForKey:v10];
        objc_opt_class();
        v13 = v12;
        if (objc_opt_isKindOfClass())
        {
          objc_opt_class();
          v13 = v12;
          if (objc_opt_isKindOfClass())
          {
            v13 = [v11 CDVMergeOverrideDictionary:v12];
          }
        }
        [v5 setObject:v13 forKey:v10];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  return v5;
}

@end