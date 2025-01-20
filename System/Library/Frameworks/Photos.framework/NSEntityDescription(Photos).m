@interface NSEntityDescription(Photos)
- (id)ph_baseEntity;
- (id)ph_relationshipDescriptionsForKeyPath:()Photos;
- (void)ph_enumerateSelfAndSubentities:()Photos;
@end

@implementation NSEntityDescription(Photos)

- (void)ph_enumerateSelfAndSubentities:()Photos
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v4 = a3;
  v4[2](v4, a1);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = objc_msgSend(a1, "subentities", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "ph_enumerateSelfAndSubentities:", v4);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (id)ph_relationshipDescriptionsForKeyPath:()Photos
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v4 = [a3 componentsSeparatedByString:@"."];
  if ([v4 count])
  {
    v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    id v6 = a1;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v7 = v4;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v18;
      while (2)
      {
        uint64_t v11 = 0;
        long long v12 = v6;
        do
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8 * v11);
          v14 = objc_msgSend(v12, "relationshipsByName", (void)v17);
          uint64_t v15 = [v14 objectForKeyedSubscript:v13];

          if (!v15)
          {

            v5 = 0;
            goto LABEL_12;
          }
          [v5 addObject:v15];
          id v6 = [v15 destinationEntity];

          ++v11;
          long long v12 = v6;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
    long long v12 = v6;
LABEL_12:
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)ph_baseEntity
{
  id v1 = a1;
  v2 = [v1 superentity];

  if (v2)
  {
    do
    {
      v3 = [v1 superentity];

      v4 = [v3 superentity];

      id v1 = v3;
    }
    while (v4);
  }
  else
  {
    v3 = v1;
  }

  return v3;
}

@end