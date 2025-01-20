@interface NSMutableArray(ImageCaptureCoreAdditions)
- (void)addItemsMatchingType:()ImageCaptureCoreAdditions fromFolder:;
- (void)addItemsMatchingTypes:()ImageCaptureCoreAdditions fromFolder:;
- (void)addTruth:()ImageCaptureCoreAdditions code:;
@end

@implementation NSMutableArray(ImageCaptureCoreAdditions)

- (void)addTruth:()ImageCaptureCoreAdditions code:
{
  if (a3)
  {
    id v5 = [NSNumber numberWithLong:a4];
    [a1 addObject:v5];
  }
}

- (void)addItemsMatchingType:()ImageCaptureCoreAdditions fromFolder:
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v6)
  {
    v9 = [MEMORY[0x1E4F442D8] typeWithIdentifier:v6];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    v25 = v8;
    v10 = [v8 files];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v31 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          v16 = (void *)MEMORY[0x1E4F442D8];
          v17 = [v15 UTI];
          v18 = [v16 typeWithIdentifier:v17];

          if ([v18 conformsToType:v9]) {
            [a1 addObject:v15];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v12);
    }

    v8 = v25;
  }
  else
  {
    v19 = [v7 files];
    [a1 addObjectsFromArray:v19];
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v20 = [v8 folders];
  uint64_t v21 = [v20 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v27;
    do
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v27 != v23) {
          objc_enumerationMutation(v20);
        }
        [a1 addItemsMatchingType:v6 fromFolder:*(void *)(*((void *)&v26 + 1) + 8 * j)];
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v22);
  }
}

- (void)addItemsMatchingTypes:()ImageCaptureCoreAdditions fromFolder:
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v6);
        }
        [a1 addItemsMatchingType:*(void *)(*((void *)&v12 + 1) + 8 * v11++) fromFolder:v7];
      }
      while (v9 != v11);
      uint64_t v9 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

@end