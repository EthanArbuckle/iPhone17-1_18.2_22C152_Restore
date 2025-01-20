@interface NSArray(CLSNSArrayExtensions)
- (id)anyObject;
- (id)flattenWithSeparator:()CLSNSArrayExtensions;
- (id)indentBy:()CLSNSArrayExtensions withSeparator:;
- (id)map:()CLSNSArrayExtensions;
@end

@implementation NSArray(CLSNSArrayExtensions)

- (id)anyObject
{
  v2 = (void *)[a1 count];
  if (v2)
  {
    v2 = objc_msgSend(a1, "objectAtIndexedSubscript:", arc4random_uniform(objc_msgSend(a1, "count")));
  }
  return v2;
}

- (id)map:()CLSNSArrayExtensions
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v4 = a3;
  v5 = objc_opt_new();
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
        v11 = v4[2](v4, *(void *)(*((void *)&v13 + 1) + 8 * i));
        objc_msgSend(v5, "addObject:", v11, (void)v13);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)flattenWithSeparator:()CLSNSArrayExtensions
{
  v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  if ([a1 count])
  {
    unint64_t v6 = 0;
    do
    {
      uint64_t v7 = [a1 objectAtIndexedSubscript:v6];
      uint64_t v8 = [v7 description];
      if (v6 >= [a1 count] - 1) {
        uint64_t v9 = &stru_1F28DF9D8;
      }
      else {
        uint64_t v9 = v4;
      }
      [v5 appendFormat:@"%@%@", v8, v9];

      ++v6;
    }
    while (v6 < [a1 count]);
  }

  return v5;
}

- (id)indentBy:()CLSNSArrayExtensions withSeparator:
{
  unint64_t v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  if ([a1 count])
  {
    unint64_t v8 = 0;
    do
    {
      uint64_t v9 = [a1 objectAtIndexedSubscript:v8];
      v10 = [v9 description];
      v11 = objc_msgSend(v10, "cls_indentBy:", a3);
      if (v8 >= [a1 count] - 1) {
        v12 = &stru_1F28DF9D8;
      }
      else {
        v12 = v6;
      }
      [v7 appendFormat:@"%@%@", v11, v12];

      ++v8;
    }
    while (v8 < [a1 count]);
  }

  return v7;
}

@end