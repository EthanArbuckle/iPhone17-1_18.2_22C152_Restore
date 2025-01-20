@interface NSArray(FIAdditions)
+ (id)fi_arrayByEnumeratingRange:()FIAdditions usingBlock:;
- (id)fi_filteredArrayUsingBlock:()FIAdditions;
- (id)fi_flatMapUsingBlock:()FIAdditions;
- (id)fi_mapUsingBlock:()FIAdditions;
- (id)fi_reduceWithReduction:()FIAdditions block:;
@end

@implementation NSArray(FIAdditions)

- (id)fi_mapUsingBlock:()FIAdditions
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__3;
  v15 = __Block_byref_object_dispose__3;
  id v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(a1, "count"));
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __41__NSArray_FIAdditions__fi_mapUsingBlock___block_invoke;
  v8[3] = &unk_26441CCD8;
  v10 = &v11;
  id v5 = v4;
  id v9 = v5;
  [a1 enumerateObjectsUsingBlock:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (id)fi_flatMapUsingBlock:()FIAdditions
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__3;
  v15 = __Block_byref_object_dispose__3;
  id v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(a1, "count"));
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __45__NSArray_FIAdditions__fi_flatMapUsingBlock___block_invoke;
  v8[3] = &unk_26441CD00;
  id v5 = v4;
  id v9 = v5;
  v10 = &v11;
  [a1 enumerateObjectsUsingBlock:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (id)fi_filteredArrayUsingBlock:()FIAdditions
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__3;
  v15 = __Block_byref_object_dispose__3;
  id v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(a1, "count"));
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __51__NSArray_FIAdditions__fi_filteredArrayUsingBlock___block_invoke;
  v8[3] = &unk_26441CD00;
  id v5 = v4;
  id v9 = v5;
  v10 = &v11;
  [a1 enumerateObjectsUsingBlock:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (id)fi_reduceWithReduction:()FIAdditions block:
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__3;
  v19 = __Block_byref_object_dispose__3;
  id v8 = v6;
  id v20 = v8;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __53__NSArray_FIAdditions__fi_reduceWithReduction_block___block_invoke;
  v12[3] = &unk_26441CCD8;
  v14 = &v15;
  id v9 = v7;
  id v13 = v9;
  [a1 enumerateObjectsUsingBlock:v12];
  id v10 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v10;
}

+ (id)fi_arrayByEnumeratingRange:()FIAdditions usingBlock:
{
  id v7 = a5;
  id v8 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:a4];
  if (a3 < a3 + a4)
  {
    do
    {
      id v9 = v7[2](v7, a3);
      [v8 addObject:v9];

      ++a3;
      --a4;
    }
    while (a4);
  }

  return v8;
}

@end