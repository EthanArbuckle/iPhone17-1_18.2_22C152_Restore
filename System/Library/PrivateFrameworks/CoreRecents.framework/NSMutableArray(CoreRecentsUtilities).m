@interface NSMutableArray(CoreRecentsUtilities)
- (uint64_t)cr_addObject:()CoreRecentsUtilities orPlaceholder:;
- (uint64_t)cr_insertObject:()CoreRecentsUtilities usingComparator:;
- (unint64_t)cr_removeObjectsStartingAtIndex:()CoreRecentsUtilities;
- (void)cr_addNonNilObject:()CoreRecentsUtilities;
@end

@implementation NSMutableArray(CoreRecentsUtilities)

- (void)cr_addNonNilObject:()CoreRecentsUtilities
{
  if (a3) {
    return objc_msgSend(a1, "addObject:");
  }
  return a1;
}

- (unint64_t)cr_removeObjectsStartingAtIndex:()CoreRecentsUtilities
{
  unint64_t result = [a1 count];
  if (result > a3)
  {
    return objc_msgSend(a1, "removeObjectsInRange:", a3, result - a3);
  }
  return result;
}

- (uint64_t)cr_insertObject:()CoreRecentsUtilities usingComparator:
{
  if (a4)
  {
    uint64_t v6 = objc_msgSend(a1, "indexOfObject:inSortedRange:options:usingComparator:", a3, 0, objc_msgSend(a1, "count"), 1024, a4);
    return [a1 insertObject:a3 atIndex:v6];
  }
  else
  {
    return objc_msgSend(a1, "addObject:");
  }
}

- (uint64_t)cr_addObject:()CoreRecentsUtilities orPlaceholder:
{
  if (!a3) {
    a3 = a4;
  }
  return [a1 addObject:a3];
}

@end