@interface NSDictionary(HMDUtilities)
+ (id)dictionaryByCombiningNonOverlappingDictionaries:()HMDUtilities;
- (id)firstKeyWithValue:()HMDUtilities;
@end

@implementation NSDictionary(HMDUtilities)

- (id)firstKeyWithValue:()HMDUtilities
{
  id v4 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __48__NSDictionary_HMDUtilities__firstKeyWithValue___block_invoke;
  v8[3] = &unk_264A1CD50;
  id v9 = v4;
  id v5 = v4;
  v6 = objc_msgSend(a1, "na_firstKeyPassingTest:", v8);

  return v6;
}

+ (id)dictionaryByCombiningNonOverlappingDictionaries:()HMDUtilities
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [MEMORY[0x263EFF9A0] dictionary];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(v4, "addEntriesFromDictionary:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  return v4;
}

@end