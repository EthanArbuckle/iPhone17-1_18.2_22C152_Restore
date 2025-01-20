@interface NSMutableArray(HFAdditions)
- (uint64_t)hf_insertObject:()HFAdditions intoSortedArrayWithOptions:comparator:;
@end

@implementation NSMutableArray(HFAdditions)

- (uint64_t)hf_insertObject:()HFAdditions intoSortedArrayWithOptions:comparator:
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = objc_msgSend(a1, "indexOfObject:inSortedRange:options:usingComparator:", v8, 0, objc_msgSend(a1, "count"), a4, v9);

  if (v10 != 0x7FFFFFFFFFFFFFFFLL) {
    [a1 insertObject:v8 atIndex:v10];
  }

  return v10;
}

@end