@interface NSMutableIndexSet(CATShifting)
- (uint64_t)cat_moveIndex:()CATShifting toIndex:;
- (uint64_t)cat_shiftAndAddIndex:()CATShifting;
- (uint64_t)cat_shiftAndAddIndexesInRange:()CATShifting;
- (uint64_t)cat_shiftAndRemoveIndex:()CATShifting;
- (uint64_t)cat_shiftAndRemoveIndexesInRange:()CATShifting;
@end

@implementation NSMutableIndexSet(CATShifting)

- (uint64_t)cat_shiftAndAddIndex:()CATShifting
{
  return objc_msgSend(a1, "cat_shiftAndAddIndexesInRange:", a3, 1);
}

- (uint64_t)cat_shiftAndAddIndexesInRange:()CATShifting
{
  objc_msgSend(a1, "shiftIndexesStartingAtIndex:by:");

  return objc_msgSend(a1, "addIndexesInRange:", a3, a4);
}

- (uint64_t)cat_shiftAndRemoveIndex:()CATShifting
{
  return objc_msgSend(a1, "cat_shiftAndRemoveIndexesInRange:", a3, 1);
}

- (uint64_t)cat_shiftAndRemoveIndexesInRange:()CATShifting
{
  objc_msgSend(a1, "removeIndexesInRange:");

  return [a1 shiftIndexesStartingAtIndex:a3 + 1 by:-a4];
}

- (uint64_t)cat_moveIndex:()CATShifting toIndex:
{
  int v7 = objc_msgSend(a1, "containsIndex:");
  objc_msgSend(a1, "cat_shiftAndRemoveIndex:", a3);
  if (v7)
  {
    return objc_msgSend(a1, "cat_shiftAndAddIndex:", a4);
  }
  else
  {
    return [a1 shiftIndexesStartingAtIndex:a4 by:1];
  }
}

@end