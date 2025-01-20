@interface NSArray(FPFrameworkAdditions)
+ (id)fp_sortDescriptorByDisplayName;
+ (id)fp_sortDescriptorByDocumentSize;
+ (id)fp_sortDescriptorByLastUsedDate;
+ (id)fp_sortDescriptorByModifiedDateDescending;
- (id)fp_categorize:()FPFrameworkAdditions;
- (id)fp_filter:()FPFrameworkAdditions;
- (id)fp_map:()FPFrameworkAdditions;
- (id)fp_mapWithIndex:()FPFrameworkAdditions;
- (id)fp_pickItemsFromArray:()FPFrameworkAdditions correspondingToIndexesOfItemsInArray:;
- (id)fp_removingObjectsNotKindOfClasses:()FPFrameworkAdditions;
@end

@implementation NSArray(FPFrameworkAdditions)

- (id)fp_mapWithIndex:()FPFrameworkAdditions
{
  id v4 = a3;
  v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __49__NSArray_FPFrameworkAdditions__fp_mapWithIndex___block_invoke;
  v11[3] = &unk_1E5AF2FD8;
  id v13 = v4;
  id v6 = v5;
  id v12 = v6;
  id v7 = v4;
  [a1 enumerateObjectsUsingBlock:v11];
  v8 = v12;
  id v9 = v6;

  return v9;
}

+ (id)fp_sortDescriptorByDisplayName
{
  if (fp_sortDescriptorByDisplayName_onceToken != -1) {
    dispatch_once(&fp_sortDescriptorByDisplayName_onceToken, &__block_literal_global_18);
  }
  v0 = (void *)fp_sortDescriptorByDisplayName_sortDescriptors;

  return v0;
}

- (id)fp_map:()FPFrameworkAdditions
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __40__NSArray_FPFrameworkAdditions__fp_map___block_invoke;
  v8[3] = &unk_1E5AF3000;
  id v9 = v4;
  id v5 = v4;
  id v6 = objc_msgSend(a1, "fp_mapWithIndex:", v8);

  return v6;
}

+ (id)fp_sortDescriptorByLastUsedDate
{
  if (fp_sortDescriptorByLastUsedDate_onceToken != -1) {
    dispatch_once(&fp_sortDescriptorByLastUsedDate_onceToken, &__block_literal_global_11);
  }
  v0 = (void *)fp_sortDescriptorByLastUsedDate_sortDescriptors;

  return v0;
}

- (id)fp_filter:()FPFrameworkAdditions
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a1, "count"));
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
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * v10);
        id v12 = (void *)MEMORY[0x1A6248870](v7);
        if (v4[2](v4, v11)) {
          objc_msgSend(v5, "addObject:", v11, (void)v14);
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      uint64_t v8 = v7;
    }
    while (v7);
  }

  return v5;
}

+ (id)fp_sortDescriptorByModifiedDateDescending
{
  if (fp_sortDescriptorByModifiedDateDescending_onceToken != -1) {
    dispatch_once(&fp_sortDescriptorByModifiedDateDescending_onceToken, &__block_literal_global_7);
  }
  v0 = (void *)fp_sortDescriptorByModifiedDateDescending_sortDescriptors;

  return v0;
}

+ (id)fp_sortDescriptorByDocumentSize
{
  if (fp_sortDescriptorByDocumentSize_onceToken != -1) {
    dispatch_once(&fp_sortDescriptorByDocumentSize_onceToken, &__block_literal_global_15_1);
  }
  v0 = (void *)fp_sortDescriptorByDocumentSize_sortDescriptors;

  return v0;
}

- (id)fp_categorize:()FPFrameworkAdditions
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __47__NSArray_FPFrameworkAdditions__fp_categorize___block_invoke;
  v11[3] = &unk_1E5AF2FD8;
  id v13 = v4;
  id v6 = v5;
  id v12 = v6;
  id v7 = v4;
  [a1 enumerateObjectsUsingBlock:v11];
  uint64_t v8 = v12;
  id v9 = v6;

  return v9;
}

- (id)fp_pickItemsFromArray:()FPFrameworkAdditions correspondingToIndexesOfItemsInArray:
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [a1 count];
  if (v8 != [v6 count])
  {
    uint64_t v9 = [a1 count];
    if (v9 != [v6 count])
    {
      v20 = [MEMORY[0x1E4F28B00] currentHandler];
      [v20 handleFailureInMethod:a2 object:a1 file:@"NSArray+FPFrameworkAdditions.m" lineNumber:121 description:@"Count of pickable items must match count of own items"];
    }
  }
  uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = v7;
  uint64_t v11 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v24 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v16 = [a1 indexOfObject:v15];
        if (v16 == 0x7FFFFFFFFFFFFFFFLL)
        {
          long long v17 = [MEMORY[0x1E4F28B00] currentHandler];
          [v17 handleFailureInMethod:a2, a1, @"NSArray+FPFrameworkAdditions.m", 126, @"Object %@ not found", v15 object file lineNumber description];
        }
        v18 = [v6 objectAtIndexedSubscript:v16];
        [v10 addObject:v18];
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v12);
  }

  return v10;
}

- (id)fp_removingObjectsNotKindOfClasses:()FPFrameworkAdditions
{
  id v4 = a3;
  id v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __68__NSArray_FPFrameworkAdditions__fp_removingObjectsNotKindOfClasses___block_invoke;
  v11[3] = &unk_1E5AF3028;
  id v12 = v4;
  id v6 = v5;
  id v13 = v6;
  id v7 = v4;
  [a1 enumerateObjectsUsingBlock:v11];
  uint64_t v8 = v13;
  id v9 = v6;

  return v9;
}

@end