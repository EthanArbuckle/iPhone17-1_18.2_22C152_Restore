@interface NSArray(NSPredicateSupport)
- (id)filteredArrayUsingPredicate:()NSPredicateSupport;
@end

@implementation NSArray(NSPredicateSupport)

- (id)filteredArrayUsingPredicate:()NSPredicateSupport
{
  v19[1] = *MEMORY[0x1E4F143B8];
  if (!a3) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"nil is not a valid predicate for filtering" userInfo:0]);
  }
  unint64_t v5 = [a1 count];
  v19[0] = 0;
  if (v5 >> 60)
  {
    CFStringRef v16 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", v5);
    v17 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:v16 userInfo:0];
    CFRelease(v16);
    objc_exception_throw(v17);
  }
  if (v5 <= 1) {
    unint64_t v5 = 1;
  }
  MEMORY[0x1F4188790](v5);
  v7 = (char *)v18 - v6;
  v18[1] = 0;
  if (v8 >= 0x101)
  {
    v7 = (char *)_CFCreateArrayStorage();
    v9 = (id *)v7;
  }
  else
  {
    v9 = 0;
  }
  _filterObjectsUsingPredicate(a1, a3, (uint64_t)v7, v19);
  uint64_t v10 = v19[0];
  if (v9)
  {
    if (v19[0] >= 1)
    {
      v11 = v9;
      uint64_t v12 = v19[0];
      do
      {
        id v13 = *v11++;
        --v12;
      }
      while (v12);
    }
    v14 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) _initByAdoptingBuffer:v9 count:v10 size:v10];
  }
  else
  {
    v14 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithObjects:v7 count:v19[0]];
  }
  return v14;
}

@end