@interface NSMutableArray(HealthKit)
- (id)hk_dequeue;
- (uint64_t)hk_shuffle;
- (void)hk_addNonNilObject:()HealthKit;
- (void)hk_addObjectsFromArray:()HealthKit passingTest:;
- (void)hk_addUniqueObjectsFromArray:()HealthKit;
- (void)hk_removeObjectsPassingTest:()HealthKit;
@end

@implementation NSMutableArray(HealthKit)

- (id)hk_dequeue
{
  v2 = [a1 firstObject];
  if (v2) {
    [a1 removeObjectAtIndex:0];
  }

  return v2;
}

- (void)hk_addObjectsFromArray:()HealthKit passingTest:
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = a4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        if (v7[2](v7, v12)) {
          [a1 addObject:v12];
        }
      }
      uint64_t v9 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (void)hk_addUniqueObjectsFromArray:()HealthKit
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        if (([a1 containsObject:v9] & 1) == 0) {
          [a1 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)hk_removeObjectsPassingTest:()HealthKit
{
  uint64_t v8 = a3;
  uint64_t v4 = [a1 count];
  if (v4)
  {
    unint64_t v5 = v4;
    unint64_t v6 = 0;
    do
    {
      uint64_t v7 = [a1 objectAtIndexedSubscript:v6];
      if (v8[2](v8, v7))
      {
        [a1 removeObjectAtIndex:v6];
        --v5;
      }
      else
      {
        ++v6;
      }
    }
    while (v6 < v5);
  }
}

- (void)hk_addNonNilObject:()HealthKit
{
  if (a3) {
    return objc_msgSend(a1, "addObject:");
  }
  return a1;
}

- (uint64_t)hk_shuffle
{
  uint64_t result = [a1 count];
  if (result - 1 >= 1)
  {
    do
    {
      unint64_t v3 = result - 1;
      [a1 exchangeObjectAtIndex:result - 1 withObjectAtIndex:arc4random_uniform(result)];
      uint64_t result = v3;
    }
    while (v3 > 1);
  }
  return result;
}

@end