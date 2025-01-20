@interface NSArray(DBAdditions)
- (id)db_filter:()DBAdditions;
- (id)db_firstObjectPassingTest:()DBAdditions;
- (id)db_map:()DBAdditions;
@end

@implementation NSArray(DBAdditions)

- (id)db_firstObjectPassingTest:()DBAdditions
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__4;
  v15 = __Block_byref_object_dispose__4;
  id v16 = 0;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __50__NSArray_DBAdditions__db_firstObjectPassingTest___block_invoke;
  v8[3] = &unk_2649B53E8;
  id v5 = v4;
  id v9 = v5;
  v10 = &v11;
  [a1 enumerateObjectsUsingBlock:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (id)db_map:()DBAdditions
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(a1, "count"));
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

- (id)db_filter:()DBAdditions
{
  id v4 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __34__NSArray_DBAdditions__db_filter___block_invoke;
  v9[3] = &unk_2649B5410;
  id v10 = v4;
  id v5 = v4;
  id v6 = [a1 indexesOfObjectsPassingTest:v9];
  uint64_t v7 = [a1 objectsAtIndexes:v6];

  return v7;
}

@end