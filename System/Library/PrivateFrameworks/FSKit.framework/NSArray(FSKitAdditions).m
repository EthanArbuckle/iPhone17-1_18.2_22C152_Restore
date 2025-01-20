@interface NSArray(FSKitAdditions)
- (id)fs_filter:()FSKitAdditions;
- (id)fs_map:()FSKitAdditions;
- (id)fs_mapWithIndex:()FSKitAdditions;
@end

@implementation NSArray(FSKitAdditions)

- (id)fs_mapWithIndex:()FSKitAdditions
{
  id v4 = a3;
  v5 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __43__NSArray_FSKitAdditions__fs_mapWithIndex___block_invoke;
  v11[3] = &unk_26530C298;
  id v13 = v4;
  id v6 = v5;
  id v12 = v6;
  id v7 = v4;
  [a1 enumerateObjectsUsingBlock:v11];
  v8 = v12;
  id v9 = v6;

  return v9;
}

- (id)fs_map:()FSKitAdditions
{
  id v4 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __34__NSArray_FSKitAdditions__fs_map___block_invoke;
  v8[3] = &unk_26530C2C0;
  id v9 = v4;
  id v5 = v4;
  id v6 = objc_msgSend(a1, "fs_mapWithIndex:", v8);

  return v6;
}

- (id)fs_filter:()FSKitAdditions
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(a1, "count"));
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
        id v12 = (void *)MEMORY[0x25332B920](v7);
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

@end