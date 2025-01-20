@interface NSArray(MSPContainerAdditions)
- (id)_maps_arrayWithObjectsConformingToProtocols:()MSPContainerAdditions;
- (id)_maps_indexesOfObjectsCorrespondingToIdentifiableObjects:()MSPContainerAdditions;
- (uint64_t)_maps_indexOfObjectCorrespondingToIdentifiableObject:()MSPContainerAdditions;
@end

@implementation NSArray(MSPContainerAdditions)

- (id)_maps_indexesOfObjectsCorrespondingToIdentifiableObjects:()MSPContainerAdditions
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  v5 = [a3 valueForKey:@"storageIdentifier"];
  v6 = [v4 setWithArray:v5];

  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = a1;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = 0;
    uint64_t v12 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v8);
        }
        v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        v15 = objc_msgSend(v14, "storageIdentifier", (void)v20);
        int v16 = [v6 containsObject:v15];

        if (v16)
        {
          v17 = [NSNumber numberWithUnsignedInteger:v11 + i];
          v18 = [v14 storageIdentifier];
          [v7 setObject:v17 forKeyedSubscript:v18];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
      v11 += i;
    }
    while (v10);
  }

  return v7;
}

- (uint64_t)_maps_indexOfObjectCorrespondingToIdentifiableObject:()MSPContainerAdditions
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = a1;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v18;
    while (2)
    {
      uint64_t v10 = 0;
      uint64_t v11 = v7 + v8;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v12 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v10), "storageIdentifier", (void)v17);
        v13 = [v4 storageIdentifier];
        char v14 = [v12 isEqual:v13];

        if (v14)
        {
          uint64_t v15 = v8 + v10;
          goto LABEL_11;
        }
        ++v10;
      }
      while (v7 != v10);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      uint64_t v8 = v11;
      if (v7) {
        continue;
      }
      break;
    }
  }
  uint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_11:

  return v15;
}

- (id)_maps_arrayWithObjectsConformingToProtocols:()MSPContainerAdditions
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  obuint64_t j = a1;
  uint64_t v6 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        id v11 = v4;
        uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v19;
          do
          {
            for (uint64_t j = 0; j != v13; ++j)
            {
              if (*(void *)v19 != v14) {
                objc_enumerationMutation(v11);
              }
              if ([v10 conformsToProtocol:*(void *)(*((void *)&v18 + 1) + 8 * j)]) {
                [v5 addObject:v10];
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
          }
          while (v13);
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v7);
  }

  return v5;
}

@end