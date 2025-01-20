@interface HKPIIRedactor
+ (void)_addName:(void *)a3 toArray:;
+ (void)_addNames:(void *)a3 toArray:;
@end

@implementation HKPIIRedactor

+ (void)_addName:(void *)a3 toArray:
{
  id v6 = a2;
  id v4 = a3;
  self;
  if (v6 && [v6 length])
  {
    v5 = (void *)[v6 copy];
    [v4 addObject:v5];
  }
}

+ (void)_addNames:(void *)a3 toArray:
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = self;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        +[HKPIIRedactor _addName:toArray:](v6, *(void **)(*((void *)&v12 + 1) + 8 * v11++), v5);
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

@end