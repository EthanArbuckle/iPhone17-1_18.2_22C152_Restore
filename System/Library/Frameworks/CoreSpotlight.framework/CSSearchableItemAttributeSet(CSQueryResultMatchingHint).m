@interface CSSearchableItemAttributeSet(CSQueryResultMatchingHint)
- (NSArray)matchingHints;
- (void)setMatchingHints:()CSQueryResultMatchingHint;
@end

@implementation CSSearchableItemAttributeSet(CSQueryResultMatchingHint)

- (void)setMatchingHints:()CSQueryResultMatchingHint
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v10), "flattenedHints", (void)v13);
        [v5 addObject:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  v12 = (void *)[v5 copy];
  [(CSSearchableItemAttributeSet *)self _setArrayValue:v12 withItemClass:objc_opt_class() forKey:@"kMDQueryResultMatchingHints"];
}

- (NSArray)matchingHints
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = [(CSSearchableItemAttributeSet *)self _getNonNullValueForKey:@"kMDQueryResultMatchingHints"];
  v3 = objc_opt_new();
  if (v2)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v4 = v2;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          uint64_t v10 = [CSQueryResultMatchingHint alloc];
          v11 = -[CSQueryResultMatchingHint initWithBackingHint:](v10, "initWithBackingHint:", v9, (void)v14);
          if (v11) {
            [v3 addObject:v11];
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v6);
    }
  }
  v12 = objc_msgSend(v3, "copy", (void)v14);

  return (NSArray *)v12;
}

@end