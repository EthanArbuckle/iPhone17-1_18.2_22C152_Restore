@interface NSArray(HAAccelSamples)
+ (uint64_t)sr_arrayWithHAAccelSamples:()HAAccelSamples;
@end

@implementation NSArray(HAAccelSamples)

+ (uint64_t)sr_arrayWithHAAccelSamples:()HAAccelSamples
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v4 = (void *)[MEMORY[0x263EFF980] array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(a3);
        }
        v9 = [[SRPhotoplethysmogramAccelerometerSample alloc] initWithHAPPGAccelSample:*(void *)(*((void *)&v11 + 1) + 8 * v8)];
        [v4 addObject:v9];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  return [MEMORY[0x263EFF8C0] arrayWithArray:v4];
}

@end