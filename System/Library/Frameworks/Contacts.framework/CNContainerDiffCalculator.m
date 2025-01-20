@interface CNContainerDiffCalculator
+ (id)diffContainer:(id)a3 to:(id)a4;
@end

@implementation CNContainerDiffCalculator

+ (id)diffContainer:(id)a3 to:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = [MEMORY[0x1E4F1CA48] array];
  v8 = +[CN writableContainerProperties];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v14 = [v13 CNValueForContainer:v5];
        v15 = [v13 CNValueForContainer:v6];
        if (([v13 isValue:v14 equalToEmptyEquivalentOrValue:v15] & 1) == 0)
        {
          v16 = +[CNContainerUpdate updateWithValue:v15 property:v13];
          [v7 addObject:v16];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  return v7;
}

@end