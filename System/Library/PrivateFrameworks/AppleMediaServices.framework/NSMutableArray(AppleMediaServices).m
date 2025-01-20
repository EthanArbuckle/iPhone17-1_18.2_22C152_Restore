@interface NSMutableArray(AppleMediaServices)
- (void)ams_addNullableObject:()AppleMediaServices;
- (void)ams_addObjectsFromNullableArray:()AppleMediaServices;
- (void)ams_removeObjectsPassingTest:()AppleMediaServices;
@end

@implementation NSMutableArray(AppleMediaServices)

- (void)ams_addNullableObject:()AppleMediaServices
{
  if (a3) {
    return objc_msgSend(a1, "addObject:");
  }
  return a1;
}

- (void)ams_addObjectsFromNullableArray:()AppleMediaServices
{
  if (a3) {
    return objc_msgSend(a1, "addObjectsFromArray:");
  }
  return a1;
}

- (void)ams_removeObjectsPassingTest:()AppleMediaServices
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v5 = objc_msgSend(a1, "copy", 0);
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
        uint64_t v10 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        if (v4[2](v4, v10)) {
          [a1 removeObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

@end