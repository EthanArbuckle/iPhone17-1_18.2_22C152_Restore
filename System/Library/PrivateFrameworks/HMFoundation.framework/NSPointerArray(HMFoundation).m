@interface NSPointerArray(HMFoundation)
- (BOOL)hmf_removePointer:()HMFoundation;
@end

@implementation NSPointerArray(HMFoundation)

- (BOOL)hmf_removePointer:()HMFoundation
{
  uint64_t v5 = [a1 count];
  if (!v5) {
    return 0;
  }
  unint64_t v6 = v5;
  if ([a1 pointerAtIndex:0] != a3)
  {
    uint64_t v7 = 1;
    while (v6 != v7)
    {
      uint64_t v8 = [a1 pointerAtIndex:v7++];
      if (v8 == a3)
      {
        uint64_t v9 = v7 - 1;
        BOOL v10 = v7 - 1 < v6;
        goto LABEL_9;
      }
    }
    return 0;
  }
  uint64_t v9 = 0;
  BOOL v10 = 1;
LABEL_9:
  [a1 removePointerAtIndex:v9];
  return v10;
}

@end