@interface NSArray(AFCollectionUtilities)
- (id)_af_lenient:()AFCollectionUtilities map:;
- (id)af_firstObjectPassingTest:()AFCollectionUtilities;
- (id)af_lenientMappedDictionary:()AFCollectionUtilities;
- (id)af_objectsPassingTest:()AFCollectionUtilities;
- (uint64_t)af_lenientMappedArray:()AFCollectionUtilities;
- (uint64_t)af_mappedArray:()AFCollectionUtilities;
@end

@implementation NSArray(AFCollectionUtilities)

- (id)af_objectsPassingTest:()AFCollectionUtilities
{
  v2 = objc_msgSend(a1, "indexesOfObjectsPassingTest:");
  v3 = [a1 objectsAtIndexes:v2];

  return v3;
}

- (id)af_firstObjectPassingTest:()AFCollectionUtilities
{
  uint64_t v2 = objc_msgSend(a1, "indexOfObjectPassingTest:");
  if (v2 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = 0;
  }
  else
  {
    v3 = [a1 objectAtIndexedSubscript:v2];
  }
  return v3;
}

- (id)af_lenientMappedDictionary:()AFCollectionUtilities
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = a1;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = v4[2](v4, *(void *)(*((void *)&v14 + 1) + 8 * i));
        if (v11) {
          objc_msgSend(v5, "addEntriesFromDictionary:", v11, (void)v14);
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  v12 = (void *)[v5 copy];
  return v12;
}

- (id)_af_lenient:()AFCollectionUtilities map:
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = a1;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = v5[2](v5, *(void *)(*((void *)&v15 + 1) + 8 * i));
        if (v12) {
          objc_msgSend(v6, "addObject:", v12, (void)v15);
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  v13 = (void *)[v6 copy];
  return v13;
}

- (uint64_t)af_lenientMappedArray:()AFCollectionUtilities
{
  return objc_msgSend(a1, "_af_lenient:map:", 1, a3);
}

- (uint64_t)af_mappedArray:()AFCollectionUtilities
{
  return objc_msgSend(a1, "_af_lenient:map:", 0, a3);
}

@end