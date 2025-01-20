@interface CNCompoundMultiValuePropertyDescription
- (NSArray)summarizationKeys;
- (id)dictionaryTransform;
- (id)fromDictionaryTransform;
- (id)stringForIndexingForContact:(id)a3;
@end

@implementation CNCompoundMultiValuePropertyDescription

- (id)dictionaryTransform
{
  v2 = self;
  CNAbstractMethodException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (id)fromDictionaryTransform
{
  v2 = self;
  CNAbstractMethodException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (NSArray)summarizationKeys
{
  return 0;
}

- (id)stringForIndexingForContact:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v4 = [(CNPropertyDescription *)self CNValueForContact:a3];
  if ([v4 count])
  {
    v5 = [MEMORY[0x1E4F28E78] string];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id obj = v4;
    uint64_t v6 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v19 != v8) {
            objc_enumerationMutation(obj);
          }
          v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          v11 = [(CNCompoundMultiValuePropertyDescription *)self dictionaryTransform];
          v12 = [v10 value];
          v13 = ((void (**)(void, void *))v11)[2](v11, v12);

          v16[0] = MEMORY[0x1E4F143A8];
          v16[1] = 3221225472;
          v16[2] = __71__CNCompoundMultiValuePropertyDescription_stringForIndexingForContact___block_invoke;
          v16[3] = &unk_1E56B7A28;
          id v17 = v5;
          [v13 enumerateKeysAndObjectsUsingBlock:v16];
        }
        uint64_t v7 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v7);
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __71__CNCompoundMultiValuePropertyDescription_stringForIndexingForContact___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [*(id *)(a1 + 32) appendString:v4];
    [*(id *)(a1 + 32) appendString:@" "];
  }
}

@end