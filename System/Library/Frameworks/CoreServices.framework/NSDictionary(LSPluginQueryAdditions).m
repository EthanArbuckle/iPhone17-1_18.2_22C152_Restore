@interface NSDictionary(LSPluginQueryAdditions)
- (id)ls_parseQueryForIdentifiers:()LSPluginQueryAdditions;
- (uint64_t)ls_hashQuery;
@end

@implementation NSDictionary(LSPluginQueryAdditions)

- (id)ls_parseQueryForIdentifiers:()LSPluginQueryAdditions
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
  v6 = [a1 objectForKey:v4];
  if (_NSIsNSArray())
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v7);
          }
          v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if (_NSIsNSString())
          {
            v12 = objc_msgSend(v11, "ls_cleanForPluginQuery", (void)v15);
            if (v12) {
              [v5 addObject:v12];
            }
          }
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v8);
    }
  }
  else if (_NSIsNSString())
  {
    v13 = objc_msgSend(v6, "ls_cleanForPluginQuery");
    if (v13) {
      [v5 addObject:v13];
    }
  }

  return v5;
}

- (uint64_t)ls_hashQuery
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v7 = 1;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __52__NSDictionary_LSPluginQueryAdditions__ls_hashQuery__block_invoke;
  v3[3] = &unk_1E5230100;
  v3[4] = &v4;
  [a1 enumerateKeysAndObjectsUsingBlock:v3];
  uint64_t v1 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v1;
}

@end