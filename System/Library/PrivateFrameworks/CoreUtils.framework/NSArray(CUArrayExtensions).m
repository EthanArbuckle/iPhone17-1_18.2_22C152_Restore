@interface NSArray(CUArrayExtensions)
- (id)cuFilteredArrayUsingBlock:()CUArrayExtensions;
@end

@implementation NSArray(CUArrayExtensions)

- (id)cuFilteredArrayUsingBlock:()CUArrayExtensions
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = a1;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = v4[2](v4, *(void *)(*((void *)&v13 + 1) + 8 * i));
        if (v10) {
          objc_msgSend(v5, "addObject:", v10, (void)v13);
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  v11 = (void *)[v5 copy];
  return v11;
}

@end