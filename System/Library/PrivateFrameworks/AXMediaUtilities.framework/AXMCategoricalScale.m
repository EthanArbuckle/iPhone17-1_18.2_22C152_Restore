@interface AXMCategoricalScale
- (AXMCategoricalScale)init;
- (AXMCategoricalScale)initWithDomain:(id)a3;
@end

@implementation AXMCategoricalScale

- (AXMCategoricalScale)init
{
  return [(AXMCategoricalScale *)self initWithDomain:MEMORY[0x1E4F1CBF0]];
}

- (AXMCategoricalScale)initWithDomain:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)AXMCategoricalScale;
  v5 = [(AXMCategoricalScale *)&v19 init];
  if (v5)
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v7 = v4;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = +[AXMDataPointValue valueWithCategory:](AXMDataPointValue, "valueWithCategory:", *(void *)(*((void *)&v15 + 1) + 8 * v11), (void)v15);
          [v6 addObject:v12];

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v20 count:16];
      }
      while (v9);
    }

    v13 = (void *)[v6 copy];
    [(AXMScale *)v5 setDomain:v13];
  }
  return v5;
}

@end