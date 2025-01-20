@interface NSDictionary(ARPersonDetectionData)
- (id)_recursiveObjectForKey:()ARPersonDetectionData visited:;
- (id)recursiveObjectForKey:()ARPersonDetectionData deleteKeys:;
@end

@implementation NSDictionary(ARPersonDetectionData)

- (id)recursiveObjectForKey:()ARPersonDetectionData deleteKeys:
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_opt_new();
  [v8 addObject:v7];
  v9 = [a1 _recursiveObjectForKey:v7 visited:v8];
  [v8 removeObject:v7];

  [v6 addObjectsFromArray:v8];
  return v9;
}

- (id)_recursiveObjectForKey:()ARPersonDetectionData visited:
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [a1 objectForKey:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = (id)[v7 mutableCopy];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v18 = v7;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v20 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v19 + 1) + 8 * i);
          if (([v6 containsObject:v14] & 1) == 0)
          {
            [v6 addObject:v14];
            v15 = [a1 _recursiveObjectForKey:v14 visited:v6];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v16 = [v15 allObjects];
              [v8 addObjectsFromArray:v16];
            }
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v11);
    }

    id v7 = v18;
  }
  else
  {
    id v8 = v7;
  }

  return v8;
}

@end