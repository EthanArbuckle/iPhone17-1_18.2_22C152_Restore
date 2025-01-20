@interface NSMutableIndexSet(HKDayIndex)
- (uint64_t)hk_addDayIndex:()HKDayIndex;
@end

@implementation NSMutableIndexSet(HKDayIndex)

- (uint64_t)hk_addDayIndex:()HKDayIndex
{
  if (a3 < 0)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, a1, @"NSIndexSet+HKDayIndex.m", 35, @"Invalid parameter not satisfying: %@", @"dayIndex >= 0" object file lineNumber description];
  }

  return [a1 addIndex:a3];
}

@end