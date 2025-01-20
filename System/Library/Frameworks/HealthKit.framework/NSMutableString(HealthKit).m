@interface NSMutableString(HealthKit)
- (void)hk_appendComponentsJoinedByString:()HealthKit container:componentGenerator:;
@end

@implementation NSMutableString(HealthKit)

- (void)hk_appendComponentsJoinedByString:()HealthKit container:componentGenerator:
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v19 = a3;
  id v8 = a4;
  v9 = a5;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    char v13 = 0;
    uint64_t v14 = *(void *)v21;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v10);
        }
        uint64_t v16 = *(void *)(*((void *)&v20 + 1) + 8 * v15);
        v17 = (void *)MEMORY[0x19F395970]();
        if (v13) {
          [a1 appendString:v19];
        }
        v18 = v9[2](v9, v16);
        [a1 appendString:v18];

        ++v15;
        char v13 = 1;
      }
      while (v12 != v15);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v12);
  }
}

@end