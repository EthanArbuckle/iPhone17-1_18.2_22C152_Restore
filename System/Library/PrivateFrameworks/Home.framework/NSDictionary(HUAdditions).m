@interface NSDictionary(HUAdditions)
- (uint64_t)computeHashFromContents;
@end

@implementation NSDictionary(HUAdditions)

- (uint64_t)computeHashFromContents
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v2 = [a1 hash];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = a1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v9 = HFComputeHashFromContents(v8) ^ v2;
        v10 = objc_msgSend(v3, "objectForKeyedSubscript:", v8, (void)v12);
        uint64_t v2 = v9 ^ HFComputeHashFromContents(v10);
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  return v2;
}

@end