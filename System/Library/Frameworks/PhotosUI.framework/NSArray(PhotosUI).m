@interface NSArray(PhotosUI)
- (id)ph_arrayDescriptionWithIndentation:()PhotosUI objectDescription:;
- (uint64_t)ph_arrayDescriptionWithIndentation:()PhotosUI;
@end

@implementation NSArray(PhotosUI)

- (uint64_t)ph_arrayDescriptionWithIndentation:()PhotosUI
{
  return objc_msgSend(a1, "ph_arrayDescriptionWithIndentation:objectDescription:", a3, &__block_literal_global_1055);
}

- (id)ph_arrayDescriptionWithIndentation:()PhotosUI objectDescription:
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v6 = a4;
  v7 = objc_msgSend(MEMORY[0x263F089D8], "stringWithString:", @"(");
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = a1;
  uint64_t v8 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        v13 = [&stru_26C82F0F0 stringByPaddingToLength:a3 withString:@"\t" startingAtIndex:0];
        v14 = v6[2](v6, v12);
        [v7 appendFormat:@"\n%@%@", v13, v14];
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v9);
  }

  if ([obj count])
  {
    if (a3) {
      uint64_t v15 = a3 - 1;
    }
    else {
      uint64_t v15 = 0;
    }
    v16 = [&stru_26C82F0F0 stringByPaddingToLength:v15 withString:@"\t" startingAtIndex:0];
    [v7 appendFormat:@"\n%@", v16];
  }
  [v7 appendString:@""]);

  return v7;
}

@end