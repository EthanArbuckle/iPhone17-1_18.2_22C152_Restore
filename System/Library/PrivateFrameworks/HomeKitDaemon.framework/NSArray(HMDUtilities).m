@interface NSArray(HMDUtilities)
- (id)arrayByRemovingObjectsInArray:()HMDUtilities;
- (uint64_t)asSet;
- (uint64_t)combineAllFutures;
@end

@implementation NSArray(HMDUtilities)

- (id)arrayByRemovingObjectsInArray:()HMDUtilities
{
  id v4 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __55__NSArray_HMDUtilities__arrayByRemovingObjectsInArray___block_invoke;
  v8[3] = &unk_264A2C478;
  id v9 = v4;
  id v5 = v4;
  v6 = objc_msgSend(a1, "na_filter:", v8);

  return v6;
}

- (uint64_t)combineAllFutures
{
  return [MEMORY[0x263F58190] combineAllFutures:a1];
}

- (uint64_t)asSet
{
  return [MEMORY[0x263EFFA08] setWithArray:a1];
}

@end