@interface NSArray(FMAdditions)
+ (id)fm_arrayByRepeatingWithCount:()FMAdditions generatorBlock:;
+ (id)fm_arrayWithSafeObject:()FMAdditions;
- (BOOL)fm_all:()FMAdditions;
- (id)fm_arrayByFlattening;
- (id)fm_arrayWithResultsOfBlock:()FMAdditions;
- (id)fm_dictionaryWithKeyGenerator:()FMAdditions;
- (id)fm_filter:()FMAdditions;
- (id)fm_firstObjectPassingTest:()FMAdditions;
- (id)fm_map:()FMAdditions;
- (uint64_t)fm_any:()FMAdditions;
- (void)fm_each:()FMAdditions;
@end

@implementation NSArray(FMAdditions)

- (id)fm_firstObjectPassingTest:()FMAdditions
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__3;
  v15 = __Block_byref_object_dispose__3;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __50__NSArray_FMAdditions__fm_firstObjectPassingTest___block_invoke;
  v8[3] = &unk_1E6019990;
  id v5 = v4;
  id v9 = v5;
  v10 = &v11;
  [a1 enumerateObjectsUsingBlock:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (id)fm_arrayWithResultsOfBlock:()FMAdditions
{
  id v4 = a3;
  id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a1, "count"));
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __51__NSArray_FMAdditions__fm_arrayWithResultsOfBlock___block_invoke;
  v11[3] = &unk_1E60199B8;
  id v13 = v4;
  id v6 = v5;
  id v12 = v6;
  id v7 = v4;
  [a1 enumerateObjectsUsingBlock:v11];
  v8 = v12;
  id v9 = v6;

  return v9;
}

- (id)fm_map:()FMAdditions
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = a1;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = v4[2](v4, *(void *)(*((void *)&v13 + 1) + 8 * i));
        if (v11) {
          objc_msgSend(v5, "addObject:", v11, (void)v13);
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)fm_filter:()FMAdditions
{
  id v4 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __34__NSArray_FMAdditions__fm_filter___block_invoke;
  v9[3] = &unk_1E60199E0;
  id v10 = v4;
  id v5 = v4;
  id v6 = [a1 indexesOfObjectsPassingTest:v9];
  uint64_t v7 = [a1 objectsAtIndexes:v6];

  return v7;
}

- (uint64_t)fm_any:()FMAdditions
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __31__NSArray_FMAdditions__fm_any___block_invoke;
  v8[3] = &unk_1E6019990;
  id v5 = v4;
  id v9 = v5;
  id v10 = &v11;
  [a1 enumerateObjectsUsingBlock:v8];
  uint64_t v6 = *((unsigned __int8 *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (BOOL)fm_all:()FMAdditions
{
  id v4 = a3;
  if ([a1 count])
  {
    uint64_t v10 = 0;
    uint64_t v11 = &v10;
    uint64_t v12 = 0x2020000000;
    char v13 = 1;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __31__NSArray_FMAdditions__fm_all___block_invoke;
    v7[3] = &unk_1E6019990;
    id v8 = v4;
    id v9 = &v10;
    [a1 enumerateObjectsUsingBlock:v7];
    BOOL v5 = *((unsigned char *)v11 + 24) != 0;

    _Block_object_dispose(&v10, 8);
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)fm_each:()FMAdditions
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __32__NSArray_FMAdditions__fm_each___block_invoke;
  v6[3] = &unk_1E6019A08;
  id v7 = v4;
  id v5 = v4;
  [a1 enumerateObjectsUsingBlock:v6];
}

- (id)fm_arrayByFlattening
{
  v2 = [MEMORY[0x1E4F1CA48] array];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__NSArray_FMAdditions__fm_arrayByFlattening__block_invoke;
  v5[3] = &unk_1E60197B0;
  id v3 = v2;
  id v6 = v3;
  objc_msgSend(a1, "fm_each:", v5);

  return v3;
}

- (id)fm_dictionaryWithKeyGenerator:()FMAdditions
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA60] dictionary];
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
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v12 = v4[2](v4, v11);
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, v12, (void)v14);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  return v5;
}

+ (id)fm_arrayByRepeatingWithCount:()FMAdditions generatorBlock:
{
  id v5 = a4;
  for (uint64_t i = [MEMORY[0x1E4F1CA48] array];
  {
    uint64_t v7 = v5[2](v5);
    [i addObject:v7];
  }
  return i;
}

+ (id)fm_arrayWithSafeObject:()FMAdditions
{
  if (a3) {
    objc_msgSend(a1, "arrayWithObject:");
  }
  else {
  id v3 = [a1 array];
  }
  return v3;
}

@end