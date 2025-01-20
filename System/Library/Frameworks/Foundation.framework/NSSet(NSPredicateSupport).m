@interface NSSet(NSPredicateSupport)
- (uint64_t)filteredSetUsingPredicate:()NSPredicateSupport;
@end

@implementation NSSet(NSPredicateSupport)

- (uint64_t)filteredSetUsingPredicate:()NSPredicateSupport
{
  v16[1] = *MEMORY[0x1E4F143B8];
  if (!a3) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"nil is not a valid predicate for filtering" userInfo:0]);
  }
  unint64_t v5 = [a1 count];
  v16[0] = 0;
  if (v5 >> 60)
  {
    CFStringRef v13 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", v5);
    v14 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:v13 userInfo:0];
    CFRelease(v13);
    objc_exception_throw(v14);
  }
  if (v5 <= 1) {
    unint64_t v5 = 1;
  }
  double v6 = MEMORY[0x1F4188790](v5);
  v8 = (char *)v15 - v7;
  v15[1] = 0;
  if (v9 >= 0x101)
  {
    v8 = (char *)_CFCreateArrayStorage();
    v10 = v8;
  }
  else
  {
    v10 = 0;
  }
  _filterObjectsUsingPredicate(objc_msgSend(a1, "allObjects", v6), a3, (uint64_t)v8, v16);
  uint64_t v11 = [MEMORY[0x1E4F1CAD0] setWithObjects:v8 count:v16[0]];
  free(v10);
  return v11;
}

@end