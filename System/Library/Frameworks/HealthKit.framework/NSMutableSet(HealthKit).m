@interface NSMutableSet(HealthKit)
- (void)hk_addNonNilObject:()HealthKit;
- (void)hk_removeObjectsPassingTest:()HealthKit;
@end

@implementation NSMutableSet(HealthKit)

- (void)hk_addNonNilObject:()HealthKit
{
  if (a3) {
    return objc_msgSend(a1, "addObject:");
  }
  return a1;
}

- (void)hk_removeObjectsPassingTest:()HealthKit
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__NSMutableSet_HealthKit__hk_removeObjectsPassingTest___block_invoke;
  v7[3] = &unk_1E58C6860;
  id v8 = v4;
  id v5 = v4;
  v6 = [a1 objectsPassingTest:v7];
  [a1 minusSet:v6];
}

@end